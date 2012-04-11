Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SHqv4-0007xl-It
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 08:20:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3B6BMPO005060
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 23:11:23 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 10 Apr 2012 23:11:22 -0700
Message-ID: <c029961dba1927336453127d856d38961a52b641.1334124374.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1334124374.git.xiaofeng.yan@windriver.com>
References: <cover.1334124374.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 11 Apr 2012 13:46:33 +0800
Date: Wed, 11 Apr 2012 14:15:17 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] archiver.bbclass: Amend the problem for moving tarballs in ${DL_DIR} to ${DEPLOY_DIR}/source when enable archiver
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 06:20:43 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

When running "bitbake core-imamge-minmal", the error information like the following  will appear:
ERROR: Error executing a python function in
/buildarea2/yzhao-test/poky-test/meta/recipes-core/zlib/zlib_1.2.6.bb:
IOError: [Errno 2] No such file or directory:
'/buildarea2/yzhao-test/poky-test/build-archive/downloads/zlib-1.2.6.tar.bz2'

An absolute path from variable "file" pointed to tarballs in ${DL_DIR} \
cause this problem. So return base-name of "file" for fixing this bug here.

[YOCTO #2272]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/archiver.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 4e4e964..59b58f4 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -173,6 +173,7 @@ def archive_sources(d,stage_name):
 	file = get_source_from_downloads(d,stage_name)
 	if file:
 		shutil.copy(file,work_dir)
+		file = os.path.basename(file)
 	else:
 		file = archive_sources_from_directory(d,stage_name)
 	return file
-- 
1.7.0.4



