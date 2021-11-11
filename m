Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627E1C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 08:40:45 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.8026.1636620044016754805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 00:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232,
 mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id AE167200003;
	Thu, 11 Nov 2021 08:40:41 +0000 (UTC)
Date: Thu, 11 Nov 2021 09:40:37 +0100
From: Quentin Schulz <foss@0leil.net>
To: openembedded-core@lists.openembedded.org, kai <kai.kang@windriver.com>
Subject: =?US-ASCII?Q?Re=3A_=5BOE-core=5D_=5BPATCH=5D_convert-srcuri=2Ep?=
 =?US-ASCII?Q?y=3A_remove_extra_spaces_before_backslash?=
In-Reply-To: <20211111034814.16625-1-kai.kang@windriver.com>
References: <20211111034814.16625-1-kai.kang@windriver.com>
Message-ID: <A219A85E-A0CE-4F41-A92D-094DEC90E3F1@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 08:40:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158148

Hi Kai,

On November 11, 2021 4:48:14 AM GMT+01:00, kai <kai=2Ekang@windriver=2Ecom=
> wrote:
>From: Kai Kang <kai=2Ekang@windriver=2Ecom>
>
>There may be more than one spaces before backslash in SRC_URI=2E Strip

There could technically be tabs too and the current code (even after your =
patch) does not seem to handle that (from the git context I see in your pat=
ch)=2E Maybe a regex would be ok here, using \s* to match as many tabs and =
spaces as needed=2E Not sure we care that much but I wanted to raise this s=
o it's known at least=2E

Thanks for the patch,
Cheers
Quentin

>them otherwise it forges a malformed uri such as open-iscsi-user in
>meta-openstack:
>
>SRC_URI =3D "git://github=2Ecom/open-iscsi/open-iscsi=2Egit;protocol=3Dht=
tps  ;branch=3Dmaster \
>
>Signed-off-by: Kai Kang <kai=2Ekang@windriver=2Ecom>
>---
> scripts/contrib/convert-srcuri=2Epy | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/scripts/contrib/convert-srcuri=2Epy b/scripts/contrib/conver=
t-srcuri=2Epy
>index 5b362ea2e8=2E=2Ee7a97fdbd4 100755
>--- a/scripts/contrib/convert-srcuri=2Epy
>+++ b/scripts/contrib/convert-srcuri=2Epy
>@@ -36,7 +36,7 @@ def processfile(fn):
>                         if line=2Eendswith('"\n'):
>                             line =3D line=2Ereplace('"\n', ';branch=3Dma=
ster"\n')
>                         elif line=2Eendswith(" \\\n"):
>-                            line =3D line=2Ereplace(' \\\n', ';branch=3D=
master \\\n')
>+                            line =3D line=2Ereplace(' \\\n', '')=2Erstri=
p() + ';branch=3Dmaster \\\n'
>                         modified =3D True
>                     if ("git://" in line or "gitsm://" in line) and "git=
hub=2Ecom" in line and "protocol=3Dhttps" not in line and matchline(line):
>                         if "protocol=3Dgit" in line:
>@@ -44,7 +44,7 @@ def processfile(fn):
>                         elif line=2Eendswith('"\n'):
>                             line =3D line=2Ereplace('"\n', ';protocol=3D=
https"\n')
>                         elif line=2Eendswith(" \\\n"):
>-                            line =3D line=2Ereplace(' \\\n', ';protocol=
=3Dhttps \\\n')
>+                            line =3D line=2Ereplace(' \\\n', '')=2Erstri=
p() + ';protocol=3Dhttps \\\n'
>                         modified =3D True
>                     new_file=2Ewrite(line)
>         if modified:

