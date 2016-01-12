Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 59D2B65CC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 07:19:19 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id tr5so28890952obc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YOMDr3d/8Jjr0OWGe2OcTN9iNTXQJ+b59kSaVZUFP/4=;
	b=HtUlZZS0bIsddzC7B1p5rOJcxJ/ZNdHV6aV43aTtlsDfnzFIxuHDmB1BvuOiDuFl4F
	8zR879ll0cp6pGYadA5iXigoUtqGU14FRD2BwJCG7ip4zRm4iWFQmej4yGXllH6L56+o
	ls+2JaNuK+1PbFdj9xwlKKEvc1kbomql2JmBjhs50Nq/Rh//Ppbwm23Ni3Goid2EgNhk
	jOe3Ml/I+ALT3AOPLK+ch0Dovl99SkAdJnT2+wNIa8VpojuV2pQhUW94ir4QnsbtUyDL
	ImeganyOB1JSWxCX9u/kmGmgGA3G+n9f5fr0y/bSNDX/Z6NvmrwJqN4XAV7+GjvECheQ
	5NTw==
X-Received: by 10.182.28.33 with SMTP id y1mr88011136obg.53.1452583160704;
	Mon, 11 Jan 2016 23:19:20 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	d2sm49992973oic.12.2016.01.11.23.19.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jan 2016 23:19:19 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 23:18:34 -0800
Message-Id: <1452583117-812-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
References: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/5] strace: fix --disable-aio configure option
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
X-List-Received-Date: Tue, 12 Jan 2016 07:19:20 -0000

Remove the original unconditional check for libaio.h,
since it's included in the newly added conditional check.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../strace/strace/strace-add-configure-options.patch       | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
index a3f8ec4..84b9f9c 100644
--- a/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
+++ b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
@@ -12,7 +12,19 @@ diff --git a/configure.ac b/configure.ac
 index e73958c..9099370 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -745,6 +745,20 @@ if test "x$ac_cv_lib_dl_dladdr" = xyes;
+@@ -303,11 +303,6 @@ AC_CHECK_MEMBERS([struct sysinfo.totalhi
+ 
+ AC_CHECK_TYPES([struct flock64],,, [#include <fcntl.h>])
+ 
+-AC_CHECK_HEADERS([libaio.h], [
+-	AC_CHECK_MEMBERS([struct iocb.u.c.flags],,, [#include <libaio.h>])
+-	AC_CHECK_DECLS([IO_CMD_PWRITE, IO_CMD_PWRITEV],,, [#include <libaio.h>])
+-])
+-
+ AC_CHECK_HEADERS([linux/input.h], [
+ 	AC_CHECK_MEMBERS([struct input_absinfo.resolution],,, [#include <linux/input.h>])
+ ])
+@@ -745,6 +740,20 @@ if test "x$ac_cv_lib_dl_dladdr" = xyes;
  fi
  AC_SUBST(dl_LIBS)
  
-- 
1.9.1


