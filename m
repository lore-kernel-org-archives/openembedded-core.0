Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TQeUc-00084d-As
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 15:26:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9NDCZsA003696
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 06:12:35 -0700 (PDT)
Received: from usp-ub10.wrs.com (128.224.163.69) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 23 Oct 2012 06:12:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Oct 2012 21:12:45 +0800
Message-ID: <de1bae26d8fc791feee90a783897231c8c6df227.1350996778.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1350996778.git.liezhi.yang@windriver.com>
References: <cover.1350996778.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] nativesdk-ncurses 5.9: files were installed but not shipped
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 13:26:02 -0000
Content-Type: text/plain

There is an warning:

$ bitbake nativesdk-ncurses

WARNING: QA Issue: nativesdk-ncurses: Files/directories were installed
but not shipped
  /opt/poky/1.3+snapshot/sysroots/i686-pokysdk-linux/usr/bin/clear.ncurses
  /opt/poky/1.3+snapshot/sysroots/i686-pokysdk-linux/usr/bin/reset.ncurses
NOTE: Tasks Summary: Attempted 533 tasks of which 521 didn't need to be
rerun and all succeeded.

And there is no clear or reset tool in the SDK.

This is caused by:
ALTERNATIVE_ncurses-tools = "clear reset"

It creates clear.ncurses and reset.ncurses which are used for avoiding
the conflicts with the target busybox, but SDK doesn't need them since
there is no nativesdk-busybox (then no conflicts), so:

ALTERNATIVE_ncurses-tools_class-target = "clear reset"

will fix the problem.

[YOCTO #3325]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index ed7f001..cce080d 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r11"
+INC_PR = "r12"
 
 inherit autotools binconfig multilib_header
 
@@ -218,7 +218,7 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_ncurses-tools = "clear reset"
+ALTERNATIVE_ncurses-tools_class-target = "clear reset"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.1



