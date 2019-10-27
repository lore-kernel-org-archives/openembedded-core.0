Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id DAE5C7F79D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 20:30:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s1so7784524wro.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 13:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JHF9iyofeBo6cHk1riH7BFDTdu28+OEIhA84x39EQXY=;
	b=L4M0PKuNWXDZO2ysdMIVUl2D3HQZNMSIuAM0FPRhQphSH+CbgHy8wRvwHDTPY3q710
	2aWZbuxry6a0Ib0MlVIwSJhTq2tbUR+/6KHU1nESAr2db+eF/Ek36tN9DgQsosShhEIn
	y/lxb80tgTpTkPJZBz9DbF6sUgu9/EjcecncvXgFhcPnNPGSHGUB0bmKrGeqrkoOGCay
	auQrq1s8FlccBF0WEWNQP5T3NU9Dtx7G+ZYovhEhZuMNgCr2Nc7mhpWPKAjKt3lS1h9n
	TssUpQuQ0qYDYklsa15sMV4tbjJsUOs8eY2gA3oVDoW0DSZa3n6fs4Ayjx5gwcNc2BfE
	Ji8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JHF9iyofeBo6cHk1riH7BFDTdu28+OEIhA84x39EQXY=;
	b=eLG/Yz+CQ2wT1sgVatGCeedl+ij3eTjUJB2c/iPmgXeZB3xjw8YKWD16hqPqUEVWhO
	exOMf7KPrY/5/+9XgRiCkCyI/swtxLtUKgROy3wdlqZ5cKKYvJ5dV7T4hORuhiZSVqrn
	patiBZenXV2joWCcZAO1hbWdJZiwn9GogitUP9GU08Vx1KKDRRjbs8JP3vH+WKCK0z0N
	AO/jVDdafRE9jh10iGQJnwb5rKe1AFDd/8zP2LD/xhe9XxmUb/PCxog07fF5mMVRt9/f
	QwvnnLH0lGsOEVJpTbSUIWwgqSWw8XVDy63oKkiZfNQtIqp7P795io5KAqpKV8OtB3Y5
	T9wg==
X-Gm-Message-State: APjAAAXPoYLpZdftyQWf9d/y1xbTd0+4+3yrdNYVwo8juyttIv8dqN7H
	pwTmOOr2/ZmwCKzrieAigzCtebJq
X-Google-Smtp-Source: APXvYqyQ2uBdRS+L2I9g45DEfLtbVQ/Qlp7nJnuf2k3xYipZssRgw6G9Anr8mV5AgE3l0bhRKpPiJQ==
X-Received: by 2002:adf:f08d:: with SMTP id n13mr11598059wro.324.1572208247194;
	Sun, 27 Oct 2019 13:30:47 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id c8sm8295026wml.44.2019.10.27.13.30.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 13:30:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Oct 2019 21:30:40 +0100
Message-Id: <20191027203040.19145-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] IMAGE_LINGUAS_COMPLEMENTARY: auto-add language packages other than locales
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
X-List-Received-Date: Sun, 27 Oct 2019 20:30:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This change allows layers adding packages other than locales automatically to
images based on languages selected in IMAGE_LINGUAS.

E.g if a layer has recipes creating packages as:
| ${PN}-foo-en / ${PN}-foo-de / ${PN}-foo-it / ..

it would set
| IMAGE_LINGUAS_COMPLEMENTARY_append = " *-foo-%s"

in its layer.conf to enable auto-adding.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/image.bbclass     | 2 +-
 meta/lib/oe/package_manager.py | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index f4633da3d5..c2824395c9 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -124,7 +124,7 @@ python () {
 def rootfs_variables(d):
     from oe.rootfs import variable_depends
     variables = ['IMAGE_DEVICE_TABLE','IMAGE_DEVICE_TABLES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE',
-                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
+                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS', 'IMAGE_LINGUAS_COMPLEMENTARY',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
                  'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS']
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index c841fdbf29..c7135ce918 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -570,6 +570,8 @@ class PackageManager(object, metaclass=ABCMeta):
 
             for lang in split_linguas:
                 globs += " *-locale-%s" % lang
+                for complementary_linguas in (self.d.getVar('IMAGE_LINGUAS_COMPLEMENTARY') or "").split():
+                    globs += (" " + complementary_linguas) % lang
 
         if globs is None:
             return
-- 
2.21.0


