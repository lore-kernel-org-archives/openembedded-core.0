Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A9306B30D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 03:02:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBD321Cm026106
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 19:02:11 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 12 Dec 2018 19:01:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2018 11:19:28 +0800
Message-ID: <337e1401f58bfb235b34e6113834a51048853090.1544671104.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544671104.git.liezhi.yang@windriver.com>
References: <cover.1544671104.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lib/oe/utils: Set stderr for host_gcc_version()
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
X-List-Received-Date: Thu, 13 Dec 2018 03:02:21 -0000
Content-Type: text/plain

Fixed:
$ ln -s /usr/bin/ccache /folk/lyang1/bin/gcc
$ rm -fr tmp/hosttools/ && bitbake -p
[snip]
ERROR: Error running gcc  --version:

It didn't print the error message, now it is:
ERROR: Error running gcc  --version: ccache: error: Could not find compiler "gcc" in PATH

For the error itself, it is because ccache is not in my HOSTTOOLS, so this is
an expected error.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/utils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 8a584d6..29b4115 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -366,7 +366,8 @@ def host_gcc_version(d, taskcontextonly=False):
     try:
         env = os.environ.copy()
         env["PATH"] = d.getVar("PATH")
-        output = subprocess.check_output("%s --version" % compiler, shell=True, env=env).decode("utf-8")
+        output = subprocess.check_output("%s --version" % compiler, \
+                    shell=True, env=env, stderr=subprocess.STDOUT).decode("utf-8")
     except subprocess.CalledProcessError as e:
         bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
 
-- 
2.7.4


