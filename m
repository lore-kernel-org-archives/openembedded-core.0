Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351CDC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 11:12:33 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com
 [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web11.28725.1647861150820170910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 04:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=kpxM/p3v;
 spf=pass (domain: bmw.de, ip: 207.54.69.27,
 mailfrom: prvs=0727fcc33=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1647861150; x=1679397150;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QfvlBFZS33ZKI7yCdaAW4tjfK9L0e2Y71tcBjGlmsrE=;
  b=kpxM/p3vyczPqSWthzc8Kw5RPkR2XRpDphBZmTZQBilqRABWdLQUfaRv
   QcBPXNYirYxH2soCOyzcwpQVkvKLpLOnUiI76uOivh81S19XhVKBtVosH
   fw2nZDwLkHZOg+yGoVJ5baPwVUjYkclsvcc6Rm/u8KV8BuL06Oso0Pwgc
   8=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 21 Mar 2022 12:12:28 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
 21 Mar 2022 12:12:28 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp)
 ([160.46.167.67])
 by esabb2.muc with ESMTP/TLS; 21 Mar 2022 12:12:28 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Mon, 21 Mar 2022 12:12:27 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.028; Mon,
 21 Mar 2022 12:12:27 +0100
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>,
	<paul.gortmaker@windriver.com>
Subject: Re: [OE-core] [RFC PATCH] kernel: Add kernel-cve-tool support to help
 monitor kernel CVEs
Thread-Topic: [OE-core] [RFC PATCH] kernel: Add kernel-cve-tool support to
 help monitor kernel CVEs
Thread-Index: AQHYO8czXO//1u43XUy+sZAONA//lazJZ8yAgAAvJ4CAAAHcAIAAA6CAgAAEVgA=
Date: Mon, 21 Mar 2022 11:12:27 +0000
Message-ID: <Yjhdmia52Lzp5JlS@korppu>
References: <20220319192555.1118739-1-richard.purdie@linuxfoundation.org>
 <Yjgtzy+HeQfaEOqQ@korppu>
 <3de447ee8439264e9164d5f9eded0ea0a6891500.camel@linuxfoundation.org>
 <YjhW7Krf3WZmBbQK@korppu>
 <7712ff4a2b5054303f127fd23d363cdfd10c47bb.camel@linuxfoundation.org>
In-Reply-To: 
 <7712ff4a2b5054303f127fd23d363cdfd10c47bb.camel@linuxfoundation.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <233E3C3729A96A42BFCDF00F46A27960@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 11:12:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163499

On Mon, Mar 21, 2022 at 10:56:55AM +0000, Richard Purdie wrote:
> On Mon, 2022-03-21 at 10:43 +0000, Mikko.Rapeli@bmw.de wrote:
> > On Mon, Mar 21, 2022 at 10:37:17AM +0000, Richard Purdie wrote:
> > > On Mon, 2022-03-21 at 07:48 +0000, Mikko.Rapeli@bmw.de wrote:
> > > > Hi,
> > > >=20
> > > > Thanks for the interesting patch!
> > > >=20
> > > > On Sat, Mar 19, 2022 at 07:25:55PM +0000, Richard Purdie wrote:
> > > > > This adds support for a random kernel CVE monitoring tool which c=
an be
> > > > > run as a specific task against a kernel:
> > > > >=20
> > > > > $ bitbake linux-yocto -c checkcves
> > > > > [...]
> > > > > Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 135 (=
100% match, 100% complete)
> > > > > NOTE: Executing Tasks
> > > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 =
do_checkcves: Should consider cherry-pick for be80a1d3f9dbe5aee79a325964f70=
37fe2d92f30:CVE-2021-4204 (NOT FOR THIS VERSION)
> > > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 =
do_checkcves: Should consider cherry-pick for 20b2aff4bc15bda809f994761d571=
9827d66c0b4:CVE-2022-0500 (NOT FOR THIS VERSION)
> > > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 =
do_checkcves: Should consider cherry-pick for 55749769fe608fa3f4a075e42e89d=
237c8e37637:CVE-2021-4095 (NOT FOR THIS VERSION)
> > > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 =
do_checkcves: Should consider cherry-pick for 4fbcc1a4cb20fe26ad0225679c536=
c80f1648221:CVE-2022-26490 (NOT FOR THIS VERSION)
> > > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 =
do_checkcves: Should consider cherry-pick for dbbf2d1e4077bab0c65ece2765d3f=
c69cf7d610f:CVE-2019-15239 (NOT FOR THIS VERSION)
> > > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 =
do_checkcves: Should consider cherry-pick for 89f3594d0de58e8a57d92d497dea9=
fee3d4b9cda:CVE-2022-24958 (NOT FOR THIS VERSION)
> > > > > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 =
do_checkcves: Should consider cherry-pick for 1bfba2f4270c64c912756fc76621b=
bce959ddf2e:CVE-2020-25220 (NOT FOR THIS VERSION)
> > > > > NOTE: Tasks Summary: Attempted 627 tasks of which 626 didn't need=
 to be rerun and all succeeded.
> > > > >=20
> > > > > Posted as an RFC to see what people think of this. I make no clai=
ms
> > > > > on how useful it is/isn't but wanted to show integration isn't di=
fficult
> > > > > and provide some inspiration for ideas.
> > > > >=20
> > > > > Details on the tool in question: https://github.com/madisongh/ker=
nel-cve-tool
> > > > >=20
> > > > > I've ignored the NO-FIXES-AVILABLE and PATCHED-CVES files.
> > > > >=20
> > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org=
>
> > > > > ---
> > > > >  meta/classes/kernel.bbclass                   | 10 ++++++++++
> > > > >  .../kernel-cve-tool/kernel-cve-tool_git.bb    | 20 +++++++++++++=
++++++
> > > > >  2 files changed, 30 insertions(+)
> > > > >  create mode 100644 meta/recipes-kernel/kernel-cve-tool/kernel-cv=
e-tool_git.bb
> > > > >=20
> > > > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bb=
class
> > > > > index 4f304eb9c7a..a842747b9d9 100644
> > > > > --- a/meta/classes/kernel.bbclass
> > > > > +++ b/meta/classes/kernel.bbclass
> > > > > @@ -753,6 +753,16 @@ addtask sizecheck before do_install after do=
_strip
> > > > > =20
> > > > >  inherit kernel-artifact-names
> > > > > =20
> > > > > +do_checkcves () {
> > > > > +	cd ${S}
> > > > > +	kernel-cve-tool -P ${STAGING_DATADIR_NATIVE}/kernel-cvedb
> > > > > +	while read -r line; do=20
> > > > > +		bbwarn "Should consider cherry-pick for $line";=20
> > > >=20
> > > > cherry-picking isn't recommended. Instead, stable releases should b=
e merged
> > > > fully into product trees to fix CVE and other critical bugs.
> > > >=20
> > > > cherry-picking will miss bugs which don't yet have CVEs or exploits=
.
> > > > cherry-picking will also miss non-obvious patch dependencies.
> > > >=20
> > > > Kernel community including Android documentation strongly recommend=
s
> > > > stable tree merges.
> > >=20
> > > If you have a stable tree available!
> >=20
> > As a git remote you always will. If you get a BSP Linux kernel without
> > git version history, well you and your vendors are doing it all wrong.
> >=20
> > It is always possible to merge stable tree releases into vendor trees.
> >=20
> > The amount of hacks in vendor trees can make this hard, e.g. merge conf=
licts, but
> > it is still the best practice which will be better in the long term ins=
tead of
> > cherry-picking only CVE fixes.
>=20
> My point was that those stable trees only have a certain lifetime though.=
 What
> do you do once you're past that?

Update to a maintained LTS version. This can be done.

If anyone thinks SOC vendors provide Linux kernel source trees which are pr=
oduct
quality, well they are wrong. The SoC specific changes may be product quali=
ty
from the vendors point of view and ok for the customer functionality, but t=
here are millions
of code lines in the kernel which are maintained by the kernel.org communit=
y and from which
issues and bugs are discovered all the time.

All the SoC vendors which I've worked with, and this is really long list, d=
o it
wrong. They provide a Linux kernel tree and rarely if ever update it with k=
ernel.org
(or Android) stable tree LTS releases. Thus they are not safe to use in pro=
ducts.
An SoC vendor tree which is missing years of fixes is common. They are also=
 missing
generic subsystem patches for stability issues which customers then see if =
they test
hard enough.

> I appreciate the correct answer is upgrade. I suspect that isn't always a=
n
> option and having some idea of the security issues in your tree is probab=
ly
> better than no idea.

It's ok to provide the data of CVEs affecting the current kernel. The data =
is
really useful and can also tell that no update is actually needed when the
product configuration isn't affected by any of the mentioned issues. An upd=
ate
still makes sense a few times per year, though, because a lot of stable ker=
nel fixes
will get the CVE status years after the patches were merged once someone fi=
gures
out an attack vector and a working exploit.

I just do not want to recommend fixing the issues by applying a few cherry-=
picked
patches. That's not the way to go with the Linux kernel.

-Mikko=

