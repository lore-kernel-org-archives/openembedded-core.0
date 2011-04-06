Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q7XSd-0001Dr-D0
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 20:28:11 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb [147.11.189.41])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p36IQ3Nx005228
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Apr 2011 11:26:03 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.73]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.01.0255.000;
	Wed, 6 Apr 2011 11:26:03 -0700
From: "Hatle, Mark" <mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Proposed Multilib Implementation Brainstorming
Thread-Index: AQHL89fR9iSKERjfLEG0K3fk5c3eRJRRnYGA
Date: Wed, 6 Apr 2011 18:26:03 +0000
Message-ID: <51BF8F9A-3607-4DBF-9A6C-03E2FC1BD284@windriver.com>
References: <1302001365.24596.459.camel@rex>
In-Reply-To: <1302001365.24596.459.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: poky <poky@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Proposed Multilib Implementation Brainstorming
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Apr 2011 18:28:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B4BF76D51430A047888BF9023691744D@corp.ad.wrs.com>
Content-Transfer-Encoding: quoted-printable

A few comments to the original proposal below...



On Apr 5, 2011, at 2:24 PM, "Richard Purdie" <richard.purdie@linuxfoundatio=
n.org> wrote:

> One of the items on our post 1.0 schedule is multilib and we need a plan
> of implementation. I've been thinking about this for a while and at
> least have some ideas how some of the issues can be handled.
>=20
> In case anyone isn't familiar with the idea of multilibs, the most
> common example are x86 systems which have both 32 bit and 64 bit
> libraries installed at the same time in /lib/ and /lib64/ directories or
> similar and hence both types of binaries can be used.
>=20
> The number of libs isn't limited to two choices as for example the mips
> platform has three choices which can be used in parallel. The x32 ABI
> would mean three possible x86 options too.=20
>=20

There are really two facets when people talk about multilibs.  The first is=
 what is discussed above, incompatible ABI that are compatible in regards o=
f running on the same hardware and can be collocated within a single filesy=
stem.   The other type of multilibs, common on ARM, is same ABI with differ=
ent optimizations, machine specific code.

Both types of multilibs need to be supported over time.


> The first step is being able to build given recipes for each of a set of
> given multilibs. This is very similar in principle to the way
> BBCLASSEXTEND is used, the difference it that whilst the native or
> nativesdk classes are used once, for multilib we need a kind of multiple
> inheritance of a class assuming we don't want one class per multilib.
>=20
> To do this I'm thinking of a new set of include files of the form
> conf/machine/include/multilib-xxxx.inc, similar in nature to the
> tune-xxx.inc files. A given setup would include each of the multilibs it
> requred. Each multilib include file would look something like:
>=20
> conf/machine/include/multilib-x86-lib32.inc:
>=20
> MULTILIBS +=3D "lib32"
>=20
> BASE_PACKAGE_ARCH_virtclass-multilib-lib32 =3D "core2-lib32"
> TARGET_CC_ARCH_virtclass-multilib-lib32 =3D "-m32 -march=3Dcore2"
> PACKAGE_EXTRA_ARCHS +=3D "core2-lib32"
>=20
> libdir_virtclass-multilib-lib32 =3D "${exec_prefix}/lib32"
> base_libdir_virtclass-multilib-lib32 =3D "${base_prefix}/lib32"
>=20
> i.e. use overrides to change the target cc architecture specifying the
> required flags to the compiler and also alter the library paths as
> required.
>=20
> I'm envisaging passing an optional new parameter to classes in
> BBCLASSEXTEND so for example the definition of a multilib could look
> something like:
>=20
> BBCLASSEXTEND_append =3D " multilib:x86-lib32"
>=20
> and all the multilib class would need to do is to manipulation of
> variables including OVERRIDES in a similar way to native.bbclass with
> the complication of handling the parameter.
>=20

One of the complications though is deciding what packages to build for whic=
h multilibs.  We will need a way to say the default system libraries and co=
mponents should be say 32-bit.  But I need this one component to be 64-bit.=
...

> The toolchain bootstrap process would become a little complicated by
> this. We'll need to be able to iterate over the list of multilibs and
> configure the compiler with a configuration appropriate to the multilibs
> requested. The compiler should then take care of generating a suitable
> libgcc for each multilib. Where the compiler currently depends on
> virtual/libc-initial, we'll need with a function called to generate the
> dependecies so for example: "virtual/libc virtual/libc-initial-lib32"
>=20

I think the toolchain bootstrap is a place where the implementation of the =
toolchain can make this easier or MUCH harder.  In the environments I am us=
ed to using (code sorcery based toolchain) its a single binary that enables=
 the user to use many different multilibs.  However, this is likely not the=
 best/easiest approach for source based toolchain builds.  It's much easier=
 for use to just iteratively build toolchains for each multlib.  Using uniq=
ue filenames can make this fairly easy to implement with minimal changes to=
 the recipes.

Using something more complex like the CS toolchains, you can do simply by c=
reating specific wrappers that call the base common toolchain with the righ=
t parameters to switch the multlib settings..


> The toolchain bootstrap process would hence become something like:
>=20
> gcc-cross-initial
> libc-initial
> libc-initial-lib32
> gcc-cross-intermediate
> libc
> libc-lib32
> gcc-cross
> libgcc (package)
> libgcc-lib32 (package)
> gcc-runtime
> gcc-runtime-lib32
>=20
> So for any multilib, we're stuck with always building the libc due to
> the way gcc handles multilib. For subsequent tasks, only the libs
> requested in a give image in a given ABI would be built.
>=20

Yes, when building multilibs there is a key set that has to exist before yo=
u can build anything else.  This normally includes libgcc, libstdcxx, and l=
ibc.  Otherwise general depenedencies can handle anything we need...  But a=
s mentioned before we need to understand which items to build and use for f=
ilesystem construction.

> Note that as far as the build system is concerned there become distinct
> targets for each ABI so "bitbake mysql" would build the default library
> type, "bitbake mysql-lib32" would build the 32 bit version. Including
> both "mysql" and "mysql-lib32" in an image is where things get
> interesting, the build system will ensure they're both built, then it
> becomes the problem of the image creation and package
> creation/management processes.
>=20

So when constructing a task or dependency list set we can do mysql, if we w=
ant the default or mysql-lib64 if we want the specific 64 bit version?  I t=
hink this is a place where we'll want to evaluate how people interact with =
the system and configuration files to find the best way to implement it.

> The final tricky part of the puzzle which is under the guidance of the
> package manager. rpm has extensive pre-existing mutlilib support. opkg
> has none.
>=20
> It should be possible to convert the build system package name
> libmysql-libx32 into just "libmysql" for the benefit of rpm and use
> rpm's package flavours to handle the multilib issues.
>=20
> For opkg there are multiple levels we can take the integration to. It
> should be possible for example to install the "weaker" multilibs first,
> then just install the stronger ones over the top, assuming any file
> overwriting is ok and can be ignored. Teaching opkg about proper
> multilib support would be a bigger project but would be much less of a
> hack/workaround.
>=20
> So to summarise the steps needed are:
>=20
> a) bitbake enhancement for BBCLASSEXTEND parameter support
> b) Add simple multilib build configuration
> c) Update toolchain bootstrap with multilibs support
> d) Add RPM multilib packaging
> e) Look at opkg multilib integration
>=20
>=20
> Does this make sense to everyone, are there any questions/ objections/
> concerns/ things I've missed?
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


