Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7F86059F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 13:21:18 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id b130so148490214wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=rNuE2myrFX2OLyTZ5XDspohQ1NgdLeQqv5g7wIV7ZG8=;
	b=tNpvgvmI/cX6ZJ+BFCeyqjOhjKrLl3f4RFFoOibDdqD9X3t4QjePgNtaipfDN5fdQ/
	vU0+wCOKLaEdpr11TmM+l7GGs5xk7xwr6kmii+aZeURgP5KDduWQ/hnltSddrDpud8PQ
	SzDsxHe64MrVROKbLTmJlewizQzMBL69hEe5aFKWXt0roXsOIDUPM8R0smPUAZ05HJkr
	QX/y+jJ7w71PzaU7ePLAsnGdvahOohy5qrWF/5DW8peoOrgp9jAesb1tPT5vU8mxywQ1
	UvXCd8ZUm6NPhY+hltWPu/PaH6D4aBf5ddYShLr0z3i3Omn8f94oiOCHC3YNTFjkbXG2
	Svng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rNuE2myrFX2OLyTZ5XDspohQ1NgdLeQqv5g7wIV7ZG8=;
	b=KWZ2Yju4YesSdjVWIPnqztWbGBlcy9ogsQp82OP8ykFZKK3kjxiliz+FZ0iaHoblzZ
	bFnFi3bV5HVH2oVaO+4K4SYn4fK7OAj5dyV/A6i2DeEE/RLWpYNqWzzuJ3nGa9e7akpa
	tAx6nt/O96NwU4I9VNAwYIICp59TsGoAA0rALfW4t3PS/G112Q7CieWduUxY9626SVQA
	4ZpjNk+5AlMuefu4B5qixGR3+Ma+OsBqcLJWAt+HouF1+yWoZIAD+Z1b5ueZg473tYtA
	ajxBCSTv7Mw+q55kWIx/rly7C9xY+Bi1NALhAD5CGagKZS90mwzNpREV7neARlagEORY
	Y7VA==
X-Gm-Message-State: AE9vXwNNGUTuS9POEQ1BAtOei0y7mPRLJmyvG08+MBCB6vi17GN0z9w5l8PoTdkoQeZlu44j
X-Received: by 10.28.141.133 with SMTP id p127mr8520896wmd.119.1474550478883; 
	Thu, 22 Sep 2016 06:21:18 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f10sm2113616wje.14.2016.09.22.06.21.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Sep 2016 06:21:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2016 14:21:14 +0100
Message-Id: <1474550474-10525-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] bitbake.conf: add a lazy default for SDKMACHINE
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
X-List-Received-Date: Thu, 22 Sep 2016 13:21:19 -0000

If the user doesn't set SDKMACHINE in their local.conf then uninative and
buildtools will fail in obscure ways, so ensure that a default value is set.

Also as SDK_ARCH will be overritten then loading the machine-sdk configuration
file, don't bother assigning it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b6a1a68..359f787 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -129,7 +129,7 @@ TARGET_CC_ARCH = "${TUNE_CCARGS}"
 TARGET_LD_ARCH = "${TUNE_LDARGS}"
 TARGET_AS_ARCH = "${TUNE_ASARGS}"
 
-SDK_ARCH = "${BUILD_ARCH}"
+SDKMACHINE ??= "x86_64"
 SDK_OS = "${BUILD_OS}"
 SDK_VENDOR = "-oesdk"
 SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS', True), ''][d.getVar('SDK_OS', True) == ('' or 'custom')]}"
-- 
2.8.1


