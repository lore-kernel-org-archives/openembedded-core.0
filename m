Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id C4FB060291
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 15:11:57 +0000 (UTC)
Received: by wmec201 with SMTP id c201so260885950wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 07:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=5vPTHSPKJDk7rgX1qdCtZmSaftIuja90WXIGdI+4rek=;
	b=RtHmTFE5at0aCJRDpLc7ZSsIvM6BT5wrzrcjfruP35WBSiEGOZLLEXrvTL5RSTydPt
	KSdvH+Q8oDFeEDSlZ1RxysuGkMHTQ1PA3ReSd8Uufc1u+B85ksvD4/9lnj2QsssgPMY/
	SZlTGRguYNcKespK+YMiJ0LpA2OvKF/Hl/kfubsNoYytIwyqS3tpLyNeRIN/aClo/Ax3
	dE3zAyVqZnHHEaOyQCB0fq1B/VP+W6IcSYMvOlmUgvkkEMZOa/tp35iWmMpkPVgJLpZe
	xBa6m9hchQsnkDH45sq/Ohkx4Q3zohPR6Z84Y7Kw0iPBq1OImQHuM5qWwTL0yWvTWjKI
	awGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5vPTHSPKJDk7rgX1qdCtZmSaftIuja90WXIGdI+4rek=;
	b=Tw+EokSBFWWlW20C891kZ4556cip94SnvdHWhFDrgTzM8JyIfAgRh2t8hhqRiGwFvM
	6XaJEn9H86QeB1Bg3+SDGIkpb7OVsYDoFS6TVUJfpQCCCdQlmbB+l9PswAnVu2/R5Rlo
	FbN1+HCvXzI6VEdpceHKruc//qpzSPJGs7xXWApmNfkNPIXjIb+l4K8UajeOTPhwiZBU
	nc1NG6EOfYNiGeIaj7N8WT8xmwEbAEPevUksStnQoEBmmo79r3aLn59WsAlIcsy/G/AX
	pToUVS3LkeWvK56V5bHnVDubuDatI+e3GdTFdf360B+iEIv9z5ifrF6fQb6/SiZZDVvK
	D80A==
X-Gm-Message-State: ALoCoQmlNtRRoaPkV4aO6VyBEWBXp9DdOkMcNuBo8c94+5ahjmMX2JBW8OT/VgvsXCI9tSrbGyd5
X-Received: by 10.194.250.39 with SMTP id yz7mr48669891wjc.92.1448464317601;
	Wed, 25 Nov 2015 07:11:57 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	u134sm3994559wmd.0.2015.11.25.07.11.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Nov 2015 07:11:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 15:03:11 +0000
Message-Id: <1448463791-18677-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] openssl: enable parallel make
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Nov 2015 15:11:58 -0000

openssl 1.0.2d fixes the parallel make problems (commit 8e6bb99), so enable
parallel make again.

[ YOCTO #7347 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index 8e8d05f..249f8c4 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -50,9 +50,6 @@ PACKAGES =+ " \
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
 FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
 
-PARALLEL_MAKE = ""
-PARALLEL_MAKEINST = ""
-
 # The crypto_use_bigint patch means that perl's bignum module needs to be
 # installed, but some distributions (for example Fedora 23) don't ship it by
 # default.  As the resulting error is very misleading check for bignum before
-- 
2.1.4


