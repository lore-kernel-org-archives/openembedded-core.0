Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99379C47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 14:12:02 +0000 (UTC)
Received: from 8.mo560.mail-out.ovh.net (8.mo560.mail-out.ovh.net [188.165.52.147])
 by mx.groups.io with SMTP id smtpd.web11.54619.1704377519580292272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 06:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 188.165.52.147, mailfrom: jonathan@joggee.fr)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.148.38])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 13B9F27D60
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jan 2024 14:11:56 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dpg4v (unknown [10.110.178.62])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C44E31FEBB
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Jan 2024 14:11:56 +0000 (UTC)
Received: from joggee.fr ([37.59.142.95])
	by ghost-submission-6684bf9d7b-dpg4v with ESMTPSA
	id wHmyJ6y8lmUrPAAAEbo37A
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 14:11:56 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001b08d8049-c646-4676-8a50-27db77e8ef61,
                    E96084CFC6176DA275D818C0F1DD071750B22EF1) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CY5ZELISQPXO.2972IEN5YAX6A@joggee.fr>
Message-Id: <CY5ZELISR49L.2HXZICNDQ76IS@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Thu, 30 Nov 2023 12:49:13 +0000
Subject: [PATCH v3 1/3] lib/oe/package: replace in place PN-locale-* packages
 in PACKAGES
X-Ovh-Tracer-Id: 13595241379393768571
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 21
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegjedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucffrghtvgcuihhnuchprghsthculddvuddmnecujfgurhepjgfkvffhfffusedttdertddttddtnecuhfhrohhmpedflfhonhgrthhhrghnucfifgfknffnqffvfdcuoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqnecuggftrfgrthhtvghrnhepleduieejtedvveevtdfgheejhfdtheevheejhfejjeeggfehhfffgeethfdvueeknecukfhppeduvdejrddtrddtrddupdekgedrudegrddukeehrdefgedpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 14:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193328

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



