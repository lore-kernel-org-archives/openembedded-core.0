Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4053876F58
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:07 +0000 (UTC)
Received: by qgt47 with SMTP id 47so96485095qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=35U0YOqz2p74wQzPKBFqI7iDrVY5wSD2+4l53Jkdqy0=;
	b=egI9IHVGrBwIeiQExZT8ZmxUfoIF33uQyv/Zg1T4l4HPupMZCobfL0wuzdWHoRQu1U
	VaOyVDy7mFDMQMkJNgfaGxBOXSkceZDwr2xuI3VKnhgqXU18e0Lj+rNcU0NxaaW0uSEj
	/HMwpvrRbo+WzDHoYoThyyvw9QdZKMESSn0yWZanrtdPUgs9DLmNPYstokbSr0qSttmO
	j2QMpW8LS3FhsSU3QS8rs+mlOldeFEdXO6cHAJa8uzrtn7NbKNurj1SlTN3AOLuX4bvo
	YZvpZOzT3fA8PmEq5l1laUeOghPNkXgoaZ7kGtS0kpz55uy4t41m+y22aJrqjzQe5pOA
	puFQ==
X-Received: by 10.140.150.139 with SMTP id 133mr42249613qhw.58.1441753687623; 
	Tue, 08 Sep 2015 16:08:07 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:49 +0000
Message-Id: <f653081aa9489d7ba4a0f696e7068b7c91d79288.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 09/16] alsa-tools: Fix compiling with clang
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:07 -0000

Fixed a linking error occurring when building with clang, where a
function reference is emitted but function is not since its marked as
inline, making it static inline gives better opportunity to compiler to
compile it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s10k1-Make-output_tram_line-static-inline.patch | 31 ++++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch b/meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch
new file mode 100644
index 0000000..d049a30
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch
@@ -0,0 +1,31 @@
+From 1e5926df74a35fe2cd90bc59f5264a8715c94048 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Sep 2015 08:16:59 +0000
+Subject: [PATCH] as10k1: Make output_tram_line() static inline
+
+The function is not used in any other file, its better to make it static
+inline so compiler has a better chance of optimizing here
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ as10k1/as10k1.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/as10k1/as10k1.c b/as10k1/as10k1.c
+index 96af0c3..d0766fd 100644
+--- a/as10k1/as10k1.c
++++ b/as10k1/as10k1.c
+@@ -366,7 +366,7 @@ void as_exit(const char *message)
+ 	exit(1);
+ }
+ 
+-inline void output_tram_line( struct list_head *line_head, int type){
++static inline void output_tram_line( struct list_head *line_head, int type){
+         
+         struct tram *tram_sym;
+         struct list_head *entry;
+-- 
+2.5.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
index b5b9cc4..fdf396e 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
@@ -13,6 +13,7 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', \
                                 'file://makefile_no_gtk.patch', d)} \
            file://gitcompile_hdajacksensetest \
+           file://0001-as10k1-Make-output_tram_line-static-inline.patch \
           "
 
 SRC_URI[md5sum] = "f339a3cd24f748c9d007bdff0e98775b"
-- 
2.5.1


