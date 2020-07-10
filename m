Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web11.3193.1594408093672816630
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 12:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=dtGP4qXe;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2330; q=dns/txt; s=iport;
  t=1594408093; x=1595617693;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e2FrO5fIzDGPZAIUZ5vM1opV54n5OqUntrICh/Rfpmo=;
  b=dtGP4qXeWvG7cjWwpSmW5/g+RyPOxi2ynkMqR98AHCAzT/AcpenXtL2b
   EsZjHNpfOBLv2em5URN0OeqXzl0FzCzrS0DDThN/cb7e6jypBK2qDHtFg
   V2fGhoa9c6GXS2oJLF1jo3fZfTiUbATQm1wFb5Ykfoe5mZTWiH9iAfLjV
   o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0A9AAC1uwhf/49dJa1gHQEBAQEJARI?=
 =?us-ascii?q?BBQUBgXYIAQsBgilvVAEyLIxUkwaKTYUtgX0LAQEBDAEBGxQEAQGETYIYAiQ?=
 =?us-ascii?q?0CQ4CAwEBCwEBBQEBAQIBBgRthVsMhigBRoE+E4MmAYJXJakUgiiJIIFAFIE?=
 =?us-ascii?q?kAYgBhG8agUE/hF+KMwSPLiuCJokNmQeBBIJnh1V6kHcPIJ8lAS2wJgIECwI?=
 =?us-ascii?q?VgVM6gVdwFYMkCUcZDZd0hREhAzA3AgYIAQEDCY92AQE?=
X-IronPort-AV: E=Sophos;i="5.75,336,1589241600"; 
   d="scan'208";a="510839550"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Jul 2020 19:08:12 +0000
Received: from localhost.localdomain ([10.24.63.201])
	(authenticated bits=0)
	by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPSA id 06AJ8Ba0031721
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 10 Jul 2020 19:08:12 GMT
From: "Taras Kondratiuk" <takondra@cisco.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, xe-linux-external@cisco.com,
        Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack
Date: Fri, 10 Jul 2020 12:08:10 -0700
Message-Id: <20200710190810.1967868-1-takondra@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: takondra@cisco.com
X-Outbound-SMTP-Client: 10.24.63.201, [10.24.63.201]
X-Outbound-Node: rcdn-core-7.cisco.com
Content-Transfer-Encoding: 8bit

'devtool modify' fails for packages that inherit python3native (e.g.
gpgme or systemd, via meson class):
| Exception: ModuleNotFoundError: No module named '_sysconfigdata'

After commit 02714c105426 ("python3: upgrade to 3.7.2") python3native
class exports _PYTHON_SYSCONFIGDATA_NAME = '_sysconfigdata'. I think the
expectation is that it will find
usr/lib/python-sysconfigdata/_sysconfigdata.py prepared by the same
commit. But some places seems to still use host python3 which doesn't
have _sysconfigdata.py. This leads to "No module named '_sysconfigdata'"
errors. E.g. commit 4b26eaf7152f ("prservice.py: fix do_package with
newer Python in Ubuntu 20.04") recently tried to workaround it for PR
service. And now we see similar issue in devtool. To unblock devtool
apply similar workaround here.

But looks like there is some deeper issue here. I haven't fully grasped
the purpose of _sysconfigdata.py yet. It is copied from
_sysconfigdata_m_linux_x86_64-linux-gnu.py and then some variables are
modified. But new values seems to be wrong. For example:
In _sysconfigdata_m_linux_x86_64-linux-gnu.py:
'INCLUDEPY': 'FIXMESTAGINGDIRHOST/usr/include/python3.7m',
While in _sysconfigdata.py:
'INCLUDEPY': 'FIXMESTAGINGDIRHOSTFIXMESTAGINGDIRHOST/usr/include/python3.7m',

When FIXMESTAGINGDIRHOST is replaces by staging.bbclass, the path in
_sysconfigdata.py points to nowhere while
_sysconfigdata_m_linux_x86_64-linux-gnu.py has a correct path.

Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
---
 meta/classes/devtool-source.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 280d6009f3c2..4a469bfacad7 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -65,6 +65,11 @@ python() {
 
 
 python devtool_post_unpack() {
+    # Otherwise this fails when called from recipes which e.g. inherit
+    # python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with: No module
+    # named '_sysconfigdata'
+    if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
+        del os.environ['_PYTHON_SYSCONFIGDATA_NAME']
     import oe.recipeutils
     import shutil
     sys.path.insert(0, os.path.join(d.getVar('COREBASE'), 'scripts', 'lib'))
-- 
2.25.1

