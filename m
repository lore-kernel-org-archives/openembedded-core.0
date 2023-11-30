Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F08AC4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 15:07:23 +0000 (UTC)
Received: from 9.mo576.mail-out.ovh.net (9.mo576.mail-out.ovh.net [46.105.56.78])
 by mx.groups.io with SMTP id smtpd.web11.37989.1702480039152472396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 07:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 46.105.56.78, mailfrom: jonathan@joggee.fr)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.176.72])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 7142730F7D
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:17 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-s8sv4 (unknown [10.110.178.109])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 166CE1FE61
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:17 +0000 (UTC)
Received: from joggee.fr ([37.59.142.102])
	by ghost-submission-6684bf9d7b-s8sv4 with ESMTPSA
	id GBvIBKXIeWXXtQAAm3lx3g
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:17 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R0046cbd3b30-7719-480e-93c8-55d6da904864,
                    8AE51020AAF3E055EAEAC9529530B6D231DC969C) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CXNASYPMN4HU.28KB1ZM3347U5@joggee.fr>
Message-Id: <CXNASYPMNLFD.9FZCU6S0NH67@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Thu, 30 Nov 2023 12:49:13 +0000
Subject: [PATCH v2 1/3] lib/oe/package: replace in place PN-locale-* packages
 in PACKAGES
X-Ovh-Tracer-Id: 14457962180419521659
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 21
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeljedgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucffrghtvgcuihhnuchprghsthculddvuddmnecujfgurhepjgfkvffhfffusedttdertddttddtnecuhfhrohhmpedflfhonhgrthhhrghnucfifgfknffnqffvfdcuoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqnecuggftrfgrthhtvghrnhepleduieejtedvveevtdfgheejhfdtheevheejhfejjeeggfehhfffgeethfdvueeknecukfhppeduvdejrddtrddtrddupdekgedrudegrddukeehrdefgedpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 15:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192299

split_locales() removes PN-locale from PACKAGES and adds PN-locale-* to the end.
As the PN-locale package typically appears before PN base package, it may result
in paths not installed in PN-locale-* packages if already catched by PN. Now
insert PN-locale-* exactly where PN-locale was existing in list to avoid such
an issue.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
---
 meta/lib/oe/package.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 9a465eaa09..2f7a50e144 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -647,8 +647,11 @@ def split_locales(d):
     dvar = d.getVar('PKGD')
     pn = d.getVar('LOCALEBASEPN')
 
-    if pn + '-locale' in packages:
-        packages.remove(pn + '-locale')
+    try:
+        locale_index = packages.index(pn + '-locale')
+        packages.pop(locale_index)
+    except ValueError:
+        locale_index = len(packages)
 
     localedir = os.path.join(dvar + datadir, 'locale')
 
@@ -665,7 +668,8 @@ def split_locales(d):
     for l in sorted(locales):
         ln = legitimize_package_name(l)
         pkg = pn + '-locale-' + ln
-        packages.append(pkg)
+        packages.insert(locale_index, pkg)
+        locale_index += 1
         d.setVar('FILES:' + pkg, os.path.join(datadir, 'locale', l))
         d.setVar('RRECOMMENDS:' + pkg, '%svirtual-locale-%s' % (mlprefix, ln))
         d.setVar('RPROVIDES:' + pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
-- 
2.43.0



