Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A97C87FCE
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 19:05:53 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.43741.1753902347950277745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 12:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NZmfaVg0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so145097a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 12:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753902347; x=1754507147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmaHhfOo1mn6e87G5+kLVfTsGQzSV+IaSgV4ktU/sWo=;
        b=NZmfaVg0ATFdj4h9pRQDXK1EXG6wl6HnMoBVsIm96UmeAwV60K/Yxcol5nVPm+9WtN
         Y/W3x6/5+b/iUZ0EZpvt4cDWx7ZJkL0m+3p3WiXGLG8O/MoT5vqJwIU1akYaWKyT9+no
         8PAeZ5QXYE4ueY0sN1dTArnGI0vXRPJqgY9HodqkiED/sEpuFEsyluJH/aG1Z6EgGxwQ
         QoFHr+AR5GAgUI6t7MsVs3xit9TBZyjS4h4yztdyp/qbBMOk5FhuezE99LaLeNgYppSh
         nnGwIekBa/6m0Nd9OiIUqIm8F0Z7klcXgIZ0uLozKgt5IA04SuPGK+QiDfWJkK49qXwO
         G/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753902347; x=1754507147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmaHhfOo1mn6e87G5+kLVfTsGQzSV+IaSgV4ktU/sWo=;
        b=Dn7XJlsCcHJrhyY3zHAObpS0xt175lLQXinVLT87ub7oCT+9sszljkAvtDMZaB7kJe
         QeoxTHA+l1kN6isPaP6dXG1ayVM1L6w+8j+zDonOilsBeDnzBap6H2SrUYVi4EKQOn2G
         fFyUHehsWJ/sx+oxcA3NDbVcN3SH6IciX7E5oPBK8EVqBKCjgOAf9Nw4yYKrEBJwRGOy
         eDZPDH4tHSH7lfr+fv646JNwdSo6WiP9loeJiK8YpsVY+4whPyD255toHi56FZEcFPJB
         HHfPqRV2r9pmg5f4MM55leD0YvP2qjE7RI6YlRW5CZJJVkrdjqUIZ81qD0GW7yb0qalA
         NHlw==
X-Gm-Message-State: AOJu0Yy/ePVWzWVNn5SOGoO73o+mJoUHrGuv7GRv0RC84Z19E82Yo4YN
	/pfe1RUgOqFZMp4T6miNEqZv3C8tYLjTyFmb/aB0nzijP2U75X26FlczIHpYYSTMktHwrNlRo+P
	DaDIJ
X-Gm-Gg: ASbGncs0l+l2Aw75qjVYmPylTmIszEktEROFMSAEjuW+tPpT9m7/NhB3PHBG8sJwVgO
	aCdf3vJxLXUis5WT9E9TlXiN+/apcgNULggbovcY+8pnBBNqU9EN329IxPq1Rr0nnX1zWBHDCqB
	Kx4RQaYRXz9rNuNbz3OKYU+AWc4iVKnWyNdXeqxN5IJoXcYeSByNvXWQ3Gw1Ax8rkhU/RWXXXZY
	88KnjEU2QpDunNUrtCLU1J4pPDH7PxZsPQowg5ipayAVCSCISKzJb43/9NPZ0lRfZPjR4rb5IBK
	mc/gWcEi+/2SmVZ/4r9mtdXTkDGr96mv6d4dUANi+uEYtmlTxJCS9nNxThopo9y5CG9z5FGGUcX
	PSIGUau3qqabDcCBf2M/wcgg=
X-Google-Smtp-Source: AGHT+IGgH11hRftAQAvXk0zEbuJzKOMf+hQOtq0fUx2IA0wfrXIXAkdoMWxk/2fRjWjNRVYn5EH4nA==
X-Received: by 2002:a17:903:22ca:b0:240:1831:eeeb with SMTP id d9443c01a7336-24096b55100mr56893305ad.40.1753902347039;
        Wed, 30 Jul 2025 12:05:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240a48b77d3sm22129025ad.117.2025.07.30.12.05.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:05:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/10] gnutls: patch reject zero-length version in certificate request
Date: Wed, 30 Jul 2025 12:05:28 -0700
Message-ID: <990bd6fab5c6004b9fbcdb9c76bcb3a96ba5887a.1753902181.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753902181.git.steve@sakoman.com>
References: <cover.1753902181.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 19:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221142

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].
The MR contains referece to undiscoled issue, so any security relevant
patch should be picked.

