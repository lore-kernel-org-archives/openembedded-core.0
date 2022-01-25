Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F05C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:46:50 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.7230.1643118392810459867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ANlMWXzS;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643118409; x=1674654409;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LnW4B3beqeZTzERLi2IpGgCk8dFqJfwRZiSiO0af534=;
  b=ANlMWXzSL+dtvcw23l2MNRtGavMcH52C/YwPEd1sKLnEoMsi/g/if/3R
   o7Yfqs82yWZz26RKxRD8c+BUjBe8LcNRm8n3UKvTOhCcebseZ568mXrt7
   9PbwgjtFWVtOEoW4iaKMNtYXYzauY1WHiaDAa+sBriVWRpSlpou/jDI/j
   UZoezPConCZAjY5wJxwaCOOqwla1jV6j6KwmZ/clNpYn67sEiBD8EINmK
   x7+jECNLV7sKApfX9pY1TnevjEQQdQ7AX4F55+/ZGDpuYCbZgEgbhEApb
   Z2qnWWjLMLlHovz3ImCDFZXH3huG6U0AdYuPT32AcAKbIV+istlUSv0mf
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="307016522"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="307016522"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="479494379"
Received: from gleong3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.227.175])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:48 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/13] lighttpd: backport a fix for CVE-2022-22707
Date: Tue, 25 Jan 2022 21:46:05 +0800
Message-Id: 
 <6e90764934722e527c3a326faa62054e68e4d2f6.1643113252.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643113252.git.anuj.mittal@intel.com>
References: <cover.1643113252.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 13:46:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160932

From: Ross Burton <ross@burtonini.com>

Backport the fix for CVE-2022-22707, a buffer overflow in mod_extforward.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7758596613cc442f647fd4625b36532f30e6129f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ix-out-of-bounds-OOB-write-fixes-313.patch | 97 +++++++++++++++++++
 .../lighttpd/lighttpd_1.4.59.bb               |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch
new file mode 100644
index 0000000000..f4e93d1065
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch
@@ -0,0 +1,97 @@
+Upstream-Status: Backport
+CVE: CVE-2022-22707
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 27103f3f8b1a2857aa45b889e775435f7daf141f Mon Sep 17 00:00:00 2001
+From: povcfe <povcfe@qq.com>
+Date: Wed, 5 Jan 2022 11:11:09 +0000
+Subject: [PATCH] [mod_extforward] fix out-of-bounds (OOB) write (fixes #3134)
+
+(thx povcfe)
+
+(edited: gstrauss)
+
+There is a potential remote denial of service in lighttpd mod_extforward
+under specific, non-default and uncommon 32-bit lighttpd mod_extforward
+configurations.
+
+Under specific, non-default and uncommon lighttpd mod_extforward
+configurations, a remote attacker can trigger a 4-byte out-of-bounds
+write of value '-1' to the stack. This is not believed to be exploitable
+in any way beyond triggering a crash of the lighttpd server on systems
+where the lighttpd server has been built 32-bit and with compiler flags
+which enable a stack canary -- gcc/clang -fstack-protector-strong or
+-fstack-protector-all, but bug not visible with only -fstack-protector.
+
+With standard lighttpd builds using -O2 optimization on 64-bit x86_64,
+this bug has not been observed to cause adverse behavior, even with
+gcc/clang -fstack-protector-strong.
+
+For the bug to be reachable, the user must be using a non-default
+lighttpd configuration which enables mod_extforward and configures
+mod_extforward to accept and parse the "Forwarded" header from a trusted
+proxy. At this time, support for RFC7239 Forwarded is not common in CDN
+providers or popular web server reverse proxies. It bears repeating that
+for the user to desire to configure lighttpd mod_extforward to accept
+"Forwarded", the user must also be using a trusted proxy (in front of
+lighttpd) which understands and actively modifies the "Forwarded" header
+sent to lighttpd.
+
+lighttpd natively supports RFC7239 "Forwarded"
+hiawatha natively supports RFC7239 "Forwarded"
+
+nginx can be manually configured to add a "Forwarded" header
+https://www.nginx.com/resources/wiki/start/topics/examples/forwarded/
+
+A 64-bit build of lighttpd on x86_64 (not known to be affected by bug)
+in front of another 32-bit lighttpd will detect and reject a malicious
+"Forwarded" request header, thereby thwarting an attempt to trigger
+this bug in an upstream 32-bit lighttpd.
+
+The following servers currently do not natively support RFC7239 Forwarded:
+nginx
+apache2
+caddy
+node.js
+haproxy
+squid
+varnish-cache
+litespeed
+
+Given the general dearth of support for RFC7239 Forwarded in popular
+CDNs and web server reverse proxies, and given the prerequisites in
+lighttpd mod_extforward needed to reach this bug, the number of lighttpd
+servers vulnerable to this bug is estimated to be vanishingly small.
+Large systems using reverse proxies are likely running 64-bit lighttpd,
+which is not known to be adversely affected by this bug.
+
+In the future, it is desirable for more servers to implement RFC7239
+Forwarded.  lighttpd developers would like to thank povcfe for reporting
+this bug so that it can be fixed before more CDNs and web servers
+implement RFC7239 Forwarded.
+
+x-ref:
+  "mod_extforward plugin has out-of-bounds (OOB) write of 4-byte -1"
+  https://redmine.lighttpd.net/issues/3134
+  (not yet written or published)
+  CVE-2022-22707
+---
+ src/mod_extforward.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mod_extforward.c b/src/mod_extforward.c
+index ba957e04..fdaef7f6 100644
+--- a/src/mod_extforward.c
++++ b/src/mod_extforward.c
+@@ -715,7 +715,7 @@ static handler_t mod_extforward_Forwarded (request_st * const r, plugin_data * c
+         while (s[i] == ' ' || s[i] == '\t') ++i;
+         if (s[i] == ';') { ++i; continue; }
+         if (s[i] == ',') {
+-            if (j >= (int)(sizeof(offsets)/sizeof(int))) break;
++            if (j >= (int)(sizeof(offsets)/sizeof(int))-1) break;
+             offsets[++j] = -1; /*("offset" separating params from next proxy)*/
+             ++i;
+             continue;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
index 8cb3a9a18c..12d3db937d 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
@@ -14,6 +14,7 @@ RRECOMMENDS:${PN} = "lighttpd-module-access \
                      lighttpd-module-accesslog"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
+           file://0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch \
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
-- 
2.34.1


