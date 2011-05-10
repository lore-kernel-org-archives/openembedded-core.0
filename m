Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QJnZL-0005zk-Av
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:05:47 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2011 07:03:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,346,1301900400"; d="scan'208";a="690664989"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2011 07:02:50 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 10 May 2011 22:02:49 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Tue, 10 May 2011 22:02:48 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Richard Purdie' <richard.purdie@linuxfoundation.org>
Date: Tue, 10 May 2011 22:02:46 +0800
Thread-Topic: [OE-core] [PATCH 37/58] gnu-config-native: add dependency on
	perl-native
Thread-Index: AcwL4UqGchFuiVQGSU6QinWKw7435ADNniCA
Message-ID: <1865303E0DED764181A9D882DEF65FB69334F4BD8A@shsmsx502.ccr.corp.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
	<1303102414.5518.30.camel@rex>
	<1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>
	<1303109647.5518.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD75@shsmsx502.ccr.corp.intel.com>
	<1304634851.30391.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD82@shsmsx502.ccr.corp.intel.com>
	<1304681508.30391.84.camel@rex>
In-Reply-To: <1304681508.30391.84.camel@rex>
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
X-List-Received-Date: Tue, 10 May 2011 14:05:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Fri, 2011-05-06 at 16:52 +0800, Cui, Dexuan wrote:
>> Howeve, there is a sed replacement in gnu-config-native's do_install:
>> -e 's,@autom4te_perllibdir@,${datadir}/autoconf,g
>=20
> Don't confuse the data files that autoconf installs and references
> with a program that is mixing the perl-native binary and libraries
> with the host system ones. I think the above change is harmless as
> its just linking in some perl files.
Sorry, but I might not make me clear here(?)=20
I meant:  due to the sed replacing and the=20
"unshift @INC, $datadir"(@INC is a path list
from which a perl module is being searched for) in
${STAGING_BINDIR_NATIVE}/gnu-configize, /usr/bin/perl will try to use
perl modues in ${STAGING_DATADIR_NATIVE}/perl/ if the gnu-configize
is executed by /usr/bin/perl.
That's just bug 941, I think.
If we keep the sed replacing, I think we have to make gnu-config-native
depend on perl-native so we're sure gnu-config-native's do_configure will
find perl-native rather than /usr/bin/perl, but as you said, gnu-config-nat=
ive
should not depend on perl-native. That's what confused me.

>> and meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in is
>> intened=20
>> to be run with "#! /usr/bin/env perl" -- this incurs some race
>> conditions:=20
>=20
> This is more problematic though as it does this but also references
> perl's full path more directly further in the file. This is the real
> problem as its mixing and matching two different perl versions.
>=20
>> 1) if perl-natvie does populate_sysroot later than
>> ${STAGING_BINDIR_NATIVE}/gnu-configize is invoked, /usr/bin/perl is
>> used=20
>> but perl-native's modules are used due to the "unshift @INC,
>> $datadir" in gnu-configize.in. This is just
>> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D941 2)  if perl-natvie
>> does populate_sysroot earlier than the gnu-configize=20
>> is invokded, we don't meet bug 941.
>>=20
>> The above is the current situation. If we install perl-native into
>> its own=20
>> sysroot, in the gnu-configize, the system perl is always found and
>> used,=20
>> and we always meet with bug 941.
>=20
> It doesn't matter which perl we use but we do need to use the same
> perl consistently.
>=20
>> How can we fix bug 941 then?
>>=20
>> BTW: the 2 lines at the beginning of gnu-configize.in is suspicious:
>> eval 'case $# in 0) exec /usr/bin/perl -S "$0";; *) exec
>> /usr/bin/perl -S "$0" "$@";; esac'     if 0; I'm new to the synax of
>> perl, but I believe the string after the "eval" is=20
>> not executed due to "if 0".
>> Can we remove the 2 lines?
>=20
> I ended up getting some other opinions on this code as it makes no
> sense to me either. The best guess I've heard is its allowing the
> script to work in shell and perl. I then looked at other autoconf
> scripts and they use this same construct so its obviously copied from
> there. I agree the style is pointless and we could remove it but it
> is at least consistent with the rest of autoconf.
>=20
> I went digging and was surprised to see many hardcoded paths to perl
> in the autoconf scripts. It turns out path_prog_fixes.patch isn't
> being applied to autoconf-native, only the target version. When we do
> apply it, it turns out the patch is buggy in the native case and I
> had to change @bindir@/env to /usr/bin/env to make it work since we
> don't have a "env" in the STAGING_BINDIR_NATIVE.
>=20
> My point is that we need to be consistent about which perl version we
> use in these scripts. Either we use one from the environment using env
Yes, I agree.

> or we hardcode to /usr/bin/perl. Since the perl-native binary won't be
> in the path for any of these, autodetecting and letting it hardcode is
> probably fine. It has the advantage that if there are any binary
> modules ever involved, they'll match the version of perl they were
> built for regardless of whether perl-native is a dependency or not.
> If someone adds a perl-native dependency to autoconf-native, it will
> also still select the "correct" perl.
>=20
> Whilst doing this we need to keep bug #968 in mind and ensure that if
> perl-native is used, all of perl-native is in the sysroot. That bug is
> where the perl binary was installed, the library was not and an error
> occurred. If it is in its own directory which is only added to the
> PATH for users with the correct dependency, we avoid this.
>=20
> As for bug #941, the bottom line is that however autoconf-native
> selects its perl version, the strings encoded in gnu-config should
> really match those in the other autoconf-native scripts.
I saw a commit that was once suspended was pushed into poky
master yesterday:
http://git.pokylinux.org/cgit/cgit.cgi/poky/commit/?id=3D605141a93443df0426=
34b2219a8628a9004be023
Actually it does fix(or at least workaround) bug #941 and bug #968.

Looks there are much work to do if we install perl-native to its own sysroo=
t.
At present we can use the above commit as a workaround.

Thanks,
-- Dexuan


