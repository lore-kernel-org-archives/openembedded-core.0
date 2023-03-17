Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B40EC6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:42:49 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.436.1679092966108295371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=edVXehvM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso6774900pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpRk0nQR8bg5mEVUDtLsh2ENMPBNhIdNOlX8dtFmhBA=;
        b=edVXehvMOW6DUqJ453nt+5RSBEJO0bi2bTTUjepeqDwe74rNs6fVkiG432E/BpVRlt
         m07BF/b6DsU3+URglWDACIGNiW3lHZYdLMFOkHzGshpPXqz9JceeCX9QFsiMOvUm2Q5i
         EtHKjdl3w/5BZr3e2fuVYwBTpc4iZNN2K8gLrpvNc4Ly1pe56lAEmDfew4nmesRtfg/N
         eblKGR3aISwaQ1WL8ItXTyU5Gv2cKNYCYDqDhbcIZ2EBIcfVkXZrEJRWsnHWh12mzJ/3
         FqPbE4ACNE5cM3wQZ3MKU5YigTLnaKCycXyz9Xq3HQky5T6dVR3IPD4tB5xC144jFqZl
         M7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpRk0nQR8bg5mEVUDtLsh2ENMPBNhIdNOlX8dtFmhBA=;
        b=6HdJcvjF0XJ1fztO6fXFPh++WCIRliVVqJwkOo1Q+Kp2YhpVYmDZOM55Fx+aY8Mc5O
         6N3ajr8imy3IBmFmiXiWvoN3O+Qy8BVlLZYc95vzaCLMRGFzcq4G9bdG0N85xHmbHXcV
         FKrkvbgCG6oNPo8DQxjcvMQw7yACH+aG9iDv690KNuR88NQHZV/V81z/2W09o9OyLKiR
         KfHT4dcXizDSr7IqmiEpjlCO6JdE6xhdWNPfR5Py2GVptYrwCCsRDNWpnWws4jiq8RRt
         RJ125sfY8qi22CG8TYkUsd62v+ZJUT/1YvV8dmZONI/tRPU/YexoZEEQ4O5piP0Ek1Ge
         zNKA==
X-Gm-Message-State: AO0yUKVp9exxAOYy2pnBtLZF7mICZDtOPfOJuSF0JMbtz1aNoeFIHIzX
	/yCqsktOgU/SF8IsuijF+CkWhtHK+b/35RSnnds=
X-Google-Smtp-Source: AK7set8XzgoafhcrE/5T2OdKCuD2LSTorw4y47x9YAJNm3n/I2n3Y1eBApCk42twydEPhxKuMg2dEQ==
X-Received: by 2002:a17:902:f684:b0:1a1:9cc3:fb01 with SMTP id l4-20020a170902f68400b001a19cc3fb01mr6303978plg.38.1679092965177;
        Fri, 17 Mar 2023 15:42:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.42.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:42:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/21] pkgconf: fix CVE-2023-24056
Date: Fri, 17 Mar 2023 12:42:15 -1000
Message-Id: <5c156d8c06267b7a733aca11c53c2905e03e4a58.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178762

From: Hongxu Jia <hongxu.jia@eng.windriver.com>

Backport from https://gitea.treehouse.systems/ariadne/pkgconf/commit/628b2b2bafa5d3a2017193ddf375093e70666059

Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...nd-stop-string-processing-on-truncat.patch | 75 +++++++++++++++++++
 .../recipes-devtools/pkgconf/pkgconf_1.8.0.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/0001-tuple-test-for-and-stop-string-processing-on-truncat.patch

diff --git a/meta/recipes-devtools/pkgconf/pkgconf/0001-tuple-test-for-and-stop-string-processing-on-truncat.patch b/meta/recipes-devtools/pkgconf/pkgconf/0001-tuple-test-for-and-stop-string-processing-on-truncat.patch
new file mode 100644
index 0000000000..c6ec7c94e1
--- /dev/null
+++ b/meta/recipes-devtools/pkgconf/pkgconf/0001-tuple-test-for-and-stop-string-processing-on-truncat.patch
@@ -0,0 +1,75 @@
+From 9368831d360c0e47df55d1bb25c3517269320c5f Mon Sep 17 00:00:00 2001
+From: Ariadne Conill <ariadne@dereferenced.org>
+Date: Wed, 15 Mar 2023 16:12:43 +0800
+Subject: [PATCH] tuple: test for, and stop string processing, on truncation
+
+otherwise a buffer overflow occurs.
+this has been a bug in pkgconf since the beginning, it seems.
+instead of disclosing the bug correctly, a "hotshot" developer
+decided to blog about it instead.  sigh.
+
+https://nullprogram.com/blog/2023/01/18/
+
+Upstream-Status: Backport [https://gitea.treehouse.systems/ariadne/pkgconf/commit/628b2b2bafa5d3a2017193ddf375093e70666059]
+CVE: CVE-2023-24056
+Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
+---
+ libpkgconf/tuple.c | 28 +++++++++++++++++++++++-----
+ 1 file changed, 23 insertions(+), 5 deletions(-)
+
+diff --git a/libpkgconf/tuple.c b/libpkgconf/tuple.c
+index 2d550d8..b831070 100644
+--- a/libpkgconf/tuple.c
++++ b/libpkgconf/tuple.c
+@@ -293,12 +293,21 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+ 				}
+ 			}
+ 
++			size_t remain = PKGCONF_BUFSIZE - (bptr - buf);
+ 			ptr += (pptr - ptr);
+ 			kv = pkgconf_tuple_find_global(client, varname);
+ 			if (kv != NULL)
+ 			{
+-				strncpy(bptr, kv, PKGCONF_BUFSIZE - (bptr - buf));
+-				bptr += strlen(kv);
++				size_t nlen = pkgconf_strlcpy(bptr, kv, remain);
++				if (nlen > remain)
++				{
++					pkgconf_warn(client, "warning: truncating very long variable to 64KB\n");
++
++					bptr = buf + (PKGCONF_BUFSIZE - 1);
++					break;
++				}
++
++				bptr += nlen;
+ 			}
+ 			else
+ 			{
+@@ -306,12 +315,21 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+ 
+ 				if (kv != NULL)
+ 				{
++					size_t nlen;
++
+ 					parsekv = pkgconf_tuple_parse(client, vars, kv);
++					nlen = pkgconf_strlcpy(bptr, parsekv, remain);
++					free(parsekv);
+ 
+-					strncpy(bptr, parsekv, PKGCONF_BUFSIZE - (bptr - buf));
+-					bptr += strlen(parsekv);
++					if (nlen > remain)
++					{
++						pkgconf_warn(client, "warning: truncating very long variable to 64KB\n");
+ 
+-					free(parsekv);
++						bptr = buf + (PKGCONF_BUFSIZE - 1);
++						break;
++					}
++
++					bptr += nlen;
+ 				}
+ 			}
+ 		}
+-- 
+2.27.0
+
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
index 887e15e28c..cad0a0fa4f 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2214222ec1a820bd6cc75167a56925e0"
 
 SRC_URI = "\
     https://distfiles.dereferenced.org/pkgconf/pkgconf-${PV}.tar.xz \
+    file://0001-tuple-test-for-and-stop-string-processing-on-truncat.patch \
     file://pkg-config-wrapper \
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
-- 
2.34.1


