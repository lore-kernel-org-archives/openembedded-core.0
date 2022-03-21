Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3466CC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 10:44:07 +0000 (UTC)
Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com
 [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web10.28813.1647859445334605972
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 03:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=kFBJTZAU;
 spf=pass (domain: bmw.de, ip: 207.54.68.121,
 mailfrom: prvs=0727fcc33=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1647859444; x=1679395444;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=73XA+T/itcKWn+BGhthMmENqw4LaQe2TDxK3DNTDezs=;
  b=kFBJTZAUlF2db0ljhJWjbJugyBNZnNdyoccPZYGebUSQvD8fNEqnDZ8S
   KBwauKFQZSaTutwaxw/9MOnWkw9k8CNjcQwIxTuQK6ClwpjVbxyb5XF/8
   X1UcPyULsRl0AP5FM82tWn0bJQ0PK7R5tvkv24ur+GEwmtJq1IpwIaDZM
   M=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 21 Mar 2022 11:44:01 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw3.muc with ESMTP/TLS;
 21 Mar 2022 11:44:02 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp)
 ([160.46.167.66])
 by esabb6.muc with ESMTP/TLS; 21 Mar 2022 11:43:58 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Mon, 21 Mar 2022 11:43:57 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.028; Mon,
 21 Mar 2022 11:43:58 +0100
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>,
	<paul.gortmaker@windriver.com>
Subject: Re: [OE-core] [RFC PATCH] kernel: Add kernel-cve-tool support to help
 monitor kernel CVEs
Thread-Topic: [OE-core] [RFC PATCH] kernel: Add kernel-cve-tool support to
 help monitor kernel CVEs
Thread-Index: AQHYO8czXO//1u43XUy+sZAONA//lazJZ8yAgAAvJ4CAAAHcAA==
Date: Mon, 21 Mar 2022 10:43:58 +0000
Message-ID: <YjhW7Krf3WZmBbQK@korppu>
References: <20220319192555.1118739-1-richard.purdie@linuxfoundation.org>
 <Yjgtzy+HeQfaEOqQ@korppu>
 <3de447ee8439264e9164d5f9eded0ea0a6891500.camel@linuxfoundation.org>
In-Reply-To: 
 <3de447ee8439264e9164d5f9eded0ea0a6891500.camel@linuxfoundation.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AE7A9A17808FDC4EAD0A5BC81E9F7B42@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 10:44:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163497

On Mon, Mar 21, 2022 at 10:37:17AM +0000, Richard Purdie wrote:
> On Mon, 2022-03-21 at 07:48 +0000, Mikko.Rapeli@bmw.de wrote:
> > Hi,
> >=20
> > Thanks for the interesting patch!
> >=20
> > On Sat, Mar 19, 2022 at 07:25:55PM +0000, Richard Purdie wrote:
> > > This adds support for a random kernel CVE monitoring tool which can b=
e
> > > run as a specific task against a kernel:
> > >=20
> > > $ bitbake linux-yocto -c checkcves
> > > [...]
> > > Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 135 (100%=
 match, 100% complete)
> > > NOTE: Executing Tasks
> > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_c=
heckcves: Should consider cherry-pick for be80a1d3f9dbe5aee79a325964f7037fe=
2d92f30:CVE-2021-4204 (NOT FOR THIS VERSION)
> > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_c=
heckcves: Should consider cherry-pick for 20b2aff4bc15bda809f994761d5719827=
d66c0b4:CVE-2022-0500 (NOT FOR THIS VERSION)
> > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_c=
heckcves: Should consider cherry-pick for 55749769fe608fa3f4a075e42e89d237c=
8e37637:CVE-2021-4095 (NOT FOR THIS VERSION)
> > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_c=
heckcves: Should consider cherry-pick for 4fbcc1a4cb20fe26ad0225679c536c80f=
1648221:CVE-2022-26490 (NOT FOR THIS VERSION)
> > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_c=
heckcves: Should consider cherry-pick for dbbf2d1e4077bab0c65ece2765d3fc69c=
f7d610f:CVE-2019-15239 (NOT FOR THIS VERSION)
> > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_c=
heckcves: Should consider cherry-pick for 89f3594d0de58e8a57d92d497dea9fee3=
d4b9cda:CVE-2022-24958 (NOT FOR THIS VERSION)
> > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_c=
heckcves: Should consider cherry-pick for 1bfba2f4270c64c912756fc76621bbce9=
59ddf2e:CVE-2020-25220 (NOT FOR THIS VERSION)
> > > NOTE: Tasks Summary: Attempted 627 tasks of which 626 didn't need to =
be rerun and all succeeded.
> > >=20
> > > Posted as an RFC to see what people think of this. I make no claims
> > > on how useful it is/isn't but wanted to show integration isn't diffic=
ult
> > > and provide some inspiration for ideas.
> > >=20
> > > Details on the tool in question: https://github.com/madisongh/kernel-=
cve-tool
> > >=20
> > > I've ignored the NO-FIXES-AVILABLE and PATCHED-CVES files.
> > >=20
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/classes/kernel.bbclass                   | 10 ++++++++++
> > >  .../kernel-cve-tool/kernel-cve-tool_git.bb    | 20 +++++++++++++++++=
++
> > >  2 files changed, 30 insertions(+)
> > >  create mode 100644 meta/recipes-kernel/kernel-cve-tool/kernel-cve-to=
ol_git.bb
> > >=20
> > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclas=
s
> > > index 4f304eb9c7a..a842747b9d9 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -753,6 +753,16 @@ addtask sizecheck before do_install after do_str=
ip
> > > =20
> > >  inherit kernel-artifact-names
> > > =20
> > > +do_checkcves () {
> > > +	cd ${S}
> > > +	kernel-cve-tool -P ${STAGING_DATADIR_NATIVE}/kernel-cvedb
> > > +	while read -r line; do=20
> > > +		bbwarn "Should consider cherry-pick for $line";=20
> >=20
> > cherry-picking isn't recommended. Instead, stable releases should be me=
rged
> > fully into product trees to fix CVE and other critical bugs.
> >=20
> > cherry-picking will miss bugs which don't yet have CVEs or exploits.
> > cherry-picking will also miss non-obvious patch dependencies.
> >=20
> > Kernel community including Android documentation strongly recommends
> > stable tree merges.
>=20
> If you have a stable tree available!

As a git remote you always will. If you get a BSP Linux kernel without
git version history, well you and your vendors are doing it all wrong.

It is always possible to merge stable tree releases into vendor trees.

The amount of hacks in vendor trees can make this hard, e.g. merge conflict=
s, but
it is still the best practice which will be better in the long term instead=
 of
cherry-picking only CVE fixes.

> > https://source.android.com/devices/architecture/kernel/releases#keeping=
-a-
> > secure-system
> >=20
> > "When deploying a device that uses Linux, it is strongly recommended th=
at all
> > LTS kernel updates be taken by the manufacturer and pushed out to their=
 users
> > after proper testing shows the update works well"
> >=20
> > http://kroah.com/log/blog/2018/02/05/linux-kernel-release-model/
> >=20
> > "When deploying a device that uses Linux, it is strongly recommended th=
at all
> > LTS kernel updates be taken by the manufacturer and pushed out to their=
 users
> > after proper testing shows the update works well. As was described abov=
e, it
> > is not wise to try to pick and choose various patches from the LTS
> > releases..."
> >=20
> > I think the cherry-pick status is not useful, but the list of CVEs and =
patches
> > to various subsystems is useful to users. IMO the tool should ask for a=
 point
> > release merge from upstream instead.
>=20
> I think a lot depends on the scenario you're using this in. The different=
 ouputs
> are useful in different scenarios...

I'm sorry but really, there isn't anything else which will work in the long=
 run.
If anyone proposes cherry-picking Linux kernel CVE patches, they are doing =
it wrong.

> >=20
> > > +	done < ${S}/cherry-picks.list
> > > +}
> > > +do_checkcves[depends] =3D "kernel-cve-tool-native:do_populate_sysroo=
t"
> > > +addtask checkcves after do_configure
> > > +
> > >  kernel_do_deploy() {
> > >  	deployDir=3D"${DEPLOYDIR}"
> > >  	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
> > > diff --git a/meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.=
bb b/meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb
> > > new file mode 100644
> > > index 00000000000..d2402bae052
> > > --- /dev/null
> > > +++ b/meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb
> > > @@ -0,0 +1,20 @@
> > > +HOMEPAGE =3D "https://github.com/madisongh/kernel-cve-tool/"
> > > +SRC_URI =3D "git://github.com/madisongh/kernel-cve-tool;protocol=3Dh=
ttps;branch=3Dmaster;name=3Dtool \
> > > +           git://github.com/nluedtke/linux_kernel_cves.git;protocol=
=3Dhttps;branch=3Dmaster;destsuffix=3Dcvedb;name=3Ddata"
> >=20
> > Could the 'data' be handled like the CVE database and updated regularly=
/automatically?
>=20
> Something like:
>=20
> SRCREV_data =3D "${AUTOREV}"
>=20
> should do that. In some ways I prefer this to the CVE database approach s=
ince
> you always have a deterministic outcome for a given revision.

Yep, good to know.

Cheers,

-Mikko=

