Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1SB6X9-0006Sn-3q
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 16:36:07 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id 44AE9F8126E; Fri, 23 Mar 2012 09:27:12 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 09:27:08 -0600
Message-Id: <1332516428-9675-3-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1332516428-9675-1-git-send-email-gary@mlbassoc.com>
References: <1332516428-9675-1-git-send-email-gary@mlbassoc.com>
Subject: [PATCH 2/2] python: Fix minimal packaging dependencies
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
X-List-Received-Date: Fri, 23 Mar 2012 15:36:07 -0000

If you install the top-level python package only on a minimal
system which has no other python packages installed then python
is not functional at all.  Without any extra packages installed
this error is seen:
  # python
  Traceback (most recent call last):
    File "/usr/lib/python2.7/site.py", line 64, in <module>
      import traceback
  ImportError: No module named traceback

Installing python-lang only partly fixes the problem as this
error still exists:
  # python
  Traceback (most recent call last):
    File "/usr/lib/python2.7/site.py", line 569, in <module>
      main()
    File "/usr/lib/python2.7/site.py", line 551, in main
      known_paths = addusersitepackages(known_paths)
    File "/usr/lib/python2.7/site.py", line 278, in addusersitepackages
      user_site = getusersitepackages()
    File "/usr/lib/python2.7/site.py", line 253, in getusersitepackages
      user_base = getuserbase() # this will also set USER_BASE
    File "/usr/lib/python2.7/site.py", line 243, in getuserbase
      USER_BASE = get_config_var('userbase')
    File "/usr/lib/python2.7/sysconfig.py", line 520, in get_config_var
      return get_config_vars().get(name)
    File "/usr/lib/python2.7/sysconfig.py", line 400, in get_config_vars
      import re
  ImportError: No module named re

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 8111b31..f1ba42d 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.8"
+PR = "${INC_PR}.9"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -123,6 +123,7 @@ py_package_preprocess () {
 require python-${PYTHON_MAJMIN}-manifest.inc
 
 # manual dependency additions
+RRDEPENDS_${PN} = "${PN}-lang ${PN}-re"
 RPROVIDES_${PN}-core = "${PN}"
 RRECOMMENDS_${PN}-core = "${PN}-readline"
 RRECOMMENDS_${PN}-crypt = "openssl"
-- 
1.7.7.6



