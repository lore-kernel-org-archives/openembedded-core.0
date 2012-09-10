Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TB8l1-0004jv-C4
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 20:30:51 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so2944640pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 11:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=tTfdEEIgvDlj+kOsRF4SBf006qzGynZSixqULHn+Hlc=;
	b=d0+Htbypy1Fxfl/0sF1tmg1Bf988V88Rdd8+dM8IXegu9p9zJAI8h9jlUZV+gNZ3mf
	0UryMl+7wfNnQ9ij7ZDOCwBNW8pabdw52K/2zwUTwrVFoskp+zfxz8WdKsFIxJ6Ha71S
	JuAoiv+Y6UU3NnFK41kHVQ7tI06LbsgJD6AoplIcDMnFexK03qF5jIihV9vgym3RyQgM
	gUvm8i2RCcEYkkfuguQpXCIsOQD/lG0CmOAArviHoK37Wk/oY9DqF28+V78edj0XFlPX
	AawP9joFYjeKUY8u/NJnK7fp55EM3U+E9O9kzXH384WHRiwyTMNc7Qlfyrazdbv0TS8M
	ftOQ==
Received: by 10.68.212.70 with SMTP id ni6mr6963119pbc.22.1347301103240;
	Mon, 10 Sep 2012 11:18:23 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id kj10sm2259246pbc.72.2012.09.10.11.18.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 11:18:22 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2012 21:18:13 +0300
Message-Id: <5d91c62217814247b57453bf6b6d97bc049caa1b.1347300913.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347300913.git.andrei@gherzan.ro>
References: <cover.1347300913.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQllNQj1Vn4qcHxd5KfxSBgx9zfF/Bx2qHCCPDnBwekjlXwG3fluVXmPFz+1rPVns5HTi4rk
Subject: [PATCH 1/1] image_types.bbclass: Round up ROOTFS_SIZE after base_size check
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
X-List-Received-Date: Mon, 10 Sep 2012 18:30:51 -0000

If we round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT before checking if
base_size is greater then IMAGE_ROOTFS_SIZE, we can end up adding an
unaligned value to IMAGE_ROOTFS_SIZE. Obviously, if
IMAGE_ROOTFS_EXTRA_SPACE was overwritten with an unaligned value. So
let's add the round up code after the base_size calculus and it's
comparison.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/image_types.bbclass |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index d286eea..0bd7a6f 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -82,9 +82,13 @@ runimagecmd () {
 	# The base_size gets calculated:
 	#  - initial size determined by `du -ks` of the IMAGE_ROOTFS
 	#  - then multiplied by the IMAGE_OVERHEAD_FACTOR
-	#  - then rounded up to IMAGE_ROOTFS_ALIGNMENT
 	#  - finally tested against IMAGE_ROOTFS_SIZE
-	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -= base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
+	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 * ${IMAGE_OVERHEAD_FACTOR}; print ((base_size > ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
+
+	# Round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT
+	ROOTFS_SIZE=`expr ${ROOTFS_SIZE} + ${IMAGE_ROOTFS_ALIGNMENT} - 1`
+	ROOTFS_SIZE=`expr ${ROOTFS_SIZE} - ${ROOTFS_SIZE} % ${IMAGE_ROOTFS_ALIGNMENT}`
+
 	${cmd}
 	# Now create the needed compressed versions
 	cd ${DEPLOY_DIR_IMAGE}/
-- 
1.7.9.5



