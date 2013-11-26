Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43A4D6DCF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 11:31:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAQBUx9A028056
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 03:31:00 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 26 Nov 2013 03:30:59 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Nov 2013 03:34:55 +0800
Message-ID: <a5580e27713f5679167a25047231033fde30ccd9.1385494440.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1385494440.git.liezhi.yang@windriver.com>
References: <cover.1385494440.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libav: use CCLD as ld
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
X-List-Received-Date: Tue, 26 Nov 2013 11:31:00 -0000
Content-Type: text/plain

The libav uses gcc as the ld, but it doesn't use CCLD, it may have
problems when target arch is 64 bit since it doesn't use the "-m64", the
poky's toolchain is fine since use "x86_64-poky-linux-gcc" without
"-m64" is default to 64 bit, but external toolchain *may* default to 32
bit (for example, when multilib is enabled and both 64 and 32 bit use
the same gcc, then the default arch can be either of them), then there
would be errors, the error is just like we run this in poky:

$ x86_64-poky-linux-gcc -m32 <file.c>

ld: skipping incompatible /path/to/sysroot/usr/lib64/x86_64-poky-linux/4.8.2/libgcc.a
when searching for -lgcc

Use CCLD as the ld will fix the problem since CCLD has been set
correctly.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-multimedia/libav/libav.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index eefee66..4c96f24 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -45,6 +45,7 @@ EXTRA_OECONF = " \
     \
     --enable-avserver \
     --enable-avplay \
+    --ld="${CCLD}" \
     --enable-libtheora  \
     --enable-libvorbis \
     --arch=${TARGET_ARCH} \
-- 
1.8.3.1


