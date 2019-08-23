Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8EEEE7F39C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:52:48 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id s11so1299480pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ktsbb1gJtu+8fsh5GbVAQTvLFRCVjYFJL11RVY8VGqE=;
	b=aT3leS4EvbcS7mjyniOyENCceObEbdCMMvl3PAMNmPxhPcwqatdTZhz8HftchRZaU7
	agJ9WtlRGdc+xrt/ltqHwvG0aJRDWYoFF62t45Qj9RO6xwooeV833pZ+C6KtIr8yy84M
	Lr5EzmYqZZo9F50jP5XuETLuGZImMv7BMUKT4/tnV6bl7AinrP1GT+kODtshBi4pnO9V
	EMGhFnwHkegNkG/dmlQo7ZgbWWV7m2n44RlxvTsLT3bNp3Azb1rLbaW3tb0yRP/r67OP
	xus8PpjgOScHWa+mPJB+CsMMbmDVZl/KBykO7NMUAykEBfQvzs2HHVezdkUeFsV6xI1U
	LaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ktsbb1gJtu+8fsh5GbVAQTvLFRCVjYFJL11RVY8VGqE=;
	b=QNf3Ra088Ml9D/YLqPVPQY10/LRVHZYMS42GeWJO9844iTMPMdiR2D89Jd1cnA4dzh
	wUSUYHxcMlGM29qMWgz1CT81dSEzQ05dOOLnI2EoIqIDQJwTE5rgpyEAyliJLIjhca8M
	VpoDUeiPf6ky7rBP1niHAJ0ucAVRdT/iBm1lWzbhlGfbc33cjS7fcxITDqCbqPXYGZho
	1TUUNR8TIoONHgS+AVzYKcY20I3MrjclWqzDz6TagoXbpLTLRwkpsVWt10+s8mG1cYZD
	WGtcOJ3g/BAfftuNAouzRoaMg0DOg7EdPSup60uzOknojuuzhvMw48jVBFb783sBqKTl
	6XlA==
X-Gm-Message-State: APjAAAUqVUbMJuoAhXQTXYEFurFChpCJr7to0upBpY6Qf52O25P/FNUP
	bvaEhZtODbu8hZ5pJELZUeIpuUXa
X-Google-Smtp-Source: APXvYqylN3At49Zgtv85fGsQ6h8Odqz0RwuXoXHRmJTC41JU3ZrWd2WEQChKs+1PxGRKh+y9eZrSnA==
X-Received: by 2002:a62:f20a:: with SMTP id m10mr7328409pfh.95.1566593569560; 
	Fri, 23 Aug 2019 13:52:49 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.52.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:52:49 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:36 -0700
Message-Id: <1566593504-21918-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 05/13] feature-arm-thumb.inc: fix ARM_THUMB_SUFFIX
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
X-List-Received-Date: Fri, 23 Aug 2019 20:52:48 -0000

Since TUNE_FEATURES now either contains a CPU or an architecture (but
not both) we can't rely on finding the architecture in TUNE_FEATURES.
Use architecture specific over-rides instead.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 0b47cca..bae169d 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -1,8 +1,6 @@
 
 TUNEVALID[thumb] = "Support Thumb instructions"
 
-ARM_THUMB_SUFFIX = "${@bb.utils.contains_any('TUNE_FEATURES', 'armv4 armv5 armv6', 't', 't2', d)}"
-
 # If the device supports ARM, then respect ARM_THUMB_OPT (which can be "arm" or "thumb")
 # If the device doesn't support ARM, then always set "thumb" even when
 # some recipe explicitly sets ARM_INSTRUCTION_SET to "arm"
@@ -23,6 +21,11 @@ python () {
 
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
 
+ARM_THUMB_SUFFIX = "t2"
+ARM_THUMB_SUFFIX_armv4 = "t"
+ARM_THUMB_SUFFIX_armv5 = "t"
+ARM_THUMB_SUFFIX_armv6 = "t"
+
 # Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
 ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT') == 'thumb' else ''}"
 
-- 
1.9.1


