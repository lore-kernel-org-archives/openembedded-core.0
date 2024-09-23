Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148D7CF9C5B
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 05:49:51 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.30174.1727070588247184599
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 22:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FAZ3dae9;
 spf=pass (domain: mvista.com, ip: 209.85.216.49, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2dee9d86f4dso765149a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 22:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1727070587; x=1727675387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYmSJMkQPuoHK8vrULbSeG1LdUIT514Aqkti8ZkoFkg=;
        b=FAZ3dae99oHBrfpKpJEfznPoBk01H3GdoDGmOT9+FSDNAW6qVOqJf9nHW/f+Cqm/0u
         hVeSyIfZUDgK/h/IzpVwbg0W4XRW2zWoQ90BUyeMd9Jezt7/i1RjiMx7Kivjvm33zjUR
         ibl+nJZcFye0MN/z95rldroDt37DALxfYK0dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727070587; x=1727675387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYmSJMkQPuoHK8vrULbSeG1LdUIT514Aqkti8ZkoFkg=;
        b=P9GSFHvnh8eLBl9dqP/AOvRuO29NaUSMD2u/eg3qKOC71+24BFuYWndjWEvbH/euUW
         qXgNKHFOGGn+5jw5b6PNUAB79FYMy2Q2oNeV7zANHrQsFYUQ8+3FbUaAvj2oTzSfI/2V
         urlwTD3D+o8YrFL+anVrwNTDTqU+5FBm9SLe1SFNPhvwCP0TXLsxMA4xEat1hGSEW1KW
         BjuieMYjYyB8oaFd7H9bs8OQ4CF7Wv3y6rttx4V8RnVQRIcWPDhNvE4Sd/bddQ5nDDOh
         uCNkOyJOIqSMS4TtCqP+r4oZEOv/mnqmWcuspvm/5Wd+uoB8lIf/2cG9OklNsv1x/wd/
         t1gw==
X-Gm-Message-State: AOJu0Ywd3n/YzQo6nUINxcfAudGpYtgIQBfeMxk/D8ycxahdZ4ZpTZ4q
	1LDFEnp1EfQu8vCJDM9x8c8FDdCwWR4RoOaqJf2hb6w/ij/ICVT5kSr3g538U5FSWVvkAL1Hsar
	u
X-Google-Smtp-Source: AGHT+IGvyzGJG89pw6tR6Tz4nkqz6km17vAZdBtR+ZlYSN1OTbzlFvWy3fsDM336QDDEyJtwEfmV7A==
X-Received: by 2002:a17:90a:1202:b0:2dd:8097:3ced with SMTP id 98e67ed59e1d1-2dd80973cf0mr13192585a91.26.1727070586994;
        Sun, 22 Sep 2024 22:49:46 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:882e:6fe6:697c:57cb:5ac0:b8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd6eec9ff0sm8558667a91.33.2024.09.22.22.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 22:49:46 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] curl: backport Debian patch for CVE-2024-8096
Date: Mon, 23 Sep 2024 11:19:38 +0530
Message-Id: <20240923054938.1387063-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 05:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204795

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2024-8096

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches?h=ubuntu/jammy-security
Upstream commit
https://github.com/curl/curl/commit/aeb1a281cab13c7ba791cb104e556b20e713941f]

Reference:
https://curl.se/docs/CVE-2024-8096.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2024-8096.patch             | 210 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 211 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-8096.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-8096.patch b/meta/recipes-support/curl/curl/CVE-2024-8096.patch
new file mode 100644
index 0000000000..777b3fe587
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-8096.patch
@@ -0,0 +1,210 @@
+Backport of:
+
+From aeb1a281cab13c7ba791cb104e556b20e713941f Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 20 Aug 2024 16:14:39 +0200
+Subject: [PATCH] gtls: fix OCSP stapling management
+
+Reported-by: Hiroki Kurosawa
+Closes #14642
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-2024-8096.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/curl/curl/commit/aeb1a281cab13c7ba791cb104e556b20e713941f]
+CVE: CVE-2024-8096
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/vtls/gtls.c | 146 ++++++++++++++++++++++++------------------------
+ 1 file changed, 73 insertions(+), 73 deletions(-)
+
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -530,6 +530,13 @@ gtls_connect_step1(struct Curl_easy *dat
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
+   rc = gnutls_init(&backend->session, init_flags);
+   if(rc != GNUTLS_E_SUCCESS) {
+     failf(data, "gnutls_init() failed: %d", rc);
+@@ -929,104 +936,97 @@ Curl_gtls_verifyserver(struct Curl_easy
+     infof(data, "  server certificate verification SKIPPED");
+ 
+   if(SSL_CONN_CONFIG(verifystatus)) {
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
++      case GNUTLS_X509_CRLREASON_KEYCOMPROMISE:
++        crl_reason = "private key compromised";
++        break;
+ 
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
+-
+-          case GNUTLS_X509_CRLREASON_SUPERSEDED:
+-            crl_reason = "certificate superseded";
+-            break;
+-
+-          case GNUTLS_X509_CRLREASON_CESSATIONOFOPERATION:
+-            crl_reason = "operation has ceased";
+-            break;
+-
+-          case GNUTLS_X509_CRLREASON_CERTIFICATEHOLD:
+-            crl_reason = "certificate is on hold";
+-            break;
+-
+-          case GNUTLS_X509_CRLREASON_REMOVEFROMCRL:
+-            crl_reason = "will be removed from delta CRL";
+-            break;
+-
+-          case GNUTLS_X509_CRLREASON_PRIVILEGEWITHDRAWN:
+-            crl_reason = "privilege withdrawn";
+-            break;
+-
+-          case GNUTLS_X509_CRLREASON_AACOMPROMISE:
+-            crl_reason = "AA compromised";
+-            break;
+-        }
++      case GNUTLS_X509_CRLREASON_CACOMPROMISE:
++        crl_reason = "CA compromised";
++        break;
+ 
+-        failf(data, "Server certificate was revoked: %s", crl_reason);
++      case GNUTLS_X509_CRLREASON_AFFILIATIONCHANGED:
++        crl_reason = "affiliation has changed";
+         break;
+-      }
+ 
+-      default:
+-      case GNUTLS_OCSP_CERT_UNKNOWN:
+-        failf(data, "Server certificate status is unknown");
++      case GNUTLS_X509_CRLREASON_SUPERSEDED:
++        crl_reason = "certificate superseded";
++        break;
++
++      case GNUTLS_X509_CRLREASON_CESSATIONOFOPERATION:
++        crl_reason = "operation has ceased";
++        break;
++
++      case GNUTLS_X509_CRLREASON_CERTIFICATEHOLD:
++        crl_reason = "certificate is on hold";
++        break;
++
++      case GNUTLS_X509_CRLREASON_REMOVEFROMCRL:
++        crl_reason = "will be removed from delta CRL";
++        break;
++
++      case GNUTLS_X509_CRLREASON_PRIVILEGEWITHDRAWN:
++        crl_reason = "privilege withdrawn";
++        break;
++
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
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 308b508072..a613e93780 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -60,6 +60,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2024-2398.patch \
            file://CVE-2024-7264_1.patch \
            file://CVE-2024-7264_2.patch \
+           file://CVE-2024-8096.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


