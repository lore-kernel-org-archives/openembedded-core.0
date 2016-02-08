Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id E5E7A601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 15:15:57 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 128so159281551wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 07:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=rGl0r9asRkrYiqenoXpcfErghFW8YSX9YtM0jZGJ61Q=;
	b=Y6gCO3PnKbw3uJA3HQG1fR2CedKFKbJeBExEIgo9QkTGT06/cqNYk+IMai83+6JRyZ
	YU5QStzhNS2dK2xTCZT8c0vi9xpiEVlGZFkoSPOjB2KGyl/sxkxHdan1eCnP7uKPJoNK
	0Fq9K/jzVOt8ANxsjyYVXBxxXILbvBXRMh+mKSpd66J8LU6TRcP2QGgLpH5oininC2Ex
	D1o15PsYvVlCvZkIodyVEx+UBP1ncWK+uQFTwAhDcfj7lS9Gx5m/aJLgyD+/x1+oNjCA
	pyEnrwUBsOCMPr15eyZei6xsm0+mOTZtRUpn5zdKoGKONNiLB3HyYofPTDgLm6aWGvaF
	MIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rGl0r9asRkrYiqenoXpcfErghFW8YSX9YtM0jZGJ61Q=;
	b=TvYSs0r4Xik5NUOt9E3E5XLmFBYImU0f1aTL3XiAsm7KWfzrYIBLfhWxyyQmWIT0wy
	RM5KJXZqkLO0AXHLbCLaE9WZ2nqbi7iIVyRBqbt0m9ceU4XfPae/RNhWqRF8b1aLWBab
	yAQ6pwz1RPOeSCohJ5PtQvwKDjg48B72MfK/KqV7OfylWEFxG0BF2U1efPK4F64b+wqw
	XPfmX3XUtbOPKH7T+Xqh9wO6EuTUJ4GmC3SYghHbzj6NYPj1RhPtO8BWdFHEuFrS/Pgk
	mnyTZaSLOaqmpYk9feM68MyQDjA3s7ZtQrJbUdvd+5C1xZk9pWovPF/fgjQN1cSPfoAs
	VOjg==
X-Gm-Message-State: AG10YORjFTAzZaF2cmYIFjRrwWL4PgFr2AMs2T7j1IbV3JLgHP4cUTKybO5CVeRb+VF5ieu+
X-Received: by 10.28.153.19 with SMTP id b19mr33354828wme.14.1454944558240;
	Mon, 08 Feb 2016 07:15:58 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	cb2sm30234758wjc.16.2016.02.08.07.15.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 07:15:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 15:15:53 +0000
Message-Id: <1454944553-30388-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] hdparm: ensure EXTRA_OEMAKE passes -e
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
X-List-Received-Date: Mon, 08 Feb 2016 15:15:58 -0000

Upcoming changes in oe-core means that EXTRA_OEMAKE will stop passing -e, but we
need that to be passed to override the STRIP variable.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/hdparm/hdparm_9.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.48.bb b/meta/recipes-extended/hdparm/hdparm_9.48.bb
index 8267fd9..a47309d 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.48.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.48.bb
@@ -21,7 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz "
 SRC_URI[md5sum] = "213efdbe7471fad3408198918e164354"
 SRC_URI[sha256sum] = "ce97b4a71cb04146f54cf6f69787e7f97ddfda9836dc803b459d3b3df3a4fbee"
 
-EXTRA_OEMAKE += 'STRIP="echo"'
+EXTRA_OEMAKE += '-e STRIP="echo"'
 
 inherit update-alternatives
 
-- 
2.7.0


