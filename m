Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEFE173F63
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 03:36:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t483aJkf000779
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 May 2015 20:36:19 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 7 May 2015 20:36:18 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 7 May 2015 23:36:14 -0400
Message-ID: <e00aaebb226437347b07442d019c458a290c1269.1431055930.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431055930.git.bruce.ashfield@windriver.com>
References: <cover.1431055930.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto: fix race between checkout and meta data generation
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
X-List-Received-Date: Fri, 08 May 2015 03:36:18 -0000
Content-Type: text/plain

There are two tasks that must run before a linux-yocto kernel is built.

  - Kernel checkout and relocation to work-shared (kernel_checkout)
  - Meta data gathering and configuration prep (kernel_metadata)

The current task definitions for both are simply "before do_patch",
which is correct, but kernel_checkout must run before and not race with
kernel_metadata.

So we set the definition of kernel_checkout to be more specific and
enforce the proper ordering.

[YOCTO: #7731]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 650ae5a4736b..0dd5b4851361 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -259,7 +259,7 @@ do_kernel_checkout() {
 }
 do_kernel_checkout[dirs] = "${S}"
 
-addtask kernel_checkout before do_patch after do_unpack
+addtask kernel_checkout before do_kernel_metadata after do_unpack
 addtask kernel_metadata after do_validate_branches before do_patch
 do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
 
-- 
2.1.0


