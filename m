Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B167FC46CD3
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 11:44:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.144929.1703850286171429908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 03:44:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TSObIUQH;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d41555f9dso70599725e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 03:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703850284; x=1704455084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBHd3jO1E3mDXuOdJyh9xQ4oMz5mNMlC1NncEr/sYKY=;
        b=TSObIUQHULR9EvFcvlvpVchxPq60ChP1ekqvdpD3Igid7lKlJQIFTBnTT9YL5D/7ET
         MFNyheSCYVnqQh1NZ4mfneYdjpcZYyElzxZDVeGjy5Oecl56hQ41yb9vVasAuSwLlcfj
         z6/4iRcBbVOpfZz92ffTFT69T4aXqXM5vEcL+CHlG4vi9foDQJCHGUu8JDsVXCU0/K69
         3dHz8ElBUbb5jWuTtG9pnFaGVJBXmkpj0TGi2Yg9rz1qD452OaRclONHN/TxvYNQuqmd
         tlYJkRFMJoU4WEZed1d+kgi4AnVGl0oADMmzOcyWVc0UPXKG9TeC/sXdJbgoAa0iWYoo
         wWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703850284; x=1704455084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBHd3jO1E3mDXuOdJyh9xQ4oMz5mNMlC1NncEr/sYKY=;
        b=s1DlzVg5LuTR4HLM3FTjCABzTO4+IQOxBblvBCw1oGPOf4RwMKAcfyry/RatkQBUzg
         FJhvFPR3/DtycVzgnx5LBrvrePAbz4JaB31Th4H109lEGllSgiRtyQTJrcf5sMj8Et7M
         LJLCP2Gp+iGZXR2lk9m3BSTAoQm2ZDEzLIPjfOeGqoUrASbQr+rSspcCpfjbOCT11n/y
         ppkFqZLFi0r4r2noMKk7anU5g/msxsncsEKBfTpNSGA63rWxNLVqyQ/mny8T9f9biFfy
         JTwyp9ORuzoe5w8/inzxF0obErwrrN7T+fnLpfSwW64szakfFdT5QDZg1FFC1Vfht78S
         HWIg==
X-Gm-Message-State: AOJu0YzjWy2BqHWuBLSrFGgrbkmeCFc+o19VEYtdfGP/vp5IrJsLvg2G
	bZ7dEsAilT+oacLj30pleIRi5d2WitY=
X-Google-Smtp-Source: AGHT+IGURfC4TpvZ7g2FB4nDW37dlRA96vPTmNwt35T3GMXo0EgBXSvNYuIXOEndtMZSZW+EX4bayw==
X-Received: by 2002:a05:600c:a0a:b0:40d:7eb5:788 with SMTP id z10-20020a05600c0a0a00b0040d7eb50788mr216023wmp.96.1703850284033;
        Fri, 29 Dec 2023 03:44:44 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id l2-20020adfe582000000b003366cf8bda4sm19035525wrm.41.2023.12.29.03.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 03:44:43 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 02/10] devtool: selftest: Fix test_devtool_modify_git_crates_subpath bbappend check
Date: Fri, 29 Dec 2023 11:44:27 +0000
Message-Id: <20231229114435.27810-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231229114435.27810-1-alex.kiernan@gmail.com>
References: <20231229114435.27810-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 11:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193005

The recipe being tested is in `testrecipe`, use that rather than the
literal `zvariant`.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d733dd158106..cc28731402e7 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -958,7 +958,7 @@ class DevtoolModifyTests(DevtoolBase):
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         self.assertExists(os.path.join(tempdir, 'Cargo.toml'), 'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. devtool output: %s' % result.output)
-        matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'zvariant_*.bbappend'))
+        matches = glob.glob(os.path.join(self.workspacedir, 'appends', '%s_*.bbappend' % testrecipe))
         self.assertTrue(matches, 'bbappend not created')
         # Test devtool status
         result = runCmd('devtool status')
-- 
2.39.0


