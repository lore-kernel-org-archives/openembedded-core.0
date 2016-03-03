Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3304E731F3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 12:34:35 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p65so29677096wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 04:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gTeET2/jw5LvI0kSdqtMMU9ZRm9dKKLhrj7eXdI/flY=;
	b=UWRuteqPmG0ZLX/0l9xhgx0aFqdclOsI7IK8X1ZZkKVLgIs7xruRRNjrb1VTt04TUr
	ztb6sdYCFd9CGzcVB8OCP71Q5xpJdMoLXOOeTgvpCCV1ZsjEB3Yl72VJ19Xe9q6/lvQP
	vfwgymavKzAi6cyPtfeSiw4xtBKwm+iuSRDJ0mupJrarGF8FLrTke11JPqQ9l4yoo3ss
	v9JPPKGsjlZgXsNPM9SEcH9n6Hf+NVq4zWuRYSWSVWegLiC0dyd/DkSXDZ3B8ze7kM3G
	hFn2uWiJxOvxC3uSQqBt3TuIy94FqSSpmZLvJJRUEsqETHR4PEVWFZtRrvS2ueaHbXlG
	MTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gTeET2/jw5LvI0kSdqtMMU9ZRm9dKKLhrj7eXdI/flY=;
	b=YuXrkYbqMxHEnaN2OwpirWBlmdfG6NLbMrI/jNbUmhbxkiFGoXKiMxQGx8CPmRnae9
	wqxQCTyhq1vSQkYMOaPATHi3tgTU7e118zZSRa5NnIN8VvXEQXYIwp7j+WjOUL9n4sgZ
	XQLxcSYYbq5ZVHnfyxFYYsjrKNHvjRCt2+VDtQGlIkM2raFpMJPNLFmevSMp1ahKax3E
	2A1+ZQJGeqT3Z+Iio02KNlgobgU0SB2fL9sTa8GqYF6P0wdQvJgx0sD9Zgn2XyH1ENy0
	sAZN01xejz0bHKm7vzUuwqQXoNuYppzWCOGuVMZM9pUXFGVU9WEUQ7vFZv8j26MiBU1w
	FBxg==
X-Gm-Message-State: AD7BkJJkHrV1eFma+wlQJVW2dKI98pAFGJ5rgPWjjUfj5n9iFcepMa58EKU0WiOIhC4p9i6w
X-Received: by 10.28.17.198 with SMTP id 189mr5617955wmr.47.1457008476274;
	Thu, 03 Mar 2016 04:34:36 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	da6sm31008734wjb.24.2016.03.03.04.34.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 04:34:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 12:34:33 +0000
Message-Id: <1457008473-5085-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] uninative: default to downloading the tarball to DL_DIR
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
X-List-Received-Date: Thu, 03 Mar 2016 12:34:37 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 9a57170..471c9ae 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -5,7 +5,7 @@ UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
 # Example checksums
 #UNINATIVE_CHECKSUM[i586] = "dead"
 #UNINATIVE_CHECKSUM[x86_64] = "dead"
-UNINATIVE_DLDIR ?= "${COREBASE}"
+UNINATIVE_DLDIR ?= "${DL_DIR}"
 
 addhandler uninative_eventhandler
 uninative_eventhandler[eventmask] = "bb.event.BuildStarted"
-- 
2.7.0


