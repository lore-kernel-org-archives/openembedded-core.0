Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id D27CF782D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 21:50:53 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g6so6225319pgn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 14:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ylefQw7YAA2RINmHBom9lw/fcjEq7z7bAc8jSQ6pWeY=;
	b=pighHeuiQViJcPN2VaEYOx3p0UFg4cKhaXzKMqutc/Tq/Xyxd0gvG8qSr5cq5dqptq
	1xsMhDWZ7vgeUf3kajYdgZWP5xKjV+gm3rqDFfxdoSKghpJ9tXtW3W3L96uOIBDWEREm
	UBfb41rhNNpw7y+DkGtb1Z2n5IPhEWYb4Jeaog2YiqhVlsbb6DvvYqL139GLd/rTukaM
	if3fOLKnxTI0JLEl2oGIQ8iYsdUMvj2PuH6WZTec8TTKByUwviwFqFjei0JSI0DZId/p
	WQjXyiPf345mSv000/zTIIBBZQXrL0rGLPZVME2qSA3ln1dInIwOrroS5GBkLQTRiqNl
	jhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ylefQw7YAA2RINmHBom9lw/fcjEq7z7bAc8jSQ6pWeY=;
	b=m6zCnzLtMcm7a1xCsWSt5+ZbCTidCmnN0MEGZj2Wj0XjzlCr30SLt1M43Nv1uyEc+e
	VsYP3Ip3SMDfc+ztwhVWK7MsxG/efi/NI+q3o/MTpySyjAE52xFxpjDn2Zr27QVsXcU6
	i7KFwOE3WWgMp2kejcVxPaaS74kJjbT/k9C0crO78dlJnquuQ2XHIJgQ9wPDgX0jbQcJ
	IW9iIJucrL4hkVLaimZ+ey1GVTMuAvqTEoGuKXdwIbZpwoC4kuxg1VZ46tPAoSgJbpGs
	XEGhmo5ObLxnTCB25SVN/CXqaJLcGBOY9gE3NnOEGXwbEP00NKTJvlIliw/xFc0FN8Tn
	E/NQ==
X-Gm-Message-State: AMCzsaXe6ZCqdmLU4igozpkKqkGyZx50qQ1k6Rly+7+n7OlG9qrIAwMy
	FucSnr9Zz8pzCUWPTEiOnx81bw==
X-Google-Smtp-Source: ABhQp+TMGy6ZMFO0yHqM0gFurxEjlq1iE2ByE/7PwDlGQStI79dPSptOm7yz4KllLxho6P/YWVnHfQ==
X-Received: by 10.159.206.198 with SMTP id x6mr1367951plo.35.1509141054766;
	Fri, 27 Oct 2017 14:50:54 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	m25sm17473605pfg.49.2017.10.27.14.50.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Oct 2017 14:50:53 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Oct 2017 14:50:48 -0700
Message-Id: <1509141048-32541-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bitbake.conf: set more conservative default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Fri, 27 Oct 2017 21:50:53 -0000

Setting IMAGE_FSTYPES_DEBUGFS to the same value as IMAGE_FSTYPES can
lead to creating a large number of DEBUGFS filesystem images, many of
which may not make much sense (or may not even be buildable).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9696273..15feb57 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -757,7 +757,7 @@ require conf/sanity.conf
 DL_DIR ?= "${TOPDIR}/downloads"
 SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
 IMAGE_FSTYPES ?= "tar.gz"
-IMAGE_FSTYPES_DEBUGFS ?= "${IMAGE_FSTYPES}"
+IMAGE_FSTYPES_DEBUGFS ?= "tar.gz"
 
 INITRAMFS_FSTYPES ?= "cpio.gz"
 # The maximum size in Kbytes for the generated initramfs image size.
-- 
1.9.1


