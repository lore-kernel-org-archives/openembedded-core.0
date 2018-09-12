Return-Path: <3FUyZWwgJAPQWXnaopeYsWuik.Yki@flex--abrestic.bounces.google.com>
Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com
	[209.85.222.73])
	by mail.openembedded.org (Postfix) with ESMTP id 4667C7966B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 17:25:41 +0000 (UTC)
Received: by mail-ua1-f73.google.com with SMTP id l14-v6so1039302uaf.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 10:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=Z+l20FTVIHGEswNqrgosQXg83vJYF2a7YxPpgA2RjsM=;
	b=VhO/l+FJxT237Nd4qxPcsG8pumjULjAomvJQzTor0lAMqgnmUWT1Qrz9X9fFtYAZyf
	aoBI0ez/jUcjuiH2174Ez2HkFGcXOU0P23CUvgW1Vh2yRrRwdgSmM8CS4yYZKKWdKeuV
	wagEqAfECwkxjsIj+qxX6mGfIxvBM9UDxBPsgbbeMFXOitlNgxRxQLjiVwcJ99OlA2o2
	9gOp46XORkfU+76JP4Sy9gPM++eTY1LhNiwMw5sE2L6zUC01J37Gvnj/0OMjBHMVJh+Z
	QGOonpo45MlAHbuSl+9HOHHD1IyoyLIBAD/9GS++rWAVDCRSBQO/T3uy0KqWPwWZpes/
	06tA==
X-Gm-Message-State: APzg51BKQm+7NINSguKvKPbnF5ZAWg4nIpnroB1uXIefvY1XSYkad0XF
	9NaiuQ8dbgrPuTI/EfAqg7cBGzC/0P6W9twImpoXNPXlOAM2rYsyAYCI7Wb4bGmeX7hORu82ol5
	MNTLQ6/arLgPkL/FeXbccYAk3yLAV4NWFesmql1Z79+z+K0Qnxdv7GUBwckaUopfI/J8opuYWoC
	sq+cPlf09dNMNB
X-Google-Smtp-Source: ANB0Vdb6EMI6RLvC7M2qo9CargZ3PrZ2enCnueAccBnkjnmzAkv45tknEOWuSxItbAH+CGSmEZLqByDsqgG28Q==
X-Received: by 2002:ab0:555d:: with SMTP id u29-v6mr632059uaa.55.1536773141945;
	Wed, 12 Sep 2018 10:25:41 -0700 (PDT)
Date: Wed, 12 Sep 2018 10:25:26 -0700
Message-Id: <20180912172526.66627-1-abrestic@waymo.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.rc2.392.g5ba43deb5a-goog
From: Andrew Bresticker <abrestic@waymo.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] initramfs-framework: Don't use 'tr'
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
X-List-Received-Date: Wed, 12 Sep 2018 17:25:41 -0000
Content-Type: text/plain; charset="UTF-8"

tr is available in busybox, but not in toybox. Just use sed instead.

Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 37527a840a..3c7e09422d 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -84,7 +84,7 @@ mount -t sysfs sysfs /sys
 # populate bootparam environment
 for p in `cat /proc/cmdline`; do
 	opt=`echo $p | cut -d'=' -f1`
-	opt=`echo $opt | tr '.-' '__'`
+	opt=`echo $opt | sed -e 'y/.-/__/'`
 	if [ "`echo $p | cut -d'=' -f1`" = "$p" ]; then
 		eval "bootparam_${opt}=true"
 	else
-- 
2.19.0.rc2.392.g5ba43deb5a-goog


