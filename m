Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7B27722D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 05:53:21 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id wz1so6781585obc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 21:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+SyowSyHMC/Ozit5I5Hj7lXjUyNdxpm71iXl7ssvXAY=;
	b=T5Kc6WU+FKdCh8r7CkFr8KKd/onYmzh1NwMCgOcpf74DazW5laSIquPJznFp98ABND
	xvG0T9E43RhnFhkKa8jCBlSAiMm27yVcXylrQXlagLy4t28wv5BIis3yvtDeandzhia8
	QTcJXFtrMR91+HbX+HlK6vfKTAr2zs8yFIPhBcC8otA8EVXFy+crLyFdasHf174kXLvD
	gB410b7dMgNTR7PDaqJkyqklb5GHtDb9gcEbgfIQSYDeHSV4T/Bq9jrVfim8QgYP+WO8
	6gvWnMw2tqGhp3wSE0jXokWslwpo/XYw4Rf5b42matyTa99tjHlLUVzvsVjGibRZTaP1
	vC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+SyowSyHMC/Ozit5I5Hj7lXjUyNdxpm71iXl7ssvXAY=;
	b=jAdJdH+UOBpcNJuPzSNwVSTG6viL4ALzQEwOhAp3cVSdFjP8pE1lqBdVpHHU1SR7o0
	2TFgykqu37vwMqzKNFwesjzmjDt/VZHiBqxHIrmLLc4EDVGYVCn6VmDZTvbJQShzBeLZ
	uxuyoPNMzPY4NtoiU6maYRbr9dayPdf7SE3FV5THJF5b+b6QK+r2XWeUcMroLcPGd44s
	zVL+X1zWCcNWq6r/yIb/nUWEdWgFc0OfZoDxQpGhXSCIlZiunhOFX34trYXUeeeofGFS
	1vGmJG1ASt3wniqHohp9hatbOHpYKL5i4dky3uoihkfbjSpVK7jiurENaEB+BmhqI6wc
	+tVg==
X-Gm-Message-State: AD7BkJKVu40g/KIlwiI+91/Pw/iJNcb3J/XPvLa9FO+dt1iUGx1mTrI1oGi5+0CTDWOe6Q==
X-Received: by 10.182.105.131 with SMTP id gm3mr4316771obb.23.1456552401913;
	Fri, 26 Feb 2016 21:53:21 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	cd5sm10867528oec.15.2016.02.26.21.53.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Feb 2016 21:53:21 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 21:53:06 -0800
Message-Id: <1456552387-10564-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456552387-10564-1-git-send-email-armccurdy@gmail.com>
References: <1456552387-10564-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/4] grub2.inc: drop bogus dependency on xz
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
X-List-Received-Date: Sat, 27 Feb 2016 05:53:22 -0000

grub contains it's own internal lzma library. Attempting to build grub against
the system liblzma shared library or header files is not likely to end well.

This change does not cause a floating dependency since all grub2.inc based
recipes pass "--enable-liblzma=no" to configure.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 0fdafd5..12cff4f 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -31,7 +31,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch \
             "
 
-DEPENDS = "flex-native bison-native xz"
+DEPENDS = "flex-native bison-native"
 
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
 SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
-- 
1.9.1


