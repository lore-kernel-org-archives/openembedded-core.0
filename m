Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SbbfM-0005R8-9U
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 20:06:08 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 04 Jun 2012 10:55:41 -0700
Received: by lahj13 with SMTP id j13so2799586lah.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 10:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=4BDSR6xP3QdtGF4mMrGvy/QeIsSsY9sWOC3dV9bywF0=;
	b=HDD4qRd7Iy39IZa9/TbwyheQIeXY0+4D7R54/1hN7AX0pMkXkN4dg1fype6TvsWaIi
	MOHhvCdWqQPRqc9EQqJZmlggHVAKIo+rbNV4bbQnh8gj+m89UrF3GiHSmY98BfRNiUoY
	ucMIucx1q8ZcPuktLIedEuKfOCdNVkfstWYBxe6ultnY5ZMkgsemJTJvtrW9OpX8xFgV
	nxCW+DCgSZy7WLipKhPa8U+dMhiqVnmnuTaS6XBbuM0YSpJSm158s5/Q6B+owWyo2YiH
	KzrerBX7LUnGzJ267QsSrrN7DrEQs7lXPLhnXyjx3kXRq19mtWTyEdc9cTv4g0Nu8mKj
	Q1tg==
MIME-Version: 1.0
Received: by 10.152.109.166 with SMTP id ht6mr13672171lab.46.1338832539510;
	Mon, 04 Jun 2012 10:55:39 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 4 Jun 2012 10:55:39 -0700 (PDT)
In-Reply-To: <4FCCC8B8.5030708@windriver.com>
References: <cover.1338500281.git.mark.hatle@windriver.com>
	<CAPhnLPD8AUtpP9bT=dUVR1zP9xBNhj3i+u+uaLG3rPHbpo-A2g@mail.gmail.com>
	<4FCCC8B8.5030708@windriver.com>
Date: Mon, 4 Jun 2012 10:55:39 -0700
Message-ID: <CAPhnLPCZSTiQzbQw1kurPtBfx=uqcz7k2rrTXnUCMWyL3TH=SQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnrYykBIOh8jG3nHsKFJf/ywPh78CxVA9/F5fer9TQOCThL397oLXQ5fTGumKj3CEJfSGme
Subject: Re: [PATCH 0/5 v3] Uprev RPM to 5.4.9
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
X-List-Received-Date: Mon, 04 Jun 2012 18:06:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 4, 2012 at 7:39 AM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> How are these builds being performed, what is the configuration? =A0Are t=
hey
> iterative?
>

Mark,

With a shared sstate across a few machines, the autobuilder builds out in o=
rder:

bitbake core-image-sato core-image-sato-dev core-image-sato-sdk
core-image-minimal core-image-minimal-dev
then a core BSP if available
then it sets the SDKMACHINE and builds out meta-toolchain-gmae

This is on an openSUSE 11.4 machine.

In this particular build, sstate was not cleaned prior to the build,
but had been cleaned a few builds prior.

I can test this locally if you wish, to confirm that it's not an
ab/host os issue.

-b

> I need to get an idea of how to reproduce the issue. =A0The symptoms indi=
cate
> that the database configuration file(s) are not getting installed into th=
e
> target filesystem before the actual install starts...
>



