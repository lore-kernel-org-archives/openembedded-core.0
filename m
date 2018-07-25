Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id EB1D1753E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:49:29 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h10-v6so7498330wre.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 06:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=w8ffSh6twBDsEHpVE0buYgKPdP5WfvWpNsIZP0zvH8Y=;
	b=Shz1piXQr3osAAiEqFZQHT25DWHr9arZU/HilnTq7PWQv7mBaMDZ92Tmfslh8TI1BX
	9YDZDz7PtY9Ae19cibDYxnjNBwufLWYmLHsBa2a5qXTTt9hEkA/N+VyVqq9rXBrxWVR+
	dqDl1lWLqffLOS3bCkcZdd9qWUCx06vDOFDcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=w8ffSh6twBDsEHpVE0buYgKPdP5WfvWpNsIZP0zvH8Y=;
	b=NpeArE6kuajyTSoi6PzFBQ+JR74BtQEJdWN/EBBO3SGRHmt9e0g2T1wHcxqGBLANC3
	wGiZ9qQTTKEGg/m2Zgp88Fpi37X9EVaTtrNkZ57v4nPcbm0gT64jKy8NpOIzFaxFWatR
	V64e97JPiFcs6tJ0llaLJrtSE3ASitWLhCGdrFuGhSHhruHMSm5a8kL14B+x9VAKj52C
	MMY+hQYNsSZhTO+uUqnCK/1h9/k1VMMZsVVFa8j1fKb50Z5s2NPxrcw/UVbtKqYiFoVn
	AXjQwWx3ijkPuW27eeXIz98rRXVFkvCMDSIhQq+gNX6n8YF4OGSz8/BTpdvmaDUgw5AH
	mEBQ==
X-Gm-Message-State: AOUpUlHklhoqE3ch1tYW6Gs1cR6z+Q/+yk3w8MzdA5ZIm1W3RGigx7UX
	ngOzJTdHmGjT9uuG0Bn0+kPKdaRZRJHNww==
X-Google-Smtp-Source: AAOMgpfzHWZWHcSkYaFlUEe/cveLqhDOwykJvkKwru+XONUM2KPwt2QbpFPwgcazlaoJu4dT9JHNvA==
X-Received: by 2002:a5d:4b50:: with SMTP id
	w16-v6mr14535017wrs.87.1532526570514; 
	Wed, 25 Jul 2018 06:49:30 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e12-v6sm12895471wrt.29.2018.07.25.06.49.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jul 2018 06:49:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2018 14:49:26 +0100
Message-Id: <20180725134927.5839-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] selftest/bblayers: Place the test layer directory in builddir
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
X-List-Received-Date: Wed, 25 Jul 2018 13:49:31 -0000

Placing the layer in meta means the directory is in an unclean state
which may influence other tests. Use our build directory instead
since we 'own' that. This helps keep oe-selftest parallelisation
clean.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 3448ae1999b..447c54b7e60 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -88,7 +88,7 @@ class BitbakeLayers(OESelftestTestCase):
     def test_bitbakelayers_createlayer(self):
         priority = 10
         layername = 'test-bitbakelayer-layercreate'
-        layerpath = os.path.join(get_bb_var('COREBASE'), layername)
+        layerpath = os.path.join(self.builddir, layername)
         self.assertFalse(os.path.exists(layerpath), '%s should not exist at this point in time' % layerpath)
         result = runCmd('bitbake-layers create-layer --priority=%d %s' % (priority, layerpath))
         self.track_for_cleanup(layerpath)
-- 
2.17.1


