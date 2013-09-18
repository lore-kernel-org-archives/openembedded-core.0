Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id D43D96BCCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 16:48:50 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hm2so6717117wib.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 09:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EAtfNYmXalQrsZy1JVv/91TBxhky1x0S46C6HWaRwKI=;
	b=kL+I7i0cYjYPcOypCBKszbzPLPg3fB5YHQlfvum8ZUg7gkGgq45tfQXnV+MONtrmR7
	WjaxnkaaWbYHHx8f4ZXTCgsRtCwRHz66A43HMR8j2itjJHxTye1uNq16ctyyUJ1MkSuV
	hLqRwdQCfZqHXNIfxgXUS/MF6yzs0sKD7R8QdJZMdmbKVqv1/6tcxhOryi2yqCm7+akL
	85OfMDjW8uQG0hQd8LRBVRkoGeqWG55uZqWxY1Pn7xlE+e4fnMn7BIY38teHjkgSMfMO
	75pGFZR85S02Aicja8Hblys2U+Iy15kFVpcRMdLEVE5N4FkUH97GNvfdk3UNuyFk3xfh
	SD/Q==
X-Gm-Message-State: ALoCoQnXrI72CGT0Etqd4Xa6E0IOgcUODEBPsDXBCgoDHSWf+r2wecvszrpjYQnTioXUc0lGELUF
X-Received: by 10.180.81.129 with SMTP id a1mr8058962wiy.2.1379522932355;
	Wed, 18 Sep 2013 09:48:52 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id mb7sm3648657wic.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Sep 2013 09:48:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2013 17:48:46 +0100
Message-Id: <1379522926-22817-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379522926-22817-1-git-send-email-ross.burton@intel.com>
References: <1379522926-22817-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] qemurunner: disable grabs in automated testing
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
X-List-Received-Date: Wed, 18 Sep 2013 16:48:51 -0000

Use the new QEMU_DONT_GRAB environment variable to disable grabs,
finally/hopefully solving the random hangs that the autobuilder has been hitting
for a while.

[ YOCTO #5131 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index d362ede..256cf3c 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -78,6 +78,9 @@ class QemuRunner:
         else:
             os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
 
+        # Set this flag so that Qemu doesn't do any grabs as SDL grabs interact
+        # badly with screensavers.
+        os.environ["QEMU_DONT_GRAB"] = "1"
         self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8" qemuparams="-serial tcp:127.0.0.1:%s"' % self.serverport
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
-- 
1.7.10.4


