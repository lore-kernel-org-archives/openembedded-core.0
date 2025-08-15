Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8505DCA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:53:19 +0000 (UTC)
Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.web11.8198.1755251592701889376
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=n9lhEftR;
 spf=pass (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=315bbc237=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1755251592; x=1786787592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6a71G2MuaEdm2xq41hnd/Id8/anmIcH2+5UPxqn5yYI=;
  b=n9lhEftR8GK9zjLpuZZPH54/ngAT58CVwokAj04n/JVnz0RLHm+8d2dS
   A85030Sy/nq5kocjW3Z54pm8CAgAFtuKfT5rZn3TMBvnC6GOlwo44SvsI
   jMR9d41ufyQ/1XD3cQCrdz2jcodWW/19+fXfTtGEWP5voGghb6aRt8L28
   w=;
X-CSE-ConnectionGUID: KzqGiYIST92i5gPA0Y/b4g==
X-CSE-MsgGUID: wH+fvo5NS1e+KxX4+I5LaA==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 15 Aug 2025 11:53:08 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw2.muc with
 ESMTP/TLS; 15 Aug 2025 11:53:08 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb3.muc with ESMTP/TLS; 15 Aug 2025 11:53:08 +0200
Received: from marvin-ws (10.30.85.200) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Fri, 15 Aug 2025 11:53:08 +0200
X-CSE-ConnectionGUID: CSltbA2VRM2tqEEXPI7EQQ==
X-CSE-MsgGUID: ucXuBAqLRNOPwpmrU63+Qw==
X-CSE-ConnectionGUID: y0gXKNDzReWENwe0zSCQjQ==
X-CSE-MsgGUID: QtyKMm9uSZG5wsjoeNMIEQ==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>, Philip Lorenz <philip.lorenz@bmw.de>
Subject: [kirkstone][PATCH 2/2] insane: Ensure that `src-uri-bad` fails correctly
Date: Fri, 15 Aug 2025 11:45:09 +0200
Message-ID: <20250815094509.3034151-2-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815094509.3034151-1-philip.lorenz@bmw.de>
References: <20250815094509.3034151-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16e.europe.bmw.corp (2a03:1e80:a15:58f::1:147) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221878

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
index 495bdda652c..67de65287f6 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1339,6 +1339,7 @@ python do_qa_unpack() {
         bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))
 
     unpack_check_src_uri(d.getVar('PN'), d)
+    oe.qa.exit_if_errors(d)
 }
 
 # The Staging Func, to check all staging

