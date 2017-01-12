Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id CA65D70016
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 12:57:58 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id r126so17025305wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 04:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/gfoUn2UcLpkClO4uV+WfZ4mBRtflIYFuAfJDDlxdY4=;
	b=QqkcNfIS4jytBYdrBYlT1tCLd9zF7eAX++c7COIJ/QhaDibnqczGOT6RVMbcT0Mhdk
	LNZZT0aWPdNUFdKZBT/yv3uf/fh6qBvIw4nzlhraUEkuU1XbZ7GQjPLNxHQFhSwbSgH8
	6tW114pbvBksk6WmDFehkX7rCffxPnN+Ppd/zUt77y1Au81+qOM/bPJv57zVTaITTZLh
	oforcs+juR57utDo7VDDLAyltlXoKQPK676tjsDrDTADY6dMIuM5uT/OGNBzuBiac3oM
	3y/B80s3YCXD2E3zotTEr659udhzBzq2kvhqccJvQk2QETG84z4ZfqhnR6+phjJNqrMS
	rB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/gfoUn2UcLpkClO4uV+WfZ4mBRtflIYFuAfJDDlxdY4=;
	b=tZbjYKs3RGemECfNfikS5iDuS8rdm++KhyvagPFxjErwcTE+JGVW+x19E1lQWnuxxQ
	UO9t4lFrm9bUCXVTk93g1o2YF086C2JjVHN6bttahLQyMJgq7cNFzIUB/Wzurp8jT4Sm
	MHvF39EdVMNZqQU18C+jiItFNrmuDSbtI0epdEmu2ms9e7CLpGDwWnytzWPhcgFpxbmc
	xRohnL3Ml8Ci9Xu4ujSBOSOb41KPCVicExebRXQNv9VVbWxSKvsvnYJ8Vm1oIkibk7ix
	bTm1aRsVagQSqXLIPyAAavWR45/tNpG1oNmoHvQ1RgT2kHamfblIECQEYFp2qDAEVyw4
	HXAg==
X-Gm-Message-State: AIkVDXK3pqdWtskzauVJMp8Om7YVSoNnJLyIj+FZ3c/fmjHEWUSlZ2kkcrs6vAjwite0YB4J
X-Received: by 10.28.98.130 with SMTP id w124mr8738692wmb.125.1484225878272;
	Thu, 12 Jan 2017 04:57:58 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id y4sm13584936wjp.0.2017.01.12.04.57.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Jan 2017 04:57:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 12:57:52 +0000
Message-Id: <1484225873-23702-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] selftest/bblayers: don't fetch a variable that is never used
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

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/bblayers.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index 677161f..cd658c5 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -68,7 +68,6 @@ class BitbakeLayers(oeSelfTest):
 
     @testcase(1384)
     def test_bitbakelayers_showrecipes(self):
-        distro = get_bb_var('DISTRO')
         result = runCmd('bitbake-layers show-recipes')
         self.assertIn('aspell:', result.output)
         self.assertIn('mtd-utils:', result.output)
-- 
2.8.1


