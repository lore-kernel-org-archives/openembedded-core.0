Return-Path: <purushottamchoudhary29@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAA7C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 07:41:19 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.8355.1644306078959728957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 23:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rmwy1tQr;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: purushottamchoudhary29@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id v74so17472877pfc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 23:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=3mVdP+8IoLfst02TvRhpwIFZBfv429gNmJ2M7vT87K0=;
        b=Rmwy1tQrqAGYy2M75MTfvYFZ61he08PLAV2ymIB69sbzHvwyKaWUVLX6Ka4hU0fm+B
         ssZRaSf/9ME5TqOit3ZHOrdMBdBHuXluRsZ7jLCZSXFb0aK7O01uGgXsv3JmCikImD5l
         5KI3USSwbo1mfbMBIqHY5jBqtPH4nEtKlQ2nJLhEZQyN7+w0qp3BZxLM9ndOY40JuuCa
         TGaP9chL5tBrPhT3SLZ6P79FaUPn+pfqgAReAZwuGOw9P4IaCEcleh8TFu0NoxmuqTy+
         bxh91HrbAcV02l6TtEj3MWNuL/t4IoEe2l/iGmvstZSBFi465UKVi+5wLky7tirrdPg/
         L2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3mVdP+8IoLfst02TvRhpwIFZBfv429gNmJ2M7vT87K0=;
        b=IjOhlh50RTXPogOVHKp2K+AHoy46cceSNbdc6v/q2u8wnT308JrVIOV4PjgupoTF1I
         4qUPIRKEshoJU4RQjk/gePI3MENRAx3b6AaGykpIb56DvkV4sMygDH72o+m7ygovWCJQ
         gt5hJM5NHygccaQw8fyYhFIpXf24E/FPpjOjez50LB5H+IXeiVNudLk7H4Jpky2dAq2e
         XNNHvkFsmLwa4rBZ6WY77sg/hV9WUQIIe/ob9vCVg9mmPaRtNchcYAt45eC4oYblUTgP
         vj75ovlIvbunZGGmFNcenIgIW4K6bJnRbZKPXoxeXZqIMOeWWh/9VC0vlMq0uirqNB2I
         bhwQ==
X-Gm-Message-State: AOAM530we9Vwg58ll/2L7fTAdXwhYT4xEJMo3a0Ajf6SRC68o1xZ/OP3
	sgUREtiwIW9uC6Diq5PCynS6tsPN5huZJabE
X-Google-Smtp-Source: 
 ABdhPJwYTDdAN0e4Sb88g078qQQVFs3V6IclWZ0gzf4HWPbeOJt1oH7DuAlzP9UStWvHgYPtmwX5uw==
X-Received: by 2002:a63:2b49:: with SMTP id r70mr2522724pgr.111.1644306077422;
        Mon, 07 Feb 2022 23:41:17 -0800 (PST)
Received: from localhost.localdomain
 ([2405:201:a410:a06c:6022:4998:4b07:5aa1])
        by smtp.gmail.com with ESMTPSA id
 n3sm13601820pfu.84.2022.02.07.23.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 23:41:16 -0800 (PST)
From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Purushottam Choudhary <purushottam.choudhary@kpit.com>
Subject: [OE-core][dunfell][PATCH] lighttpd: backport a fix for CVE-2022-22707
Date: Tue,  8 Feb 2022 13:10:42 +0530
Message-Id: <20220208074042.9234-1-purushottamchoudhary29@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 07:41:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161475

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
2.17.1


