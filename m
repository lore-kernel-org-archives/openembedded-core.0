Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QIJIw-0003Hi-Pu for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 13:34:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p46BVwV3023099;
	Fri, 6 May 2011 12:31:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22717-08; Fri,  6 May 2011 12:31:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p46BVpr2023093
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 6 May 2011 12:31:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB69334F4BD82@shsmsx502.ccr.corp.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
	<1303102414.5518.30.camel@rex>
	<1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>
	<1303109647.5518.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD75@shsmsx502.ccr.corp.intel.com>
	<1304634851.30391.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD82@shsmsx502.ccr.corp.intel.com>
Date: Fri, 06 May 2011 12:31:48 +0100
Message-ID: <1304681508.30391.84.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Fri, 06 May 2011 11:34:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-06 at 16:52 +0800, Cui, Dexuan wrote:
> Richard Purdie wrote:
> >> 3) In gnu-config_20080123.bb's do_install, I don't understand this
> >>     lines: here the "!=" should be "="? if [ "${BUILD_ARCH}" !=
> >>         "${TARGET_ARCH}" ]; then sed -i -e
> >>     's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/gnu-configize fi
> > 
> > This means it only applies for non-native packages. (native has
> > BUILD_ARCH=TARGET_ARCH). The path to env is ${bindir} and this assists
> > with things like the nativesdk packages where bindir != "/usr/bin".
> Thanks for the explanation!
> My understanding about "non-native package" is target recipe (in this case bindir=/usr/bin)
> and -nativesdk recipe.
> gnu-config_20080123.bb doesn't have -nativesdk version(BBCLASSEXTEND doesn't
> contain nativesdk), so looks the sed replacement is useless at present?

Not useless but not heavily used directly in Poky at this time.
DISTRO=minimal in OE for example sets exec_prefix="" so bindir
becomes /bin.

> >> e.g. when building gnu-config-native for MACHINE qemux86 on a 32-bit
> >> host,  BUILD_ARCH=TARGET_ARCH=i686-linux and the sed isn't invoked;
> >> when building gnu-config, the sed will be invoked, but bindir is
> >> just /usr/bin, so the replacement operation actually does nothing.
> > 
> > You can define a system where exec_prefix is "" and bindir is hence
> > "/bin" when it wouldn't do nothing.

As I mentioned here :)

> >> And for gnu-config-native, I think we need do a
> >> sed -i -e
> >> 's,/usr/bin/perl,${STAGING_BINDIR_NATIVE}/perl-native/perl,g'
> >> ${D}${bindir}/gnu-configize Correct? 
> > 
> > No, the whole point is to stop it seeing perl-native. Only perl itself
> > and modules should be using perl-native.
> So gnu-config-native should use perl-native-runtime(i.e., the system perl) and
> shouldn't depend on perl-native.

Correct.

> Howeve, there is a sed replacement in gnu-config-native's do_install:
> -e 's,@autom4te_perllibdir@,${datadir}/autoconf,g

Don't confuse the data files that autoconf installs and references with
a program that is mixing the perl-native binary and libraries with the
host system ones. I think the above change is harmless as its just
linking in some perl files.

> and meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in is intened
> to be run with "#! /usr/bin/env perl" -- this incurs some race conditions:

This is more problematic though as it does this but also references
perl's full path more directly further in the file. This is the real
problem as its mixing and matching two different perl versions.

> 1) if perl-natvie does populate_sysroot later than
> ${STAGING_BINDIR_NATIVE}/gnu-configize is invoked, /usr/bin/perl is used
> but perl-native's modules are used due to the "unshift @INC, $datadir" in gnu-configize.in.
> This is just http://bugzilla.pokylinux.org/show_bug.cgi?id=941
> 2)  if perl-natvie does populate_sysroot earlier than the gnu-configize
> is invokded, we don't meet bug 941.
> 
> The above is the current situation. If we install perl-native into its own
> sysroot, in the gnu-configize, the system perl is always found and used,
> and we always meet with bug 941.

It doesn't matter which perl we use but we do need to use the same perl
consistently.

> How can we fix bug 941 then?
> 
> BTW: the 2 lines at the beginning of gnu-configize.in is suspicious:
> eval 'case $# in 0) exec /usr/bin/perl -S "$0";; *) exec /usr/bin/perl -S "$0" "$@";; esac'
>     if 0;
> I'm new to the synax of perl, but I believe the string after the "eval" is
> not executed due to "if 0".
> Can we remove the 2 lines?

I ended up getting some other opinions on this code as it makes no sense
to me either. The best guess I've heard is its allowing the script to
work in shell and perl. I then looked at other autoconf scripts and they
use this same construct so its obviously copied from there. I agree the
style is pointless and we could remove it but it is at least consistent
with the rest of autoconf.

I went digging and was surprised to see many hardcoded paths to perl in
the autoconf scripts. It turns out path_prog_fixes.patch isn't being
applied to autoconf-native, only the target version. When we do apply
it, it turns out the patch is buggy in the native case and I had to
change @bindir@/env to /usr/bin/env to make it work since we don't have
a "env" in the STAGING_BINDIR_NATIVE.

My point is that we need to be consistent about which perl version we
use in these scripts. Either we use one from the environment using env
or we hardcode to /usr/bin/perl. Since the perl-native binary won't be
in the path for any of these, autodetecting and letting it hardcode is
probably fine. It has the advantage that if there are any binary modules
ever involved, they'll match the version of perl they were built for
regardless of whether perl-native is a dependency or not. If someone
adds a perl-native dependency to autoconf-native, it will also still
select the "correct" perl.

Whilst doing this we need to keep bug #968 in mind and ensure that if
perl-native is used, all of perl-native is in the sysroot. That bug is
where the perl binary was installed, the library was not and an error
occurred. If it is in its own directory which is only added to the PATH
for users with the correct dependency, we avoid this.

As for bug #941, the bottom line is that however autoconf-native selects
its perl version, the strings encoded in gnu-config should really match
those in the other autoconf-native scripts.

Cheers,

Richard




