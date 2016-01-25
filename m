Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC886FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 15:36:02 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id r129so69056950wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 07:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ohYPjqP0pnI5dv5VjtS9a+6gPJ7hIu8Mb8NvLCmQg9Q=;
	b=r5HaQ+s4LnwtenblbQaMHrXVdKZHm3UAa3xCp+nD0d4fE/ObXAjOyONAZWHSSXNHQ7
	D2OgNXCZagU6M8ooGMwBDvBHKxeHwx77mIjahctZKS5hWZm/1+2759wOEG4PlKX63F5I
	kZW0gGWTO50SjEodCavpGsIH9PtwRCypQTviQoBKbZTgkiEkVul8b5ptCMQRHSBBI3uR
	CyrNO9jBLK1W/w4GNumO7q87uD1oYhy+VDY6l/ADDar7ZrMY15b8dOT3APofWS0EAavH
	yS+JMYVNqiYikwRwaS4IyCMNPT9ujerLvWFZ9g6l64/IrH99WzTs6swz7M8v+43zYr0a
	+iXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ohYPjqP0pnI5dv5VjtS9a+6gPJ7hIu8Mb8NvLCmQg9Q=;
	b=lifGuZ1xsGTabXXqHTCQEId5LrJIuQCKBRs7r/0bnTwUp5GFz+3L1HI/zE6FjElTTT
	dFWUuPsAkntrZ3vfbqVGe8SG5HFEBo+6PdD35J54k+v14FxHlxFFZaYYIwrKbEziZW7U
	uWz7Nq7+YLt1GIgWbGowQh+37SRBHpb3MXN2v+jW3sFgsIBvx3pfAKndZxemWxRSR9y/
	CS1tJ/DO9BxFg1mHHMy3c2eiwrJoBLcR+86xDCTfTwt1C8TlIjZoCF2IsvOa0caqvtml
	JnFk8Zyai2b2Tghg4wfNxJgN33j/I0ovoBAcLcmrUyLtqE5Oz3Di/OEbCOXieUkTapxb
	GfjA==
X-Gm-Message-State: AG10YOQVlsp4ZtyLsSkZwZmnl9aYex+UPdTtD10drEOaZYdhb8BHVIlaTL0xGyQaqATNpYT7
X-Received: by 10.194.158.73 with SMTP id ws9mr20788451wjb.40.1453736162262;
	Mon, 25 Jan 2016 07:36:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w23sm16774624wmd.1.2016.01.25.07.36.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 07:36:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 15:35:55 +0000
Message-Id: <1453736157-21837-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH 1/3] scripts/wipe-sysroot: also delete uninative sysroot
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
X-List-Received-Date: Mon, 25 Jan 2016 15:36:03 -0000

The uninative sysroot is in ${STAGING_DIR}-uninative so delete that alongwith
$STAGING_DIR.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/wipe-sysroot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/wipe-sysroot b/scripts/wipe-sysroot
index c22d39a..9e067e8 100755
--- a/scripts/wipe-sysroot
+++ b/scripts/wipe-sysroot
@@ -42,7 +42,7 @@ fi
 echo "Deleting the sysroots in $STAGING_DIR, and selected stamps in $SSTATE_MANIFESTS and $STAMPS_DIR."
 
 # The sysroots themselves
-rm -rf $STAGING_DIR
+rm -rf $STAGING_DIR ${STAGING_DIR}-uninative
 
 # The stamps that said the sysroot was populated
 rm -rf $STAMPS_DIR/*/*/*.do_populate_sysroot.*
-- 
2.6.4


