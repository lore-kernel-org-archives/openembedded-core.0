Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id B79847ECB9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 14:59:19 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id n9so98645621wru.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 07:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wsY9UugqO+X5kS3st/zxd/FbFzG0Hw3tOQVYK8BFoo8=;
	b=s4L/0HZnI8QC4SdC29UFp1v0vQA+wPvs2+USVU6vJqZPO/QDPvTe9OO6hr31szcpZV
	uT4DCeUwCrFAPClJG1M3XRqh5Map1ZL7So5ahyc2OYhZTfWzjDYIiPzuZtgy4yXYMe/Z
	mLMIbOMa8f7gqNVrTFHngn5b1rGWfLCgVEPFCjrIfIWQ0ucPmJAAcZUQsD0D5w7w3Bq4
	RfIwYY4K+iC5wTWDJvI8MhzcNjnPdYsmxUlZQbX4YlPpNism/sVse+q9U7eNDhUIYFqe
	LBgkvHfZ0dxjpcx6naCjhG9GIjMDh6lIUiA6zaMzOeWAqREKRMwLPU7Yt9WB5pJGmN7K
	by/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wsY9UugqO+X5kS3st/zxd/FbFzG0Hw3tOQVYK8BFoo8=;
	b=KsA9oHLY0QykRDDAWafb/SzQauTAszHOLztnnj776bE7lJIm7sX5dT4ItNRt8qZ+3C
	qCYRGPOtZxawmvL+46eKXfIPWnawtpjM4Zp45ZNwfVPCQ+Xc55lS4B89I2I32q91hdOx
	mzZLAZdnzi41tBiKZKZBjpSl8vEwtTBp8c0Wt5leFrXPon49dNFTMAduoZEUnaIignXU
	tN6El7g/5zUIIlkwXqnbcbZzV8dpW4zEc4pkvntb3ARf8bDklmtiC/PD+A+lC52aHgNI
	gZ2FIDw1AEfrR+BS41UWPgNSK1mMaGKoOulxy5rK6QmCoTULe/IdJOPBdG6i2pWCpBPg
	L08A==
X-Gm-Message-State: APjAAAWyNZkCPwBq/0VCGUl+ZMs4BWCb+/cHOEQTYNnje/j+T+bUmMH8
	eUlf9/b6p4sRFv0rDV6NRxpemU8IlXEOxA==
X-Google-Smtp-Source: APXvYqwAjfFdEZufGbemuBl97c++yCIyeG4ihQ7aDgx1zLLtwQEWNQQRH7GZ47d8QQmouCFY2IxLAA==
X-Received: by 2002:adf:de10:: with SMTP id b16mr23657413wrm.296.1565362760233;
	Fri, 09 Aug 2019 07:59:20 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id a2sm5159160wmj.9.2019.08.09.07.59.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 09 Aug 2019 07:59:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2019 16:59:12 +0200
Message-Id: <20190809145913.114922-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] lib/oeqa/utils/qemurunner.py: add runqemuparams after kvm/nographic/snapshot/slirp
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
X-List-Received-Date: Fri, 09 Aug 2019 14:59:20 -0000

Previously, 'nographic' was set first, and was overriding anything set via runqemuparams.

Particularly, egl-headless from the virgl headless selftest was overriden,
which broke the test in non-X environments.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index b1999fde853..fe8b77d97a6 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -126,7 +126,7 @@ class QemuRunner:
             env["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
 
         if not launch_cmd:
-            launch_cmd = 'runqemu %s %s ' % ('snapshot' if discard_writes else '', runqemuparams)
+            launch_cmd = 'runqemu %s' % ('snapshot' if discard_writes else '')
             if self.use_kvm:
                 self.logger.debug('Using kvm for runqemu')
                 launch_cmd += ' kvm'
@@ -136,7 +136,7 @@ class QemuRunner:
                 launch_cmd += ' nographic'
             if self.use_slirp:
                 launch_cmd += ' slirp'
-            launch_cmd += ' %s %s' % (self.machine, self.rootfs)
+            launch_cmd += ' %s %s %s' % (runqemuparams, self.machine, self.rootfs)
 
         return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
 
-- 
2.17.1


