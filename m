Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1A16E7D90C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c1so2550505wml.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=woFjiJ9nKzy7V+JyYFC2vIyFp0byhdvxVFcHpX2VRgs=;
	b=hXKLU83pPhvxH77kdi3fG1wJKvPNZeWW9UYiX8jC1e5Lrj2Ry2lyw9t+Bq3YeBzbFf
	ZqvJWS2MPPkhTR3NPp/KMk1RqALDEEXZsLoPkBg4Fjc+7Ixpwkf+5aS6unYEumVuXcqo
	nxf42VqeNBhbIm/aFlniRG6Fw0chrrD+fb/s1t9/1DYXactxZSXQ/QQMX557LOIhOHu2
	24pIJJqJm5Dgg555j0rCjpjZYqUT+YPm/whh070iyiwRprO5WsjRLgSsDP5JGqExQZmM
	kE+M0Av/rtrGbLTxy/StS0W8+4sidtPH65V4oF6ZkT4SLY403eBRZD9azOFuayLhQRuy
	HgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=woFjiJ9nKzy7V+JyYFC2vIyFp0byhdvxVFcHpX2VRgs=;
	b=UfI4Gmhh4gn4QIutFIzUgAUiSljFGfyStBAFTzoSEXy8DXLypHPBH3Hcfxod+x50+i
	pXct6RfQULhjmicbOKlMkZv2paUZB7TC0h6fRLh5pB+qw0k2Qr6SOsnO7kF9TLaa55Ca
	PcMagF67ZA2LvvAJ14UZPcW3RzUhSqOjcFafDPkGCE7OTv4C2R9QW0h/DvsBiHdB88IS
	dNpNBZ70F7Y//6sgjQkX5J8xGLL8eXpZiKAZRTNfupeFsKBi6fF+mxkAtK5BOOe7Fizc
	gdAXoZiUcJ3KNmH5Gzaa/6L328PO9YsSgSwOcvM3pFqJcIJVe4+x7X/+Mq15lPKozafF
	bFew==
X-Gm-Message-State: APjAAAW+T1GYcislWY5ipyqeWNFU/nQaGGUzGGub2aD3Xmf+7j9IR3Ok
	EREIzs+lkBsfliYH+U/XuJ7SBAMcV34=
X-Google-Smtp-Source: APXvYqz5oK8USBbCxJ3ygeGgicUi6FZ5MkcgZPJ4g3yN2ptQmAMTiRQW5ZkbLyQ8dalMkpDhxKD0mQ==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr2883428wmj.121.1554901950636; 
	Wed, 10 Apr 2019 06:12:30 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:43 +0530
Message-Id: <6f53c61dd989045a7075b678c7030421d715bc16.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 24/33] wic: search nonarch STAGING_DATADIR for multilib
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:30 -0000

From: Kai Kang <kai.kang@windriver.com>

It fails to build multilib image such as lib32-core-image-minimal with
wic by set 'IMAGE_FSTYPES = "wic"':

| ERROR: Couldn't find correct bootimg_dir, exiting

When multilib is enabled, STAGING_DATADIR is expanded with MLPREFIX. But
dependencies of images such as syslinux is still populated to nonarch
STAGING_DATADIR.

Search nonarch STAGING_DATADIR to fix the error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index d599112..9347aa7 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -26,6 +26,7 @@
 
 import logging
 import os
+import re
 
 from wic import WicError
 from wic.engine import get_custom_config
@@ -47,10 +48,17 @@ class BootimgPcbiosPlugin(SourcePlugin):
         """
         Check if dirname exists in default bootimg_dir or in STAGING_DIR.
         """
-        for result in (bootimg_dir, get_bitbake_var("STAGING_DATADIR")):
+        staging_datadir = get_bitbake_var("STAGING_DATADIR")
+        for result in (bootimg_dir, staging_datadir):
             if os.path.exists("%s/%s" % (result, dirname)):
                 return result
 
+        # STAGING_DATADIR is expanded with MLPREFIX if multilib is enabled
+        # but dependency syslinux is still populated to original STAGING_DATADIR
+        nonarch_datadir = re.sub('/[^/]*recipe-sysroot', '/recipe-sysroot', staging_datadir)
+        if os.path.exists(os.path.join(nonarch_datadir, dirname)):
+            return nonarch_datadir
+
         raise WicError("Couldn't find correct bootimg_dir, exiting")
 
     @classmethod
-- 
2.7.4


