Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 487A272325
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 16:22:41 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lj1so3142317pab.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=7srmr1RqEh+4XigCzgM4X1NBodnst6JzrJymP+h90zo=;
	b=SbO8OPRjTE5AEo/qYx3HSnolaahlZAYlrDrjVzH0JtFEcaYHGny0nqxZmYZ2yYnRG5
	nWYpWUA/PXB4zQFkJ67PIlcOkwFZJuKDHVabBtu2mFP22VOXTu+kJALGgKFawCULgE/Q
	M0OMqBtnbw4NnZCJvy2vwmb48JwpguZhUMYEQqj5Xu4knxg0qSJgszM4AfCowEq/cMyQ
	Q7UOINf2amPbdIu+H7L4wk0hkNADvxk3VeCsdN4iVyFumsnJ1qxZ6mvrL3gq7TUX5e6/
	ySVsVsiZLAH25cDAX9GA3PcunM0BllZS8Ses1MCJOwgeIkspYpp37geND1K+wMCoz6Wh
	ks2w==
X-Received: by 10.70.94.73 with SMTP id da9mr54588057pdb.51.1417018962373;
	Wed, 26 Nov 2014 08:22:42 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qn1sm4736673pdb.42.2014.11.26.08.22.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Nov 2014 08:22:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 08:22:13 -0800
Message-Id: <4fb9677b34f08b17df4c87da0c2582f9b0dabd8d.1417018567.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
References: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
In-Reply-To: <cover.1417018567.git.akuster808@gmail.com>
References: <cover.1417018567.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/11] package_manager: DpkgPM fix populate_sdk
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
X-List-Received-Date: Wed, 26 Nov 2014 16:22:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linux.intel.com>

DpkgPM change all_arch_list variable set from PACKAGE_ARCHS to passed
archs variable because is different when is executed from rootfs.py
and sdk.py.

Credits to: Ricardo Ribalda <ricardo.ribalda@gmail.com>

(From OE-Core rev: f6fb8c16f49fd9a2b124ad55f5c4fed82d7e6dca)

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 27fdf26..19895e5 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1477,7 +1477,7 @@ class DpkgPM(PackageManager):
 
         self.apt_args = d.getVar("APT_ARGS", True)
 
-        self.all_arch_list = self.d.getVar('PACKAGE_ARCHS', True).split()
+        self.all_arch_list = archs.split()
         all_mlb_pkg_arch_list = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
         self.all_arch_list.extend(arch for arch in all_mlb_pkg_arch_list if arch not in self.all_arch_list)
 
-- 
1.9.1


