Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TBtT5-0007pv-4d
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 22:23:27 +0200
Received: by wgbdr1 with SMTP id dr1so1470082wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 13:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Q5FQnQ6/QvqQkRJZIUrTdfnsIuUmkv5hElkWbqboEZk=;
	b=NpO0HFtPYtLIdINZo7B9MR/ZUPdvxe3Lj51AMzgwkTPJqzbogxGra9SjeSWHATOyPC
	z5Yc+nu5/UJMap8mRWtZ+ZhRMZpeEBoCOfPKBumj4IYtAX0rfTrv8805eJMIuB+ZftY7
	BfSD8ILIFiTM2IybOyyyKfBJwxQ6VcjG8eY39kUeGIE2noWhW+30rClEeXG40FTj3Zd4
	yUjJnz7RsjYuyjwfkLJcjlA91c8Sk+zFTdEjVT87inZekK35jpoDprRRzJX4PNltnM0z
	3kjQpTKP0ZXg+YY4uqbWJkjqrziWlk6wx6V0VUmgShtt85BS58p3rwTS4oIlx3P57MxA
	S64Q==
Received: by 10.180.95.193 with SMTP id dm1mr35018650wib.10.1347480654852;
	Wed, 12 Sep 2012 13:10:54 -0700 (PDT)
Received: from localhost.localdomain ([79.118.163.23])
	by mx.google.com with ESMTPS id t7sm14511953wix.6.2012.09.12.13.10.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Sep 2012 13:10:53 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2012 23:10:47 +0300
Message-Id: <09795cfdec0b03e3c5e03b8bef431de0adad71e5.1347480378.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347480378.git.andrei@gherzan.ro>
References: <cover.1347480378.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkEzfdbc1rhg1EYOOc/2+gvHUCKnYcG9MWxJ5DciFeWhRB46yQLKplk05Gj3k2gJ4ihIZaq
Subject: [PATCH V2 1/1] image_types.bbclass: Round up ROOTFS_SIZE after base_size check
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
X-List-Received-Date: Wed, 12 Sep 2012 20:23:27 -0000

If we round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT before checking if
base_size is greater then IMAGE_ROOTFS_SIZE, we can end up adding an
unaligned value to IMAGE_ROOTFS_SIZE. Obviously, if
IMAGE_ROOTFS_EXTRA_SPACE was overwritten with an unaligned value. So
let's add the round up code after the base_size calculus and it's
comparison.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/image_types.bbclass |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index d286eea..6c01b21 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -82,9 +82,12 @@ runimagecmd () {
 	# The base_size gets calculated:
 	#  - initial size determined by `du -ks` of the IMAGE_ROOTFS
 	#  - then multiplied by the IMAGE_OVERHEAD_FACTOR
-	#  - then rounded up to IMAGE_ROOTFS_ALIGNMENT
 	#  - finally tested against IMAGE_ROOTFS_SIZE
-	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -= base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
+	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 * ${IMAGE_OVERHEAD_FACTOR}; print ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
+
+	# Round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT
+	ROOTFS_SIZE=`awk "BEGIN { rootfs_size = $ROOTFS_SIZE + ${IMAGE_ROOTFS_ALIGNMENT} - 1; rootfs_size -= rootfs_size % ${IMAGE_ROOTFS_ALIGNMENT}; print rootfs_size }"`
+
 	${cmd}
 	# Now create the needed compressed versions
 	cd ${DEPLOY_DIR_IMAGE}/
-- 
1.7.9.5



