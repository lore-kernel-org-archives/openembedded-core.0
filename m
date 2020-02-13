Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0B14C60BBB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:22:06 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d9so2037294plo.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OErsMwhR9fgZ4owSKxqwS1BO7OBXKo5eC77/nuxTDkw=;
	b=mxEJQDMgTG2tdKLQKQihSvVGThkC2le5sKmPeGRXuZdYLcI3JK5hAdMt3q87lwk0V2
	zKwkWNjQdjMawgaxKwFv5wlCi+rJg8u6xjtBuE+Ma71kqMu+CdObnN+2AL/0I0S6nQ8E
	MEFjqtCd401rDpyrhWyCVvG51I/I8mmGV2XDBEtACvmQYSzzHGbFjYKgoydn/wFzWb2t
	pMe+171p8ZZ+7YQsrhCYuSExeGCWFYJVyAuPIB8DsoFSoMs/u35Dhkr7Yk3AxGg6mEN3
	XRosDSEzi+aDOsbquQzD5G9PR+bLLfjTSfRRwA4qPqhO9bDqMGrsnP9i4pa2rGbbiHPn
	mDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OErsMwhR9fgZ4owSKxqwS1BO7OBXKo5eC77/nuxTDkw=;
	b=r8x6YWAtuShtta/QmbGAsc4Ilg+1zVAL9cqOLhtVAdkBbgQPRS4UYAAZ8vaH45g1gW
	kLHxwvmHQavZaKque1Q7LRJL9tbM94GHTa95YKjw+SMd5RaC4X1l+WEE//qCbrVch1Uj
	4ewb8b1nAmoG4WvTXZq5diQJRyy8cRKebhIcSoktRYv5G772i6RkiZu5TtR1cPEt0lBE
	/avQbhLED0gaGcaGx+AkS+Tq+RbTCc0zrxaueViKlR6V0IlgjVhYJ0YkZJE26KS3nQKZ
	XqA4GPQm9+ZcPpTF1V0wLwXN2dtMKtxc43no1O9EMELluQCnicEGz44Uc0OpBE1fxv74
	VNHg==
X-Gm-Message-State: APjAAAU2EFZl9fPHRcXVB+M4SE37/ZVG8T49EB7laJmLRGaHtB5egyGc
	W+MYHLaTltb4krmdsAU8WI2ScbhXIwo=
X-Google-Smtp-Source: APXvYqx2xp2x/OKYJjxeJJ30TNWX3iD0l83c23PYiy40c4ROlyo2Gq9c9h1OTlSgBEasVb7NP8X8/g==
X-Received: by 2002:a17:902:6b4b:: with SMTP id
	g11mr26867758plt.26.1581582127712; 
	Thu, 13 Feb 2020 00:22:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	f127sm1958085pfa.112.2020.02.13.00.22.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 00:22:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 00:21:58 -0800
Message-Id: <8f211fc072b26ed9b3418fef4bead2644966d797.1581580428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581580428.git.raj.khem@gmail.com>
References: <cover.1581580428.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] crosssdk: Set natisdk specific distro features
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
X-List-Received-Date: Thu, 13 Feb 2020 08:22:07 -0000
Content-Transfer-Encoding: 8bit

Currently, normal distro features e.g. ld-is-gold is impacting
crosssdk recipes, which actually should not be the case, since
that feature is essentially intended for target packages and not
nativesdk packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/crosssdk.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index c718a09025..04aecb694e 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -5,9 +5,15 @@ NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
 MACHINEOVERRIDES = ""
 PACKAGE_ARCH = "${SDK_ARCH}"
+
 python () {
     # set TUNE_PKGARCH to SDK_ARCH
     d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH'))
+    # Set features here to prevent appends and distro features backfill
+    # from modifying nativesdk distro features
+    features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
+    filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
+    d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
 }
 
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-- 
2.25.0


