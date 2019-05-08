Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B86C6D666
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 03:05:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4835lDh020142
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 May 2019 20:05:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 7 May 2019 20:05:40 -0700
From: <mingli.yu@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2019 11:05:39 +0800
Message-ID: <20190508030539.448075-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <5CD13414.9060408@windriver.com>
References: <5CD13414.9060408@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v3] glib-2.0: fix ptest failures
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
X-List-Received-Date: Wed, 08 May 2019 03:05:50 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Install 7 translation packages to fix 7 ptest
  failures such as:
  | GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1477:test_non_utf8_printf: assertion failed (__p == ("10\346\234\210")): ("Oct" == "10\346\234\210")
  | GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1716:test_month_names: assertion failed (p_casefold == (o_casefold)): ("nov" == "stu")
  | GLib:ERROR:../glib-2.58.3/glib/tests/gdatetime.c:1731:test_month_names: assertion failed (p_casefold == (o_casefold)): ("jul" == "liep.")

* Increase the timeout to 15 minutes as the default
  timeout which is 5 minutes is not enough to fix below error:
  | Executing: glib/actions.test
  | Test timed out after 300 seconds
  | cleaning up pid 13050
  | FAIL: glib/actions.test (Child process killed by signal 9)

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest | 2 +-
 meta/recipes-core/glib-2.0/glib.inc           | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
index 8f082d34f6..893125d772 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -2,5 +2,5 @@
 
 set -eux
 useradd glib2-test
-su glib2-test -c gnome-desktop-testing-runner glib
+su glib2-test -c "gnome-desktop-testing-runner glib -t 900"
 userdel glib2-test
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 574bb38557..1e8fea2df1 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -152,6 +152,13 @@ RDEPENDS_${PN}-ptest += "\
             tzdata-europe \
             tzdata-posix \
             shared-mime-info \
+            ${PN}-locale-ja \
+            ${PN}-locale-fr \
+            ${PN}-locale-el \
+            ${PN}-locale-hr \
+            ${PN}-locale-lt \
+            ${PN}-locale-pl \
+            ${PN}-locale-ru \
            "
 
 RDEPENDS_${PN}-ptest_append_libc-glibc = "\
-- 
2.18.1


