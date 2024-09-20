Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF16CF58CD
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 05:17:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.11475.1726809451779037209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 22:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Tynlvq2J;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-206bd1c6ccdso16845655ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 22:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1726809451; x=1727414251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rt24JOI0o6IMYE92XGL+y9V8WxbWox5MgKpqG2vrNHA=;
        b=Tynlvq2JUu07+hyznaDtLulbr8mGYb5cEXfW+xrjWLLkPp4fcSBc5R2Vns9fL7lwso
         3wPZB72Jhv7r7081Im2bxP4hFuFnjPfYHfIyJtSRW60ZemLcexicFVvICCKuKGRbixT7
         fLLEgJl0gxVS/hLUPuNzwfVAOsXySe92/joHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726809451; x=1727414251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rt24JOI0o6IMYE92XGL+y9V8WxbWox5MgKpqG2vrNHA=;
        b=AT5CDKmhPQEd9AZZNWmYBI2B8/giSSJOpx6mtX0tGCPR72sh1qSCfSYHtQTMPThdI5
         qikPL3FJECgcmNFaVk1pY+NyHQB963wsjxRXgTjdU6MNYdNKn/zb7sTrQdiwRZnZUmps
         mSRDcXlXUddun+eMeGExr5CGOgmVl7uLiL6cEQ+mWgOCaSH232aAVeBOwR8NDo/9WaOk
         Y1PX3HayxQtBMLuJu+4Zn/HS127/BAoMI2zeXHzAVx/ChYKKy1OGH6aiMa6/ffXAi701
         BlOcERzvYXqtZbN/KWvRxXHJZLjsnRBSDzNn87nnP6z2HduO6MjmK/xpuVB539ZnFYLo
         yEwg==
X-Gm-Message-State: AOJu0YxZMrvNnE/h+l6FMaw+9tCSWrAUiL4N9sxkQyNoEGrf/bqsIo2s
	7GEyyB5qew4kJ7pmZFZW4bGsQQbzF9aAyqIbHrRUDL7UDy8AoOGLwPUfHvRLtbW0vqOJjfrHJzY
	h
X-Google-Smtp-Source: AGHT+IGBU4n/iqECQxhXAwlOMnarMP18Z4ZU0yz5zdaAJbKB3PywcP0Xq+wUgSuJJbZnm3NzhmTbuQ==
X-Received: by 2002:a17:902:d4d2:b0:204:e4c9:ce91 with SMTP id d9443c01a7336-208d8370eb8mr23785645ad.7.1726809450908;
        Thu, 19 Sep 2024 22:17:30 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794719c14sm88044685ad.223.2024.09.19.22.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 22:17:30 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] curl: fix CVE-2024-8096
Date: Fri, 20 Sep 2024 10:47:21 +0530
Message-Id: <20240920051721.81905-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 05:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204722

Upstream-Status: Backport from https://github.com/curl/curl/commit/aeb1a281cab13c7ba791cb104e556b20e713941f

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


