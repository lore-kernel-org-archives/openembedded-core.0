Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC128C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 20:21:44 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.1095.1747772496169926608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 13:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Buv+CUtn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20250520202132b3e0d6512d52d0c7e8-a4yovt@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250520202132b3e0d6512d52d0c7e8
        for <openembedded-core@lists.openembedded.org>;
        Tue, 20 May 2025 22:21:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=7VtKvAbZXZNXHoC9VagnMmbfwwsvVGQDo7AqXnW6SjQ=;
 b=Buv+CUtnmc+ywKQY98CNVSO/EG3F6IBJ4hlKN8lfU+4mNr36XHDyUG6swMJHr4V3b7vxfT
 OH8n8T+f4sL3MZnBsFUxkf0rSasu1AU/kshRfAWIG2jcXjtTSnT3CTSyARkpeFvLiVhtQkwf
 k9rJudli1DL3+psuElZMCjXwdrKgVcd4p4H8wjwGl2dgPNHa4Qn3fetQLdFKkb3T9bqAeavP
 H1xUrxGWa7I296G0Qc4+4nCiSGd6FQLD6xlVJtdLgiCzreASmHUq+DyLaYD7+MQuJyZ6SNXs
 QZPaPOFVUCr1NoJDCdvZx0HtNWRod0xVn1C7d6ctjJuZLhasyutsSNwA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 1/8] sqlite3: patch CVE-2025-3277
Date: Tue, 20 May 2025 22:20:26 +0200
Message-Id: <20250520202033.2352749-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 20:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216943

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] mentioned in [2].

[1] https://sqlite.org/src/info/498e3f1cf57f164f
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-3277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sqlite/sqlite3/CVE-2025-3277.patch        | 28 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
new file mode 100644
index 0000000000..8264d4443a
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
@@ -0,0 +1,28 @@
+From d7f45414935e4ef6e3361f02a22876f1ee7a04aa Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sun, 16 Feb 2025 10:57:25 +0000
+Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
+ concat_ws() function with an enormous separator values and many arguments.
+
+FossilOrigin-Name: 498e3f1cf57f164fbd8380e92bf91b9f26d6aa05d092fcd135d754abf1e5b1b5
+
+CVE: CVE-2025-3277
+Upstream-Status: Backport [https://sqlite.org/src/info/498e3f1cf57f164f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 08c593e55c..24d0d954d9 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -130954,7 +130954,7 @@ static void concatFuncCore(
+   for(i=0; i<argc; i++){
+     n += sqlite3_value_bytes(argv[i]);
+   }
+-  n += (argc-1)*nSep;
++  n += (argc-1)*(i64)nSep;
+   z = sqlite3_malloc64(n+1);
+   if( z==0 ){
+     sqlite3_result_error_nomem(context);
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
index bd2ac6614d..86983f21bd 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
@@ -3,6 +3,8 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+    file://CVE-2025-3277.patch \
+"
 SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
 

