Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 746446FF3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 18:24:09 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id a186so25231298qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 11:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=K6jGbMbqd2KcjZtiaVRmPHA23qy4B6vEQ3/wY0gfI9c=;
	b=hScODMD5qj55kJgiMHHG76UMKRJRxW+TYD/d5pifC9WkrQRAoweW+B+1nKPWpamQH3
	bzJbxORJvGF3z9eMobu2wW5O5Le0niG1agCVeb84ZBJO3w9jcJgVnQ6kQCgPAuCjPVkb
	AOQibWmst+PWxVC7Tvu8ZwGNypcXOa0GKbOL7hkwxdQR5daB2yLXvdI+tknHSLtYSiOY
	F0KdIT9Q/OCbPbhayBESHPBj+7yOenZAYzoKeIxNsG8yzKX3CITDwtW4aw20Bv8Gf7oC
	iomIYT46zS/4eD6cuggedp0mvBThkiipwdX+Z9GNH6DxV6Ec7wu7VPVnNwZW/uhHjFIi
	Ni/A==
X-Gm-Message-State: ALyK8tJBBFi3vGOfC56h/KaPCefnykfeXYxODBS/2MZ8cJt+3Pb5uyA14Fs4qYwdb7XtWw==
X-Received: by 10.55.136.133 with SMTP id k127mr24305439qkd.20.1466447049738; 
	Mon, 20 Jun 2016 11:24:09 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	z206sm19265249qka.1.2016.06.20.11.24.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jun 2016 11:24:08 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 20 Jun 2016 15:24:03 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jun 2016 15:23:53 -0300
Message-Id: <20160620182354.23988-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160620182354.23988-1-otavio@ossystems.com.br>
References: <20160620182354.23988-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] initramfs-framework: base: Ensures /run/lock is available
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
X-List-Received-Date: Mon, 20 Jun 2016 18:24:09 -0000

Depending on the module we use, the /run/lock may be required. This
creates it as part of initial setup and thus makes it available for
every sub module.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


