Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id A180577032
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:48:29 +0000 (UTC)
Received: by iofh134 with SMTP id h134so25109852iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 08:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=QHdLthet7S45FxGstxiKEtSBZg7b/dihIpdUNt2823I=;
	b=E6u5PAru1GlHVWZqwAJLgGj85W/B6t2UAMaQoZSorThrN7sYeI2KdxSWaGaKXTSycE
	7o06UK/JJBej19bIWRh99lFl1CB32qzdtkRb7KVQby2UUH0q+YssFthjZzPeGhzlRxaT
	ZEjtLJUwa+h1wYuq/CLQ1bsal0JBBCQ6cIOTSD/fCsojrDrvJqheusXry9FCaYff32X/
	iTw4juUmSb+gcdaLzzuTeKm5xFnBZXDKovw4NtblLamAg9JrLuOMd10t/PPMgzG+sWsu
	Z+SBIWBfxvNAGCYmSnRVJCtZkyUEVfyucAzzALAK1YuGt4s7NtmZ3BR6BYf0d0sy3FCA
	AECw==
X-Gm-Message-State: ALoCoQnzdHYocRTt2WDeWJEhFpTyn7Q7kzfqhykETCatqosqIJCrvYHSqjTZyJ/o5VlLCiH3DLIp
X-Received: by 10.107.130.156 with SMTP id m28mr41805228ioi.56.1441208909871; 
	Wed, 02 Sep 2015 08:48:29 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FD7A.dip0.t-ipconnect.de.
	[93.232.253.122]) by smtp.gmail.com with ESMTPSA id
	o189sm17258398ioe.30.2015.09.02.08.48.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 08:48:29 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 17:48:39 +0200
Message-Id: <088162677a90e58e765514901920567a47c32a17.1441207840.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
References: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
Subject: [PATCH 03/10] initramfs-framework: handle kernel parameters with . inside
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
X-List-Received-Date: Wed, 02 Sep 2015 15:48:30 -0000

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


