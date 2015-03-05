Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0FF773878
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 08:05:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t25860Kp008633
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Mar 2015 00:06:01 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 5 Mar 2015 00:06:00 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Mar 2015 16:06:03 +0800
Message-ID: <d0760019e61d2045c64c62684cf437a01c7f39da.1425542599.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1425542599.git.Qi.Chen@windriver.com>
References: <cover.1425542599.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dbus-test: make do_install run to trigger the effect of cleandirs flag
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
X-List-Received-Date: Thu, 05 Mar 2015 08:06:02 -0000
Content-Type: text/plain

For now, we would meet the following QA error if we build dbus-test in
the same build directory with multilib enabled/disabled.

The steps are as follows:
1. Enable multilib and `bitbake dbus-ptest'
2. Disable multilib and `bitbake dbus-ptest'

The error message is as follows:
ERROR: QA Issue: dbus-test: Files/directories were installed but not shipped
  /usr/lib64
  /usr/lib64/dbus-test
  /usr/lib64/dbus-test/ptest
  /usr/lib64/dbus-test/ptest/run-ptest
  ...

The problem is that the ${D} is not cleaned up at the second build while it
should be.

This patch fixes the above problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dbus/dbus-test_1.8.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dbus/dbus-test_1.8.10.bb b/meta/recipes-core/dbus/dbus-test_1.8.10.bb
index fb796fb..719c1f9 100644
--- a/meta/recipes-core/dbus/dbus-test_1.8.10.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.8.10.bb
@@ -44,6 +44,7 @@ EXTRA_OECONF = "--enable-tests \
                 ${EXTRA_OECONF_X}"
 
 do_install() {
+    :
 }
 
 do_install_ptest() {
-- 
1.9.1


