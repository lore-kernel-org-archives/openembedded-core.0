Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF197D3B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 17:04:44 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n25so9205413wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EjmoYxZ+wTxyXle8osBL7OiSUV4hk9m9cgGUo0w8nOs=;
	b=EH8dyPCwyFL4OEFFL/Y+5FIUlf+8cGYtycMfLUmW1gvkUiwVgzwOQ8NqKazNN40Ry+
	GVHRzqoL+VNDkIaKACIt2oUVcEaTSDmSSty9aVfNYfHCpi7AxMWMQyNJI8rE53kp+ybs
	Eszitbzv6vbGwmneX6y2cppVdPH/4DTtSShDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EjmoYxZ+wTxyXle8osBL7OiSUV4hk9m9cgGUo0w8nOs=;
	b=WLq19MF5ONP2VFbPni8MLA4JwQTZv7sF9v+WEtevnd3lHMxbBUPH4K+1vSditUn+QC
	MQYysmRre17whc2Y5P7Na7aEKHOvWFFWE9lRfgV8aNrR6frhlT9BJL8oGXaHA1xRYdrI
	69zpYzmvbupuT2+Rhhk2Ry68iipuUzCBF+AttIa1xGCvJr24SXGBOzC5lulo5/iBFR0g
	mgcOyhBrgffeZsNpM+yN6jwo16VQwiwIEJrQPsRKHrIaHKtNh1a1mdJAzMuR168+uCKA
	NlzYQhnXSpN1+k+UW0HTyzyPMcYlM5g7BJiWoEtY9lzD5817FF3gmOJ4R9cfJcrjW47I
	T95Q==
X-Gm-Message-State: APjAAAUoS5rjyePMbhoGt6ugSujK3WlYciOqQUx5FsIK7/5ByateK75h
	NItlvIvJj2KXCzxLqC1sFPZ8H+sk8lKosg==
X-Google-Smtp-Source: APXvYqxCRdV9fkTnRt6+xZPQLXl6xU3HF1jKTBB7DRV/E2nHhghmNarznEe/QlvZWMmyomMNyJRLIg==
X-Received: by 2002:a7b:cf2c:: with SMTP id m12mr805089wmg.21.1554311084862;
	Wed, 03 Apr 2019 10:04:44 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x18sm23048238wrw.14.2019.04.03.10.04.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 10:04:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 18:04:43 +0100
Message-Id: <20190403170443.10657-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] core-image-sato-sdk-ptest: Fix free space issues causing test failures
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
X-List-Received-Date: Wed, 03 Apr 2019 17:04:44 -0000
Content-Transfer-Encoding: 8bit

Some tests such as strace-ptest require more than the current 500MB of free
space. Increase the amount available, staying under the 4GB limit. We have more
flexibility now since we shrank kernel-devsrc and the comments are out of date
due to that.

This should improve the strace-ptest results and the util-linux ones since
those sort after strace and also hit the space issues as strace-ptest didn't
clean up after itself when failing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 7e3152b4a11..1027ec03be0 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -4,11 +4,12 @@ DESCRIPTION += "Also includes ptest packages."
 
 IMAGE_FEATURES += "ptest-pkgs"
 
-# This image is sufficiently large (~3GB) that it can't actually fit in a live
+# This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
 # image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
-# box) and explicitly add just 500MB.
+# box) and explicitly add just 1500MB.
+# strace-ptest in particular needs more than 500MB
 IMAGE_OVERHEAD_FACTOR = "1.0"
-IMAGE_ROOTFS_EXTRA_SPACE = "524288"
+IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
 
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
-- 
2.20.1


