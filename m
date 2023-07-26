Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209ABC001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 19:50:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.4596.1690401048304544982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 12:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UkLtKywD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31765792c7cso187251f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 12:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690401046; x=1691005846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ja+lxc0f8+U3RvmGFcAQHLtf1faXsoemUhTLQe61Ig=;
        b=UkLtKywDNDRSR82AjrN1WsSk0ebhCIJRLbzpn8M8fIngt3X/97WFiOC/rQKmUxYQfA
         bl5PlqMfKgWX3x1+45L4EM/2dSZZJgiTNGTGS+4aVM+9zucPYLrgwuh0rxT0zBXt+6tv
         d2wt6i4IXs1zOidG2CdiNTiPyndA5QQqXLJpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690401046; x=1691005846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ja+lxc0f8+U3RvmGFcAQHLtf1faXsoemUhTLQe61Ig=;
        b=Ti9Q093lndCUkcuRDr6Pe46/vxulFLQ0ePU+vLZtvDRRkwWImJ9S7llq2SXdCpW3Zm
         yHrnqYZOLWT9oHlVyCHqsJSgZ58LWGhtNWz4nY8Otcwj0dQUspdlp/mW/cECLLjyPC6m
         NIbFJmkz94FYAgtgKftQ/B4g13NevyrU1LGiVw0nMNy/ugGW+e18IPZtfyVezCWpjq7P
         N0vmrGzryrvZQNsjWHTcbf/uLvFyVkjV5Y2Vh7OpB26bGri28pFkNBWdAOj/r+8ihk17
         AtTDkJ1wi/+ivg+O4KDaf0QOmprW2zdcXaas9ZuqbI/VS8d2kk7fkrZ/YpmbLamXyzcA
         Gblw==
X-Gm-Message-State: ABy/qLZk3NIIR+dGhC95mQrtyQRM5UUwd2A/1DFptP5+wdpZD3vPsiNq
	/L0OKz+jLOZAtTewnYsH+lFhs79sqhe1uMZtdRU=
X-Google-Smtp-Source: APBJJlGfreEWpujeacTxPgV9TnTjEhSWP3jPl6K6Cvo/PIRNokzgjYpeF95MeQccvWu3cuF+FGwY3g==
X-Received: by 2002:adf:f003:0:b0:317:6348:8a9d with SMTP id j3-20020adff003000000b0031763488a9dmr87424wro.66.1690401046051;
        Wed, 26 Jul 2023 12:50:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b15:acff:c09:f648])
        by smtp.gmail.com with ESMTPSA id q4-20020adfdfc4000000b0031134bcdacdsm20648423wrn.42.2023.07.26.12.50.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 12:50:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] createrepo-c: Fix 32 bit architecture segfaults with 64 bit time
Date: Wed, 26 Jul 2023 20:50:44 +0100
Message-Id: <20230726195044.1453294-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 19:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184901

After including time64.inc, createrepo-c was segfaulting on 32 bit architectures
when creating repo indexes (even for an empty repo).

Add a patch from Khem to fix this and some other compiler warnings related to 64
bit time on 32 bit.

[YOCTO #15170]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../createrepo-c/createrepo-c/time64fix.patch | 69 +++++++++++++++++++
 .../createrepo-c/createrepo-c_0.21.1.bb       |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
new file mode 100644
index 00000000000..d022d95b703
--- /dev/null
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
@@ -0,0 +1,69 @@
+From 89e1c9415fb8438310036d5810cdb7da75ee3a7f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 26 Jul 2023 12:27:14 -0700
+Subject: [PATCH] Adjust printf formats for 64bit time_t on 32bit systems
+
+Fixes format specifier mismatch warnings as well while here
+
+e.g.
+warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'time_t'
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/createrepo_c.c    | 4 ++--
+ src/misc.c            | 4 ++--
+ src/xml_dump_repomd.c | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/createrepo_c.c b/src/createrepo_c.c
+index 8681419..0f9048a 100644
+--- a/src/createrepo_c.c
++++ b/src/createrepo_c.c
+@@ -582,9 +582,9 @@ duplicates_warning(const char *nevra, GArray *locations, CmdDupNevra option)
+   for (size_t i=0; i<locations->len; i++) {
+       struct DuplicateLocation location = g_array_index(locations, struct
+                                                         DuplicateLocation, i);
+-      g_warning("    Sourced from location: \'%s\', build timestamp: %ld%s",
++      g_warning("    Sourced from location: \'%s\', build timestamp: %jd%s",
+                 location.location,
+-                location.pkg->time_build,
++                (intmax_t) location.pkg->time_build,
+                 location.pkg->skip_dump ? skip_reason : "");
+ 
+   }
+diff --git a/src/misc.c b/src/misc.c
+index 8511ca2..7866c7b 100644
+--- a/src/misc.c
++++ b/src/misc.c
+@@ -1512,11 +1512,11 @@ cr_append_pid_and_datetime(const char *str, const char *suffix)
+     gettimeofday(&tv, NULL);
+     timeinfo = localtime (&(tv.tv_sec));
+     strftime(datetime, 80, "%Y%m%d%H%M%S", timeinfo);
+-    gchar *result = g_strdup_printf("%s%jd.%s.%ld%s",
++    gchar *result = g_strdup_printf("%s%jd.%s.%jd%s",
+                                     str ? str : "",
+                                     (intmax_t) getpid(),
+                                     datetime,
+-                                    tv.tv_usec,
++                                    (intmax_t) tv.tv_usec,
+                                     suffix ? suffix : "");
+     return result;
+ }
+diff --git a/src/xml_dump_repomd.c b/src/xml_dump_repomd.c
+index 33b0e09..9d24249 100644
+--- a/src/xml_dump_repomd.c
++++ b/src/xml_dump_repomd.c
+@@ -143,7 +143,7 @@ cr_xml_dump_repomd_body(xmlNodePtr root, cr_Repomd *repomd)
+                            BAD_CAST repomd->revision);
+     } else {
+         // Use the current time if no revision was explicitly specified
+-        gchar *rev = g_strdup_printf("%ld", time(NULL));
++        gchar *rev = g_strdup_printf("%jd", (intmax_t) time(NULL));
+         xmlNewChild(root, NULL, BAD_CAST "revision", BAD_CAST rev);
+         g_free(rev);
+     }
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
index 5080131dc1e..57f23b8dfdb 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-include-rpm-rpmstring.h.patch \
            file://0001-src-cmd_parser.c-add-a-missing-parameter-name.patch \
+           file://time64fix.patch \
            "
 
 SRCREV = "0652d7303ce236e596c83c29ccc9bee7868fce6e"
-- 
2.39.2


