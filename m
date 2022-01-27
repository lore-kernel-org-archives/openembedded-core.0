Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0B0C4332F
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 05:10:46 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.24368.1643260217446113039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 21:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=iedl3Q2a;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643260244; x=1674796244;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=AbNvt4GwKEdyynKeWR06hh/SpEaKzjQMOL+UrhcKq7Y=;
  b=iedl3Q2aDtfYTwoObQJTZVnnx73nU5rsoAJLBX0ErEOBAge9iF6MMTPY
   tRTfQ63czqkguYhHkv5sNuw117YqmB5tdr4hQYVlt2m+ClzqEvroe+fWS
   L8AMWnIUPYr/ODFOtKI7SxhVMvcopMQDnXGJOkj85jSLlN0qO385955jA
   oCg0C5w6kkNuxtW+gWw9R8+EkqN6tZ9nJUIJvoroKc/RX48WvXFOhi1Mm
   U9FEX0wtGUIlNUqNTeJsZASMPnn0wndSps0o2Jnrx/OX9STtz+9kHVnEq
   gqv7hHiH34UENPX484gs7pN1qwHWKpB7gy9/Hkc5lawZRM96trjUOsUNH
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245590394"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="245590394"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="618209073"
Received: from huiyinkx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.134.201])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:43 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 17/17] lighttpd: backport a fix for CVE-2022-22707
Date: Thu, 27 Jan 2022 13:10:10 +0800
Message-Id: 
 <d54d7e7b43da621be8e6fcca34feb7b3d49b8160.1643259953.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643259953.git.anuj.mittal@intel.com>
References: <cover.1643259953.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 05:10:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161020

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
index cf7f478915..73443f77b4 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
@@ -14,6 +14,7 @@ RRECOMMENDS_${PN} = "lighttpd-module-access \
                      lighttpd-module-accesslog"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
+        file://0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch \
         file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
-- 
2.34.1


