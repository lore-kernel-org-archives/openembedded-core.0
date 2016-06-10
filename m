Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CA4EF70030
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 15:12:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r5so18669219wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 08:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DkD8bhqEe/9brWcputYBIuJ2NOQcGvfeZpgexHtykN0=;
	b=jQF+WZ70TOPJ7puDBJ/eFFiege8QlIvd7TFwPdG/whuVEdGHvxWznwr+PWcb/QmAQy
	O1Wpyuide3ydBcpOqqWtAKrhTGEybTm6fuhSL6yWa3cbu5HZSC/YzN9oJKuW31KUxgZG
	/TYUYRizTPPYKSzbBDB608WCQafSZ+A9OdWCNTQLBu8DZAr7OLHEvFHBgQZnMhfHlV0z
	bFPDMd/1KFSHpAjlVlFy0GcpPIDzcXj+uBJD3vBRZY49750uCpXv19HG5GEaPK5wf1rA
	l+dfGMRFU0rcwYU9cE1sfsrSA8cZJ7URzIVI/WMn15b/KOXiaYl21ln8E0/q6JYo5SrH
	vn+w==
X-Gm-Message-State: ALyK8tLUTKtTXijurpRVdkR4/IAiECKlb10K5rJmbjuWWsyYbNpMbZnTKLowzmKNYfmUgQ==
X-Received: by 10.28.30.149 with SMTP id e143mr3186157wme.81.1465571562227;
	Fri, 10 Jun 2016 08:12:42 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.66])
	by smtp.gmail.com with ESMTPSA id
	d7sm36240332wmd.11.2016.06.10.08.12.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2016 08:12:41 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 16:12:39 +0100
Message-Id: <1465571559-21739-2-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1465571559-21739-1-git-send-email-git@andred.net>
References: <1465571559-21739-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/2] mips: add tunes for (some) 24K cores
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
X-List-Received-Date: Fri, 10 Jun 2016 15:12:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

- add 24kc big and little endian, which is based on mips32r2 w/o FPU
- add 24kec which is 24kc + DSP
- both can have the MIPS16e ASE enabled in their tunes

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/conf/machine/include/mips/tune-mips-24k.inc | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta/conf/machine/include/mips/tune-mips-24k.inc

diff --git a/meta/conf/machine/include/mips/tune-mips-24k.inc b/meta/conf/machine/include/mips/tune-mips-24k.inc
new file mode 100644
index 0000000..154ab56
--- /dev/null
+++ b/meta/conf/machine/include/mips/tune-mips-24k.inc
@@ -0,0 +1,45 @@
+DEFAULTTUNE ?= "mips32r2-24kc"
+
+MIPSPKGSFX_MIPS16E ??= ""
+
+require conf/machine/include/tune-mips32r2.inc
+require conf/machine/include/mips/feature-mips-mips16e.inc
+
+
+TUNEVALID[24kc] = "Enable MIPS 24Kc processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "24kc", " -mtune=24kc", "", d)}"
+TUNEVALID[24kec] = "Enable MIPS 24KEc processor optimizations, including DSP"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "24kec", " -mtune=24kec -mdsp", "", d)}"
+
+
+AVAILTUNES += "mips32r2-24kc   mips32r2-24kec   mips32r2-24kec-m16"
+AVAILTUNES += "mips32r2el-24kc mips32r2el-24kec mips32r2el-24kec-m16"
+
+# big endian: kc, kc+dsp=kec, kc+dsp+mips16e=kec-m16
+TUNE_FEATURES_tune-mips32r2-24kc = "${TUNE_FEATURES_tune-mips32r2-nf} 24kc"
+TUNE_FEATURES_tune-mips32r2-24kec = "${TUNE_FEATURES_tune-mips32r2-nf} 24kec"
+TUNE_FEATURES_tune-mips32r2-24kec-m16 = "${TUNE_FEATURES_tune-mips32r2-24kec} mips16e"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2-24kc = "mips32r2-24kc"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kc = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2-nf} mips32r2-24kc-nf"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2-24kec = "mips32r2-24kec"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kec = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kc} mips32r2-24kec-nf"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2-24kec-m16 = "mips32r2-24kec${MIPSPKGSFX_MIPS16E}"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kec-m16 = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kec} mips32r2-24kec-m16-nf"
+
+
+# little endian: kc, kc+dsp=kec, kc+dsp+mips16e=kec-m16
+TUNE_FEATURES_tune-mips32r2el-24kc = "${TUNE_FEATURES_tune-mips32r2el-nf} 24kc"
+TUNE_FEATURES_tune-mips32r2el-24kec = "${TUNE_FEATURES_tune-mips32r2el-nf} 24kec"
+TUNE_FEATURES_tune-mips32r2el-24kec-m16 = "${TUNE_FEATURES_tune-mips32r2el-24kec} mips16e"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2el-24kc = "mips32r2el-24kc"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kc = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-nf} mips32r2el-24kc-nf"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2el-24kec = "mips32r2el-24kec"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kec = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kc} mips32r2el-24kec-nf"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2el-24kec-m16 = "mips32r2el-24kec${MIPSPKGSFX_MIPS16E}"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kec-m16 = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kec} mips32r2el-24kec-m16-nf"
-- 
2.8.1


