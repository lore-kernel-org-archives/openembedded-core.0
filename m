Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QIGqB-00034o-GN
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 10:56:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 May 2011 01:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,325,1301900400"; d="scan'208";a="918794849"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by fmsmga001.fm.intel.com with ESMTP; 06 May 2011 01:54:09 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 6 May 2011 16:53:01 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Fri, 6 May 2011
	16:53:00 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Richard Purdie' <richard.purdie@linuxfoundation.org>
Date: Fri, 6 May 2011 16:52:59 +0800
Thread-Topic: [OE-core] [PATCH 37/58] gnu-config-native: add dependency on
	perl-native
Thread-Index: AcwLdJjAEAmcSqBbRsiA4Bdbv1FkewAUstyA
Message-ID: <1865303E0DED764181A9D882DEF65FB69334F4BD82@shsmsx502.ccr.corp.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
	<1303102414.5518.30.camel@rex>
	<1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>
	<1303109647.5518.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD75@shsmsx502.ccr.corp.intel.com>
	<1304634851.30391.54.camel@rex>
In-Reply-To: <1304634851.30391.54.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 37/58] gnu-config-native: add dependency on perl-native
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
X-List-Received-Date: Fri, 06 May 2011 08:56:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Thu, 2011-05-05 at 22:18 +0800, Cui, Dexuan wrote:
>> Recently I have been looking into it and I've made some commits
>> ......
>> 1)  As you said, after we install perl-native into its own directory,
>> any recipe not depending on perl-native doesn't see
>> ${STAGING_BINDIR_NATIVE}/perl-native/perl unnecessarily.
>> However, if we keep the current code, what's the bad consequence if
>> the recipe not depending on perl-native does see perl of perl-native?
>> looks no?
>=20
> We have an assumption that perl is already on the system we're
> building on. Perl is a relatively stable language with defined
> compatibility and interoperability. Most recipes are therefore fine
> using perl from the build system directly and don't need perl-native.
> I think we defined a special name for the build system perl
> (perl-native-runtime?). Better names are welcome but we should ensure
> we use the right dependency in the right places.
>=20
> The time to use perl-native instead of perl-native-runtime is where
> any perl module is being built, perl itself is being built or
> anything that has an explicit dependency on the perl version present.
Thanks for all the clarification!

>> 3) In gnu-config_20080123.bb's do_install, I don't understand this
>>     lines: here the "!=3D" should be "=3D"? if [ "${BUILD_ARCH}" !=3D
>>         "${TARGET_ARCH}" ]; then sed -i -e
>>     's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/gnu-configize fi
>=20
> This means it only applies for non-native packages. (native has
> BUILD_ARCH=3DTARGET_ARCH). The path to env is ${bindir} and this assists
> with things like the nativesdk packages where bindir !=3D "/usr/bin".
Thanks for the explanation!
My understanding about "non-native package" is target recipe (in this case =
bindir=3D/usr/bin)
and -nativesdk recipe.
gnu-config_20080123.bb doesn't have -nativesdk version(BBCLASSEXTEND doesn'=
t
contain nativesdk), so looks the sed replacement is useless at present?


>> e.g. when building gnu-config-native for MACHINE qemux86 on a 32-bit
>> host,  BUILD_ARCH=3DTARGET_ARCH=3Di686-linux and the sed isn't invoked;
>> when building gnu-config, the sed will be invoked, but bindir is
>> just /usr/bin, so the replacement operation actually does nothing.
>=20
> You can define a system where exec_prefix is "" and bindir is hence
> "/bin" when it wouldn't do nothing.
>=20
>> And for gnu-config-native, I think we need do a
>> sed -i -e
>> 's,/usr/bin/perl,${STAGING_BINDIR_NATIVE}/perl-native/perl,g'
>> ${D}${bindir}/gnu-configize Correct?=20
>=20
> No, the whole point is to stop it seeing perl-native. Only perl itself
> and modules should be using perl-native.
So gnu-config-native should use perl-native-runtime(i.e., the system perl) =
and
shouldn't depend on perl-native.
Howeve, there is a sed replacement in gnu-config-native's do_install:
-e 's,@autom4te_perllibdir@,${datadir}/autoconf,g
and meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in is intened
to be run with "#! /usr/bin/env perl" -- this incurs some race conditions:
1) if perl-natvie does populate_sysroot later than
${STAGING_BINDIR_NATIVE}/gnu-configize is invoked, /usr/bin/perl is used
but perl-native's modules are used due to the "unshift @INC, $datadir" in g=
nu-configize.in.
This is just http://bugzilla.pokylinux.org/show_bug.cgi?id=3D941
2)  if perl-natvie does populate_sysroot earlier than the gnu-configize
is invokded, we don't meet bug 941.

The above is the current situation. If we install perl-native into its own
sysroot, in the gnu-configize, the system perl is always found and used,
and we always meet with bug 941.

How can we fix bug 941 then?

BTW: the 2 lines at the beginning of gnu-configize.in is suspicious:
eval 'case $# in 0) exec /usr/bin/perl -S "$0";; *) exec /usr/bin/perl -S "=
$0" "$@";; esac'
    if 0;
I'm new to the synax of perl, but I believe the string after the "eval" is
not executed due to "if 0".
Can we remove the 2 lines?

>=20
>> 4) My last commit of the top 5 commits is a chaos... I'm trying to
>> replace every "DEPENDS on perl-native" with "inherit perlnative".
>> I'm now stuck in fixing the build issues for libxml-parser-perl and
>> libxml-parser-perl-native.=20
>> I don't know how to fix get_perl_version and perl_get_libdirs in
>> cpan-base.bbclass -- for libxml-parser-perl-native, I have to manage
>> to add a "/perl-native" into STAGING_LIBDIR and libdir, but for
>> libxml-parser-perl, I can't change STAGING_LIBDIR and libdir. Can you
>> please help me out?
>=20
> I'd suggest splitting this into two steps:
>=20
> a) Check through all perl-native references and correct the ones that
>    should be perl-native-runtime.
> b) Replace all remaining perl-native references with the class
>    dependency.
Ok, I'm checking all the references.

> In step a), gnu-config would have a dependency on perl-native-runtime
> so wouldn't use the perlnative class.
Please see my above reply.

> Just for reference, using perl-native-runtime means that someone can
> remove it from ASSUME_PROVIDED and provide a version of it themselves
> if they so wish (using perl-native or otherwise).
>=20
> I suspect you'll still have the libxml-parser-perl problem but lets
> take this one step at a time! :)
I'll continue to try to fix this. :-)

Richard, thanks a lot for your help!

-- Dexuan=


