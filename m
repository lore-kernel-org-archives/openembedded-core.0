Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6618C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 14:50:29 +0000 (UTC)
Received: from 16.mo582.mail-out.ovh.net (16.mo582.mail-out.ovh.net [87.98.139.208])
 by mx.groups.io with SMTP id smtpd.web10.8079.1707749422222157271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 06:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 87.98.139.208, mailfrom: jonathan@joggee.fr)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.176.162])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4TYS701JwCz19pk
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:19 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-6l449 (unknown [10.110.113.115])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C80D01FE3C
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:19 +0000 (UTC)
Received: from joggee.fr ([37.59.142.101])
	by ghost-submission-6684bf9d7b-6l449 with ESMTPSA
	id +J4aMCswymV36wAAKvzQ+Q
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:19 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G00408120765-c82d-4e86-88e6-3f300ac52495,
                    C9F09FF139978B9C7604C68D153D486573A97FEF) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
In-Reply-To: <CZ36N8IH0R6J.ZIQATXFYOO0W@joggee.fr>
Message-Id: <CZ36N8IH1D92.E9NCN9EK9468@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Thu, 30 Nov 2023 12:49:13 +0000
Subject: [PATCH v4 1/3] lib/oe/package: replace in place PN-locale-* packages
 in PACKAGES
X-Ovh-Tracer-Id: 3470867939282979963
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 21
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudefgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecuffgrthgvuchinhcuphgrshhtucdlvddumdenucfjughrpegjkffvhfffufestddtredttddttdenucfhrhhomhepfdflohhnrghthhgrnhcuifgfkffnnffqvfdfuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeeludeijeetvdevvedtgfehjefhtdehveehjefhjeejgefghefhffegtefhvdeukeenucfkphepuddvjedrtddrtddruddpkeegrddugedrudekhedrfeegpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195341

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
index 702d8403be..cb6893f3c2 100644
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



