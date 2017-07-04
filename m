Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC52E60119
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 03:06:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6436ImU017603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Jul 2017 20:06:18 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 3 Jul 2017 20:06:17 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 3 Jul 2017 23:06:14 -0400
Message-ID: <04c5aaea9dba132ab0928e5c7778cf91ee1beb45.1499137428.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1499137428.git.bruce.ashfield@windriver.com>
References: <cover.1499137428.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] kernel-yocto: propagate configuration errors to bbclass
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
X-List-Received-Date: Tue, 04 Jul 2017 03:06:19 -0000
Content-Type: text/plain

As pointed out by klapperichpaul@johndeere.com, missing configuration
fragments were being picked up twice, once by the tools and once by the
bbclass. Unfortunately, the tools error message was being detected as
configs, and hence no error was reported at all.

Rather than catching the output of the tools, we can instead check the
return code and propagate the error message from the tools directly to
the user.

[YOCTO #11649]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 50226f6d492e..1ca0756c4959 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -281,7 +281,8 @@ do_kernel_configme() {
 
 	meta_dir=$(kgit --meta)
 	configs="$(scc --configs -o ${meta_dir})"
-	if [ -z "${configs}" ]; then
+	if [ $? -ne 0 ]; then
+		bberror "${configs}"
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
 
-- 
2.5.0


