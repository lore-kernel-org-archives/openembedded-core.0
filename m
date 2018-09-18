Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA8E79832
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 15:16:19 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n11-v6so3260000wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 08:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W5Bko0kDl6JitkqLcTo5Go9ToAZ5CV35Q1K1UoREIIU=;
	b=XAie6yd05qhtSchmd6vaXJ6qP/0zvSwEf3+XD/B9hmp9i1eOjvjO9lDYS39HQcxcdz
	drWAakjGYH4D6qjGdDwZ2KvFjXA/ADWI6urAyvrLupDUcunR6f9/NJpxd25Vqedxx023
	4GvGugMk+ilbbNgA1LfDMb6Gm36HQwqSg1cX6CNa4PpPXNyfhLtcdJny0JuY3BSryKR5
	+KXA6N+3qEu6Ngl4dJQdiWgipm+wjWR9tnk6ePwvhkCB6Zmg9bUmQAGpHxdm3hVw74vr
	R9MiTsvLODOafY09O+6Gpwf+04nskqwGJNIqH7l/PIxSvqg64uHfukM17EjSxpfnvIA5
	DAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=W5Bko0kDl6JitkqLcTo5Go9ToAZ5CV35Q1K1UoREIIU=;
	b=FIXcw48bAQiHp6zsCq2OVlD9BxmtiIRMViE/QZFUey2YgjcBf8Nm/RSSgrfmkXOxCW
	pce7RtzDyTIl4aBEuIHYIHT7RgBWXuLuhtttOtnB/HEahPEQMxDdn8DlWbLE617tTUFL
	0NlMWRtkfo/CQOxJLDhLayZcwE+ms7FKSfLx4F1+/cA0u+CMkxjW/6BESIyXsc+0Et3w
	CQ6XukQ7E59X8XLxzQtpxoj06MRXfaZEdFsyIW5p4v1f/8ckq4uv8wjRrPtdSyT4DEJZ
	t1/6suFadENAG75Nb0Ir2wcjP+aZ9U8J/wNKXdP/Ajpdt39w4lJl0Rg1YtDholwlrwJy
	joQg==
X-Gm-Message-State: APzg51DnZenQMUE+to04Ih0SU68tOVL7T/caSrlzPPXOX97HX+mS/+1P
	H/Cn4ckWLOg0grqlhNkvNBMHOs3d
X-Google-Smtp-Source: ANB0VdYTuY78Dqhwg6aDtyAEgZjCaxWZ/VfSqOz0Et2heieKIPrHtfTx9lzwOSR/AnkETDvrgz/Kzg==
X-Received: by 2002:a1c:5e48:: with SMTP id
	s69-v6mr15392136wmb.19.1537283780006; 
	Tue, 18 Sep 2018 08:16:20 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	142-v6sm1904838wme.35.2018.09.18.08.16.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Sep 2018 08:16:19 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 15:15:22 +0000
Message-Id: <1537283723-27429-4-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537283723-27429-1-git-send-email-alex.kiernan@gmail.com>
References: <1537283723-27429-1-git-send-email-alex.kiernan@gmail.com>
Subject: [PATCH 4/4] kernel.bbclass: Avoid iterating over KERNEL_IMAGETYPES twice
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
X-List-Received-Date: Tue, 18 Sep 2018 15:16:19 -0000

During deploy we iterate over KERNEL_IMAGETYPES twice, with no consumer
of our changes in the interim. Collapse these two loops into one.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/kernel.bbclass | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 396627e7efa1..d0fbbd19899b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -669,20 +669,17 @@ kernel_do_deploy() {
 	for imageType in ${KERNEL_IMAGETYPES} ; do
 		base_name=${imageType}-${KERNEL_IMAGE_NAME}
 		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
+		symlink_name=${imageType}-${KERNEL_IMAGE_LINK_NAME}
+		ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
+		ln -sf ${base_name}.bin $deployDir/${imageType}
 	done
+
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}${root_prefix}/lib
 		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
 		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
 	fi
 
-	for imageType in ${KERNEL_IMAGETYPES} ; do
-		base_name=${imageType}-${KERNEL_IMAGE_NAME}
-		symlink_name=${imageType}-${KERNEL_IMAGE_LINK_NAME}
-		ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
-		ln -sf ${base_name}.bin $deployDir/${imageType}
-	done
-
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
 		for imageType in ${KERNEL_IMAGETYPES} ; do
 			initramfs_base_name=${imageType}-${INITRAMFS_NAME}
-- 
2.7.4


