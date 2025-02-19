Return-Path: <Daniel.Mueller@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A079EC021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 09:47:42 +0000 (UTC)
Subject: Re: [PATCH v2] kernel.bbclass: Handle possible multiconfig.
To: openembedded-core@lists.openembedded.org
From: "Mueller, Daniel" <Daniel.Mueller@karlstorz.com>
X-Originating-Location: CH (147.161.228.102)
X-Originating-Platform: Linux Firefox 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 19 Feb 2025 01:47:39 -0800
References: <ad3e4563833e3c899f0e10ee4c1eed6115554f12.camel@linuxfoundation.org>
In-Reply-To: <ad3e4563833e3c899f0e10ee4c1eed6115554f12.camel@linuxfoundation.org>
Message-ID: <3702.1739958459103063665@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="fYDI20wemvScSPfRRZKK"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 09:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211695

--fYDI20wemvScSPfRRZKK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From: Sebastian Zenker <sebastian.zenker@gmx.de>
When specifying the dependencies of do_bundle_initramfs the current
multiconfig might not be the default. This fixes the dependencies between
the multiconfigs if the current differs to default.
Signed-off-by: Mueller, Daniel <daniel.mueller@karlstorz.com>
---
Your right, handling 'default' isn't required anymore, my apologies. I've
reworked the changes and tested them against the master branch.
Please also ignore the other 2 patches of the original patchset, those
have been been integrated into master already.
Regards, Daniel
meta/classes-recipe/kernel.bbclass | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
index 617727a989..6fe7c60e17 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -146,7 +146,7 @@ set -e
# standalone for use by wic and other tools.
if image:
if d.getVar('INITRAMFS_MULTICONFIG'):
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag('do_bundle_initr=
amfs', 'mcdepends', ' mc::${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_im=
age_complete')
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag('do_bundle_initr=
amfs', 'mcdepends', ' mc:${BB_CURRENT_MC}:${INITRAMFS_MULTICONFIG}:${INITRA=
MFS_IMAGE}:do_image_complete')
else:
d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_i=
mage_complete')
if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):

--fYDI20wemvScSPfRRZKK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>From: Sebastian Zenker &lt;sebastian.zenker@gmx.de&gt;</div>
<div>When specifying the dependencies of do_bundle_initramfs the current<br=
 />multiconfig might not be the default. This fixes the dependencies betwee=
n<br />the multiconfigs if the current differs to default.</div>
<div>Signed-off-by: Mueller, Daniel &lt;daniel.mueller@karlstorz.com&gt;<br=
 />---<br />Your right, handling 'default' isn't required anymore, my apolo=
gies. I've<br />reworked the changes and tested them against the master bra=
nch.</div>
<div>Please also ignore the other 2 patches of the original patchset, those=
<br />have been been integrated into master already.</div>
<div>Regards, Daniel<br />&nbsp;meta/classes-recipe/kernel.bbclass | 2 +-<b=
r />&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)</div>
<div>diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass<br />index 617727a989..6fe7c60e17 100644<br />--- a/meta/cla=
sses-recipe/kernel.bbclass<br />+++ b/meta/classes-recipe/kernel.bbclass<br=
 />@@ -146,7 +146,7 @@ set -e<br />&nbsp; &nbsp; &nbsp;# standalone for use=
 by wic and other tools.<br />&nbsp; &nbsp; &nbsp;if image:<br />&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;if d.getVar('INITRAMFS_MULTICONFIG'):<br />- &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d.appendVarFlag('do_bundle_initramfs', '=
mcdepends', ' mc::${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_comp=
lete')<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d.appendVarFlag('do_=
bundle_initramfs', 'mcdepends', ' mc:${BB_CURRENT_MC}:${INITRAMFS_MULTICONF=
IG}:${INITRAMFS_IMAGE}:do_image_complete')<br />&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;else:<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d.appendV=
arFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_comp=
lete')<br />&nbsp; &nbsp; &nbsp;if image and bb.utils.to_boolean(d.getVar('=
INITRAMFS_IMAGE_BUNDLE')):</div>
</div>

--fYDI20wemvScSPfRRZKK--

