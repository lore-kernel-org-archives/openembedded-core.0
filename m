Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 34F0F7382F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 14:55:56 +0000 (UTC)
Received: by ykbq9 with SMTP id q9so10701640ykb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 07:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ag4qy33oPt+BZZPDlZGorYzlTJnrkSoM/yWBxolodyk=;
	b=jy1Uji9iYo1ySvh0MYXCKnGOETOVNkPgNR5x+w+iYyd8U6VF1dgX+KfuaAk9mAt5td
	cKkcHoMBkSHYPuEInc9jVt0+eRk8DBfGnowJL9Q8RTWte7ToNBecrJn7Gruk+XuA8R2+
	tEa1b99p3uePP9mdh49wll1KGpZ4B7gDBALB7IOG8TZFzlw0kSk4EKgMHlmHxEvhgcB+
	E0ygShkcr9cEL0A/KaAo0gQzXAXeoBX8f5ous0XuUlE4yc+SnpqN7jIgYIuoszMWXnt5
	WSEBuZmcMdKkesDNXzmtvKkgT8kVZq0voLEOWRqOj7dcGlGeMTS1E0Yy4GVZaMoCvt+A
	rV+Q==
X-Gm-Message-State: ALoCoQnDaxUhuc0b81HOHlMZn3iT4VtK39j9pbRUO0gEZLJi/bS5TtY7fw2X53gQz15vjjqj+Fw8
X-Received: by 10.170.195.10 with SMTP id m10mr13311139yke.50.1426258557977;
	Fri, 13 Mar 2015 07:55:57 -0700 (PDT)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id a74sm1773572yhq.31.2015.03.13.07.55.54
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Mar 2015 07:55:56 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 20:25:23 +0530
Message-Id: <1426258527-2329-2-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
References: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
Cc: matt.fleming@intel.com
Subject: [OE-core v1 PATCH 1/5] bootimg: Add support to install Image
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
X-List-Received-Date: Fri, 13 Mar 2015 14:55:59 -0000

Add support to install kernel image for aarch64

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
---
 meta/classes/bootimg.bbclass |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index b1c03ba..ed7b32f 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -64,10 +64,17 @@ inherit ${EFI_CLASS}
 
 populate() {
 	DEST=$1
-	install -d ${DEST}
+
+	SRC_KERNEL_IMAGE=bzImage
+	DEST_KERNEL_IMAGE=vmlinuz
+
+	if [ "${TARGET_ARCH}" = "aarch64" ]; then
+		SRC_KERNEL_IMAGE=Image
+		DEST_KERNEL_IMAGE=Image
+	fi
 
 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage ${DEST}/vmlinuz
+	install -m 0644 -D ${STAGING_KERNEL_DIR}/${SRC_KERNEL_IMAGE} ${DEST}/${DEST_KERNEL_IMAGE}
 	
 	# initrd is made of concatenation of multiple filesystem images
 	if [ -n "${INITRD}" ]; then
-- 
1.7.9.5


