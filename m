Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QJqtg-00078n-9C
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 19:39:00 +0200
Received: by wwb17 with SMTP id 17so5914064wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 10:36:14 -0700 (PDT)
Received: by 10.217.4.66 with SMTP id t44mr4227239wes.104.1305048973703;
	Tue, 10 May 2011 10:36:13 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y35sm372433weq.15.2011.05.10.10.36.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 10:36:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DC97379.9020702@linux.intel.com>
Date: Tue, 10 May 2011 19:36:10 +0200
Message-Id: <9115F978-6F2D-4074-919C-F5911681601E@dominion.thruhere.net>
References: <1304151675-8653-1-git-send-email-koen@dominion.thruhere.net>
	<A6996345-EB9D-4298-942F-9CCDBA49BC30@dominion.thruhere.net>
	<4DC97379.9020702@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] git: make it work on the target
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
X-List-Received-Date: Tue, 10 May 2011 17:39:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 mei 2011, om 19:18 heeft Saul Wold het volgende geschreven:

>=20
> Koen,
>=20
> Have you built this against oe-core without a TK library available?

I see what you mean now, without a tk recipe available, I tested with a =
recipe available, but without having tk in sysroots. I'll send a patch =
to fix this shortly

>=20
> We did pull this patch into oe-core, but it breaks the world build.
>=20
> This was the problem I was trying to address the other day on the =
patch
> that RP bounced.  The inclusion of gitk/git-gui needs to be flexible =
based on TK and X11's availability.
>=20
> Thanks
> 	Sau!
>=20
>=20
> On 04/30/2011 01:22 AM, Koen Kooi wrote:
>> Saul, this depends on http://patches.openembedded.org/patch/3031/
>>=20
>> Op 30 apr 2011, om 10:21 heeft Koen Kooi het volgende geschreven:
>>=20
>>> Packaging is synced with OE .dev, but without the -large, thanks to =
pseudo we retain all (hard)links properly:
>>>=20
>>> * git-perltools holds all the utils requiring perl and adds =
appropriate RDEPENDS
>>> * git-tk holds the tcl/tk utils once they get activate
>>> * git now packages /usr/libexec/git-core
>>>=20
>>> The result:
>>>=20
>>> 8.5M	ipk/armv7a/git_1.7.4.3-r2_armv7a.ipk
>>> 3.1M	ipk/armv7a/git-dbg_1.7.4.3-r2_armv7a.ipk
>>> 4.0K	ipk/armv7a/git-dev_1.7.4.3-r2_armv7a.ipk
>>> 12K	ipk/armv7a/git-doc_1.7.4.3-r2_armv7a.ipk
>>> 136K	ipk/armv7a/git-perltools_1.7.4.3-r2_armv7a.ipk
>>>=20
>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>> ---
>>> meta/recipes-devtools/git/git.inc        |   32 =
++++++++++++++++++++++++++++-
>>> meta/recipes-devtools/git/git_1.7.4.3.bb |    2 +-
>>> 2 files changed, 31 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-devtools/git/git.inc =
b/meta/recipes-devtools/git/git.inc
>>> index 843a1d3..7f12859 100644
>>> --- a/meta/recipes-devtools/git/git.inc
>>> +++ b/meta/recipes-devtools/git/git.inc
>>> @@ -14,11 +14,39 @@ EXTRA_OECONF =3D =
"--with-perl=3D${STAGING_BINDIR_NATIVE}/perl --without-tcltk"
>>> inherit autotools
>>>=20
>>> do_install () {
>>> -	oe_runmake install DESTDIR=3D"${D}" bindir=3D${bindir} =
gitexecdir=3D${gitexecdir} \
>>> +	oe_runmake install DESTDIR=3D"${D}" bindir=3D${bindir} \
>>> 		template_dir=3D${datadir}/git-core/templates \
>>> 		GIT_PYTHON_DIR=3D${D}${datadir}/git-core/python
>>> }
>>>=20
>>> -FILES_${PN} +=3D "${datadir}/git-core"
>>> +FILES_${PN} +=3D "${datadir}/git-core ${libxecdir}/git-core/"
>>> +FILES_${PN}-dbg +=3D "${libexecdir}/git-core/.debug"
>>> +
>>> +# Git tools requiring perl
>>> +PACKAGES =3D+ "${PN}-perltools"
>>> +FILES_${PN}-perltools +=3D " \
>>> +    ${libexecdir}/git-core/git-add--interactive \
>>> +    ${libexecdir}/git-core/git-archimport \
>>> +    ${libexecdir}/git-core/git-cvsexportcommit \
>>> +    ${libexecdir}/git-core/git-cvsimport \
>>> +    ${libexecdir}/git-core/git-cvsserver \
>>> +    ${bindir}/git-cvsserver \
>>> +    ${libexecdir}/git-core/git-difftool \
>>> +    ${libexecdir}/git-core/git-relink \
>>> +    ${libexecdir}/git-core/git-send-email \
>>> +    ${libexecdir}/git-core/git-svn \
>>> +    ${datadir}/perl \
>>> +"
>>> +RDEPENDS_${PN}-perltools =3D "${PN} perl perl-module-file-path =
findutils"
>>> +
>>> +# git-tk package with gitk and git-gui
>>> +PACKAGES =3D+ "${PN}-tk"
>>> +RDEPENDS_${PN}-tk =3D "${PN} tk tcl"
>>> +EXTRA_OEMAKE =3D "TCL_PATH=3D${STAGING_BINDIR_CROSS}/tclsh"
>>> +FILES_${PN}-tk =3D " \
>>> +    ${bindir}/gitk \
>>> +    ${datadir}/gitk \
>>> +"
>>> +
>>>=20
>>> BBCLASSEXTEND =3D "native"
>>> diff --git a/meta/recipes-devtools/git/git_1.7.4.3.bb =
b/meta/recipes-devtools/git/git_1.7.4.3.bb
>>> index 2ff1ed5..45ef61b 100644
>>> --- a/meta/recipes-devtools/git/git_1.7.4.3.bb
>>> +++ b/meta/recipes-devtools/git/git_1.7.4.3.bb
>>> @@ -1,6 +1,6 @@
>>> require git.inc
>>>=20
>>> -PR =3D "r1"
>>> +PR =3D "r2"
>>>=20
>>> EXTRA_OECONF +=3D "ac_cv_snprintf_returns_bogus=3Dno =
ac_cv_c_c99_format=3Dyes \
>>>                  =
ac_cv_fread_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes} \
>>> --
>>> 1.6.6.1
>>>=20
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



