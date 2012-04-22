Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SM2PE-0006E4-Jw
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Apr 2012 21:25:08 +0200
Received: by vcbfl13 with SMTP id fl13so8469273vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 12:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=HnpnYEtAtISI0nRu7bVSjcP0q4YO22H1/dbaqqoMxuE=;
	b=AKy9jsgASZPFZ1yXvFooNz2OwOl27w6Tn1XzqaeJrTnYYouC6cuR8TM2T3RzW+Hh5O
	mC5FJBve5TPJ46A3O1OmclotsLr3e7pM+GzITHgPZwQb7nqUHZEYVzSm9nTHws+ioF+z
	Rv0QNFLQ8iKhqdwg3I+18L1x898CNQXbcO58A4b5HoJfsmP4Wv91RlAamLFZ88bgIIte
	d7esxQ0oPcObNH0EP81YHzGXceJteMYpp7vjy7/PBQG+H5f+KyPihV1HB2hthDcf2Ziq
	7b1q8IOrXpGQ0BKVcbjlOFrP0Kf8GL41gzrxXVlwWsLGM25Y/1qnRul3D8M9Wr+DlXcr
	BZlQ==
Received: by 10.220.218.136 with SMTP id hq8mr1696891vcb.68.1335122135922;
	Sun, 22 Apr 2012 12:15:35 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id fd3sm21452715vdc.22.2012.04.22.12.15.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Apr 2012 12:15:35 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Apr 2012 16:15:23 -0300
Message-Id: <58eb527cbe9ca96a92dc89b32cf3c7e24336dc4c.1335118370.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1335118369.git.otavio@ossystems.com.br>
References: <cover.1335118369.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1335118369.git.otavio@ossystems.com.br>
References: <cover.1335118369.git.otavio@ossystems.com.br>
Subject: [PATCH 2/5] u-boot.inc: fix compilation when using 'gold' as linker
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
X-List-Received-Date: Sun, 22 Apr 2012 19:25:08 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-bsp/u-boot/u-boot.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 0445c34..a13eddc 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -36,6 +36,10 @@ SPL_IMAGE ?= "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
 
 do_compile () {
+	if [ "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
+		sed -i 's/$(CROSS_COMPILE)ld/$(CROSS_COMPILE)ld.bfd/g' config.mk
+	fi
+
 	unset LDFLAGS
 	unset CFLAGS
 	unset CPPFLAGS
-- 
1.7.2.5



