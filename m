Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id DF25265D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 09:24:50 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id w64so56413139wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 02:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vu9xesWYfo1BMcdVOYhDUwA6fVd0oQrC/0ZLMQzJbfI=;
	b=1Y+kHkxj8Edj1XpZMEXaSi0tgasYGkdZWuQ0VzgniiM2H9v0Jnt3FolyWSy+IM3JXR
	ZO3DEt/M32DlHPkF7P0DKQlzbVRj0CNfQTL4Mse6mk8VhCEtklyDeMJBzPMYeYTdAbhY
	OpgG77+7FtcGOkN55R0Q2AOgt7QwaHG3YM/Ieorx58pjNY6T6/TTFSnQP6hC3hPQJftD
	eEaTyeNV+vxG4HAnQ2L81BYDgNWXcPL9V4JdqOsnGSg863T2AdZDZZll8COb9opp0Hks
	w75rj6Dxuo42DPB3JTQN78bZucczDV5fixmOX4RgzGjCyC4hPylUT9j4qI2MDCBoVhYZ
	DeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vu9xesWYfo1BMcdVOYhDUwA6fVd0oQrC/0ZLMQzJbfI=;
	b=KbvzkASMBz9tshwkS/abVGdkizUjiFbn9wRUKab7fR2iDaZmeR4SO+0XbeLw4RH8Yy
	1JfOFuc06T0UKJmLsx13Tj/zXxJF67Df0B9DoykZWwSWa5p0wwtZOIZWEvd3NEEb6F3Q
	aW95eFNL0ybJ+Ir/B+OWXSK6+4EdtLvWcVa6ybc+lKD0Yj1mHQIrJa3GiXOJuDnoFElV
	KvU9Mp7ouJWNByHJpWFesZxPniJXnq6UBY2uiacsIsRBPvSe7LkFbtMUodPbxIMyK4xI
	8tQdVkgOoNBVbtCEmm/9oOh9dLCKYNbUn0Gl3LWAD1k8u0IgMAegOGMCZIev/sCllxpO
	oLnQ==
X-Gm-Message-State: AN3rC/6YmSnvze/LPo5+B+LIwyj/E4b7ybz1mYZokVPF2t9LpU6dOS6A
	IxpQTdK0q4virvqDt28=
X-Received: by 10.28.4.142 with SMTP id 136mr9195917wme.89.1493025891558;
	Mon, 24 Apr 2017 02:24:51 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	33sm21752272wrd.40.2017.04.24.02.24.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Apr 2017 02:24:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Apr 2017 10:24:49 +0100
Message-Id: <1493025889-8761-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] selftest/bbtests: improve download rename test
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
X-List-Received-Date: Mon, 24 Apr 2017 09:24:51 -0000

This test was assuming the format of SRC_URI so broke when SRC_URI was changed.
Fix the test by hardcoding a complete SRC_URI instead of appending and hoping
for the best.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index d073433..46e09f5 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -151,15 +151,16 @@ doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result
 
     @testcase(171)
     def test_rename_downloaded_file(self):
+        # TODO unique dldir instead of using cleanall
+        # TODO: need to set sstatedir?
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
 
-        data = 'SRC_URI_append = ";downloadfilename=test-aspell.tar.gz"'
+        data = 'SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz;downloadfilename=test-aspell.tar.gz"'
         self.write_recipeinc('aspell', data)
-        bitbake('-ccleanall aspell')
-        result = bitbake('-c fetch aspell', ignore_status=True)
+        result = bitbake('-f -c fetch aspell', ignore_status=True)
         self.delete_recipeinc('aspell')
         self.assertEqual(result.status, 0, msg = "Couldn't fetch aspell. %s" % result.output)
         dl_dir = get_bb_var("DL_DIR")
-- 
2.8.1


