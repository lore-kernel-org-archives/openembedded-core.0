Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77FAC369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 16:58:55 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.833.1744131525842563818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 09:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dv5swn6V;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac345bd8e13so983992366b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 09:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744131524; x=1744736324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cStArh2iEQtWuvOwSPdNFykEkx9Z1Apuf1Uu8Ajf9Ao=;
        b=Dv5swn6VxTWD7JUwoglz0Pr17dmrSEvoCmMNJ2dRV8jpg1by71ZIm9A4GSza5EhHaR
         yRUKUk2zqZEH/MevshB3hCWvshG+DtHYo8AVloqHWGt9FsX0m/9RQdlSR8DZmVbh8pZw
         op0yAcXz6FYaNjmuY2U2KD4VJMCGt+zJlUAOkFJ9Zea8nZoXuml72QyRJmTrF6d9cUjh
         tMiL6rPnMTbyxJIRQci2xzJobA6Xd48EXSJy/3bHmDRxCl7tfG6j4jVyWdVlzwIGESyu
         8qFkBry1hqcGowxXXxQdMStay1TAWRFi32TndPGZAdE9jo02GSU1YrVBA3ITm1gXOtUk
         l4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744131524; x=1744736324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cStArh2iEQtWuvOwSPdNFykEkx9Z1Apuf1Uu8Ajf9Ao=;
        b=EkysKPxKZ0XcXPbGChojNvro6G+x9YR+ufLc0Qi+ZqcfborT0jkvusH4lub/bNA3Bn
         ubSJYMGQkYJ5XR2r49ag7gXapDxwt1WLq0grzJYmNLNBG/D3SuR+Go9JQpWeO5usVuYc
         EpMISS0lZttZc2U6/xnp5YX7yTttCITukrV8Q+MTkzEHZB7gEQ5nPQaAu9Rntev8CD9D
         cOXXu+Cw/6qeVWrBX213tzA5Yz2G9a5Ed4kfIyPkVJZ97OPFM4dsZoxZH+o6tVXopvTF
         NXOo048cMR5Rv2jR9wQGakNIf2hbT8xRz23FLAjAmrPE/yvQ51SkVa3FFxqYycZK4HJY
         w+6g==
X-Gm-Message-State: AOJu0YxVvF1bUtZm//y23E5twByNtuqV/c0o0fiuR9X+wMNHcAP6FMws
	3q8DCSeek5DxMZVP2x1gKZeoUjILEgV+dlxmFBEnuyoF55uK/EgjMWsoz9Vf
X-Gm-Gg: ASbGnctA7csygxtghxWnAyM0Vj2njHrnqAB4RKqXLfPvv7iuv7PESTwdGTViCfYShbT
	o8964kguZ0A3Yc/nrdNlF85WxIRad7jgUVG6wcSNEge9k2wa3ImQF9uCidJCNpwA6+BzvsIcuhA
	sbn4ywApJjs/bDt84v2hOQG2Q03sUXO4hrDdTxPC1Y4aPgY2P0f8hTR/BCDxxWj/39mjfYUmhFT
	aV1DFtYlFwpYD9QbVR8LHoDw3pGOIZF8JDDDnweeU6NNOJQqQR8frFO0m5LhGxKj+QMdQcjItwR
	nDiHUrhqmeQHzcQOSHTCNoC/M7QlcGsXZtslqsa0P7rH3A9ffae7Eut9qdr9
X-Google-Smtp-Source: AGHT+IF/QRwSj7wMAsA9SJjt7sMRyj4QTKaQQMrqpVQwog2fRpTwUtq2JxZ9Qt+KMN3eKRUiHPYYpw==
X-Received: by 2002:a17:906:f5a3:b0:abf:7af6:ea64 with SMTP id a640c23a62f3a-ac7e7651b43mr1222032166b.45.1744131523659;
        Tue, 08 Apr 2025 09:58:43 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f29csm939691766b.113.2025.04.08.09.58.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 09:58:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] yocto-check-layer: expect success for test_patches_upstream_status
Date: Tue,  8 Apr 2025 18:58:42 +0200
Message-ID: <20250408165842.2014509-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 16:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214551

When the Upstream-Status tag for patches became mandatory,
the test verifying the presence of this tag was made to not
fail the layer compatibility tests, in order to allow time for
the maintainers to adapt to this change.

This was two years before this commit.

Since then the layer compatibility script shows a cryptic
"unexpected success" result for this test, which of course
becomes clear once one checks the code and commit history,
but it is a nuisance still, which shouldn't be needed to
understand the result.

This commit removes the the related annotation so the
compatibility check will pass or fail with a clear message - in
hope that 2 years was enough for active maintainers to
adjust their patches.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 scripts/lib/checklayer/cases/common.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 51233de767..ddead69a7b 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -104,7 +104,6 @@ class CommonCheckLayer(OECheckLayerTestCase):
                 self.tc.layer['name'])
             self.fail('\n'.join(msg))
 
-    @unittest.expectedFailure
     def test_patches_upstream_status(self):
         import sys
         sys.path.append(os.path.join(sys.path[0], '../../../../meta/lib/'))

