Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AED9CF31BF
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:14 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.6928.1727874785646998803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=US+dcq08;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71b8d10e990so3299654b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874785; x=1728479585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9S/pR04Lqss0WB7fdKeT/S35PR9r+9l2BaZGsQDilfM=;
        b=US+dcq08UqJ3k9YN/lg67LSctfOLAN3BM46PoAABSw/rPvJ3wWcmwBLcWO2ZBH6Dxm
         fBVxJ+nYqHdUu2BzA8h1o7Y1ndCo0vYZZKse4mbyPfeVKV4Cxj4eOgloT8/mBDosTPg3
         qkiC1+wBprBkDw5ztGGkpI0hXIWQ0F0kipLLxc5CZI5q2x/oWzHIXsabcwyLKePmJ9/a
         RDhtPXEhHEca6Fcm94p55Je8wQ13l7LL/Unmsusq524O/RUKw7GrjN86y+1/ohElDc4m
         BBslkFldtE3qLJ1r+BxM+ymj1iUDOuv/IZI6H+mfAMRQHBsY1THViaFdmFSri/hoX6Bd
         AitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874785; x=1728479585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9S/pR04Lqss0WB7fdKeT/S35PR9r+9l2BaZGsQDilfM=;
        b=verFUkjq4KvMdZetrxoPHjHuNm8svaiggfmVxVEAOF5BIp6hqRdOK3iIcndnmI7xR3
         QoR/MwkIzRenzyewZMip8TbdqUInAn2ijYmXZlmOUuOo7J3UoqrF5Yh2VAq9ixEcP3AA
         pRZufpJmpqxeP5J8O7G+O076bdC+7gZ0g3+XrPg1HOitWxumBuqdLWcCApB1zWUvTQi6
         oWIZAvdHetWJzI+ZIuBdFGQ0gnePjIhZUPQjMWiGDQdwF7n29/fI48xluoWhiLEjNVUT
         aqYKDjoQ9dvdwK2isHU8cgGH/OV/BdaX4XAW83wVjtqSui/sM2FzMJi4/NMOffEIYD8f
         G21g==
X-Gm-Message-State: AOJu0YzNJYGp64x2l49IAqpgyy3acuu5zKAf0Q0NBI2WBWQzec686PmB
	eobRK1GJwjNGmCbtzyPuteIL0J7zH3UjpYhIHxbN83r6yMHlPejbQhru99iRLp+jLi1zrfez0o6
	8SQs=
X-Google-Smtp-Source: AGHT+IGeWDTgYqgV9faGn/Rpaik7f3nHO/owjHxG3gPRmTcVdUzNCNO3ojo+LpEQLCvsOmKPpu0Rtg==
X-Received: by 2002:a05:6a00:2d94:b0:717:d4e3:df1a with SMTP id d2e1a72fcca58-71dc5c7b5f5mr4930708b3a.9.1727874784679;
        Wed, 02 Oct 2024 06:13:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/16] curl: backport Debian patch for CVE-2024-8096
Date: Wed,  2 Oct 2024 06:12:41 -0700
Message-Id: <5383b18d4f8023b49cdadf7c777aaecf55d95dc1.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205185

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2024-8096

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches?h=ubuntu/jammy-security
Upstream commit
https://github.com/curl/curl/commit/aeb1a281cab13c7ba791cb104e556b20e713941f]

Reference:
https://curl.se/docs/CVE-2024-8096.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


