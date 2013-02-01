Received: from mail-gg0-f170.google.com ([209.85.161.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U16fA-0004ys-60
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 03:47:40 +0100
Received: by mail-gg0-f170.google.com with SMTP id k4so33433ggn.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 18:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Gcmmgty8fwZ7ZHyMrc528/VqB04ojO5moZI4W8q39eI=;
	b=QHMFCjD2ik4owUIA6ljesE5GiWkgIDSMMTkTZS7NuljK+Xvhv29sEQzgfbwFBir0BS
	v63zk5vVocZdYjY4AtgIYVDbNSD5ci7iyeAFeptlRkXrW85a6N8xRlKLOUu5t0I4/Vzk
	9Wq/tn/Z+ngzphAiLI6jjjhwyS7VVtgccXOM+AyfUIKkW3jUv7J9WBUWpSuy4N4x7J36
	S2VHXH27HfrOoj0qQ1QZrPFhJAxcEQL95Zi4zpMeAqlOlgZpD86OFlbh/HC8XLZwlJe6
	X9xiy6DZumaEzpAUbATH92aD4KXiNqzL+rDBClG6u7yKhT3/lIHOkymTsWYj+mlDSF0V
	8NTw==
X-Received: by 10.101.68.16 with SMTP id v16mr3677548ank.21.1359685912378;
	Thu, 31 Jan 2013 18:31:52 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.35.66.48])
	by mx.google.com with ESMTPS id s3sm11300861yhm.10.2013.01.31.18.31.50
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 18:31:51 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  1 Feb 2013 00:36:15 -0200
Message-Id: <1359686175-28538-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mini-x-session: Fix runtime when using without session contents
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
X-List-Received-Date: Fri, 01 Feb 2013 02:47:51 -0000

The script where behaving badly when the session directory does not
exist and also lacking a dependency to 'sudo'. Instead of adding a
dependency on 'sudo' we use 'su' as done in xserver-common.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../mini-x-session/files/mini-x-session                | 18 ++++++++++--------
 .../mini-x-session/mini-x-session_0.1.bb               |  2 +-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/mini-x-session/files/mini-x-session b/meta/recipes-graphics/mini-x-session/files/mini-x-session
index f7d6c3b..91f1592 100644
--- a/meta/recipes-graphics/mini-x-session/files/mini-x-session
+++ b/meta/recipes-graphics/mini-x-session/files/mini-x-session
@@ -17,14 +17,16 @@ exec /etc/mini_x/session
 fi
 
 MINI_X_SESSION_DIR=/etc/mini_x/session.d
-
-# Execute session file on behalf of file owner
-for SESSIONFILE in $MINI_X_SESSION_DIR/*; do
-    set +e
-    USERNAME=`stat -c %U $SESSIONFILE`
-    sudo -b -i -u $USERNAME $SESSIONFILE& 
-    set -e
-done
+if [ -d "$MINI_X_SESSION_DIR"]; then
+	# Execute session file on behalf of file owner
+	find $MINI_X_SESSION_DIR -type f | while read SESSIONFILE; do
+		set +e
+		USERNAME=`stat -c %U $SESSIONFILE`
+		# Using su rather than sudo as latest 1.8.1 cause failure [YOCTO #1211]
+		su -l -c '$SESSIONFILE&' $USERNAME
+		set -e
+	done
+fi
 
 # This resolution is big enough for hob2's max window size.
 xrandr -s 1024x768
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index 6f7efb2..8106cbb 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Mini X session files for poky"
 HOMEPAGE = "http://www.yoctoproject.org"
 BUGTRACKER = "http://bugzilla.pokylinux.org"
 
-PR = "r3"
+PR = "r4"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mini-x-session;endline=5;md5=b6430bffbcf05f9760e72938826b7487"
-- 
1.8.1



