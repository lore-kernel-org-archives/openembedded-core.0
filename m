Received: from mail-pd0-f181.google.com ([209.85.192.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNQvh-0004Mb-Kd
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 18:52:58 +0200
Received: by mail-pd0-f181.google.com with SMTP id y10so943273pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 09:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=dpwSJuamRXzqnbKn/IXWlFS73Pa2kKyZdrycHj7aEc4=;
	b=IpIxZO6i0wgpQ1SwTUxpJ5HHedEb73jK+NiKqo3yLbZwL4eELg7rk4BtE6dZZq3xFs
	TSuvvTWqC85hwEWmJK377LYfZsZHPVW2Lti7jbVwMGhUDM9rTeDIRELYEgGLkyHFuAWD
	tGG46IMLWLkEkNAq3GMxHlDKYcW2tHDmMlELXRvZWQrSj0YZ1cd8JYjWIr4p33USAj++
	LJQ63uFGnE0NYtU7kVTwUWEKApZH2oSdKfeUiVZnQooytZyPRje8tBAWVwRub8bFKZcB
	6eWc0p1SkfFgIeZyev/mpAYl9/skJ+DMr1GekUKEVLQeJF+8/ixH89sHaOUpxrOCn0nV
	SYKg==
X-Received: by 10.66.176.205 with SMTP id ck13mr4330427pac.50.1365006945503;
	Wed, 03 Apr 2013 09:35:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ef3sm7555758pad.20.2013.04.03.09.35.42
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 09:35:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 18:35:40 +0200
Message-Id: <1365006940-3863-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] rm_work: keep do_fetch, do_write_srcrev stamps
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
X-List-Received-Date: Wed, 03 Apr 2013 16:53:03 -0000

* otherwise do_fetch/do_write_srcrev/do_rmwork is reexecuted for each recipe included in image
  on every build

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rm_work.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 1642af7..2d0eb1b 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -60,6 +60,14 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
+            *do_fetch*)
+                i=dummy
+                break
+                ;;
+            *do_write_srcrev*)
+                i=dummy
+                break
+                ;;
             *do_build*)
                 i=dummy
                 break
-- 
1.8.1.5



