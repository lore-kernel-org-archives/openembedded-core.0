Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 865E777009
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 18:42:16 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so56245853igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 11:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=QHdLthet7S45FxGstxiKEtSBZg7b/dihIpdUNt2823I=;
	b=eS1LuR8u/adqeTZoekXCEBMj9731zs01g6LgfZdHPImFalEgCLXGwjBofbL41Vjl1o
	hMoUNUchVg+eQn367aRTh0qtD/B/W/GCUMRb7CgJ733gHTrs7SbMBu5dp32R6zRoEiUh
	xCMOdIvdiXUKLxtsG7U+Z0xjEN5VVfWt7F+/apaGt8cw0KXccHUweoSj+Jw+HOq/aXm3
	5LYn0nkyAwmJDuHSZw4oOnRogQ+3q4bhG7cT/oy0z4WXnl/hCb2MD6xfFFohfpTk2N+D
	55WuFnjouzaobrVKQqWwM8uOK8fcghjoO0buGtpjywpjz93PgK1Z+p03fq1usJrt66u9
	X6fQ==
X-Gm-Message-State: ALoCoQnM4kWEHYu/eFqKjy+ExN4RC3Hkuo0mi98zjqibpuKKU441hPOawVdR50L8wOOQHPpbyFgx
X-Received: by 10.50.46.65 with SMTP id t1mr15410022igm.25.1441305737178;
	Thu, 03 Sep 2015 11:42:17 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5686C.dip0.t-ipconnect.de.
	[87.165.104.108])
	by smtp.gmail.com with ESMTPSA id cr1sm166136igb.15.2015.09.03.11.42.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Sep 2015 11:42:16 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 20:42:29 +0200
Message-Id: <f92b53737125c0c471a9ed45785f254a060e0715.1441305437.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
References: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441305437.git.patrick.ohly@intel.com>
References: <cover.1441305437.git.patrick.ohly@intel.com>
Subject: [PATCH 4/8] initramfs-framework: handle kernel parameters with . inside
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
X-List-Received-Date: Thu, 03 Sep 2015 18:42:17 -0000

Kernel parameters like "uvesafb.mode_option=640x480-32" were turned
into shell variables named "bootparam_uvesafb.mode_option", which
triggered errors from the shell because the name is not valid. Now
points get replaced with underscores, leading to
bootparam_uvesafb_mode_option in this example.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 95fa9fb..e8f4713 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -13,6 +13,7 @@
 #
 # 'foo=value' as 'bootparam_foo=value'
 # 'foo' as 'bootparam_foo=true'
+# 'foo.bar[=value] as 'foo_bar=[value|true]'
 
 # Register a function to be called before running a module
 # The hook is called as:
@@ -79,7 +80,7 @@ mount -t sysfs sysfs /sys
 # populate bootparam environment
 for p in `cat /proc/cmdline`; do
 	opt=`echo $p | cut -d'=' -f1`
-	opt=`echo $opt | sed -e 's/-/_/'`
+	opt=`echo $opt | tr '.-' '__'`
 	if [ "`echo $p | cut -d'=' -f1`" = "$p" ]; then
 		eval "bootparam_${opt}=true"
 	else
-- 
2.1.4


