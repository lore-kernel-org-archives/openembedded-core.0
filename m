Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE97BC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 14:15:12 +0000 (UTC)
Received: from 18.mo582.mail-out.ovh.net (18.mo582.mail-out.ovh.net [46.105.73.110])
 by mx.groups.io with SMTP id smtpd.web10.37074.1702476903951073138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 06:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 46.105.73.110, mailfrom: jonathan@joggee.fr)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.9.3])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 0771B28F44
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:15:01 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-j56hl (unknown [10.110.178.147])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A1C3B1FED6
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:15:01 +0000 (UTC)
Received: from joggee.fr ([37.59.142.106])
	by ghost-submission-6684bf9d7b-j56hl with ESMTPSA
	id sJnBJmW8eWWtJQEAcHI1ww
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:15:01 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-106R00649fc1a78-a0e8-47b4-9424-768c48bed9b6,
                    8AE51020AAF3E055EAEAC9529530B6D231DC969C) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CXN9OZ7FYB2C.Q33EONS2A1HX@joggee.fr>
Message-Id: <CXN9OZ7FYOXZ.2O53J270GP5ED@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Thu, 30 Nov 2023 12:49:13 +0000
Subject: [PATCH 1/3] lib/oe/package: replace in place PN-locale-* packages in
 PACKAGES
X-Ovh-Tracer-Id: 13575256653270944891
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 21
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeljedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucffrghtvgcuihhnuchprghsthculddvuddmnecujfgurhepjgfkvffhfffusedttdertddttddtnecuhfhrohhmpedflfhonhgrthhhrghnucfifgfknffnqffvfdcuoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqnecuggftrfgrthhtvghrnhepleduieejtedvveevtdfgheejhfdtheevheejhfejjeeggfehhfffgeethfdvueeknecukfhppeduvdejrddtrddtrddupdekgedrudegrddukeehrdefgedpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 14:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192293

split_locales() removes PN-locale from PACKAGES and adds PN-locale-* to the end.
As the PN-locale package typically appears before PN base package, it may result
in paths not installed in PN-locale-* packages if already catched by PN. Now
insert PN-locale-* exactly where PN-locale was existing in list to avoid such
an issue.
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



