Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 818227BFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:01:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBI71LD5014048
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 23:01:31 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:01:11 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2018 15:18:06 +0800
Message-ID: <3227aab946c35414d1638abe602cc986129c1e2d.1545102457.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545102457.git.liezhi.yang@windriver.com>
References: <cover.1545102457.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 06/11] ccache.bbclass: Set CCACHE_CONFIGPATH to fix race issues
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
X-List-Received-Date: Tue, 18 Dec 2018 07:01:40 -0000
Content-Type: text/plain

Fixed race issues when parallel build:
ccache: error: /path/to/ccache/i586-poky-linux/mmc-utils/ccache.conf: No such file or directory
ccache: error: /path/to/ccache/i586-poky-linux/mmc-utils/ccache.conf: No such file or directory

This is because we set CCACHE_DIR for earch recipe, and ccache will create a
ccache.conf for each CCACHE_DIR when CCACHE_CONFIGPATH is not set, but there
might be a race issue in parallel build:

ccache gcc file1.c
ccache gcc file2.c

If the two ccache processes use fopen(path, "w") to create ccache.conf at the
same time, the error would happen. Set CCACHE_CONFIGPATH to
meta/conf/ccache.conf can fix the problem, and we can add other configs to the
file when needed.

And also set cache_dir_levels to 1 (default is 2) since each recipe has a cache
dir, thus we don't have too many files in one dir.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/ccache.bbclass | 2 ++
 meta/conf/ccache.conf       | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 meta/conf/ccache.conf

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index fb3fbdf..b545735 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -29,6 +29,8 @@ export CCACHE_BASEDIR ?= "${TMPDIR}"
 # Used for sharing cache files after compiler is rebuilt
 export CCACHE_COMPILERCHECK ?= "%compiler% -dumpspecs"
 
+export CCACHE_CONFIGPATH ?= "${COREBASE}/meta/conf/ccache.conf"
+
 export CCACHE_DIR ?= "${CCACHE_TOP_DIR}/${MULTIMACH_TARGET_SYS}/${PN}"
 
 # We need to stop ccache considering the current directory or the
diff --git a/meta/conf/ccache.conf b/meta/conf/ccache.conf
new file mode 100644
index 0000000..931012d
--- /dev/null
+++ b/meta/conf/ccache.conf
@@ -0,0 +1,2 @@
+max_size = 0
+cache_dir_levels = 1
-- 
2.7.4


