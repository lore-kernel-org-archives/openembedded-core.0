Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19139CF6499
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:57:36 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.45577.1727661449726316233
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cr3qqWl3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e09ff2d890so3147221a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661449; x=1728266249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6iTAE7WJF8uwvoh7UaFr+qlV9xOVeEB7uHBd+HdNUA=;
        b=cr3qqWl3HWZLCThsuc5mmMsBNtKB8l0eUqtACN+H3Gmy0LjFlgcNVIMHUqafKZwUKj
         wwDYOxVCdzmXf3JO6F+P3kYMBVT7PIJh7JWbsJfcNffpUs6qPi1as60U9qSWiZ96DP0J
         9uatpZAeI0895tKajltHj9pBy8rfesoH2HVaGhWLrJWqYATHEGf3QtFcSneCABJOfwoh
         xac5uSCR6lLUQK8aGXjnYueaE9jhRCkBJtPOSQ9dVsjMbGBPX9vS7bxufqqldvg+9/6t
         6Fh+wGhtaJS0Kgj3cDuKdYO0Pm4mbsgaOzrHzWEtLc9suYeI4IMvbY2K/QXNA8eZsMlp
         XLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661449; x=1728266249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6iTAE7WJF8uwvoh7UaFr+qlV9xOVeEB7uHBd+HdNUA=;
        b=VPEiA654JWeR3Hd/IKgHGHquacUutPA0m7f67uTh2NX/ww8H6VTvmhI8hdYJvb9lne
         1q/I7IZmDGu/2VhhvSLHcjDBX6yasLijmH4DoIzpAxACNvLbZbZew5aIzgkFo7JIoqBm
         f4mltxsQyeP9RQx6RjdpyjhIXd7IIActGVZ+yhHQ0z2dWcBVxoQidwa5KhSVmTjnqYQv
         n6O/OOPI0+uvps91DRzI2ytrPvAZeHbqBqij8xVaz1lxcLYVhIaNpcDnga2SY4SqymmV
         Xrh1MvlgkWpLkAE6QfPQl1gdEFcTAYmuFATir1+lDSysMcJcKPlB9v4tJHXjld15P6tX
         3vjA==
X-Gm-Message-State: AOJu0YyYRZyjuUGe94hxlZ25EtgF6oMD4OrV3i9KeQ68ePNfZK4aW7RI
	P7ieeRfMfnBzpITQ7dI6KNMOv13lPPrzA1lLThzyzDZZNvfKpcmghqjz7rLHOD3vtQHLAP2LPY7
	YshA=
X-Google-Smtp-Source: AGHT+IHrurxvcN63/+PqfgNTRG2k6zQS2S7/ok0NONp0sYxxZ7+C2eAYB3cq/FBpI5p0n0eVzKD63w==
X-Received: by 2002:a17:90b:4004:b0:2d9:dd4a:6a95 with SMTP id 98e67ed59e1d1-2e0b8e927f6mr13058465a91.25.1727661448958;
        Sun, 29 Sep 2024 18:57:28 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/27] curl: fix CVE-2024-8096
