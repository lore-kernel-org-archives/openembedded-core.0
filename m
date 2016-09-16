Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1C97360111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 10:06:30 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l132so1746751wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 03:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9vxlVYkW9oTuD0WGsuiakvCcLgJwBAVxDtaaDAch2Ls=;
	b=amYW7f1AfOm85nqPOEYXN4QsV3hXhJBNg8xxZ+9pG3qAM19jxEGYw2iTNTUAy26R54
	EjOX4HZ4UINMuiTCvV05MpQNo0/UI13zpRh+4P0Nm2detaZhNS1pDyccMjTyoSWauSx0
	j3mI1yZvA0GuSuqKFHaZQu/mirtzlgj6WAptbP2VHDG41gVnzYsFatfJhq2xSbvR54Z8
	h1+xRTF7+4mpnDYM2dmcWLpnj7Y5uD77MwhDJuHLeMHl0QOmHJXXSQEvePV2Ui3L0KUh
	H9/0XKVToesTEk2YscZbWbLjuS/XR80XelkaVXMhETJuVefMPol+RrygayQJDTyQiyca
	cipg==
X-Gm-Message-State: AE9vXwMpq5WuAtbDLGanRXlh9woPNu/y8SoTggmrvdFiJ8aNnURx7Em31r08jmOdbW/5KQ==
X-Received: by 10.194.120.37 with SMTP id kz5mr12708068wjb.196.1474020390881; 
	Fri, 16 Sep 2016 03:06:30 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	gg10sm7677837wjd.4.2016.09.16.03.06.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Sep 2016 03:06:29 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 11:06:29 +0100
Message-Id: <20160916100629.15717-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] qemuboot.bbclass: don't fail on very first build
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
X-List-Received-Date: Fri, 16 Sep 2016 10:06:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

During the very first build, the DEPLOY_DIR_IMAGE
directory might not have been created yet, causing
the creation of the qemuboot.conf config file to
fail.

This is because write_qemuboot_conf() runs at
rootfs creation time, i.e. before deploy.

So let's create the directory if necessary before
trying to write the config file.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/qemuboot.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 8500c73..4c7d205 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -63,6 +63,7 @@ python write_qemuboot_conf() {
     cf.add_section('config_bsp')
     for k in build_vars + qb_vars:
         cf.set('config_bsp', k, '%s' % d.getVar(k, True))
+    bb.utils.mkdirhier(os.path.dirname(qemuboot))
     with open(qemuboot, 'w') as f:
         cf.write(f)
 
-- 
2.9.3


