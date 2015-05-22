Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id CA5CA70A7C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 12:54:05 +0000 (UTC)
Received: by wizk4 with SMTP id k4so46569927wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 05:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=M2EvDNZyKaYZH9LwYWPUMOMrRperg+CiJxBO6tfdqkQ=;
	b=SKuoWZBlnoMwRwHzkj2K72vUX3VGt078ylZvQC4jW1IogozVImbOWFJIjnisbTJXvb
	Ai3ZMufVBvZLQ2qWjhB9eTfXpyEEAOM9ijKU8mHBL0UstIviuaaeh8btP3RL/2ch1zd3
	8dHLTKvnBwQL0usPydUE7R7l0aRJuZ+tIgAetpgsElX3OWsZDQkdXiBupX+iD1v2mZN8
	FBiPkLe7zEGKV9s1O0VmKJ+ZWjW8YSUyZi+x9M516d04sLLnBISwkhWj+0KAVvaixsSv
	nimcsqGuNFRsq/fcONasveyZlpfITTImbV/HsfAM6+v+e427F/kujEUIlq4X9cyWcZw/
	CiDQ==
X-Gm-Message-State: ALoCoQnqJL74of6ETIXtxistb4XnUKe0sz0fkpniinZuSPOTiHg9kicECbxldG5BR+QNe8VNwpb9
X-Received: by 10.180.231.41 with SMTP id td9mr7347878wic.69.1432299245403;
	Fri, 22 May 2015 05:54:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id u9sm3057905wjx.15.2015.05.22.05.54.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 May 2015 05:54:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 13:49:41 +0100
Message-Id: <1432298981-23473-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1432298981-23473-1-git-send-email-ross.burton@intel.com>
References: <1432298981-23473-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 2/2] bitbake.conf: programatically generate COMBINED_FEATURES
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
X-List-Received-Date: Fri, 22 May 2015 12:54:06 -0000

Instead of hard-coding the set of features that can be considered in
COMBINED_FEATURES, simply generate the intersection of DISTRO_FEATURES and
MACHINE_FEATURES.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8653a7f..9c72044 100644
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
+COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
 COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
 
 SERIAL_CONSOLE ??= ""
-- 
2.1.4


