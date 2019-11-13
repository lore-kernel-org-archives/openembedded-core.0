Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 41FAC7F8AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:55 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 15so1598071pgh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QaFVveUaioki+mNjrq5iWu55ySD8Fofp88iCF/w3oC4=;
	b=XY5qiyWfmCRZCyzhzJPnfybzIybxbC+waXMUraI2lHme+IoP3KBo+VAjUNOC+xG1AP
	17duApWkWUBMyeYd/edi8L/eZOqoPgkOAG+2z+IvkVZK6b+fds9jF7k0xsK9AfE74Lvg
	pDDVdJFSTaIqCDlT4sH99VNMMWb8Cy0RsS9nahZhxmOgrquhEnQJSwDTDQk5zr6CK/7o
	0nUwVC6PHyqQj76x7fNO/u3/sfEH/dCFDbMgec+injUrn3IiYgijhdDo5G/hR6pxRXTU
	sZOi62l1esnMycUps/soR9T/cIahcM6psVGdiNz+3Tj+EXFjDvLJQtF8PZ2ATe9Vu8iR
	zEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QaFVveUaioki+mNjrq5iWu55ySD8Fofp88iCF/w3oC4=;
	b=a4tl2+eMLf9Yrb9UhLVG8yxCNLL3+/LkFIoErgPqHskkgcx4cCBGYu3RN+gZcknl3W
	p2SguHH/ncfikJlseaZtFEc7SnxXIYLAIafxEY9b/FYxbEyzHBvmDbtx4NKZ6RlEtXAQ
	cXzMhYiVzjjlgK6eQI6561+VHmDmzS1Err7iy5jRSc4mYJ33B+mr1cWeyI4h9JQiYr1L
	378R2qj1U8MhwKayxnk14pP8EaYqTkwbEcCEuWClPyo68bBdbnUsQzKmkUiikOnfvwSC
	6uF3BeOfK7UcwuI5tBO1KuGIl/bFJn4upYqYY+wCgPH6gGDnPN89tOQK+E9TYsVzxOxC
	Y2Ww==
X-Gm-Message-State: APjAAAXcHDK7zz4/MsWAj2qE9UPrLH8YCRm3+CP9LJlRfiWC8vYVidze
	HlDOZ99DWeAuV5GPaZckvt+NxxNC
X-Google-Smtp-Source: APXvYqxe3Fti4RzUS5UK0DSzj3ozMVsZQuOYty9mVGIkCzFDTWeeG+4ZGyi5ABqmRqh6bscXbFJp0g==
X-Received: by 2002:a17:90a:c981:: with SMTP id
	w1mr5718858pjt.126.1573659175887; 
	Wed, 13 Nov 2019 07:32:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:12 -0800
Message-Id: <adc0a31169f59d0183c327347b9ab3bcebb1aef2.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 30/31] initscripts/sysfs.sh: Mount /sys/firmware/efi/efivars when possible
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:55 -0000

From: Haris Okanovic <haris.okanovic@ni.com>

Without this change, efibootmgr is unable to recover BootOrder if lost
during a previous write operation, e.g. exceeded storage capacity. This
is problematic using EFI to manage boot flow from Linux (E.g. via RAUC).

https://www.kernel.org/doc/Documentation/filesystems/efivarfs.txt

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
index f5b5b99..4871ee9 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
@@ -26,6 +26,10 @@ if [ -e /sys/kernel/config ] && grep -q configfs /proc/filesystems; then
   mount -t configfs configfs /sys/kernel/config
 fi
 
+if [ -e /sys/firmware/efi/efivars ] && grep -q efivarfs /proc/filesystems; then
+  mount -t efivarfs efivarfs /sys/firmware/efi/efivars
+fi
+
 if ! [ -e /dev/zero ] && [ -e /dev ] && grep -q devtmpfs /proc/filesystems; then
   mount -n -t devtmpfs devtmpfs /dev
 fi
-- 
2.7.4


