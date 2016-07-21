Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id F35A470100
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 17:16:00 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f65so29096763wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 10:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IeX4UzX39LdIholSLeh1CuLQECpCRmsUwnW/iIcHhgc=;
	b=hAaPWx7lkLmzhPlnl8qy+BTs9yAlPCKOHziFyB4Coq9LQ5lwOjCLMIbwzpsmsLyrlK
	v5bGgJ9aufVDp5B7cyjh5gsRnov6dBFpFGrh6cKNgGNEUxabe+H+rTIiA8i1rgknK45N
	ODbKM/efCcz2L6V3ugFQ140eH92A6BzTZM+WW1Xu5Ud+MP4hvdVaSNrFlAKXMF2bBAKc
	hE4a5S0Rf7yvOFMbLNvkuj2LaUkjUNR925etSZoDj5crYiFIw0uiG/nsqObGMcWilZkF
	w3KtVh67W/vVDh+IQK2ugLuUKR0hlyQ0x08gFiWUQCsRZBCAbQugbKFGGTmiQCeKO8LU
	o8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IeX4UzX39LdIholSLeh1CuLQECpCRmsUwnW/iIcHhgc=;
	b=aGSMl+IDY/upRjHng2T+810sMZYAQVX1Whac/yoqfIxN35S5zNRzlMmiWPlI0csNz1
	0M60BSrzaYrb8isyGwkZITuASGYAaTODXOa9MVOLPrCqjKeatA2qcYkIib50TxnHd0j/
	vI+HfpjV2x3O2feciUwBczrXLP+40jviZBgdd3OxBP0wUxrUyH1az2yl6fSUZ+Btuhcs
	fkwUmiFafqS97cjS5UyKvxPZGfcFhSpYfCnpRp4z5N4h1niQgisEAfNFrxktcnB54ihK
	ObaPoEpyRESwbd6dR08d08IxmInzTrdpkzzViczI4apJVKo0tdf/vLLYcMUNBEMM3naM
	vV3Q==
X-Gm-Message-State: ALyK8tKe86de7EKuUk9sSfevBGpJDG32XksPQD5aGWfaNVg4aBdQJMPbIDa5ZgodjrBpnvsk
X-Received: by 10.28.222.8 with SMTP id v8mr20075072wmg.55.1469121360029;
	Thu, 21 Jul 2016 10:16:00 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	a194sm5552715wmd.24.2016.07.21.10.15.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 10:15:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2016 18:15:52 +0100
Message-Id: <1469121352-29774-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1469121352-29774-1-git-send-email-ross.burton@intel.com>
References: <1469121352-29774-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] oeqa/selftest/signing: check that we have GPG in setup
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
X-List-Received-Date: Thu, 21 Jul 2016 17:16:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/signing.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index beafd63..4c12d6d 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -17,6 +17,10 @@ class Signing(oeSelfTest):
 
     @classmethod
     def setUpClass(cls):
+        # Check that we can find the gpg binary and fail early if we can't
+        if not shutil.which("gpg"):
+            raise AssertionError("This test needs GnuPG")
+
         cls.gpg_home_dir = tempfile.TemporaryDirectory(prefix="oeqa-signing-")
         cls.gpg_dir = cls.gpg_home_dir.name
 
-- 
2.8.1


