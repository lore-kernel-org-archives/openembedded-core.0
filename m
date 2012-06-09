Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOwH-00046A-PX
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:55:01 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so3401908dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=x7zmk4hh3BKHIhGM7v0WY241/SXus/76tytH0Fx45Yc=;
	b=ef1hT0HTSCgcQgS8gS8HAnEBjjfvdJLLwqE5zvtMjdUnDH5+ls4+5Z7/VimJzulGET
	B9lqmWago+82HmZ6wPO9JxUarUGmMtnNLWdzpjK+WUX5urgCzPizBV8cCiVQ+eH/KVG4
	eBsGRNvAqgyx+Ih21LTJYIJriInVufdqOjzBNjMBt0tH25kZIuR8rx9oyQykZks5TTq6
	lkGJnIsGU3qw01/T8Y1/pNd/2X1Fjuck88xlgboTMr0Z/MyDl3QcQ/s1Q3MLceUXHDZY
	GA5lOvZypDLjm0o2W8zBojlC80Is0fYTty84HGukjSz4BZlmoLyeRZiuSN2zGtJUwONW
	Cpeg==
Received: by 10.68.219.202 with SMTP id pq10mr7901470pbc.82.1339260272589;
	Sat, 09 Jun 2012 09:44:32 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:43:11 -0700
Message-Id: <e3bca662121b51a9e8e31d9beaca96687b637352.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
References: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 13/16] task-self-hosted.bb, task-core-lsb.bb: Conditionalize pth inclusion
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
X-List-Received-Date: Sat, 09 Jun 2012 16:55:02 -0000

pth is not portable to uclibc therefore we need to exclude it for
uclibc based systems.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb  |    4 +++-
 meta/recipes-extended/tasks/task-core-lsb.bb |    6 +++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 64e01bb..61d08ed 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -137,7 +137,7 @@ RDEPENDS_task-self-hosted-extended = "\
     perl-dev \
     perl-modules \
     perl-pod \
-    pth \
+    ${PTH} \
     python \
     python-compile \
     python-compiler \
@@ -199,3 +199,5 @@ RDEPENDS_task-self-hosted-graphics = "\
     python-pygtk \
     gtk-theme-clearlooks \
     "
+PTH = "pth"
+PTH_libc-uclibc = ""
diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/tasks/task-core-lsb.bb
index 4faf4d7..553b89e 100644
--- a/meta/recipes-extended/tasks/task-core-lsb.bb
+++ b/meta/recipes-extended/tasks/task-core-lsb.bb
@@ -70,7 +70,7 @@ RDEPENDS_task-core-sys-extended = "\
     minicom \
     neon \
     parted \
-    pth \
+    ${PTH} \
     quota \
     screen \
     setserial \
@@ -197,3 +197,7 @@ RDEPENDS_task-core-lsb-runtime-add = "\
     eglibc-pic \
     eglibc-utils \
 "
+
+PTH = "pth"
+PTH_libc-uclibc = ""
+
-- 
1.7.5.4



