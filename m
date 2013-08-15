Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 640D46B8E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:09 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so183697eek.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=/EGwKElT2BK6MQkZkC03AW325XrvPNmVU1IOlYYrejU=;
	b=ZzgQQtaeQbHn1IN5itHgmCdt6DJg3+DY13Q3NbWAyvMoLED9vEg/zDTXMmEDv64Tcx
	UMHUTG7OleE5VyLP0/gsT0rkW+txnNQ5C1TUL1R8r7d5WslOcxZN4TBn5cSMHjOICr8k
	w+JLJwLTDwGKq3hydmLFXWVAKsU6NM1xDUB8dE0ueoEj5SvKRvEwoaQ6IMClHom0ZXF7
	WM7QF/3YG+985FOd4nylS9ujxWuvadJU2uEVQ4rHjQ+FEJ0M6yTOWlGsshLmcjl998A6
	h3FA8X5+QxK5fpj+TfI/QyyhXxMyIcsyJSdnfVeqQc0aGrDe7xyf6hzYodbtLFgEBZm1
	9+Ng==
X-Received: by 10.14.102.72 with SMTP id c48mr2832062eeg.52.1376551389860;
	Thu, 15 Aug 2013 00:23:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k3sm82027375een.16.2013.08.15.00.23.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:24 +0200
Message-Id: <0275b7e11cd063265368f93bce7c365738197861.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 13/33] gcc: add build directory to include directories
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:09 -0000

From: "Roy.Li" <rongqing.li@windriver.com>

Add build directory to include directories by -I${B}/include which will
be searched before standard system include directories.

Both libunwind and gcc supply unwind.h, once gcc use libunwind's unwind.h,
the compiling will fail.

This patch is generally not applicable to the upstream as they do not
use libunwind.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc_4.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc_4.7.bb b/meta/recipes-devtools/gcc/gcc_4.7.bb
index 9954375..f68c67a 100644
--- a/meta/recipes-devtools/gcc/gcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.7.bb
@@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
 
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
-- 
1.8.3.2


