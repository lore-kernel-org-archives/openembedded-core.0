Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06DEC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 06:46:01 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.9778.1668667555355245491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 22:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=E9MjQWw2;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id p12so762012plq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 22:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fZyxLG1pHYsktl5Uo3DORQgEg3CwgJ5zGMZ8fjmVgm4=;
        b=E9MjQWw2mUNNfnkBuQ4FN/XmEbw1gqPTAPMPK9Bp/ePj+ovnui92hz/0IJrSCXELiM
         OrbRLbmrseGZw/tSveQ9u5UEiMd+hJMQL4pqutDnv8vu5BP9GkBQdGOOShmAhaobfwTM
         Zz5j8JuVaEtqItoLar9mAZ5j2OCKv7JNc0ezI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZyxLG1pHYsktl5Uo3DORQgEg3CwgJ5zGMZ8fjmVgm4=;
        b=LeF2z7lmtV7jpoQy5DK3ihcuGvxczsDseSQYPhODXwFhULT4ZoBiEtj0BPjM3M6pz8
         Pz2s0bR4+wrT0E8VkkOkx2599Y3JNvep8YaF2AtsgPrCN/wl2Lrb8ydOlugq+HyiUgt1
         1xhnvlnoPrf24r2OXA2pWQeT6eXRDr6r3i49QgUHXH9PWWnwR1tYmnTMfswl7hwsMjZI
         a+FwCDjb+bSL6J4iJs/XHuY5ZCtBA5gPqIDzVLa7TvPOT1rER7g7fDBTtFacEauIBHTv
         SYDbX97N/VbZsf9fasgybd94uJeUCSNxX9oryH/qD2xMFPjdJ8MXOqZZdd7Uq1oq0WgS
         fgcw==
X-Gm-Message-State: ANoB5pnMJ8VB+oWd/Sj0dn7vGmONQLDoejYE8OhIad3GxL3Zk207w6bn
	mM4uOrZsPGDqgjCLniUNUo7ntIBqFgctXw==
X-Google-Smtp-Source: AA0mqf6cYOBla3fuZCR0NuMUpU7S5T1ynYbkqRy0hPYnjyrdwyN370DRdsMUiKxCPMoyBNzMnExaYQ==
X-Received: by 2002:a17:90b:1958:b0:213:880:e931 with SMTP id nk24-20020a17090b195800b002130880e931mr1332560pjb.217.1668667554577;
        Wed, 16 Nov 2022 22:45:54 -0800 (PST)
Received: from vivek-Latitude-3400.mvista.com ([116.73.95.148])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090322c400b0016f196209c9sm367026plg.123.2022.11.16.22.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 22:45:54 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] libtasn1: fix CVE-2021-46848 off-by-one in asn1_encode_simple_der
Date: Thu, 17 Nov 2022 12:15:38 +0530
Message-Id: <20221117064538.187445-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 06:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173403

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/44a700d2051a666235748970c2df047ff207aeb5]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../gnutls/libtasn1/CVE-2021-46848.patch      | 45 +++++++++++++++++++
 .../recipes-support/gnutls/libtasn1_4.16.0.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2021-46848.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2021-46848.patch b/meta/recipes-support/gnutls/libtasn1/CVE-2021-46848.patch
new file mode 100644
index 0000000000..9a8ceecbe7
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2021-46848.patch
@@ -0,0 +1,45 @@
+From 22fd12b290adea788122044cb58dc9e77754644f Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Thu, 17 Nov 2022 12:07:50 +0530
+Subject: [PATCH] CVE-2021-46848
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/44a700d2051a666235748970c2df047ff207aeb5]
+CVE: CVE-2021-46848
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+
+Fix ETYPE_OK off by one array size check.
+---
+ NEWS      | 4 ++++
+ lib/int.h | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/NEWS b/NEWS
+index f042481..d8f684e 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,5 +1,9 @@
+ GNU Libtasn1 NEWS                                     -*- outline -*-
+ 
++* Noteworthy changes in release ?.? (????-??-??) [?]
++- Fix ETYPE_OK out of bounds read.  Closes: #32.
++- Update gnulib files and various maintenance fixes.
++
+ * Noteworthy changes in release 4.16.0 (released 2020-02-01) [stable]
+ - asn1_decode_simple_ber: added support for constructed definite
+   octet strings. This allows this function decode the whole set of
+diff --git a/lib/int.h b/lib/int.h
+index ea16257..c877282 100644
+--- a/lib/int.h
++++ b/lib/int.h
+@@ -97,7 +97,7 @@ typedef struct tag_and_class_st
+ #define ETYPE_TAG(etype) (_asn1_tags[etype].tag)
+ #define ETYPE_CLASS(etype) (_asn1_tags[etype].class)
+ #define ETYPE_OK(etype) (((etype) != ASN1_ETYPE_INVALID && \
+-                          (etype) <= _asn1_tags_size && \
++			   (etype) < _asn1_tags_size && \
+                           _asn1_tags[(etype)].desc != NULL)?1:0)
+ 
+ #define ETYPE_IS_STRING(etype) ((etype == ASN1_ETYPE_GENERALSTRING || \
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.16.0.bb b/meta/recipes-support/gnutls/libtasn1_4.16.0.bb
index 8d3a14506a..d2b3c492ec 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.16.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.16.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
+           file://CVE-2021-46848.patch \
            "
 
 DEPENDS = "bison-native"
-- 
2.25.1


