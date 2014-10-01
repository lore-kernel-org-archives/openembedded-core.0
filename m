Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D910D7171F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 04:43:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s914hisk005838
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Sep 2014 21:43:44 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 30 Sep 2014 21:43:44 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Oct 2014 00:43:31 -0400
Message-ID: <92d7aacb33d52ca7bab053e435176acf60ad6086.1412137857.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1412137857.git.bruce.ashfield@windriver.com>
References: <cover.1412137857.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] kern-tools: fix overly greedy path relocations
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
X-List-Received-Date: Wed, 01 Oct 2014 04:43:51 -0000
Content-Type: text/plain

During patch processing a consolidated set of configs, patches and directives
is created under the kernel source tree being modified. During that processing,
absolutely paths are converted to relative. It has been found that if directories
are sufficiently similar, like so:

  /path/to/my-linux
  /path/to/my-linux-3.16

The processing will chop to much of some paths, resulting in invalid relative
directories (like -3.16 in the above example).

Importing the following two kern tools fixes for the issue:

  23345b8846fe kgit: retain trailing / in directory processing
  a8cf93a3bc94 kgit-s2q: move subject and diffstat mismatch to 'fuzzy' matching

[YOCTO: #6753]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index bca1decf7bd2..ce872354f23c 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native"
 
-SRCREV = "83f468ab8ef748a8880cba7d26779c35abfcc0bf"
+SRCREV = "23345b8846fe4bd167efdf1bd8a1224b2ba9a5ff"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
1.8.1.2


