Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 281A0602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:02:31 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id h129so379385ita.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=25cejAF7mD2zPKRmI8+t0MOzhzNw8SU3hObKTtyQg1E=;
	b=jfuxW6CgTeKdStq5MW7s+eNxmAA7YFSVtuso0SanoZzrqEhtkD/G7Wu8S/cDA5sBNy
	8Qj2T58kulud8hX6oKJ1+hKlwVHgf/NX+2Q4MnZgnIlp/WMfAypLxEQRKHwdMT8dh29j
	AUVNiwTg/8fpC+JbezCMrBp2/NDtuFpegPI2xplEzClkoMek+CfmjtT4AvltIfVKCO1K
	35UD3pxzKmG4LU7kqm3yBt4zEdK7YNgmMG5MSy5Ygkxo9Y/9oiSZ8TCfbkv7NOcv56bB
	uZPEfeYQ5ePVgZkzFp1vbxcYPJH2Cks6KimU1RE3GH9Uoor1G58tMzfWYiTErDIptJgL
	87KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=25cejAF7mD2zPKRmI8+t0MOzhzNw8SU3hObKTtyQg1E=;
	b=eSslz38xWlEFIQwzial15xlG3lbk2hRLPjtrTCozRpODqMR4si5XaCFrXZOslFMfFu
	9gM5BlwdJcsQzQL7maWKvtTiqx53nq36b03LKZWjR2A5iurn51Be1yWUcYMkefwjNPZM
	mzDw3XsT9gb42ccmd7eoHzg5wulb/WGBkZ1f1bIX85VrudAXn/GYcWni0+/I2pXgkw+T
	uuGu/rGapi1/18eCe4R0clkabk/qwTFTh7k948EuWboGpvILkhjhBDQdAzguK250dbeo
	KtRZxrd7p/C9aGW2NV2+KunPpHMvvkl2RtGtSr3mjU/zTcQ2SUg17PWDIuEco6SCdTg4
	SpQA==
X-Gm-Message-State: AKwxyteuiNgHGiAh2WnWWfV1jTuM1Bjc4F5Tvm3sBf9P0sTFLWTtu2J8
	X5iFBAgo2XRNvLVR+nu76Q6q+0f7
X-Google-Smtp-Source: AH8x224S9bu/+MFFJ/VA5sj7qCAKwnS0mSNSPeYjeOmWclsNOLCJQzFsGndbzuNOf+2834Nlwnp4Lg==
X-Received: by 10.36.6.139 with SMTP id 133mr34647997itv.92.1517418153105;
	Wed, 31 Jan 2018 09:02:33 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g1sm94579itg.10.2018.01.31.09.02.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Jan 2018 09:02:32 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jan 2018 11:02:30 -0600
Message-Id: <20180131170230.7183-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Cc: stefan.agner@toradex.com, jslater@windriver.com
Subject: [PATCH] waf.bbclass: cd to ${S} before checking version
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
X-List-Received-Date: Wed, 31 Jan 2018 17:02:32 -0000

waf requires that the current working directory be the project root (in
this case ${S} when it is invoked. The check to get the waf version was
being executed as a prefunc for do_configure, which meant it was
executed before the current working directory was switched to ${S}, and
thus would fail with some recipes. Fix this by changing to ${S} before
executing "waf --version"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/waf.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index c3e744e5de..f72ddb7814 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -29,7 +29,8 @@ python waf_preconfigure() {
     from distutils.version import StrictVersion
     srcsubdir = d.getVar('S')
     wafbin = os.path.join(srcsubdir, 'waf')
-    status, result = oe.utils.getstatusoutput(wafbin + " --version")
+    cmd = "cd '%s'; %s --version" % (srcsubdir, wafbin)
+    status, result = oe.utils.getstatusoutput(cmd)
     if status != 0:
         bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % status)
         return
-- 
2.14.3


