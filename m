Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TfadD-0003lN-OU
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 19:20:39 +0100
Received: by mail-ob0-f175.google.com with SMTP id vb8so2718921obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 10:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=65Ve+spUPZGdAEw+t8DegkPoukL4Xn1faH6b6Si+0Jw=;
	b=BQb4mL1JSL3VXnoqFSWE4IPGMKxqbOHe5Gj1X71+QwZXUD563rV44Jzma/UtFDYcuP
	RuFu9JLl5n+CbWLU5wQ4jPLmkYmmFmO6utxyeMr6C2EoCLDL/ztmP6wJweX8dpHTKQ9l
	AAS80xn5jTQBBdv9sKf8ht7aiU/RY67SPtiPGyhZqaM3R7hMqQVNBzFfFVdA1KIC1/9k
	rc7yUGUgoj5COWwEGuO5nNBpd12Oz7ZYkmrIHL5xI200+nW3UETFA3iZqZ+dVgQNzt0e
	YAU366zuSTYSX5UPMqtSXDDntkQRAym15eRHY/oo1anbOf3JMmZ2pSUspFJmyvG4izjW
	YeTg==
Received: by 10.60.1.232 with SMTP id 8mr8816444oep.30.1354557977831;
	Mon, 03 Dec 2012 10:06:17 -0800 (PST)
Received: from localhost.localdomain ([187.23.153.69])
	by mx.google.com with ESMTPS id s5sm14144174obo.10.2012.12.03.10.06.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 10:06:17 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2012 16:06:04 -0200
Message-Id: <1354557964-12145-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH] pulseaudio: explicitly set --with-database=simple
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
X-List-Received-Date: Mon, 03 Dec 2012 18:20:39 -0000

The default value for --with-database is "auto".  So, if some package
installs a database library and pulseaudio auto detects, that library
will be added to the dependencies list, causing a dependency error at
do_rootfs time.  For example, samba installs libtdb, which is one of
the pulseaudio supported databases.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 +
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index d9a1b94..6633e38 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -39,6 +39,7 @@ EXTRA_OECONF = "\
 		--with-access-group=audio \
 		--disable-openssl \
 		--disable-xen \
+		--with-database=simple \
 "
 
 PARALLEL_MAKE = ""
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 811dc0f..a576368 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r14"
+PR = "r15"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.2.5



