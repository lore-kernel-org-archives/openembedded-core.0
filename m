Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 022127D9D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 20:20:02 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l2so30089048wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PQsgv3DtIn9oMjW6TIC1Od6RlZya/N1keJO1HDlyc7s=;
	b=s0qi6cnaub+Lyj3niky5wzcxMZi0S6Os6qoSnm10XfLiAqk1Om8kENb9Vs2tFPS3s1
	SPv9j3kmmsi89p2lRSGGQXovfi3cnm6rcuK3gk9Hoci8kt9WrqiZJKTkJYzkadxqeWB1
	E9mDqyp2Wyg8gdEPhBWtzSXwBFT46fjzZPghm+DAwN4SRLKkRkC8duPer0azfweYAad9
	y82B2F+99KmB1DMSRZCDyr0ZYQdkMvbbasC0Bp/z3qiw6ZcPMRKWLeIORmu5FB746GZv
	TvpXsDv+V4KIN6J4nXl0kFVBENppCyw3BFc4QnBfP55Ywhmw948qVuInA/ngDz0+67xv
	ZovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PQsgv3DtIn9oMjW6TIC1Od6RlZya/N1keJO1HDlyc7s=;
	b=ofYtQb/kTmz7zXO/zqcewylUgVbf73htbwHTIlsYfabL8Y/WiCBmvZvrj9vJ6U/P8m
	tQGBF4MuiRRa/pyFWMoJZPPHQDdXBO3MmOuxqmZPff2lvQZon+Jcu3QvBw/WlJMZ5xC0
	5YS12ebElHf9HNS4JtxHeuiRUBL/qNm5WJV2YdBwxYFXWaCUnQB9hipL9BovOhO+DxNl
	NHvkh9R+znizGUgHPUjBc7McKCPnvGHCVf8AjQ5uwLpSqf/lYfy+yqDFQAcb29UGqTwM
	ACCQmb0DlwlqBc2NP0+Jxj44yqrX1NxhM/ltY9maUySF7kHvjJbHDGC/O3CJz7LUZXIW
	5vIA==
X-Gm-Message-State: APjAAAWwBDDNnw3Cla42Er9Qe+CxIWbsLAfa3tECUVG8pPwt5mYUHTWB
	G6/82TSSnz3syAHl7ouRgNd2Zf+GNbc=
X-Google-Smtp-Source: APXvYqxgABYkDIGcHAysBnDbZ/CNgP4IYWGcytCYcD5EDCJyoeFUVkjixz/MPbWLqJZMI0AEaqkD1A==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr50420134wml.169.1563567603186;
	Fri, 19 Jul 2019 13:20:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t13sm38854282wrr.0.2019.07.19.13.20.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 13:20:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 21:19:57 +0100
Message-Id: <20190719201958.19700-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] ffmpeg: don't use hardcoded lookup tables
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
X-List-Received-Date: Fri, 19 Jul 2019 20:20:03 -0000
Content-Transfer-Encoding: 8bit

ffmpeg can generate lookup tables at build time instead of runtime, but this is
no longer a recommended option.  The size impact is significant (12% of the
total libavcodec size, nearly 2MB), the runtime impact of dynamic tables isn't
too costly, and only a few codecs actually use the pre-generated tables (MP3,
notably).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
index 147388d9b7c..6d230c33169 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
@@ -106,7 +106,6 @@ EXTRA_OECONF = " \
     --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
     --extra-ldflags="${TARGET_LDFLAGS}" \
     --sysroot="${STAGING_DIR_TARGET}" \
-    --enable-hardcoded-tables \
     ${EXTRA_FFCONF} \
     --libdir=${libdir} \
     --shlibdir=${libdir} \
-- 
2.20.1


