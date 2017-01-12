Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6A89770016
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 12:57:59 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id c206so18337441wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 04:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VRrF5t0oTFWvec9mJCQzyNXe44NTZVWezl1oOwW1AnU=;
	b=l8N3cT86Vww54BxmbZ79XNi+uxWkLbyCRzmJMjeRAK2j0h31t4CXBYkkghUkOnCpfx
	yTGeOk+fmhPTPQ8t1xtLysVurAbWf/7n3iUAMuOIH4KNgHEuAuLf00gm0iGjE1DXtW2L
	oNfxoJd60srl0AXOxQMAwsdW5L8C1V7Wu3cHcIs+q+KiZk6wtSK4faMhctJ5+Bm6bL42
	z5SI/gGqiEb1j+xDbHD//hzT33OuRw30104+/6xcbo8TdDmNxZF4AcF2W76FKtXSCVI7
	mYRDKat1f4E6sWTsOFLmF65JqgQbjUcPTuj6qE+wvJGgH4xtERzsyeGa4lIKjttphaBc
	yYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VRrF5t0oTFWvec9mJCQzyNXe44NTZVWezl1oOwW1AnU=;
	b=YKVrdmweikhlQeyu1Facgh2MMfsDq4c7Fuw37faw180Jxk10Eac5W0V4H6yc7fKxVI
	iIlHYOpQ97KfaoyMD0eSxqoF+0XecqK1zXaDKTGrpEkV5V3VEd1Ik3AFu4lBTuWVDTkz
	tDZxMbRE2dWG3uHahz7S5KCSPDvXnStGplznrJd5zBC9Z/0qFITNXnYfByBcmJ8u5lfS
	AArSTfkkhjvcsj6U9NJPITvqZixtiz59//A+HeNYJKfv3kuXEjO4Cindnjoz+ZnrmE0s
	6ZsRe2YSBS5396dH495mbzs8whMGlOO/Sxc5fTv+w3+xjVpytj0F8pJkhlfY/Lx8OS6u
	FgpQ==
X-Gm-Message-State: AIkVDXI2uISDW9kAo3KImeLGqIPhieykhFSi9Cf/mEi3KG541LNbAVFRqim5XpCwitEgjZ3Q
X-Received: by 10.223.161.222 with SMTP id v30mr8228587wrv.80.1484225879028;
	Thu, 12 Jan 2017 04:57:59 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id y4sm13584936wjp.0.2017.01.12.04.57.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Jan 2017 04:57:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 12:57:53 +0000
Message-Id: <1484225873-23702-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1484225873-23702-1-git-send-email-ross.burton@intel.com>
References: <1484225873-23702-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] selftest/base: don't fetch DISTRO variable in constructor
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
X-List-Received-Date: Thu, 12 Jan 2017 12:57:59 -0000

Fetching the DISTRO variable in the base constructor means that we have to start
bitbake for every test case instance, which adds minutes to the startup time.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/base.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index b477db3..26c93f9 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -41,7 +41,6 @@ class oeSelfTest(unittest.TestCase):
             self.testinc_path, self.testinc_bblayers_path,
             self.machineinc_path, self.localconf_backup,
             self.local_bblayers_backup]
-        self.distro = get_bb_var('DISTRO')
         super(oeSelfTest, self).__init__(methodName)
 
     def setUp(self):
-- 
2.8.1


