Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 648A36013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 15:24:09 +0000 (UTC)
Received: by wgbgs4 with SMTP id gs4so11917851wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 08:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rCZc6MJnDo9bY0q31PveOYOX+cK580dZUIAAU4Q9N5s=;
	b=BNyKEc8DOeSoSNOtQraTiUHtxtNlGEhi5ajI9s+niyyWvzSuFlVAk9FapRB4AlKKSB
	tB+Qv54cYr7aGY8MqVvjAoU95MIaT5IIIXvuzVdZTJB0cWIN9MnLQMwOgC/0Hex4QbOQ
	hSTJL95X59YGz1EHTSVQGojwwj/vnhDsZLAPpYfI1iBzgmouEDKSef8ALG/4QH13OcbB
	5EHuwTZqPQmluXn8zcKRjop7jY2qIX9DbgWDyg1jkyyy5FK5yfk8pCEO6atrEbIp+/b2
	BxQ5qpzQuTO7T2UNa/5Hk9PV1aNSSxZ4GTvF1zXvJ4NqZ/rypVT2Mqf5XUdCRXc69Gm5
	6PGA==
X-Gm-Message-State: ALoCoQnivWXHar+Fa8PWKk14Y2DwSYJuyFFaRN7SEwXvwGzY1CjkDTMNYUkDlb31CrIKjZOEVCjb
X-Received: by 10.194.6.228 with SMTP id e4mr38238293wja.63.1427469850686;
	Fri, 27 Mar 2015 08:24:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id g2sm7682715wib.1.2015.03.27.08.24.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Mar 2015 08:24:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Mar 2015 15:21:01 +0000
Message-Id: <1427469661-14521-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1427469661-14521-1-git-send-email-ross.burton@intel.com>
References: <1427469661-14521-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] kernel-yocto: merge duplicate kernel_configme task definitions
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
X-List-Received-Date: Fri, 27 Mar 2015 15:24:14 -0000

The kernel_configme task was added twice (once in the .bbclass, one in a .inc)
with different ordering constraints.

Change this to be just one definition in the bbclass with the stronger ordering
constraints.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/kernel-yocto.bbclass         |    2 +-
 meta/recipes-kernel/linux/linux-yocto.inc |    2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index a1fbb51..650ae5a 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -289,7 +289,7 @@ do_kernel_configme() {
 	echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
 }
 
-addtask kernel_configme after do_patch
+addtask kernel_configme before do_configure after do_patch
 
 python do_kernel_configcheck() {
     import re, string, sys
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 5b69a49..3b41a61 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -32,8 +32,6 @@ KCONF_BSP_AUDIT_LEVEL ?= "0"
 
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-addtask kernel_configme before do_configure after do_patch
-
 # Pick up shared functions
 inherit kernel
 inherit kernel-yocto
-- 
1.7.10.4