> --Mark
>
>
> On 6/2/12 12:10 PM, Flanagan, Elizabeth wrote:
>>
>> On Thu, May 31, 2012 at 2:42 PM, Mark Hatle<mark.hatle@windriver.com>
>> =A0wrote:
>>>
>>> Rebase of the v2 changes.
>>>
>>> Re-disabled the "test" chunk.. =A0this should resolve the hang problem =
a
>>> few people have observed.
>>>
>>> v2 message follows:
>>>
>>> Berkley DB also gets upreved, and a new package ossp-uuid gets added to
>>> the system.
>>>
>>> This was -heavily- tested with and without zypper on IA, and PPC.
>>>
>>> In addition a minor performance enhancement with a query operation was
>>> added.
>>>
>>> The uprev also adds the capability of using PACKAGECONFIG settings to
>>> tailor
>>> the behavior of RPM.
>>>
>>> V2 changes:
>>>
>>> Fix a problem with libuuid.so from util-linux would sometimes be linked
>>> into
>>> the binary.
>>>
>>> Also force libzypp, sat-solver and zypper to refresh via a PR bump.
>>
>>
>> Something in this patch set seems to be killing the master_under_test
>> build of meta-toolchain-gmae.
>>
>> See:
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/517=
/steps/shell_68/logs/stdio
>>
>> -b
>>
>>>
>>>
>>> The following changes since commit
>>> e3113827810e98eb1b012f0b280fb917199704c1:
>>>
>>> =A0webkit-gtk: Use glib as unicode backend to avoid browser crash
>>> (2012-05-30 17:37:58 +0100)
>>>
>>> are available in the git repository at:
>>> =A0git://git.pokylinux.org/poky-contrib mhatle/rpm
>>> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dmhatle/rpm
>>>
>>> Mark Hatle (5):
>>> =A0rpm: Upgrade RPM to 5.4.8 =A0(db to 5.3.15)
>>> =A0rpm: Upgrade RPM to 5.4.9
>>> =A0ossp-uuid: Add oss-uuid package and RPM 5.4.9 integration
>>> =A0package_rpm: Add capability to directly query packageorigin
>>> =A0rpm: Bump PR numbers on componets that require RPM
>>>
>>> =A0meta/classes/package_rpm.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 18 +-
>>> =A0meta/classes/rootfs_rpm.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 22 +-
>>> =A0.../ossp-uuid/0001-Change-library-name.patch =A0 =A0 =A0 | =A0112 ++=
+++
>>> =A0...erve-m-option-status-in-v-option-handling.patch | =A0 55 +++
>>> =A0.../ossp-uuid/0003-Fix-whatis-entries.patch =A0 =A0 =A0 =A0| =A0 51 =
+++
>>> =A0.../ossp-uuid/0004-fix-data-uuid-from-string.patch | =A0 36 ++
>>> =A0.../ossp-uuid/ossp-uuid/uuid-libtool.patch =A0 =A0 =A0 =A0 | =A0 24 =
+
>>> =A0.../ossp-uuid/ossp-uuid/uuid-nostrip.patch =A0 =A0 =A0 =A0 | =A0 16 =
+
>>> =A0meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb | =A0 58 +++
>>> =A0.../rpm/rpm/fix_for_automake_1.11.2.patch =A0 =A0 =A0 =A0 =A0| =A0 5=
4 ---
>>> =A0.../rpm/rpm/fprint-pointer-fix.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 35 --
>>> =A0.../rpm/rpm/remove-compiled-tests.patch =A0 =A0 =A0 =A0 =A0 =A0| =A0=
443
>>> --------------------
>>> =A0meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch =A0 | =A0 22 -
>>> =A0meta/recipes-devtools/rpm/rpm/rpm-autogen.patch =A0 =A0| =A0 41 +--
>>> =A0meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch =A0| =A0 16 +-
>>> =A0.../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch | =A0 12 +-
>>> =A0meta/recipes-devtools/rpm/rpm/rpm-lua.patch =A0 =A0 =A0 =A0| =A0 29 =
++
>>> =A0.../rpm/rpm/rpm-no-perl-urpm.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 43 ++
>>> =A0meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch =A0 =A0| =A0 36 --
>>> =A0meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch =A0| =A0 20 +
>>> =A0.../rpm/rpm/rpm-packageorigin.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 23 +
>>> =A0.../rpm/rpm/rpm-scriptletexechelper.patch =A0 =A0 =A0 =A0 =A0| =A0 3=
3 +-
>>> =A0meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch | =A0 26 +-
>>> =A0.../rpm/{rpm_5.4.0.bb =3D> =A0rpm_5.4.9.bb} =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0158 ++++----
>>> =A0.../libzypp/libzypp/libzypp-rpm549.patch =A0 =A0 =A0 =A0 =A0 | =A0 2=
8 ++
>>> =A0meta/recipes-extended/libzypp/libzypp_git.bb =A0 =A0 =A0 | =A0 =A03 =
+-
>>> =A0meta/recipes-extended/sat-solver/sat-solver_git.bb | =A0 =A02 +-
>>> =A0meta/recipes-extended/zypper/zypper_git.bb =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
>>> =A0.../db/{db_5.1.19.bb =3D> =A0db_5.3.15.bb} =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A08 +-
>>> =A029 files changed, 652 insertions(+), 774 deletions(-)
>>> =A0create mode 100644
>>> meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Change-library-name.patc=
h
>>> =A0create mode 100644
>>> meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid-preserve-m-option-s=
tatus-in-v-option-handling.patch
>>> =A0create mode 100644
>>> meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-whatis-entries.patch
>>> =A0create mode 100644
>>> meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-data-uuid-from-strin=
g.patch
>>> =A0create mode 100644
>>> meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libtool.patch
>>> =A0create mode 100644
>>> meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nostrip.patch
>>> =A0create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.b=
b
>>> =A0delete mode 100644
>>> meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch
>>> =A0delete mode 100644
>>> meta/recipes-devtools/rpm/rpm/fprint-pointer-fix.patch
>>> =A0delete mode 100644
>>> meta/recipes-devtools/rpm/rpm/remove-compiled-tests.patch
>>> =A0delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch
>>> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua.patch
>>> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.pa=
tch
>>> =A0delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch
>>> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch
>>> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-packageorigin.p=
atch
>>> =A0rename meta/recipes-devtools/rpm/{rpm_5.4.0.bb =3D> =A0rpm_5.4.9.bb}=
 (76%)
>>> =A0create mode 100644
>>> meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch
>>> =A0rename meta/recipes-support/db/{db_5.1.19.bb =3D> =A0db_5.3.15.bb} (=
93%)
>>>
>>> --
>>> 1.7.3.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


