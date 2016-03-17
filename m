Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8011A6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 22:10:30 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l68so13120490wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 15:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+tfq2sTLVbyntOGc0ceWKwaff3cEf3at5dk08m4zA8A=;
	b=fKcgidFKavWkpM9irlxG3nkpyZTLX6ru7+pXZH3Vwz8QdW5CtGMrFSR21f9Xcit2V7
	hemF7NLgs80q14VoUPx4nw95J2bl10BB2NRgLZKl21gpPuhxMB9InUE94d1iXsEc8Ssw
	XCSkPnTlSVeYTehou67RXoATz3VgjzbFq51TRaBrXOKN7y9OGKd9jYT+9axqgBF8/9Xb
	vLKDohKHt11awGlQJSPhbV7QM47ef7/REU6AU/w21kuflZfghI0xKYOapEWxnbl6wkqi
	FpnNIfwpdtjf1r0PHBWPDyQ7z9drustyhn4r89vhOBdl5PAFACxRohuZu6beJZZPrmue
	fDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+tfq2sTLVbyntOGc0ceWKwaff3cEf3at5dk08m4zA8A=;
	b=JtU90USI8srM462kZcGgnWNBuo1dEUbdXhlzyh8VQuuyYVLrhLZmDPmYgny/ENQzBQ
	KqrwL7LAtHfujAt7idMITIPBfh+EhTakY5fcUwo6E22Hv5XeYv66Za+N/iIW4sAYZFfM
	ZnbPrz+n/hPSQVRhlmq/55b8x5/yYbjcONmMlDI8e5Md/8EMkwKlHMRZ96/NDg5B0BZJ
	yccw8E0LXizsRyYzsIrhQ6/UDb0ScCnTLJEhXg0zDs1hnvlX5HFmEF6ePHiWBmvs9o0U
	2msxt+liDAUrw3M8hxgcaSkxCsLBrfnsyqfilgr7Mwjjwvsp1ClX48o6QCxIblXTpUUq
	4WDQ==
X-Gm-Message-State: AD7BkJL1UYPaKe9vWkYJHrJbftEUJrS4nCeF/Yr1J5RRLkl16BRowjCdCKBb9tUZLbH+9SHu
X-Received: by 10.28.111.92 with SMTP id k89mr40195331wmc.36.1458252631439;
	Thu, 17 Mar 2016 15:10:31 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	bg1sm9536037wjc.27.2016.03.17.15.10.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 15:10:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 22:10:28 +0000
Message-Id: <1458252628-29590-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] oeqa/selftest/buildoptions: test read-only-rootfs
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
X-List-Received-Date: Thu, 17 Mar 2016 22:10:31 -0000

Add a test to build core-image-sato with read-only-rootfs enabled.

[ YOCTO #9214 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 491ce50..2fc77e1 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -57,6 +57,10 @@ class ImageOptionsTests(oeSelfTest):
         res = runCmd("grep ccache %s" % (os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile")), ignore_status=True)
         self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile"))
 
+    def test_read_only_image(self):
+        self.write_config('IMAGE_FEATURES += "read-only-rootfs"')
+        bitbake("core-image-sato")
+        # do_image will fail if there are any pending postinsts
 
 class DiskMonTest(oeSelfTest):
 
-- 
2.7.0


