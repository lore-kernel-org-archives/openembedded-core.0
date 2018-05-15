Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC6A7509C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 06:11:23 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id h5-v6so14597256wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 23:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vHziXedcWm3k3Vq0YdJ3Et7hrlF13iO7JyXmpf3SCfo=;
	b=d1qNhj1c92soMUaaNEskvfT3ieJxfBlAkt+vvnI4gkMv++Em0ypUPhThMro1BbXwb/
	NrfZNfAWgOBIbsl+h6skF0C4C86mtAVkqR6usszvLH320ubInDgicR497Pqgn02eaee5
	3cAlLoXV/KIS5uq6dvM7B/ZhYz62bhEdYqQDbdnhnPAG0w39E8dIPTYfQobV/2XQmtNE
	GwiDE/fIy8662ffDvpdx8O9sETOWit56HyxA2lyI/aIprrm7TwZWfDVeQxuyGKjg2Wwv
	sJIMbJbQ4H9NtKBftdlMYwld/gaSDPQ/3/Pq/X5dA1RrhHU7QhclVqvj9HsHkQ1QzVbA
	+fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vHziXedcWm3k3Vq0YdJ3Et7hrlF13iO7JyXmpf3SCfo=;
	b=oMppt4N1+8PHY2ZMR6vYjmsk8yEN5jPQKZnQ+Kata+SO4p+fIf8ObuIDFjASbBo7r6
	7vbTDIl1C24aoTFi6DwJzgU/beEic1DFokjhEpr87rNTnUlgvbE6Bcpmahpg52plUgUF
	1ZpvP8zO4iqUXqvLz0rvBigRrX3kYW9Eq7uUvKYuC0StG37jgMgQG/W0e9TUYIskYvjf
	5UUEfcn29F1d8y/eQox8mMl+HTwX/2oUkxctDsNktp8BcPHbE8dy4KOzFomjZ3DPtmhf
	VTvnhe6IHPOEy5O9alrmAS5RqTnEdaARCDFFGATiK1/J7o0/mNpEJfsrWBi2sTyFYpGW
	+QLQ==
X-Gm-Message-State: ALKqPwc27d/OpKGw2IN9x+gRrv4hrQ5oOVVMxovUUqrbbekF6b+RPW2+
	cQzPm9MgInGfrBXYb6tNxAey4g==
X-Google-Smtp-Source: AB8JxZrZaFMHzeMYtHxjPb2uQG4ApBEgd+DduJGbNU5WdMYlULKCfCFn2sSMo3JnMgi8hesP/Jod1w==
X-Received: by 2002:adf:860d:: with SMTP id 13-v6mr9580219wrv.12.1526364683902;
	Mon, 14 May 2018 23:11:23 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([176.32.49.4]) by smtp.gmail.com with ESMTPSA id
	131-v6sm18086723wms.34.2018.05.14.23.11.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 May 2018 23:11:23 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 08:11:10 +0200
Message-Id: <1526364671-29451-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526364671-29451-1-git-send-email-liu.ming50@gmail.com>
References: <1526364671-29451-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 3/4] kernel-uimage.bbclass: support initramfs bundle
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
X-List-Received-Date: Tue, 15 May 2018 06:11:23 -0000

From: Ming Liu <liu.ming50@gmail.com>

Add do_uboot_mkimage to INITRAMFS_IMAGE_BUNDLE_POSTPROCESS_COMMANDS,
and add uImage to KERNEL_IMAGETYPE_BACKUP_UIMAGE to support initramfs
bundle when KEEPUIMAGE is set negative.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-uimage.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index d3d9d77..4bd6c7b 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -18,6 +18,10 @@ python __anonymous () {
 
             # Enable building of uImage with mkimage
             bb.build.addtask('do_uboot_mkimage', 'do_install', 'do_kernel_link_images', d)
+
+            # Handle uImage initramfs bundle
+            d.prependVar('INITRAMFS_IMAGE_BUNDLE_POSTPROCESS_COMMANDS', 'do_uboot_mkimage; ')
+            d.setVar('KERNEL_IMAGETYPE_BACKUP_UIMAGE', 'uImage')
 }
 
 do_uboot_mkimage[dirs] += "${B}"
-- 
2.7.4


