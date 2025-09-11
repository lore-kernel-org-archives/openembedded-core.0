Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F50BCAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 12:50:00 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web11.45908.1757594991275412087
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 05:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=O+zcHqij;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=34223b862=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1757594991; x=1789130991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ScxPti0Nc8bxQXkRx5OsvHXodIsnsmFhVd4yGW0+XUI=;
  b=O+zcHqijiUgyKXCP5oAImC/2jMJLz3JWu95hp/BYj4H5CQ5x4ftW/a2B
   U0h2pTZwjgzxhYVHsD62MdmILiOly9f7gfB0Ck80B596B7wvchA6uQDWh
   ginIz03JplbSAAUCo6WNEW7bqnTV/sb7jheWP6pXtzALCrr3JX31mMS9s
   k=;
X-CSE-ConnectionGUID: VOMe1bPzTiWdUOmQnhR9Qw==
X-CSE-MsgGUID: pGJhR6f1TPe4VQq9hkHxAA==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Sep 2025 14:49:49 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw6.muc with
 ESMTP/TLS; 11 Sep 2025 14:49:49 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb4.muc with ESMTP/TLS; 11 Sep 2025 14:49:50 +0200
Received: from marvin-ws (10.30.85.213) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Thu, 11 Sep 2025 14:49:49 +0200
X-CSE-ConnectionGUID: bSwnglSxSMGgBRUYbiSDyw==
X-CSE-MsgGUID: prq2AQJ+RkKOOoIEIfhqLw==
X-CSE-ConnectionGUID: 1IAchZ27T76q4sKsicjo4A==
X-CSE-MsgGUID: sd74U5P1RcSJRITmeW8vhw==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>, Philip Lorenz <philip.lorenz@bmw.de>
Subject: [kirkstone][PATCH v2 2/2] insane: Ensure that `src-uri-bad` fails correctly
Date: Thu, 11 Sep 2025 14:41:30 +0200
Message-ID: <20250911124130.182442-2-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911124130.182442-1-philip.lorenz@bmw.de>
References: <20250911124130.182442-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18g.europe.bmw.corp (2a03:1e80:a15:58f::1:79) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 12:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223274

`src-uri-bad` is missing the required call to `oe.qa.exit_if_errors` so
the corresponding task is not marked as failed when the QA check is
classified as an error.

This issue was fixed by the introduction of the do_recipe_qa task in
OE-core (e0c71367ab59021fc430ef215bbfc3b525036ba4) which is not part
of kirkstone yet.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/classes/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 99340c17522..6b3cc5228a7 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1338,6 +1338,7 @@ python do_qa_unpack() {
         bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))
 
     unpack_check_src_uri(d.getVar('PN'), d)
+    oe.qa.exit_if_errors(d)
 }
 
 # The Staging Func, to check all staging