Date: Sun, 29 Sep 2024 18:56:56 -0700
Message-Id: <6efcd8aea340186df484afc07a2b63a2c2a3af66.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205063

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/curl/curl/commit/aeb1a281cab13c7ba791cb104e556b20e713941f

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2024-8096.patch             | 207 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 208 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-8096.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-8096.patch b/meta/recipes-support/curl/curl/CVE-2024-8096.patch
new file mode 100644
index 0000000000..a26a6253c9
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-8096.patch
@@ -0,0 +1,207 @@
+From aeb1a281cab13c7ba791cb104e556b20e713941f Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 20 Aug 2024 16:14:39 +0200
+Subject: [PATCH] gtls: fix OCSP stapling management
+
+Reported-by: Hiroki Kurosawa
+Closes #14642
+ 
+Upstream-Status: Backport [https://github.com/curl/curl/commit/aeb1a281cab13c7ba791cb104e556b20e713941f]
+CVE: CVE-2024-8096
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/vtls/gtls.c | 146 ++++++++++++++++++++++++------------------------
+ 1 file changed, 73 insertions(+), 73 deletions(-)
+
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index 6eaa6a8..7dd7df8 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -538,6 +538,13 @@ CURLcode gtls_client_init(struct Curl_easy *data,
+   init_flags |= GNUTLS_NO_TICKETS;
+ #endif
+ 
++#if defined(GNUTLS_NO_STATUS_REQUEST)
++  if(!config->verifystatus)
++    /* Disable the "status_request" TLS extension, enabled by default since
++       GnuTLS 3.8.0. */
++    init_flags |= GNUTLS_NO_STATUS_REQUEST;
++#endif
++
+   rc = gnutls_init(&gtls->session, init_flags);
+   if(rc != GNUTLS_E_SUCCESS) {
+     failf(data, "gnutls_init() failed: %d", rc);
+@@ -923,104 +930,97 @@ Curl_gtls_verifyserver(struct Curl_easy *data,
+     infof(data, "  server certificate verification SKIPPED");
+ 
+   if(config->verifystatus) {
+-    if(gnutls_ocsp_status_request_is_checked(session, 0) == 0) {
+-      gnutls_datum_t status_request;
+-      gnutls_ocsp_resp_t ocsp_resp;
++    gnutls_datum_t status_request;
++    gnutls_ocsp_resp_t ocsp_resp;
++    gnutls_ocsp_cert_status_t status;
++    gnutls_x509_crl_reason_t reason;
+ 
+-      gnutls_ocsp_cert_status_t status;
+-      gnutls_x509_crl_reason_t reason;
++    rc = gnutls_ocsp_status_request_get(session, &status_request);
+ 
+-      rc = gnutls_ocsp_status_request_get(session, &status_request);
++    if(rc == GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE) {
++      failf(data, "No OCSP response received");
++      return CURLE_SSL_INVALIDCERTSTATUS;
++    }
+ 
+-      infof(data, " server certificate status verification FAILED");
++    if(rc < 0) {
++      failf(data, "Invalid OCSP response received");
++      return CURLE_SSL_INVALIDCERTSTATUS;
++    }
+ 
+-      if(rc == GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE) {
+-        failf(data, "No OCSP response received");
+-        return CURLE_SSL_INVALIDCERTSTATUS;
+-      }
++    gnutls_ocsp_resp_init(&ocsp_resp);
+ 
+-      if(rc < 0) {
+-        failf(data, "Invalid OCSP response received");
+-        return CURLE_SSL_INVALIDCERTSTATUS;
+-      }
++    rc = gnutls_ocsp_resp_import(ocsp_resp, &status_request);
++    if(rc < 0) {
++      failf(data, "Invalid OCSP response received");
++      return CURLE_SSL_INVALIDCERTSTATUS;
++    }
+ 
+-      gnutls_ocsp_resp_init(&ocsp_resp);
++    (void)gnutls_ocsp_resp_get_single(ocsp_resp, 0, NULL, NULL, NULL, NULL,
++                                      &status, NULL, NULL, NULL, &reason);
+ 
+-      rc = gnutls_ocsp_resp_import(ocsp_resp, &status_request);
+-      if(rc < 0) {
+-        failf(data, "Invalid OCSP response received");
+-        return CURLE_SSL_INVALIDCERTSTATUS;
+-      }
++    switch(status) {
++    case GNUTLS_OCSP_CERT_GOOD:
++      break;
+ 
+-      (void)gnutls_ocsp_resp_get_single(ocsp_resp, 0, NULL, NULL, NULL, NULL,
+-                                        &status, NULL, NULL, NULL, &reason);
++    case GNUTLS_OCSP_CERT_REVOKED: {
++      const char *crl_reason;
+ 
+-      switch(status) {
+-      case GNUTLS_OCSP_CERT_GOOD:
++      switch(reason) {
++      default:
++      case GNUTLS_X509_CRLREASON_UNSPECIFIED:
++        crl_reason = "unspecified reason";
+         break;
+ 
+-      case GNUTLS_OCSP_CERT_REVOKED: {
+-        const char *crl_reason;
+-
+-        switch(reason) {
+-          default:
+-          case GNUTLS_X509_CRLREASON_UNSPECIFIED:
+-            crl_reason = "unspecified reason";
+-            break;
+-
+-          case GNUTLS_X509_CRLREASON_KEYCOMPROMISE:
+-            crl_reason = "private key compromised";
+-            break;
+-
+-          case GNUTLS_X509_CRLREASON_CACOMPROMISE:
+-            crl_reason = "CA compromised";
+-            break;
+-
+-          case GNUTLS_X509_CRLREASON_AFFILIATIONCHANGED:
+-            crl_reason = "affiliation has changed";
+-            break;
++      case GNUTLS_X509_CRLREASON_KEYCOMPROMISE:
++        crl_reason = "private key compromised";
++        break;
+ 
+-          case GNUTLS_X509_CRLREASON_SUPERSEDED:
+-            crl_reason = "certificate superseded";
+-            break;
++      case GNUTLS_X509_CRLREASON_CACOMPROMISE:
++        crl_reason = "CA compromised";
++        break;
+ 
+-          case GNUTLS_X509_CRLREASON_CESSATIONOFOPERATION:
+-            crl_reason = "operation has ceased";
+-            break;
++      case GNUTLS_X509_CRLREASON_AFFILIATIONCHANGED:
++        crl_reason = "affiliation has changed";
++        break;
+ 
+-          case GNUTLS_X509_CRLREASON_CERTIFICATEHOLD:
+-            crl_reason = "certificate is on hold";
+-            break;
++      case GNUTLS_X509_CRLREASON_SUPERSEDED:
++        crl_reason = "certificate superseded";
++        break;
+ 
+-          case GNUTLS_X509_CRLREASON_REMOVEFROMCRL:
+-            crl_reason = "will be removed from delta CRL";
+-            break;
++      case GNUTLS_X509_CRLREASON_CESSATIONOFOPERATION:
++        crl_reason = "operation has ceased";
++        break;
+ 
+-          case GNUTLS_X509_CRLREASON_PRIVILEGEWITHDRAWN:
+-            crl_reason = "privilege withdrawn";
+-            break;
++      case GNUTLS_X509_CRLREASON_CERTIFICATEHOLD:
++        crl_reason = "certificate is on hold";
++        break;
+ 
+-          case GNUTLS_X509_CRLREASON_AACOMPROMISE:
+-            crl_reason = "AA compromised";
+-            break;
+-        }
++      case GNUTLS_X509_CRLREASON_REMOVEFROMCRL:
++        crl_reason = "will be removed from delta CRL";
++        break;
+ 
+-        failf(data, "Server certificate was revoked: %s", crl_reason);
++      case GNUTLS_X509_CRLREASON_PRIVILEGEWITHDRAWN:
++        crl_reason = "privilege withdrawn";
+         break;
+-      }
+ 
+-      default:
+-      case GNUTLS_OCSP_CERT_UNKNOWN:
+-        failf(data, "Server certificate status is unknown");
++      case GNUTLS_X509_CRLREASON_AACOMPROMISE:
++        crl_reason = "AA compromised";
+         break;
+       }
+ 
+-      gnutls_ocsp_resp_deinit(ocsp_resp);
++      failf(data, "Server certificate was revoked: %s", crl_reason);
++      break;
++    }
++
++    default:
++    case GNUTLS_OCSP_CERT_UNKNOWN:
++      failf(data, "Server certificate status is unknown");
++      break;
++    }
+ 
++    gnutls_ocsp_resp_deinit(ocsp_resp);
++    if(status != GNUTLS_OCSP_CERT_GOOD)
+       return CURLE_SSL_INVALIDCERTSTATUS;
+-    }
+-    else
+-      infof(data, "  server certificate status verification OK");
+   }
+   else
+     infof(data, "  server certificate status verification SKIPPED");
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 5442d8d4fd..d094604ea1 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://CVE-2024-6197.patch \
     file://CVE-2024-7264-1.patch \
     file://CVE-2024-7264-2.patch \
+    file://CVE-2024-8096.patch \
 "
 SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd"
 
-- 
2.34.1


