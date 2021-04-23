Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.10185.1619186398277610695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 06:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eqYvXPbU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id g16so20834290pfq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=c6hS48TsbdV+g4+MRU7REJQkvNe7BPwfNUQJVGHmMhA=;
        b=eqYvXPbUfUr7RU0V2LwTZNupjLG366dzLrdrplcSGxlIMGd+AN/iL4g11SeqQ8qgrs
         e49am19zhktOgN0ai3p/mBS9+iBOq3VS4a8wt1PjmBgz23dNgkL1dXDa3aZHO0OoD9Y+
         l+j5d52IqSzATBN3Zwr0QAXgCa++5sK22jss4ukEzA0E8qUFXAsF7/iawICM3UF/7+pb
         LwzrTjbvzNnYLU9yXHBS+EGh2R5S1PXr41/PCvVEiJE5lai0SJO/b7F7r4rbK4IGoWM+
         fsLB2G9KBbjyvlogvEKrB+wpD8UBYrh9gte+eDsCAmuKtTeBZhiUMQxE5pIQ+c7cz+Sz
         VnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c6hS48TsbdV+g4+MRU7REJQkvNe7BPwfNUQJVGHmMhA=;
        b=dEUlW2EmXdLQVn9RcEV6RnEYu0v8j3ueBqCuvzk0LCvS2UUF9sHCzkOiThXU3qcrGq
         v8n9aIrZndQylvPqqxwxtGRMF88pjbkvc6cEM3B15RZadA4nCftsxbR6E5W5nxTdQ0GL
         TLhKeEtD3MojkBw40/Uz2Vka0wkY72GXEVTZys8XJkHky4Ph5omXfNjrtxo81cLkTw2Q
         7zCWR6dxgZizT69wZdN4l04Ceqf2NchfHLOteSY2GRn+UhfE44DNmW/oFuwI1Oob2KHV
         hcmPvN3q7JPrQQH/ITsLRkNhCPsrO2b5pChgHiU14nxhzP3Kk5Vx2ruLJ36vSJJjs8+x
         i4Yw==
X-Gm-Message-State: AOAM5307nETXa/TTvcvs9hG9Go87qN28DtzvJ0w/VzlKhKvpERdQzw4y
	k7K2WkQ3zmVfagb7AKCXn3bGLFdfrLucxU2p1hw=
X-Google-Smtp-Source: ABdhPJyWSMpRQNWVoGVLWgXqCqeJephB12O5yK6N8IJ295t3PIdqOiF7MFK+MdW10HnaFbtjIH3eaA==
X-Received: by 2002:a65:4481:: with SMTP id l1mr3867945pgq.42.1619186397079;
        Fri, 23 Apr 2021 06:59:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.06.59.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 06:59:56 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/19] wpa-supplicant: fix CVE-2021-30004
Date: Fri, 23 Apr 2021 03:58:43 -1000
Message-Id: <470e4af4c3a23eaafbd413722fdbfee5ad9e5be9.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Ghinea <stefan.ghinea@windriver.com>

In wpa_supplicant and hostapd 2.9, forging attacks may occur because
AlgorithmIdentifier parameters are mishandled in tls/pkcs1.c and
tls/x509v3.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-30004

Upstream patches:
https://w1.fi/cgit/hostap/commit/?id=a0541334a6394f8237a4393b7372693cd7e96f15

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b32b671bf430b36a5547f8d822dbb760d6be47f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wpa-supplicant/CVE-2021-30004.patch       | 123 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch
new file mode 100644
index 0000000000..e2540fc26b
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch
@@ -0,0 +1,123 @@
+From a0541334a6394f8237a4393b7372693cd7e96f15 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 13 Mar 2021 18:19:31 +0200
+Subject: [PATCH] ASN.1: Validate DigestAlgorithmIdentifier parameters
+
+The supported hash algorithms do not use AlgorithmIdentifier parameters.
+However, there are implementations that include NULL parameters in
+addition to ones that omit the parameters. Previous implementation did
+not check the parameters value at all which supported both these cases,
+but did not reject any other unexpected information.
+
+Use strict validation of digest algorithm parameters and reject any
+unexpected value when validating a signature. This is needed to prevent
+potential forging attacks.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+Upstream-Status: Backport
+CVE: CVE-2021-30004
+
+Reference to upstream patch:
+[https://w1.fi/cgit/hostap/commit/?id=a0541334a6394f8237a4393b7372693cd7e96f15]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/tls/pkcs1.c  | 21 +++++++++++++++++++++
+ src/tls/x509v3.c | 20 ++++++++++++++++++++
+ 2 files changed, 41 insertions(+)
+
+diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
+index 141ac50..e09db07 100644
+--- a/src/tls/pkcs1.c
++++ b/src/tls/pkcs1.c
+@@ -240,6 +240,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestInfo",
++		    hdr.payload, hdr.length);
+ 
+ 	pos = hdr.payload;
+ 	end = pos + hdr.length;
+@@ -261,6 +263,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestAlgorithmIdentifier",
++		    hdr.payload, hdr.length);
+ 	da_end = hdr.payload + hdr.length;
+ 
+ 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
+@@ -269,6 +273,23 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: Digest algorithm parameters",
++		    next, da_end - next);
++
++	/*
++	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
++	 * omit the parameters, but there are implementation that encode these
++	 * as a NULL element. Allow these two cases and reject anything else.
++	 */
++	if (da_end > next &&
++	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
++	     !asn1_is_null(&hdr) ||
++	     hdr.payload + hdr.length != da_end)) {
++		wpa_printf(MSG_DEBUG,
++			   "PKCS #1: Unexpected digest algorithm parameters");
++		os_free(decrypted);
++		return -1;
++	}
+ 
+ 	if (!asn1_oid_equal(&oid, hash_alg)) {
+ 		char txt[100], txt2[100];
+diff --git a/src/tls/x509v3.c b/src/tls/x509v3.c
+index 1bd5aa0..bf2289f 100644
+--- a/src/tls/x509v3.c
++++ b/src/tls/x509v3.c
+@@ -1834,6 +1834,7 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: DigestInfo", hdr.payload, hdr.length);
+ 
+ 	pos = hdr.payload;
+ 	end = pos + hdr.length;
+@@ -1855,6 +1856,8 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: DigestAlgorithmIdentifier",
++		    hdr.payload, hdr.length);
+ 	da_end = hdr.payload + hdr.length;
+ 
+ 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
+@@ -1862,6 +1865,23 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: Digest algorithm parameters",
++		    next, da_end - next);
++
++	/*
++	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
++	 * omit the parameters, but there are implementation that encode these
++	 * as a NULL element. Allow these two cases and reject anything else.
++	 */
++	if (da_end > next &&
++	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
++	     !asn1_is_null(&hdr) ||
++	     hdr.payload + hdr.length != da_end)) {
++		wpa_printf(MSG_DEBUG,
++			   "X509: Unexpected digest algorithm parameters");
++		os_free(data);
++		return -1;
++	}
+ 
+ 	if (x509_sha1_oid(&oid)) {
+ 		if (signature->oid.oid[6] != 5 /* sha-1WithRSAEncryption */) {
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 357c28634a..cddcfb6811 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
            file://CVE-2021-0326.patch \
            file://CVE-2021-27803.patch \
+           file://CVE-2021-30004.patch \
           "
 SRC_URI[md5sum] = "2d2958c782576dc9901092fbfecb4190"
 SRC_URI[sha256sum] = "fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17"
-- 
2.25.1

