Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id A555572E77
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:52 +0000 (UTC)
Received: by pdbfp1 with SMTP id fp1so8541499pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oUV+Z9znI5jdg/wOd5a5Eautf3iXqCMtA2rO/Bgz+uA=;
	b=h4dxm7+Y6mdLWgkUFbWN3DRcRShKq0a/JJ3c5L5PH9wkN4OnbioV2fuLTEjga1IOSY
	SaAqTGkKvqk1F6NJyLmQ/dBkwUtBVSGTRYPIWlywvi/94m2wCOKukxZ8U0MekVod1Xvy
	Lk+vv21TWKCkea+GX6ekH4JfiIIX9xEvbKujranzVqeQb9ATGXRwXzxNfuyodj/oSLoY
	d5KFHnb3Q1rYCCiCXFsrRvSg9AoI4Wzsz9RDcJzdzQGvPJgzmePuB95TFdb2mqaKQEGQ
	JW4K68ifZc3bk3ExsbYVWHktv9wbDeFMRK+U+mkB3NU7Jr+SReXBltSoQLLJcodUkUt8
	pypQ==
X-Received: by 10.66.140.39 with SMTP id rd7mr5864543pab.25.1423152353980;
	Thu, 05 Feb 2015 08:05:53 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:58 -0800
Message-Id: <17dadeb400a21b4457a408449a0466cdec93aefd.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 50/61] yocto-bsp: Add branch to SRC_URI for custom kernels
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:52 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Without 'branch' in the SRC_URI, a SRCREV specified for a non-master
KBRANCH will result in a fetch failure since the branch tested by the
fetcher will default to master, which doesn't contain the SRCREV.
This fixes the problem by adding branch=KBRANCH to the SRC_URI.

Fixes [Yocto #6518].

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{{ if kernel_choice == \"custom\": }} linux-yocto-custom.bb"      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git "a/scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/{{ if kernel_choice == \"custom\": }} linux-yocto-custom.bb" "b/scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/{{ if kernel_choice == \"custom\": }} linux-yocto-custom.bb"
index 6d3cc6f..c85e731 100644
--- "a/scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/{{ if kernel_choice == \"custom\": }} linux-yocto-custom.bb"	
+++ "b/scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/{{ if kernel_choice == \"custom\": }} linux-yocto-custom.bb"	
@@ -31,9 +31,9 @@ inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
 
 {{ if kernel_choice == "custom" and custom_kernel_remote == "y": }}
-SRC_URI = "{{=custom_kernel_remote_path}};protocol=git;bareclone=1"
+SRC_URI = "{{=custom_kernel_remote_path}};protocol=git;bareclone=1;branch=${KBRANCH}"
 {{ if kernel_choice == "custom" and custom_kernel_remote == "n": }}
-SRC_URI = "git://{{=custom_kernel_local_path}};protocol=file;bareclone=1"
+SRC_URI = "git://{{=custom_kernel_local_path}};protocol=file;bareclone=1;branch=${KBRANCH}"
 
 SRC_URI += "file://defconfig"
 
-- 
1.9.1


