Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 53BD760E07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 21:03:43 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id r15so1209429ead.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=mQvx/IpVq+3LmUm2vKr7jTDXhL6esI9xDb5qCUE1VIQ=;
	b=upt/2pvPvlQEQMaY5hVJe8Wrt7Txz0Q98ffwymHsm7Xxn4FvFNd1I54H9dYt9/6A5+
	CtX9JLlmeOaVdwi8K2zpZqMciM5yO3fEpnJz+fTVKimfzvQDkXZpxc9YBNhmUYUizd9q
	PBjeZseMHvep9stxcQEupxarcJB1PcFwjzlt/nzECXLsvmh3LpxlOn7Y6qDEfL7WQYZY
	yO9QxOP4DdFhPBjNuv2zERlvLkeR0QbPiUFKZdtH7CdX9wiv+xtq7LejU646jGzhCU2P
	K7hbTXL9ghOyztEHhArvL26gJ0h3a8SGP8oh4AoQnERqpMwkOvxv8bQRFcnDXoIQeMGm
	fR0A==
X-Received: by 10.14.207.194 with SMTP id n42mr163123eeo.76.1391029423965;
	Wed, 29 Jan 2014 13:03:43 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 46sm13555286ees.4.2014.01.29.13.03.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jan 2014 13:03:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 22:03:43 +0100
Message-Id: <b32992acfd3d49985f050d614681164b74e6f92b.1391027849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391027849.git.Martin.Jansa@gmail.com>
References: <cover.1391027849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391027849.git.Martin.Jansa@gmail.com>
References: <cover.1391027849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] sstate-cache-management.sh: don't remove all packagedata sstate archives
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
X-List-Received-Date: Wed, 29 Jan 2014 21:03:43 -0000

* packagedata task was introduced in:
  commit 6107ee294afde395e39d084c33e8e94013c625a9
  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
  Date:   Wed Jan 23 14:27:33 2013 +0000
  Subject: Split do_packagedata task from do_package
* rm_by_stamps wasn't using do_packagedata or do_packagedata_setscene
  stamp files to find which sstate archives to keep, so it was removing
  all of them

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 0d71bfe..34483d0 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -320,7 +320,7 @@ rm_by_stamps (){
   local all_sums
 
   suffixes="populate_sysroot populate_lic package_write_ipk \
-            package_write_rpm package_write_deb package deploy"
+            package_write_rpm package_write_deb package packagedata deploy"
 
   # Figure out all the md5sums in the stamps dir.
   echo -n "Figuring out all the md5sums in stamps dir ... "
-- 
1.8.5.3