Binary test file was added as separate file as binary diffs are not
supported.

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-length-version-in-certificate-reque.patch |  37 ++++++++++++++++++
 .../3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2  | Bin 0 -> 830 bytes
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   5 ++-
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2

diff --git a/meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch b/meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch
new file mode 100644
index 0000000000..6351bf4559
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-x509-reject-zero-length-version-in-certificate-reque.patch
@@ -0,0 +1,37 @@
+From 61c0505634a6faacf9fa0723843408aa0d3fb90a Mon Sep 17 00:00:00 2001
+From: Andrew Hamilton <adhamilt@gmail.com>
+Date: Mon, 7 Jul 2025 10:35:54 +0900
+Subject: [PATCH] x509: reject zero-length version in certificate request
+
+Ensure zero size asn1 values are considered invalid in
+gnutls_x509_crq_get_version, this ensures crq version is not used
+uninitialized. Spotted by oss-fuzz at:
+https://issues.oss-fuzz.com/issues/42536706
+
+Signed-off-by: Andrew Hamilton <adhamilt@gmail.com>
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/61c0505634a6faacf9fa0723843408aa0d3fb90a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/x509/crq.c                                    |   7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/lib/x509/crq.c b/lib/x509/crq.c
+index 19e13623c..9e9801d2b 100644
+--- a/lib/x509/crq.c
++++ b/lib/x509/crq.c
+@@ -635,6 +635,13 @@ int gnutls_x509_crq_get_version(gnutls_x509_crq_t crq)
+ 		return _gnutls_asn2err(result);
+ 	}
+ 
++	/* Note that asn1_read_value can return success with */
++	/* len set to zero (without setting the data) in some */
++	/* conditions. */
++	if (unlikely(len <= 0)) {
++		return gnutls_assert_val(GNUTLS_E_ASN1_VALUE_NOT_VALID);
++	}
++
+ 	return (int) version[0] + 1;
+ }
+ 
diff --git a/meta/recipes-support/gnutls/gnutls/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 b/meta/recipes-support/gnutls/gnutls/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2
new file mode 100644
index 0000000000000000000000000000000000000000..23ff09c4be5ece2b2aae278f48b3a24543256e8e
GIT binary patch
literal 830
zcmXqLVzx49Vp`19$Y4-yC~6?g#;gDYJRkxF48;vZA;NqxAqZ_KWFP>M;Dk#U@*D6%
z#Mq#UxD7ZV0!#`DV57L;iWL;tp=^W3`9OULV-y&e8+(z|4Lox}6JxDG6JsTkBMqAv
zvxsmQ(BDLW7_gfE|Nj%AmUJaSq-!ClgBPy~G=HFR!CFzpKs@B6!4EYarV1l{G~%_N
LG)b5xr0D_xkf?K@

literal 0
HcmV?d00001

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index 4929e44db3..65e42c00c2 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -33,6 +33,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://04939b75417cc95b7372c6f208c4bda4579bdc34 \
            file://0001-psk-fix-read-buffer-overrun-in-the-pre_shared_key-ex.patch \
            file://5477db1bb507a35e8833c758ce344f4b5b246d8e \
+           file://0001-x509-reject-zero-length-version-in-certificate-reque.patch \
+           file://3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
@@ -71,9 +73,10 @@ do_configure:prepend() {
 	done
 
     # binary files cannot be delivered as diff
-    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/ ${S}/fuzz/gnutls_psk_client_fuzzer.repro/
+    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/ ${S}/fuzz/gnutls_psk_client_fuzzer.repro/ ${S}/fuzz/gnutls_x509_crq_parser_fuzzer.repro/
     cp ${WORKDIR}/04939b75417cc95b7372c6f208c4bda4579bdc34 ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
     cp ${WORKDIR}/5477db1bb507a35e8833c758ce344f4b5b246d8e ${S}/fuzz/gnutls_psk_client_fuzzer.repro/
+    cp ${WORKDIR}/3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 ${S}/fuzz/gnutls_x509_crq_parser_fuzzer.repro/
 }
 
 PACKAGES =+ "${PN}-openssl ${PN}-xx"
-- 
2.43.0


