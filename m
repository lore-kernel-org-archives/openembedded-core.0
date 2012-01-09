Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RkLla-0003A3-5A
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 21:24:26 +0100
Received: by iakh37 with SMTP id h37so7054250iak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 12:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4jdGdTNcQizqrGnSJV4qLdCwj9hxVDPpVGwnf9Ir16A=;
	b=lHhmOGzQ0boHFtig/E9mZRyHYBdV2Z6GkVJ4jiAOO74fX56V0UjPY1txnfN8cL3j+Q
	Lv0YLN0zaKW+pFddDSbjx7hGYWZuqRjKWANUiVS7Izlzawipn7kOeVMGyarv01Seouwm
	GISkl/5y/Wzh7pXxWuUJ/LzFB2S6fq6H3JEL4=
Received: by 10.42.151.4 with SMTP id c4mr18907721icw.39.1326140212337;
	Mon, 09 Jan 2012 12:16:52 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id h9sm254620546ibh.11.2012.01.09.12.16.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 12:16:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 12:15:44 -0800
Message-Id: <46f981713711044dbe58d37d354a10c4fc9c6c27.1326140011.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <106d8165fbc1ba1063d46fe268fd8b2595d6d9b8.1326140011.git.raj.khem@gmail.com>
References: <106d8165fbc1ba1063d46fe268fd8b2595d6d9b8.1326140011.git.raj.khem@gmail.com>
In-Reply-To: <cover.1326140011.git.raj.khem@gmail.com>
References: <cover.1326140011.git.raj.khem@gmail.com>
Subject: [PATCH 7/7] util-linux: Enable fallocate and use CACHED_CONFIGUREVARS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jan 2012 20:24:26 -0000

fallocate is implemented in eglibc 2.11 and all eglibc
we use are greater than 2.11 so drop disabling it.

Use CACHED_CONFIGUREVARS to specify scanf_cv_type_modifier=as

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux_2.20.1.bb |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.20.1.bb b/meta/recipes-core/util-linux/util-linux_2.20.1.bb
index aa2c6ff..ed445d7 100644
--- a/meta/recipes-core/util-linux/util-linux_2.20.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.20.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.20"
-PR = "r1"
+PR = "r2"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -39,9 +39,7 @@ do_remove_lscpu() {
 
 addtask remove_lscpu before do_configure after do_patch
 
-# fallocate is glibc 2.10, fallocate64 is glibc 2.11
-# we need to disable it for older versions
-EXTRA_OECONF += "ac_cv_func_fallocate=no scanf_cv_type_modifier=as"
+CACHED_CONFIGUREVARS += "scanf_cv_type_modifier=as"
 EXTRA_OECONF_virtclass-native += "--disable-fallocate --disable-use-tty-group"
 
 do_install_append () {
-- 
1.7.5.4



