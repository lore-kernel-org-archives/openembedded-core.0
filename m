Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 893BA796C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 15:15:19 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id l5so9194196edw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 08:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qwEele8WESLBOkmc4oStcasAaLztJtzjr4Ij8SJbhEE=;
	b=fx4YRijyeKHPDYULohjuIsNavajZyXxLrKVQqbq0ZuxeayZVESUxje3MR4H2utBhfV
	ILIZHX1RDCYYc3556UEOqJJJXsZmuUskJdGC8PBcOIVezJsHMiGan1KNgKrl2dmHteLa
	KgCrdATr48vgT7b2sEBU5IJg9G3gWRsTVGUDHFn66Nndrw3885AVJJf7qoxxP3yXQ6ym
	bL1R1PrhxY84bdCJZCfaWUJITYBNcL0MDfI7oJ3wBcl4BCYN/Ai5wFnx7Bc9UWB7eMW4
	e6qmSsUPjjVhakL0h4JWyZHe+bxBmsJZBIcSbr1MxtwB7hbkVG9l8OOhCMyQCmMOMwpi
	guVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qwEele8WESLBOkmc4oStcasAaLztJtzjr4Ij8SJbhEE=;
	b=F/GnpaU6l8x+6atn+58rOt9kfNHBRss08Hheu8Xv9iYVFA+A3S9PvBCQSPNZJPQ4wX
	Na4rkE8+/KCjvQLFcBvDY0YIt9Z2682eV1vJY5p1Wx088gERxsdrjviykqB17lND27On
	havMHmGvFSZNk6oZguNaygBKN050NEizUSYoz18K18SnTu8BsWYRn4fH9BC0i09En2lC
	nOO8rP19tBCDrdXt2SOE3/Gd5tbzGLOqmd81cbFRWTPvlNIXtKszYt6Df94UqTM2MgFI
	/h0C0Y+m4e+j7ex8ijRuiCWcga615WBJSnvlUF3ytKEcRjEe0+fsVViu+HD2SrF8iZes
	HdwA==
X-Gm-Message-State: APzg51B9MlwJBn/HmzD8fA/uw8Ixphbb4L41P5ENutVXTW9xqLKEep+Q
	PwqEsR8uSVN8cJP+xxtDvQkHzDuL0HmPbg==
X-Google-Smtp-Source: ANB0Vdatw2XReFXQtAui29MR4u+fXYs/+QqUWoLgGPfpx1C2+fTe5z1hxi3BNq6Ug/oGnVH3gIlAPw==
X-Received: by 2002:a50:8978:: with SMTP id
	f53-v6mr4019297edf.166.1536246920071; 
	Thu, 06 Sep 2018 08:15:20 -0700 (PDT)
Received: from localhost.localdomain ([145.130.96.189])
	by smtp.gmail.com with ESMTPSA id
	y7-v6sm2716027edd.13.2018.09.06.08.15.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 08:15:19 -0700 (PDT)
From: Leon Woestenberg <leon@sidebranch.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 17:14:53 +0200
Message-Id: <1536246893-680-2-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536246893-680-1-git-send-email-leon@sidebranch.com>
References: <1536246893-680-1-git-send-email-leon@sidebranch.com>
Cc: Walter Goossens <waltergoossens@creative-embedded.com>
Subject: [openembedded-core][PATCH v2 2/2] kernel-fitimage.bbclass: Create a "fitImage" symlink to resulting FIT image.
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
X-List-Received-Date: Thu, 06 Sep 2018 15:15:19 -0000

From: Walter Goossens <waltergoossens@creative-embedded.com>

If an initramfs was used, the fitImage link will point to the FIT containing
the initramfs. Otherwise it will link to the FIT without initramfs.

This ensures the user can depend on "fitImage" to point to the desired
FIT image.

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 meta/classes/kernel-fitimage.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 8bda644..17addab 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -519,5 +519,10 @@ kernel_do_deploy_append() {
 			install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin
 			ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin ${DEPLOYDIR}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}
 		fi
+		if [ -n "${INITRAMFS_IMAGE}" ]; then
+			ln -sf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its fitImage
+		else
+			ln -sf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin fitImage
+		fi
 	fi
 }
-- 
2.7.4


