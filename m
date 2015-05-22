Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id EE35D6B0CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 11:42:47 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so38031937wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 04:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=09SkjLInEkOqHe+SJ9Vx+cZFU+J3b4ZGjOpdX8qGT1k=;
	b=JTb4tMlZrskl0WJUuldUoPKue59T1Nfbrt37wEBe2NrQ663K/8YQAp2cKqq08sW4z4
	zrfzfSfo63bjFf/c9EyEs9qETf8ci1XwPwPaXFMol5wM6MhaWcD3NoEMn7wt8oS+yw8n
	7/E+scy3WGaWYJ70qu7yI8RQ00StZ2cBxJTjnsuLX4IV1PV7MRAVao3+2gVJsBt9/S7s
	2ywqdafNbH1XjdMcEz99bbdcIR+OdhV29HkosjXdIU+YsO3tDYcWc5kSHdXbyIl/lp4C
	gz72xg2U0NORMhSYrQZnXMgI7fedn50fjcTeXhqbKnvATLDGHGyO7oBljdq6NH32ufJl
	AnHQ==
X-Gm-Message-State: ALoCoQmFN67xigEyqUM2DctfAh9mD/pMxC7+M/ATQrDp6MFtTWlzqsQXAtq+jbl9t+RPmZ3W6OVI
X-Received: by 10.194.133.102 with SMTP id pb6mr13975045wjb.97.1432294968388; 
	Fri, 22 May 2015 04:42:48 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id d14sm2776985wjn.30.2015.05.22.04.42.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 May 2015 04:42:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 12:38:26 +0100
Message-Id: <1432294706-18789-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1432294706-18789-1-git-send-email-ross.burton@intel.com>
References: <1432294706-18789-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] bitbake.conf: programatically generate COMBINED_FEATURES
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
X-List-Received-Date: Fri, 22 May 2015 11:42:49 -0000

Instead of hard-coding the set of features that can be considered in
COMBINED_FEATURES, simply generate the union of DISTRO_FEATURES and
MACHINE_FEATURES.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8653a7f..88b004f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -735,17 +735,7 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5"
 MACHINE_FEATURES_BACKFILL = "rtc"
 
-COMBINED_FEATURES = "\
-    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "alsa", d)} \
-    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "bluetooth", d)} \
-    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "ext2", d)} \
-    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "vfat", d)} \
-    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "irda", d)} \
-    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "pcmcia", d)} \
-    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "pci", d)} \
-    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbgadget", d)} \
-    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbhost", d)} \
-    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "wifi", d)}"
+COMBINED_FEATURES = "${@oe.utils.set_union('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
 COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
 
 SERIAL_CONSOLE ??= ""
-- 
2.1.4


