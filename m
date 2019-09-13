Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id B3B717ED8E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:44:58 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h2so21059572ljk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 08:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+bvGypW0zDbyFHSvVUfNgrx+pklVDg5Ck+pBj99Uc7M=;
	b=tFEi33KaD2NiWcOZy5zqjfz2GPiCDxRUHJNJUrzH+cnixx/i8zbAIZ2TU87UOPRbkV
	DK4r045XEbIYvpAOX7qRw0nzsLxnbkTRdPBMvSFWiaiCIuhQ5ECnDrWcZVKepyAL9SEO
	f5IJl//Yp+QAdHU19Kjdw7cSuXXtTceRi0Ef8VxSz7aYSley5B5gzt7etRtfwFdNL4Ve
	eaay/OLRujEDcg0EdD1Cd3m1taVkpvbM/azV2wrEBAUEXipUkrrmcCHwPiZHmL9Vh8DP
	OpZbbX403Z+gaI/MhtJdeGMEZYukHVY6GYeC3tjItTi+xrclpaA9act57pq54Aegn2Ff
	Bb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+bvGypW0zDbyFHSvVUfNgrx+pklVDg5Ck+pBj99Uc7M=;
	b=Np8chwwCu2NTUFQH0HH/g3eZT/X+GmRyEPt7PDVsTsGMY/cdmSSnD0DIupr+r4/AGU
	N4vFMHwVuxcJdIKQzNTOZihgh3smulaTjJ4HWG8qt8+f+fe/j9dNUVO638SyRzYcPt7m
	xMGusbn+s74Gvowz2KSDQmLyT0UQpR69V16zivU5nHxsdIAghE53OfZ73wWmlGRCePBe
	dEGfnkLwuA9YL/ehZ2EgTE9XMi6436MdrPk+MjAwMVJMl0VGauhrSMdVQP/hdw4oCsSx
	GoYoQ4ljI5kklXC5pN0AxNmNeLy3UcMm1M2q6Z0+fLZ4vNd0L2HmoEI6JzzW/6yf1NU3
	gfuw==
X-Gm-Message-State: APjAAAV6LECoQV0ZeyBZ53v5gpRGmSMGmBBgzyu0zvMVRanfqvyikPmw
	gl943/rQ7DX4N3GTaVYswe8KbjVI
X-Google-Smtp-Source: APXvYqzVl2PE2q9WyF9uWwOO2sXAzHgPtAsUS76A46lKwooxJGkJcusUSU2uDBsH9Tb01Kzn13W2KQ==
X-Received: by 2002:a2e:3618:: with SMTP id d24mr29714275lja.179.1568389498865;
	Fri, 13 Sep 2019 08:44:58 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.196])
	by smtp.gmail.com with ESMTPSA id
	t1sm6297169lji.101.2019.09.13.08.44.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 08:44:57 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 18:44:32 +0300
Message-Id: <20190913154434.29908-7-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913154434.29908-1-dbaryshkov@gmail.com>
References: <20190913154434.29908-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 7/9] uefi.bbclass: provide efi population functions for live images
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
X-List-Received-Date: Fri, 13 Sep 2019 15:44:59 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Define common functions for populating EFI directories in live image.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/uefi.bbclass | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/classes/uefi.bbclass b/meta/classes/uefi.bbclass
index 7991640a2aaa..dab654d73d52 100644
--- a/meta/classes/uefi.bbclass
+++ b/meta/classes/uefi.bbclass
@@ -24,3 +24,31 @@ python __anonymous () {
         raise bb.parse.SkipRecipe("UEFI unsupported on target %s, skipping" % target)
     d.setVar("EFI_BOOT_IMAGE", image)
 }
+
+efi_populate_common() {
+        # DEST must be the root of the image so that EFIDIR is not
+        # nested under a top level directory.
+        DEST=$1
+
+        install -d ${DEST}${EFIDIR}
+
+        install -m 0644 ${DEPLOY_DIR_IMAGE}/$2-${EFI_BOOT_IMAGE} ${DEST}${EFIDIR}/${EFI_BOOT_IMAGE}
+        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
+}
+
+efi_iso_populate_common() {
+        iso_dir=$1
+        efi_populate $iso_dir
+        # Build a EFI directory to create efi.img
+        mkdir -p ${EFIIMGDIR}/${EFIDIR}
+        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
+        cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
+
+        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${EFIIMGDIR}/startup.nsh
+
+        if [ -f "$iso_dir/initrd" ] ; then
+                cp $iso_dir/initrd ${EFIIMGDIR}
+        fi
+}
-- 
2.23.0


