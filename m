Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E37447F921
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Dec 2019 07:01:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBP71E90027788
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2019 23:01:14 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 24 Dec 2019 23:01:14 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Dec 2019 15:01:13 +0800
Message-ID: <20191225070113.25133-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] base.bbclass: clean up dead symlink when handling hosttools
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
X-List-Received-Date: Wed, 25 Dec 2019 07:01:14 -0000
Content-Type: text/plain

When some hosttool is a dead symlink, bitbake any recipe will
fail with error like below.

  FileExistsError: [Errno 17] File exists: '/usr/bin/chrpath' -> '/path/to/builddir/tmp-glibc/hosttools/chrpath'

So we remove dead symlink under hostools/ directory to avoid
such error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/base.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 2fdab74f4b..3db8527d04 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -127,6 +127,9 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
     for tool in tools:
         desttool = os.path.join(dest, tool)
         if not os.path.exists(desttool):
+            # clean up dead symlink
+            if os.path.islink(desttool):
+                os.unlink(desttool)
             srctool = bb.utils.which(path, tool, executable=True)
             # gcc/g++ may link to ccache on some hosts, e.g.,
             # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
-- 
2.17.1


