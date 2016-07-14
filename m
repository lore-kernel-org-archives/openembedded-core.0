Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 74E6773169
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 16:39:45 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id i5so120327068wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ayCcv6iKKR6n0ICBxZiUAvdPwfnhBZDOtEWIdQDFHVw=;
	b=J+voSGqDH3b3ukEFbCY4ekXmVzD3/tUOJ+DmkYIQz2x0hlKUSw8yYrDTh+q+rY7VTc
	FaIAKpbZeVSkRRkHypsNt6tc65I6c2+JFpU9LEUgBHE7wXJKCX0zpzCR8DeKDntack/t
	dLTA6bKADcn7u9P0dk78CMEyakiLmO8aWvHtrxygDpSeUPuZEzqIqEbK5rYf7Z1RQG/N
	62/eunQpLYX9UkMWo2ITVb3DcsuQvtHgnkRI1JNGlakSjaogSwDavg9rTAKMLRkJ8Q86
	HAPAdOYAs3tooiEfMNzcQEFATMObkXayX5si3e6b5tLlJt/02d8x2cULIoHEcx1Ewi0d
	Ts2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ayCcv6iKKR6n0ICBxZiUAvdPwfnhBZDOtEWIdQDFHVw=;
	b=SbmxDuQ0h+ly9uN79HVCOmFNhUZ47XoX0QbjkvAPcDxjPXKoEfPQDh5MyrYG3NhJAz
	GGUQ0XU6Ae7R9r9Uu+yR1vB/Wh0774Y3ZxgSw2irU2i745s5J48TVuG85weoR/Oqdv+c
	RTNRT2zieybulaJNX6BYClJbz+voIKnTXn5bJPuDMdKQGlxEV6XbHXHoOKYnn88Qbb1y
	rvf8Z2Xn4LOddNy29tC1yQyUtv5wb4GjdNEbDNICAJ6LnqWIrlg2XhEEFBbG2rU4Zuq0
	vh5UmbWqsMKTj75bJtlicyAUh7eR5p3JJbpSaNeHrwefgMt9dqyXFC7al4HdsMwjdU33
	6Kcg==
X-Gm-Message-State: ALyK8tJzHJ1kG0/jimHPjwSSEc0FTD5f24ZLiWwtCipC2o83ta0oRSQGJw/PkqwmM8TjAnqd
X-Received: by 10.28.148.21 with SMTP id w21mr18391262wmd.9.1468514385567;
	Thu, 14 Jul 2016 09:39:45 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i66sm16903385wmg.9.2016.07.14.09.39.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jul 2016 09:39:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 17:39:40 +0100
Message-Id: <1468514381-6587-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] classes/license.bbclass: don't set [dirs] and [cleandirs]
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
X-List-Received-Date: Thu, 14 Jul 2016 16:39:47 -0000

There's no need to set these as the restore from sstate will create the
directories as required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/license.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c543637..26c297d 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -668,8 +668,6 @@ do_rootfs[recrdeptask] += "do_populate_lic"
 IMAGE_POSTPROCESS_COMMAND_prepend = "write_deploy_manifest; "
 do_image[recrdeptask] += "do_populate_lic"
 
-do_populate_lic_setscene[dirs] = "${LICSSTATEDIR}/${PN}"
-do_populate_lic_setscene[cleandirs] = "${LICSSTATEDIR}"
 python do_populate_lic_setscene () {
     sstate_setscene(d)
 }
-- 
2.8.1


