Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 931536012C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 17:44:54 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id n127so935677vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 10:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=mgHcS/skMhfONwTajHpn6Fo+vrrtLA7rUUPYcoQ1lx8=;
	b=Btx/ElY/i2l+Q6KA06k9PjN/WxTFWN7G/B5k8dqpZ58oBxot7AtB11JY1xinAdsIdj
	wlBWxYEh3UWv3aRfg1O26Pe20WceNqPkw3THJGcWAKGFAwbQW5u9FjnluxrRz01NJixO
	+VK+0eQ+8lYSE0BzBV3APnjMqnPFF6ku+1vy69Q16pRokNiiLoblYvGy49qAgi3ugafL
	SUgA5wVG/2lex14TZ7/clpeZvl2YvKiLAFvXTohY9HNXx9Au5uqutBeO72zZj9Pbjkma
	UcEGsijS9qtTxi0MRRhDoBxwZgJLnCcT7DvjbrSBKFVunPKNCgVdwn03ow49KnK/4DSO
	Xh9g==
X-Gm-Message-State: ALyK8tLiPEFlhndUP9lqceH/JeSgo1Qc3lehAZBVqtMLd2okwxVedr8UbZOjv2lOe027pw==
X-Received: by 10.31.190.211 with SMTP id o202mr16604621vkf.118.1466703894756; 
	Thu, 23 Jun 2016 10:44:54 -0700 (PDT)
Received: from localhost ([179.105.243.72])
	by smtp.gmail.com with ESMTPSA id 80sm432088uag.27.2016.06.23.10.44.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 10:44:53 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 23 Jun 2016 14:44:49 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2016 14:44:47 -0300
Message-Id: <20160623174448.5504-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/2] initramfs-framework: base: Ensures /run/lock is available
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
X-List-Received-Date: Thu, 23 Jun 2016 17:44:56 -0000

Depending on the module we use, the /run/lock may be required. This
creates it as part of initial setup and thus makes it available for
every sub module.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- New patch

 meta/recipes-core/initrdscripts/initramfs-framework/init | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 204f237..37527a8 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -76,8 +76,8 @@ MODULES_DIR=/init.d  # place to look for modules
 # make mount stop complaining about missing /etc/fstab
 touch /etc/fstab
 
-# initialize /proc, /sys and /var/lock
-mkdir -p /proc /sys /var/lock
+# initialize /proc, /sys, /run/lock and /var/lock
+mkdir -p /proc /sys /run/lock /var/lock
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
 
-- 
2.8.3


