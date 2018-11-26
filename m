Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 900086C4F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 22:01:06 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 79so192233wmo.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 14:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=hDyNsCqz82kYZxFtYZSKakksb2OSIo0hoyxgVg3X9g4=;
	b=TKtBFl5CySnE5+ZpcUSUxJ+BHTBC+NIR0n9kP3KJq6g4kEHcs13Kdu5CM94z1y8sTz
	AEQERSZaOT1okLfLKOJD4hmM6b5NjztPNWj5sp853BBkY/Ps6jXllf8YZO2SPQhRpsrB
	FLpxlD9/Ef3JTeEJXvA5wYNuv9pUI88zdc9VX8z+OtGObvUt+hCyGdF1joLP8aJb198n
	sd7cl8hbbL9KJBteh9kSynhPm0fKM68uobYH68TVW1FLASFUrMJgzB7LN2t1nb9tZo0F
	7Fmf5s8a2GUEAltNaReQURPpsps10brosN4CIlKTdovNvV7aSrLfHxIUB3i4mVKXAt2L
	GeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hDyNsCqz82kYZxFtYZSKakksb2OSIo0hoyxgVg3X9g4=;
	b=mo3xe/OeYTTqF6YDA6QB5xYs1t8LkRmpKbuumma8/971QCbaMDc/Hdg9Q21wxSTc30
	iLRRT5TufHZ9xlKUqCdV9dmnkZF8AE+p4C2ZNllXzyQ3LWnu0saT3M1ic7QRyKUxMx4j
	vkaeDQgPtzjAS4BTaKwKeAAg8ZAebKBC9IgQSmSVEco/V5UpqFRpunRr2FX+99I9j4/M
	81PiNTFE2mw4JQ246+M63+GMFinkcg/BOdHUOb06NJ38fHA2pTtuZr94Sjg0rTxP6cGe
	bR6D5/Qkhr3ICXd3KO/mV5vpuQ0zQZUN/K9q2eeTUTbNp8GSxot+1u57Lil2pRarKJcy
	deUw==
X-Gm-Message-State: AGRZ1gIhSRjxVB0u3aRDUQsTYMWY7n6kaI869vPfmzXTk/oPE9KgawBh
	AhYC0TjYbYnQ4+XYS3x7oUVWczG4
X-Google-Smtp-Source: AFSGD/U8ojbQGEi+pCk2ebMWarQA5Qu5FHRTXsktCH0Lmz66gRgAexEQ/j4vnhg+hu6m4gUsz7rVkw==
X-Received: by 2002:a1c:88c7:: with SMTP id k190mr23569012wmd.97.1543269666914;
	Mon, 26 Nov 2018 14:01:06 -0800 (PST)
Received: from localhost.localdomain (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	185sm2968059wmx.41.2018.11.26.14.01.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 14:01:05 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Nov 2018 23:00:46 +0100
Message-Id: <20181126220046.90191-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] devtool: fix target-deploy --strip
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
X-List-Received-Date: Mon, 26 Nov 2018 22:01:06 -0000

This is a fixup for: e1ba46109ea4be3d3b310abaf7f2da3c84a83930

devtool deploy-target --strip foo root@192.168.7.2
ended up with:
Traceback (most recent call last):
  File "/home/user/bar_sdk/sysroots/x86_64-pokysdk-linux/usr/bin/
        devtool", line 344, in <module>
   ret = main()
  File "/home/user/bar_sdk/sysroots/x86_64-pokysdk-linux/usr/bin/
        devtool", line 331, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/user/bar_sdk/layers/poky/scripts/lib/devtool/
        deploy.py", line 187, in deploy
    rd.getVar('base_libdir'))
TypeError: strip_exbar() missing 1 required positional argument: 'd'

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 scripts/lib/devtool/deploy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 52e261d560..886004b5d0 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -184,7 +184,7 @@ def deploy(args, config, basepath, workspace):
             exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
             os.environ['PATH'] = ':'.join([os.environ['PATH'], rd.getVar('PATH') or ''])
             oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar('STRIP'), rd.getVar('libdir'),
-                        rd.getVar('base_libdir'))
+                        rd.getVar('base_libdir'), rd)
 
         filelist = []
         ftotalsize = 0
-- 
2.17.1


