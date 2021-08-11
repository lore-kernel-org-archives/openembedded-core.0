Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web09.10574.1628702047094436613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 10:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=AJDW88of;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id DrnomLUe7HBkXDrnpm3iNU; Wed, 11 Aug 2021 18:14:05 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=fI+iIaSe c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=MhDmnRu9jo8A:10 a=-An2I_7KAAAA:8 a=32uHfFeSOX9-2Eez5dcA:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=DUHor0REMsdPXBMo6ElI0rXPRfQ/tsQCZJDm+zDA2vA=; b=AJ
	DW88ofzTjKGu3dfWlNcRKOp4utQj31aqGjGuK7iqBHvITDkyZFU6OLY0pKOa8O3cTD4K7sWLr0BXR
	9zRqYWZKeY0LAIYFSvLTwojplxQtERN/nfBx+Ak7OGBLfdD0USxmwhHhpHzYXZXBbKItwebeaTN0F
	CDOqjaggxIM6PEBBDpyKItKxvSn/4k3b8rP0hPXjFCkwkbmLTWdHvuek0xVIWGkbKzTmY9+cqEUEe
	NDMlkOVznplh02qxz5PIEQUT3NCkfiCHXeIhVV5mZTKjiMdoMhEA9hzZy+OXD8M4G4LvWm//0ktub
	X9hYwHE81dwa8ZVeafLoksKOJ8Xmc1FA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mDrnm-0004bw-UC; Wed, 11 Aug 2021 18:14:02 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [pseudo][PATCH] test-openat: Consider device as well as inode number
Date: Wed, 11 Aug 2021 18:13:54 +0100
Message-Id: <20210811171354.916407-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFu7lEVwLNWZYbrVzZnr1ZFO7jPyhKO58UGtJwsW6MHKYOhwiuBTZNe+initjEMcGNZHX+WIZP3o31drAIce7ABX3n0y52Vbw7sIXEBHQpCqJ3doNI+x
 uSNcRSV9Xe+M+RorTOvLpBgpWs2/ONDJwFRUo5w/R2lPquAlS6DodtoJFJS8x+9I1iSuv5ySnMFOVw==
Content-Transfer-Encoding: 8bit

It just so happens that my /home/mac and /home directories have the same
inode number but on different filesystems.

This means that test-openat fails with "Recursion failed!" even when run
without pseudo.

Let's consider both the device number and the inode number before
assuming that we've found the same directory again.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 test/test-openat.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/test/test-openat.c b/test/test-openat.c
index b710285..df6655a 100644
--- a/test/test-openat.c
+++ b/test/test-openat.c
@@ -25,11 +25,13 @@ int main () {
     int fd, dir_fd;
     struct stat st;
     ino_t ino;
+    dev_t dev;
     char *path;
 
     fd = openat(AT_FDCWD, ".", O_DIRECTORY, 0);
     fstat(fd, &st);
     ino = st.st_ino;
+    dev = st.st_dev;
 
     while (1) {
         path = path_of(fd);
@@ -37,7 +39,7 @@ int main () {
 
         dir_fd = openat(fd, "../", O_DIRECTORY, 0);
         fstat(dir_fd, &st);
-        if (st.st_ino == ino) {
+        if (st.st_ino == ino && st.st_dev == dev) {
             if (strcmp(path, "/") == 0) {
                 //puts("Reached top of tree");
                 return 0;
@@ -49,6 +51,7 @@ int main () {
 
         free (path);
         ino = st.st_ino;
+        dev = st.st_dev;
         fd = dir_fd;
     }
     return 0;
-- 
2.30.2

