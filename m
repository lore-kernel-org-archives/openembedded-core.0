Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UJIQc-0000sH-QE
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 08:00:09 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so3367016pbc.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 23:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=4oF8kWagbHhmxP996yjxZxfDdWLArR7Xc9YB0PMyQDE=;
	b=cknxXqw9upRyh5FapUpOlfDwjge1A98pUs3M749rSviJk7CfKfeIG7k392FqbTuhuP
	DvW9CRadUZqGUODJ8ERg0HI75sVQGqbdPCr8IRJKDzAl4GTF83+S96DWa+jqqtVBjP0m
	SN4x7jBt9fG072oHx4GzeL3fhyUCwNpdtO/gC2QielmA1BkpmnzxxskoCSbioG5/Eptp
	OXn5VxQJ2KOl42ndUqqY/HxtBbgiF1u3wu9pJdKwJ2okdSV8AHVv3cU+NQzVV1v893+6
	e7Fx9ujkrVElDFtJJ3BXjxTZnnAiMhKcXaVBAANIQVkp7IaVl+ibUk6deC7bmg5M0ooN
	91Vg==
X-Received: by 10.68.247.72 with SMTP id yc8mr3686387pbc.23.1364020971178;
	Fri, 22 Mar 2013 23:42:51 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id rt13sm5909044pac.14.2013.03.22.23.42.49
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 23:42:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 23:42:25 -0700
Message-Id: <1364020945-22616-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libuser: Use abs_srcdir instead of srcdir
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
X-List-Received-Date: Sat, 23 Mar 2013 07:00:14 -0000
X-List-Received-Date: Sat, 23 Mar 2013 07:00:14 -0000

srcdir is still relative to pwd. We need to use
abs_srcdir to get absolute source directory names

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libuser/libuser/fixsepbuild.patch              |   27 +++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/libuser/libuser/fixsepbuild.patch b/meta/recipes-extended/libuser/libuser/fixsepbuild.patch
index 27e6bc6..893ca14 100644
--- a/meta/recipes-extended/libuser/libuser/fixsepbuild.patch
+++ b/meta/recipes-extended/libuser/libuser/fixsepbuild.patch
@@ -6,21 +6,30 @@ Upstream-Status: Pending
 
 RP 2013/03/21
 
-Index: libuser/docs/Makefile.am
+Index: libuser-0.58/docs/Makefile.am
 ===================================================================
---- libuser/docs.orig/Makefile.am	2012-11-08 02:25:58.000000000 +0000
-+++ libuser/docs/Makefile.am	2013-03-21 14:15:40.756950231 +0000
-@@ -13,9 +13,9 @@
- 		< $(srcdir)/libuser.conf.5.in > $@
+--- libuser-0.58.orig/docs/Makefile.am	2012-11-07 18:25:58.000000000 -0800
++++ libuser-0.58/docs/Makefile.am	2013-03-22 23:32:06.843518069 -0700
+@@ -8,14 +8,14 @@
  
- sgml/libuser.txt: $(srcdir)/sgml/libuser.sgml
+ all: sgml/libuser.txt sgml/libuser.html
+ 
+-libuser.conf.5: $(srcdir)/libuser.conf.5.in Makefile
++libuser.conf.5: $(abs_srcdir)/libuser.conf.5.in Makefile
+ 	sed 's,@sysconfdir\@,$(sysconfdir),g' \
+-		< $(srcdir)/libuser.conf.5.in > $@
++		< $(abs_srcdir)/libuser.conf.5.in > $@
+ 
+-sgml/libuser.txt: $(srcdir)/sgml/libuser.sgml
 -	[ -d sgml ] || mkdir sgml
 -	cd sgml; sgml2txt ../$(srcdir)/sgml/libuser.sgml
++sgml/libuser.txt: $(abs_srcdir)/sgml/libuser.sgml
 +	[ -d sgml ] || mkdir sgml || true
-+	cd sgml; sgml2txt $(srcdir)/sgml/libuser.sgml
++	cd sgml; sgml2txt $(abs_srcdir)/sgml/libuser.sgml
  
- sgml/libuser.html: $(srcdir)/sgml/libuser.sgml
+-sgml/libuser.html: $(srcdir)/sgml/libuser.sgml
 -	[ -d sgml ] || mkdir sgml
 -	cd sgml; sgml2html ../$(srcdir)/sgml/libuser.sgml
++sgml/libuser.html: $(abs_srcdir)/sgml/libuser.sgml
 +	[ -d sgml ] || mkdir sgml || true
-+	cd sgml; sgml2html $(srcdir)/sgml/libuser.sgml
++	cd sgml; sgml2html $(abs_srcdir)/sgml/libuser.sgml
-- 
1.7.9.5



