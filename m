Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id EA0C260249
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 15:50:33 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id u188so65020486wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 07:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/6PQ1qJDmJl90b0FR9ixvazxF0ISoh8ze3p/ktWb2Cs=;
	b=2T1/UCPPH2Twpr/hrbeP7duTZymjz3XoKqvOOYWuMsk+7krjhQ0zrmUwjBb0AxKFfI
	/dB8Ud0e9OxBI+4bOFyvtBhDloQIyg147aM7Gk3XOuHkKluQFVMVC1irK3tScDloC0r4
	E/HNWUyJ+1uMR+CkEpALsC8x0tKSjv0YgqvkyGd1GsXMkwaLQjiBui11EGyz8L30Tlao
	Yg88pPt/HI7wVoIML18c3un+rpBWD8jV0ccHRdIlh0N0oNURhuzA1ih9ELnmnsJMQEj8
	iCdz1S3eYGfEhYIL3eQrUt2Gyble9ME5Lf9SHek06trIuclFpiUFTv7ZjVDOuEzYt9XQ
	sVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/6PQ1qJDmJl90b0FR9ixvazxF0ISoh8ze3p/ktWb2Cs=;
	b=OwbFaloFU/rHMIp5T46eCSSSK1CqFm0l6Kfg+yKvgdThw/5sE249L+UAhkj62c1PpK
	Dinmmvn75NU/DIMrMUlgESrQJxXimDqMiWQGSx7lcE+3faLC6LqPoyI/qBLomYSdcZY8
	EwLlQ8r48KhERFqmPSLV83Va74TLy5qyq1WRdTdJMklmbhZ7mzQvsoLbe/G8U3YY6Ubd
	2InZ21z7tZ7r+dHga4d9ddJdFhv8pmHuCK0SgASu/j2nfG1pKMY/Wuzfm/CKvV35dBpA
	x4mAe4Mn/jF2kX7gwHEtMCIprnDrNv454YYnEv4bm1TW8ncJm0Ba3OfWcyTvurQSy2Is
	80Gg==
X-Gm-Message-State: ALoCoQnZF22bGNVMlPCxN26qXb+D4rabNl2SJ6TKskuDSxcWRW6Me54yST9RUV6luobgcMu2z1Eh4X+58dCGNk3cALxaYozgyg==
X-Received: by 10.28.55.76 with SMTP id e73mr11484683wma.53.1452095434017;
	Wed, 06 Jan 2016 07:50:34 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id y8sm9303314wmg.9.2016.01.06.07.50.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jan 2016 07:50:33 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 15:50:31 +0000
Message-Id: <1452095431-16168-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] postinst-intercepts: always use set -e
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
X-List-Received-Date: Wed, 06 Jan 2016 15:50:35 -0000

If a postinst has a problem (say, qemu crashes) and set -e isn't in operation,
the only mention of the problem is a single line in the rootfs log that doesn't
trigger any warnings.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/postinst-intercepts/update_font_cache   | 2 ++
 scripts/postinst-intercepts/update_pixbuf_cache | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index 0deab3c..d8b70ee 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -1,5 +1,7 @@
 #!/bin/sh
 
+set -e
+
 PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} \
 					-E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D ${fontconfigcacheparams}
 chown -R root:root $D${fontconfigcachedir}
diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
index a8b4001..5d44075 100644
--- a/scripts/postinst-intercepts/update_pixbuf_cache
+++ b/scripts/postinst-intercepts/update_pixbuf_cache
@@ -1,5 +1,7 @@
 #!/bin/sh
 
+set -e
+
 export GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
 export GDK_PIXBUF_FATAL_LOADER=1
 
-- 
2.6.4


