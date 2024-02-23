Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5546BC48BC4
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 08:12:35 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.6374.1708675952749962406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 00:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i54ekSrR;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d95d67ff45so3236515ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 00:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708675951; x=1709280751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zvDoE8Zn7U7uxnIEjdsfqCutmCVRCv/O6d3t1quibY=;
        b=i54ekSrRsLA+fcZRI/LXvAot5zeLDdR2SLy01gSG5yUNkpxTjWTuyBLXLvQzEN/T/b
         bCDuJ+gFng6i9zSZBTKe/jnk/i/gzlzHD8laSBKk0PHp84Kzpa53ePsq9PCSHocm3wP2
         OXDXJ21VrwkSnHiudEeLPwVsT/ruW6uNjRxhQ3g0mVkfIWtR1QM/79/92fF2UXqjYWge
         ArXfR5YnKyORPesazdME9l1KWh5WZ30E4X2E+0KrshpT61a3+17CQTeYvn1/KqKy3yz0
         RN1HZnbrwyxttC3Z9x0fwqnkY8Q9sFY5qP1mD67I8bsuXgHS1NlJFy2oRRSMmZqBhNDq
         npDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708675951; x=1709280751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zvDoE8Zn7U7uxnIEjdsfqCutmCVRCv/O6d3t1quibY=;
        b=uPE52HS3w6zykR+kHGXo97gPmeikX93LzrCO0jhYdp91DREnxGg6KfLAPHAyuJz6D1
         WtThIrpYN9RGhslHoeM7IoSfOEmMfBZSln/5SdqN8SPrQkgBIwQ+cJnqMx/i+NaZS7sK
         Tj4KYzEuboSuZYXnaRKPpaa2HSKQ7ZoqO5Lf4xzSZuSL+rY7LiN9u4zQmdPCtKd5V//v
         TWE32JmHv/lSp9cH1mtq89warEOj3TkQwbdZ5MHE3O7m04hwUlgoNgdV2WcP0rljrFDB
         bZFo3ci6RGBEbN+nVps3UfS1ixClQa8KhLopmZKkHgkJPVYyv494M5V3VibZ4+FF8Xuh
         vu9A==
X-Gm-Message-State: AOJu0YxmvFo4VVnIJPQoSzON9IKiJXeK6YFeeRDDOGZBXRcExbcR3Y5Z
	wMuTx3kcFkqfworaS7dnnl7rzqZ6ISNLr96GSOlIUIZQBWKNbm8Hs0ogWQcT
X-Google-Smtp-Source: AGHT+IHtPyJvGpea1ZI5UEq7v+r9bGvk5a9k5c3eeudrCzmJMMbEv3PoMy3sryEZCM5EF1GfWYFWXg==
X-Received: by 2002:a17:902:dac4:b0:1db:6722:5b3d with SMTP id q4-20020a170902dac400b001db67225b3dmr1713132plx.21.1708675951163;
        Fri, 23 Feb 2024 00:12:31 -0800 (PST)
Received: from localhost.localdomain ([2402:a00:404:fd88:166:f28b:cf95:7de5])
        by smtp.gmail.com with ESMTPSA id o7-20020a170902778700b001dc391cc28fsm3828531pll.121.2024.02.23.00.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 00:12:30 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][dunfell][PATCH] gnutls: Backport of CVE-2024-0567
Date: Fri, 23 Feb 2024 13:42:06 +0530
Message-Id: <20240223081206.40554-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 08:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196050

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

A vulnerability was found in GnuTLS, where a cockpit (which uses gnuTLS)
rejects a certificate chain with distributed trust. This issue occurs
when validating a certificate chain with cockpit-certificate-ensure.
This flaw allows an unauthenticated, remote client or attacker to
initiate a denial of service attack.

Link: https://nvd.nist.gov/vuln/detail/CVE-2024-0567
Link: https://gitlab.com/gnutls/gnutls/-/issues/1521
Link: https://gitlab.com/gnutls/gnutls/-/commit/9edbdaa84e38b1bfb53a7d72c1de44f8de373405

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../gnutls/gnutls/CVE-2024-0567.patch         | 190 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
 2 files changed, 191 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch b/meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch
