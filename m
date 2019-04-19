Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE26F7D2AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 08:54:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3J8s4Cb013369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 01:54:04 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Fri, 19 Apr 2019 01:54:04 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Apr 2019 16:54:03 +0800
Message-ID: <1555664043-329543-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] glib-2.0: fix ptest failures
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
X-List-Received-Date: Fri, 19 Apr 2019 08:54:03 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Set G_TEST_BUILDDIR to mark we run the tests
  out of builddir to make it can skip the test_non_utf8_printf
  to fix below test error as test_non_utf8_printf needed
  to run under builddir per https://gitlab.gnome.org/GNOME/glib/blob/master/glib/tests/gdatetime.c#L1440.
  | GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1477:test_non_utf8_printf: assertion failed (__p == ("10\346\234\210")): ("Oct" == "10\346\234\210")
  | Bail out! GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1477:test_non_utf8_printf: assertion failed (__p == ("10\346\234\210")): ("Oct" == "10\346\234\210")
  | FAIL: glib/gdatetime.test (Child process killed by signal 6)

* Increase the timeout to 15 minute to fix below
  error as the default timeout which is 5 minutes
  is not enough.
  | Executing: glib/actions.test
  | Test timed out after 300 seconds
  | cleaning up pid 13050
  | FAIL: glib/actions.test (Child process killed by signal 9)

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
index 8f082d3..e4777da 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -1,6 +1,8 @@
 #! /bin/sh
 
+# set G_TEST_BUILDDIR to mark the tests running out of the builddir
+export G_TEST_BUILDDIR=$(pwd)
 set -eux
 useradd glib2-test
-su glib2-test -c gnome-desktop-testing-runner glib
+su glib2-test -c "gnome-desktop-testing-runner glib -t 900"
 userdel glib2-test
-- 
2.7.4


