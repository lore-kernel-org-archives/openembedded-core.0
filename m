Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.467.1606848745914551178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Sf39BmPd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id l4so1729530pgu.5
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=hNXOHx1MNuv9Og4j4pr4uRNgAQOkJdZcaOBoiA9u8Us=;
        b=Sf39BmPdy8sAmjLLg5BLQsXBg70pOzC+XoMlV1YhgnnG0XlGqgtKSvKLFKQSDhpCj1
         1B2sZHoc1ZG7NbZlUXPpftu6mqqapjewfFAbG5cFfHix20yLbS4VOmllGChbOg870onG
         T0DgoSvE17pjpQdXkSGOB5gYxOeTE+BhTSQamuikkftOdIHzPU3NciMDcx2sJaIfa+Nm
         rLONaGbZ+YrjyQJmE9SyLyXaZ4ANhJRp6epTxBpMo803/dIKXaJKs2fkAGAukr8NpV+Y
         7vMkTByL/g1eZw8OOJ3xlvmCbxx1ppQKdATA+MA2Svw1oz2mPhjcSiAH+xW/Ak5Afj+h
         QTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=hNXOHx1MNuv9Og4j4pr4uRNgAQOkJdZcaOBoiA9u8Us=;
        b=h+ue3qmgxUzgxbIzroTrhp/yTWs50hR7q6WRd+9/QZjwsMxJsYwWLr2N1dB1mNje3B
         wEYxIHMIWgBPKpjZ+BneFCGH2F8+xcRBhc+RixtbEDSJ5uq1U2+lLQ3cxKwzrcAibi42
         QvBlg1UimD9K+dl55VB/Tl17W4CT985J7Kk8f4LaLvLPjuCUnf2GBjyYWcQ4eo9WSmrx
         yES3Va8PMr/RM6AVyQaf4Td9HtQzMWYhLmedXY/SykgBaDr39RKCRO84ZXyevOW0XAOb
         xA+jg6gUJzFlNy7uqNJahP8LVvWanktgfkSj104a+dD6x/xo8DeiGEtwvkAgKQKT7U06
         m7nw==
X-Gm-Message-State: AOAM533/M+yNgzLaJxsNMH111sZbd5lA8ZJ6tjXBL+hapm3GsCbsOBoe
	OcRVwNIoL4tOo2H8PTMmb4nBPEFqDnfWib1y
X-Google-Smtp-Source: ABdhPJwiLRpV2o3A/D3RfbMP4gyx5x/fTI+EB+O1khMHFnJq9df8e2wePgtCv8sDYaIl0WeRNEWQJA==
X-Received: by 2002:a62:4e87:0:b029:197:c74c:a8bf with SMTP id c129-20020a624e870000b0290197c74ca8bfmr3923850pfb.45.1606848744940;
        Tue, 01 Dec 2020 10:52:24 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:24 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/16] kernel: relocate copy of module.lds to module compilation task
Date: Tue,  1 Dec 2020 08:51:45 -1000
Message-Id: <38c6c6f4a460e9c0593e2530ffeaf20b24fd83a9.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

There were two copies of this patch floating around, and the merged
variant has the copy in the wrong place.

module.lds is only created during modules_prepare, and that target is
not invoked during our main build of the kernel. We aren't about to
change the kernel build (there's no need), so we move the copy into
the compile_kernelmodules task. After that runs, we have module.lds
availble to copy.

This has been tested against clean kernel + out of tree module
builds, and the dependencies are correct that the file is copied
before the out of tree module build starts.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d94f9209ebaaf59ea001239a889dd7f928a0e7c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 58c9f171dc..700ba0ad8d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -358,6 +358,10 @@ do_compile_kernelmodules() {
 		# other kernel modules and will look at this
 		# file to do symbol lookups
 		cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
+		# 5.10+ kernels have module.lds that we need to copy for external module builds
+		if [ -e "${B}/scripts/module.lds" ]; then
+			install -Dm 0644 ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
+		fi
 	else
 		bbnote "no modules to compile"
 	fi
@@ -465,7 +469,6 @@ do_shared_workdir () {
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
 	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
-	[ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-- 
2.17.1