new file mode 100644
index 0000000000..1580cab277
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch
@@ -0,0 +1,190 @@
+From 9edbdaa84e38b1bfb53a7d72c1de44f8de373405 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Thu, 11 Jan 2024 15:45:11 +0900
+Subject: [PATCH] x509: detect loop in certificate chain
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+There can be a loop in a certificate chain, when multiple CA
+certificates are cross-signed with each other, such as A → B, B → C,
+and C → A.  Previously, the verification logic was not capable of
+handling this scenario while sorting the certificates in the chain in
+_gnutls_sort_clist, resulting in an assertion failure.  This patch
+properly detects such loop and aborts further processing in a graceful
+manner.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+CVE: CVE-2024-0567
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/9edbdaa84e38b1bfb53a7d72c1de44f8de373405]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Comment: Hunks refreshed to fix error during backporting this patch
+
+---
+ lib/x509/common.c   |   4 ++
+ tests/test-chains.h | 125 ++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 129 insertions(+)
+
+diff --git a/lib/x509/common.c b/lib/x509/common.c
+index 861cace4c8..d749a062cd 100644
+--- a/lib/x509/common.c
++++ b/lib/x509/common.c
+@@ -1761,6 +1761,11 @@ gnutls_x509_crt_t *_gnutls_sort_clist(gn
+ 			*clist_size = i;
+ 			break;
+ 		}
++
++		if (insorted[prev]) { /* loop detected */
++			break;
++		}
++
+ 		sorted[i] = clist[prev];
+ 		insorted[prev] = 1;
+ 	}
+diff --git a/tests/test-chains.h b/tests/test-chains.h
+index 9ce23764da..3e559fecd5 100644
+--- a/tests/test-chains.h
++++ b/tests/test-chains.h
+@@ -4106,6 +4106,129 @@ static const char *superseding_ca[] = {
+ 	NULL
+ };
+ 
++static const char *cross_signed[] = {
++	/* server (signed by A1) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBqDCCAVqgAwIBAgIUejlil+8DBffazcnMNwyOOP6yCCowBQYDK2VwMBoxGDAW\n"
++	"BgNVBAMTD0ludGVybWVkaWF0ZSBBMTAgFw0yNDAxMTEwNjI3MjJaGA85OTk5MTIz\n"
++	"MTIzNTk1OVowNzEbMBkGA1UEChMSR251VExTIHRlc3Qgc2VydmVyMRgwFgYDVQQD\n"
++	"Ew90ZXN0LmdudXRscy5vcmcwKjAFBgMrZXADIQA1ZVS0PcNeTPQMZ+FuVz82AHrj\n"
++	"qL5hWEpCDgpG4M4fxaOBkjCBjzAMBgNVHRMBAf8EAjAAMBoGA1UdEQQTMBGCD3Rl\n"
++	"c3QuZ251dGxzLm9yZzATBgNVHSUEDDAKBggrBgEFBQcDATAOBgNVHQ8BAf8EBAMC\n"
++	"B4AwHQYDVR0OBBYEFGtEUv+JSt+zPoO3lu0IiObZVoiNMB8GA1UdIwQYMBaAFPnY\n"
++	"v6Pw0IvKSqIlb6ewHyEAmTA3MAUGAytlcANBAAS2lyc87kH/aOvNKzPjqDwUYxPA\n"
++	"CfYjyaKea2d0DZLBM5+Bjnj/4aWwTKgVTJzWhLJcLtaSdVHrXqjr9NhEhQ0=\n"
++	"-----END CERTIFICATE-----\n",
++	/* A1 (signed by A) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBUjCCAQSgAwIBAgIUe/R+NVp04e74ySw2qgI6KZgFR20wBQYDK2VwMBExDzAN\n"
++	"BgNVBAMTBlJvb3QgQTAgFw0yNDAxMTEwNjI1MDFaGA85OTk5MTIzMTIzNTk1OVow\n"
++	"GjEYMBYGA1UEAxMPSW50ZXJtZWRpYXRlIEExMCowBQYDK2VwAyEAlkTNqwz973sy\n"
++	"u3whMjSiUMs77CZu5YA7Gi5KcakExrKjYzBhMA8GA1UdEwEB/wQFMAMBAf8wDgYD\n"
++	"VR0PAQH/BAQDAgIEMB0GA1UdDgQWBBT52L+j8NCLykqiJW+nsB8hAJkwNzAfBgNV\n"
++	"HSMEGDAWgBRbYgOkRGsd3Z74+CauX4htzLg0lzAFBgMrZXADQQBM0NBaFVPd3cTJ\n"
++	"DSaZNT34fsHuJk4eagpn8mBxKQpghq4s8Ap+nYtp2KiXjcizss53PeLXVnkfyLi0\n"
++	"TLVBHvUJ\n"
++	"-----END CERTIFICATE-----\n",
++	/* A (signed by B) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBSDCB+6ADAgECAhQtdJpg+qlPcLoRW8iiztJUD4xNvDAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBCMCAXDTI0MDExMTA2MTk1OVoYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEEwKjAFBgMrZXADIQA0vDYyg3tgotSETL1Wq2hBs32p\n"
++	"WbnINkmOSNmOiZlGHKNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFFtiA6REax3dnvj4Jq5fiG3MuDSXMB8GA1UdIwQYMBaAFJFA\n"
++	"s2rg6j8w9AKItRnOOOjG2FG6MAUGAytlcANBAPv674p9ek5GjRcRfVQhgN+kQlHU\n"
++	"u774wL3Vx3fWA1E7+WchdMzcHrPoa5OKtKmxjIKUTO4SeDZL/AVpvulrWwk=\n"
++	"-----END CERTIFICATE-----\n",
++	/* A (signed by C) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBSDCB+6ADAgECAhReNpCiVn7eFDUox3mvM5qE942AVzAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBDMCAXDTI0MDExMTA2MjEyMVoYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEIwKjAFBgMrZXADIQAYX92hS97OGKbMzwrD7ReVifwM\n"
++	"3iz5tnfQHWQSkvvYMKNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFJFAs2rg6j8w9AKItRnOOOjG2FG6MB8GA1UdIwQYMBaAFEh/\n"
++	"XKjIuMeEavX5QVoy39Q+GhnwMAUGAytlcANBAIwghH3gelXty8qtoTGIEJb0+EBv\n"
++	"BH4YOUh7TamxjxkjvvIhDA7ZdheofFb7NrklJco7KBcTATUSOvxakYRP9Q8=\n"
++	"-----END CERTIFICATE-----\n",
++	/* B1 (signed by B) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBUjCCAQSgAwIBAgIUfpmrVDc1XBA5/7QYMyGBuB9mTtUwBQYDK2VwMBExDzAN\n"
++	"BgNVBAMTBlJvb3QgQjAgFw0yNDAxMTEwNjI1MjdaGA85OTk5MTIzMTIzNTk1OVow\n"
++	"GjEYMBYGA1UEAxMPSW50ZXJtZWRpYXRlIEIxMCowBQYDK2VwAyEAh6ZTuJWsweVB\n"
++	"a5fsye5iq89kWDC2Y/Hlc0htLmjzMP+jYzBhMA8GA1UdEwEB/wQFMAMBAf8wDgYD\n"
++	"VR0PAQH/BAQDAgIEMB0GA1UdDgQWBBTMQu37PKyLjKfPODZgxYCaayff+jAfBgNV\n"
++	"HSMEGDAWgBSRQLNq4Oo/MPQCiLUZzjjoxthRujAFBgMrZXADQQBblmguY+lnYvOK\n"
++	"rAZJnqpEUGfm1tIFyu3rnlE7WOVcXRXMIoNApLH2iHIipQjlvNWuSBFBTC1qdewh\n"
++	"/e+0cgQB\n"
++	"-----END CERTIFICATE-----\n",
++	/* B (signed by A) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBSDCB+6ADAgECAhRpEm+dWNX6DMZh/nottkFfFFrXXDAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBBMCAXDTI0MDExMTA2MTcyNloYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEIwKjAFBgMrZXADIQAYX92hS97OGKbMzwrD7ReVifwM\n"
++	"3iz5tnfQHWQSkvvYMKNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFJFAs2rg6j8w9AKItRnOOOjG2FG6MB8GA1UdIwQYMBaAFFti\n"
++	"A6REax3dnvj4Jq5fiG3MuDSXMAUGAytlcANBAFvmcK3Ida5ViVYDzxKVLPcPsCHe\n"
++	"3hxz99lBrerJC9iJSvRYTJoPBvjTxDYnBn5EFrQYMrUED+6i71lmGXNU9gs=\n"
++	"-----END CERTIFICATE-----\n",
++	/* B (signed by C) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBSDCB+6ADAgECAhReNpCiVn7eFDUox3mvM5qE942AVzAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBDMCAXDTI0MDExMTA2MjEyMVoYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEIwKjAFBgMrZXADIQAYX92hS97OGKbMzwrD7ReVifwM\n"
++	"3iz5tnfQHWQSkvvYMKNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFJFAs2rg6j8w9AKItRnOOOjG2FG6MB8GA1UdIwQYMBaAFEh/\n"
++	"XKjIuMeEavX5QVoy39Q+GhnwMAUGAytlcANBAIwghH3gelXty8qtoTGIEJb0+EBv\n"
++	"BH4YOUh7TamxjxkjvvIhDA7ZdheofFb7NrklJco7KBcTATUSOvxakYRP9Q8=\n"
++	"-----END CERTIFICATE-----\n",
++	/* C1 (signed by C) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBUjCCAQSgAwIBAgIUSKsfY1wD3eD2VmaaK1wt5naPckMwBQYDK2VwMBExDzAN\n"
++	"BgNVBAMTBlJvb3QgQzAgFw0yNDAxMTEwNjI1NDdaGA85OTk5MTIzMTIzNTk1OVow\n"
++	"GjEYMBYGA1UEAxMPSW50ZXJtZWRpYXRlIEMxMCowBQYDK2VwAyEA/t7i1chZlKkV\n"
++	"qxJOrmmyATn8XnpK+nV/iT4OMHSHfAyjYzBhMA8GA1UdEwEB/wQFMAMBAf8wDgYD\n"
++	"VR0PAQH/BAQDAgIEMB0GA1UdDgQWBBRmpF3JjoP3NiBzE5J5ANT0bvfRmjAfBgNV\n"
++	"HSMEGDAWgBRIf1yoyLjHhGr1+UFaMt/UPhoZ8DAFBgMrZXADQQAeRBXv6WCTOp0G\n"
++	"3wgd8bbEGrrILfpi+qH7aj/MywgkPIlppDYRQ3jL6ASd+So/408dlE0DV9DXKBi0\n"
++	"725XUUYO\n"
++	"-----END CERTIFICATE-----\n",
++	/* C (signed by A) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBSDCB+6ADAgECAhRvbZv3SRTjDOiAbyFWHH4y0yMZkjAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBBMCAXDTI0MDExMTA2MTg1MVoYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEMwKjAFBgMrZXADIQDxm6Ubhsa0gSa1vBCIO5e+qZEH\n"
++	"8Oocz+buNHfIJbh5NaNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFEh/XKjIuMeEavX5QVoy39Q+GhnwMB8GA1UdIwQYMBaAFFti\n"
++	"A6REax3dnvj4Jq5fiG3MuDSXMAUGAytlcANBAPl+SyiOfXJnjSWx8hFMhJ7w92mn\n"
++	"tkGifCFHBpUhYcBIMeMtLw0RBLXqaaN0EKlTFimiEkLClsU7DKYrpEEJegs=\n"
++	"-----END CERTIFICATE-----\n",
++	/* C (signed by B) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBSDCB+6ADAgECAhQU1OJWRVOLrGrgJiLwexd1/MwKkTAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBCMCAXDTI0MDExMTA2MjAzMFoYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEMwKjAFBgMrZXADIQDxm6Ubhsa0gSa1vBCIO5e+qZEH\n"
++	"8Oocz+buNHfIJbh5NaNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFEh/XKjIuMeEavX5QVoy39Q+GhnwMB8GA1UdIwQYMBaAFJFA\n"
++	"s2rg6j8w9AKItRnOOOjG2FG6MAUGAytlcANBALXeyuj8vj6Q8j4l17VzZwmJl0gN\n"
++	"bCGoKMl0J/0NiN/fQRIsdbwQDh0RUN/RN3I6DTtB20ER6f3VdnzAh8nXkQ4=\n"
++	"-----END CERTIFICATE-----\n",
++	NULL
++};
++
++static const char *cross_signed_ca[] = {
++	/* A (self-signed) */
++	"-----BEGIN CERTIFICATE-----\n"
++	"MIIBJzCB2qADAgECAhQs1Ur+gzPs1ISxs3Tbs700q0CZcjAFBgMrZXAwETEPMA0G\n"
++	"A1UEAxMGUm9vdCBBMCAXDTI0MDExMTA2MTYwMFoYDzk5OTkxMjMxMjM1OTU5WjAR\n"
++	"MQ8wDQYDVQQDEwZSb290IEEwKjAFBgMrZXADIQA0vDYyg3tgotSETL1Wq2hBs32p\n"
++	"WbnINkmOSNmOiZlGHKNCMEAwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC\n"
++	"AgQwHQYDVR0OBBYEFFtiA6REax3dnvj4Jq5fiG3MuDSXMAUGAytlcANBAHrVv7E9\n"
++	"5scuOVCH9gNRRm8Z9SUoLakRHAPnySdg6z/kI3vOgA/OM7reArpnW8l1H2FapgpL\n"
++	"bDeZ2XJH+BdVFwg=\n"
++	"-----END CERTIFICATE-----\n",
++	NULL
++};
++
+ #if defined __clang__ || __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 5)
+ #  pragma GCC diagnostic push
+ #  pragma GCC diagnostic ignored "-Wunused-variable"
+@@ -4275,6 +4398,8 @@ static struct
+   { "ed448 - ok", ed448, &ed448[0], GNUTLS_PROFILE_TO_VFLAGS(GNUTLS_PROFILE_ULTRA),
+     0, NULL, 1584352960, 1},
+   { "superseding - ok", superseding, superseding_ca, 0, 0, 0, 1590928011 },
++  { "cross signed - ok", cross_signed, cross_signed_ca, 0, 0, 0,
++    1704955300 },
+   { NULL, NULL, NULL, 0, 0}
+ };
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index a1451daf2c..66700ac1b4 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2023-0361.patch \
            file://CVE-2023-5981.patch \
            file://CVE-2024-0553.patch \
+           file://CVE-2024-0567.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.25.1


