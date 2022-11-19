Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD75C4167B
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:08 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.26305.1668880084153380796
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gwcod9OT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id w3-20020a17090a460300b00218524e8877so9117858pjg.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvQrBVeXcxu0NdbYKROb6jSW68W2I1C1ZQRtDatulUw=;
        b=gwcod9OTyuy89PhKTD3FMshGO/7950EdftKnaFVANCxUYdxbH/iUX0Ra/ASfSKyz3+
         q0BjycG9JFA/rDwFZI6EX/071QjYfUomOCc99xt96pmRhUYbmXXSQaTj7n2fp4I6sEkh
         kpGFitH0UkUOInATNGSBY5QhbuG+sdpjBeOFm4rCZHB+Wa64jCdw/mnA9IaLlu8CYVBw
         zXOqY3cZ/jKGwVA/uWB53yyvDQG8yevfuMvXKmAuqsUsA+zDVqY633jlyyZuNfEvqCqf
         WSZXNAUPWHAEuzv6c2QWCEbXNA2QXDN4ih67UsBMEEA1ak5EvYYDpfNopvSH7c5pEWqD
         w7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvQrBVeXcxu0NdbYKROb6jSW68W2I1C1ZQRtDatulUw=;
        b=Fv3b2dDEEtqfjvgQidtAicqcMr7L5ZJ05wHL5UFi/ntsXCXmwBhdITM7nWg68qdIj+
         L4DcXddJyeKf+yTjMP4CfjmGsKd1i0xaW6mTMWxOmrjz7sDVnALO+aiTGvOOW0r9ZFbx
         rgiZd0WELjZwWvy68vd5K1P7Waiy1z/4L711YMe9fYpywq99G7ugruKaKfTDm3bER0qj
         FYDpCJai11Brq8A5ISNiv8SU4RaH4y6kYCVEWcZ8KBqxEC/XbbAu1D1ZQPEptw8wDeW3
         yW5UgvZr9R1ihRBvJnr//wryA4dMLSkhBdpkCrlDMSRy/xs3WcDe5XZEwXvrijVUA10G
         oGBA==
X-Gm-Message-State: ANoB5pnYrFv4xGirfAnSn6ctqb6+SYZ6BW13O8ao98jggPuXRvnuyvRj
	OzmsDW4hwDm1vhaNCg8yzDoVMaZ9Gfwm5PdFk5Y=
X-Google-Smtp-Source: AA0mqf5yt+zs2xiL+ZsnhjO6OmjX+J3k4CZdlYRZ2AhTr98FIq0hM/q9sHoV7FNVEcbRsO4HsF8t8g==
X-Received: by 2002:a17:90b:2552:b0:212:f8d0:a075 with SMTP id nw18-20020a17090b255200b00212f8d0a075mr12884846pjb.92.1668880083148;
        Sat, 19 Nov 2022 09:48:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/21] libtasn1: fix CVE-2021-46848 off-by-one in asn1_encode_simple_der
Date: Sat, 19 Nov 2022 07:47:32 -1000
Message-Id: <20ef1066860254b9dbfbcc68fff3af8f965fcc61.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173522

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/44a700d2051a666235748970c2df047ff207aeb5]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


