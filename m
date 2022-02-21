Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C08C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:14:46 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.10997.1645452886011243820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QkJJiCdb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 iq13-20020a17090afb4d00b001bc4437df2cso2793451pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tIgNMw7dnX2CvgjRh5cv0BlKZ4ciCpvSA4UvHFe+xCg=;
        b=QkJJiCdbh7CV+vLY8RGDEBLylKxU7UVr1x+BaQST7PJP6PccjQbPFYLg32n2hZUkKz
         dSC/hxAlwNzJVhuL2WmchHnlLOuVjD19lLd7TsYm3c/XGt00zSxo4G0loQNlnnC9pGMb
         l1wWHF1grUEN/3Zu3YU37aCE9U0m3L9PyN2m01ocYxAXEROm8SP7y/WPklBAA2KYZ+8k
         BnI0YRPxyhgfv3Bn0JOzCPaiHrpq18P9VQAF7PVHoycgXN9/FD0TuCeYq2yHVA+ZR8DW
         H1TuS6Wjh5Q5HPt2U8KrAhObpGIihMM8LcRXKH53B2Wyzxf2UgoiYOGUQhcidQcSgT6b
         fsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tIgNMw7dnX2CvgjRh5cv0BlKZ4ciCpvSA4UvHFe+xCg=;
        b=YUElnCwoKKDHOizluhva4RVXQuBv3Q8lhf/krxaJd3kgBWysOFLMFCQoSWvIVXeoWt
         q5zlE7WLqdWTkAw5ppYzOIa09fRVa5OWy3MEEEJAGwTYtEA3fraQfAZ3zxxqrclfw411
         jDNRLKU58gfPtmlKQguuyLHkq8KNasKWdsmNwLrSSZe/CytW4rDHRAn15HlJ0hg65q2K
         d7tnuCFZwO2H9gwbUl/9z2nV6fJHWEdragevU8X8Afuz6I59PaXWQGlwdndfFeuCdLGv
         PxKMsNoFyN24KHOqg008EY2bz0WE4Erb37MSNS0du8mOd/2WJINQlrmLpPyUzrF8BKS9
         /0gg==
X-Gm-Message-State: AOAM532o+AQtLGkSoweJXy9jXGPsHTD3TT4G3j5JqbCxS+8BdM1c1jEQ
	UOckLZ0iGENUIOaOpgegcFPln1HAXGi3v64m
X-Google-Smtp-Source: 
 ABdhPJzJ19Ct4ybzbAfz7iTs9JsydnAn5dk0TLSf7Rlv1eTgU4alFgfDw7ZMmcB0RyApAFrBgosIhQ==
X-Received: by 2002:a17:902:8509:b0:14e:f9b7:6cab with SMTP id
 bj9-20020a170902850900b0014ef9b76cabmr19315046plb.162.1645452885032;
        Mon, 21 Feb 2022 06:14:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.14.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:14:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/20] lighttpd: backport a fix for CVE-2022-22707
Date: Mon, 21 Feb 2022 04:14:04 -1000
Message-Id: 
 <bf57c164501c0a60279d069aa8130fb622db8273.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:14:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162034

From: Ross Burton <ross@burtonini.com>

Backport the fix for CVE-2022-22707, a buffer overflow in mod_extforward.

(From OE-Core rev: d54d7e7b43da621be8e6fcca34feb7b3d49b8160)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7758596613cc442f647fd4625b36532f30e6129f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7695d11dd09b1e9e87d6741135d0b28e82672f0a)
Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ix-out-of-bounds-OOB-write-fixes-313.patch | 100 ++++++++++++++++++
 .../lighttpd/lighttpd_1.4.55.bb               |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch
new file mode 100644
index 0000000000..da59b7297a
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch
@@ -0,0 +1,100 @@
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
+
+Upstream-Status: Backport
+CVE: CVE-2022-22707
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
+Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
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
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
index 737d6ebf7c..357a269015 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
@@ -14,6 +14,7 @@ RRECOMMENDS_${PN} = "lighttpd-module-access \
                      lighttpd-module-accesslog"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
+        file://0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch \
         file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
-- 
2.25.1


