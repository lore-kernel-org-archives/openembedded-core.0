Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKPzL-0002Cw-Ac
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Oct 2011 08:39:27 +0100
Received: by faas16 with SMTP id s16so5271096faa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2011 00:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vNGGdcHL7zY4p/yryZ6uDpp39xTBzgzsSUvISFcHDNk=;
	b=OfGhSk47FqwfSDbhdbmFj51Rms7qiB6nDBWnwMiXMkb1OA6wPbGfs3SfAWHB0fjeR2
	H1yIHrYl+OpgKZGbKPTd0JsRM57oqnINSk/obuLd2L1g+3vNQgngrryGSZ0JcLDPwehJ
	oBCWYeXOE1R+EFklJtdHVEcXc9u3CoKmtlHeQ=
Received: by 10.223.7.14 with SMTP id b14mr20267812fab.10.1319960003214;
	Sun, 30 Oct 2011 00:33:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d21sm26650105fac.4.2011.10.30.00.33.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 30 Oct 2011 00:33:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Oct 2011 08:33:14 +0100
Message-Id: <1319959994-27406-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1319919735-2962-1-git-send-email-Martin.Jansa@gmail.com>
References: <1319919735-2962-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] python-2.7.2: fix build issues when additional modules are linked against host or native libpython instead of target
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
X-List-Received-Date: Sun, 30 Oct 2011 07:39:27 -0000

* -L. is needed to find right libpython
* -L${STAGING_LIBDIR} is needed ie for python-zlib to find right zlib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index af14adb..45d8350 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -51,6 +51,7 @@ do_compile() {
 	install -m 0644 Makefile Makefile.orig
 	sed -i -e 's,${includedir},${STAGING_INCDIR},' Makefile
 	sed -i -e 's,${libdir},${STAGING_LIBDIR},' Makefile
+	sed -i -e 's,LDFLAGS=,LDFLAGS=-L. -L${STAGING_LIBDIR},' Makefile
 	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
 	# save copy of it now, because if we do it in do_install and 
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
-- 
1.7.7.1



