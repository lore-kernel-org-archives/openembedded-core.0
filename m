Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED487E4FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 15:53:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8NFqnjT032505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 08:52:59 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 23 Sep 2019 08:52:38 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Sep 2019 11:52:38 -0400
Message-ID: <20190923155238.31958-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] python3-subunit: ensure runtime dependencies are present
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
X-List-Received-Date: Mon, 23 Sep 2019 15:53:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Without access to unittest, subunit cannot be imported in python3:

    root@qemux86-64:~# python3
    Python 3.7.4 (default, Sep 20 2019, 13:38:31)
    [GCC 9.2.0] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import subunit
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
      File "/usr/lib/python3.7/site-packages/subunit/__init__.py", line 123, in <module>
        import unittest
    ModuleNotFoundError: No module named 'unittest'
    >>>

Adding python3-testtools to python3-subunit's RDEPENDS fixes the
issue. This also implicitly provides the functionality found in
the python3-extras module.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-devtools/python/python3-subunit_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-subunit_1.3.0.bb b/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
index 2ece4451df..55066e2d0f 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.3.0.bb
@@ -1,2 +1,4 @@
 inherit setuptools3
 require python-subunit.inc
+
+RDEPENDS_${PN} = " python3-testtools"
-- 
2.21.0


