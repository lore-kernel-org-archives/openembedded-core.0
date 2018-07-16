Return-Path: <Rui.Wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 02F21606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 02:55:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6G2tFwa001552
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 19:55:15 -0700 (PDT)
Received: from pek-rwang4-d1.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 15 Jul 2018 19:55:14 -0700
From: Rui Wang <rui.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jul 2018 10:55:08 +0800
Message-ID: <1531709708-13389-1-git-send-email-rui.wang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] bash: fix wrong exit status offset
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
X-List-Received-Date: Mon, 16 Jul 2018 02:55:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In Linux，8 bits of the return code and 8 bits of the number of
the killing signal are mixed into a single value on the exit code,
so the exit status offset should be 8. But the autoconf checker
can not determine it while cross compiling, and then it is set to
the default value 0, which will cause generating the wrong exit
code if program exit with an error code.

Signed-off-by: Rui Wang <rui.wang@windriver.com>
---
 meta/recipes-extended/bash/bash.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index f4e1f7a11f..ada9f51ca2 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -7,7 +7,7 @@ DEPENDS = "ncurses bison-native virtual/libiconv"
 inherit autotools gettext texinfo update-alternatives ptest
 
 EXTRA_AUTORECONF += "--exclude=autoheader --exclude=aclocal"
-EXTRA_OECONF = "--enable-job-control --without-bash-malloc"
+EXTRA_OECONF = "--enable-job-control --without-bash-malloc bash_cv_wexitstatus_offset=8"
 
 # If NON_INTERACTIVE_LOGIN_SHELLS is defined, all login shells read the
 # startup files, even if they are not interactive.
-- 
2.13.3


