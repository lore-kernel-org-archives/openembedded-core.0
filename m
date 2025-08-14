Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5A3CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 12:17:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.21260.1755173828538820783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 05:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B4Thlyfv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0b6ac4so4186375e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755173826; x=1755778626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5p2eoJQudgKFZJdV7zZHwKrdnRTHfURBuzQPpTCVR/E=;
        b=B4ThlyfvgqgX4ANKzdAL2YFTwhEz21tDJ4w71ugvTxqkyhyYsGPxYxHK0Sesc2DybW
         pNNTAdxGRSSb5+FLtkobhdx5IF21m7ihFNfWqFo3FmYWwV9xosnSlQXZxZRLN0nXhNTd
         LRsxtzTsIbJfhhfYGNBG97tnpIEvp9PGwrIio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755173826; x=1755778626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5p2eoJQudgKFZJdV7zZHwKrdnRTHfURBuzQPpTCVR/E=;
        b=HMpFH4HcXnVT8FDhx7LL842BmGQyLnmyta8hUSuix/3W+MoCdVESh2eyeqq+UvIxGk
         pKsUaYyrM0m1iwpDHlpJqc/PUYrBZWrZlSu+KkTzrd40/96ODI9I2Ee8blab+L+mzh5/
         hz7vhBQLNckBeBNHvR3GOeMulW5rizxcj7DgdGKoF5sM/fqxCP2lKOBtw8nHdaBP7OQG
         xjc7KZRQiR8cCavcazTGlHymcj3YwEpf8cFsCfj/t4IuqLr5Jo4MXi4IAAm2R2Pqd4wN
         9HVvsdT6Ho4bTW8mAQsGcyjPWEr4+/WyPgxuwoOd/gwR/NV9UVq5l3HnpdmrWrdncmY2
         +ngA==
X-Gm-Message-State: AOJu0YwanlLBvLNhxOjpL42UXu7VztC/bgQV1pNCPCHgaoGVgU1YvGR+
	VDYjpI+jKMTCaKddGFiQtopZSE3IVeE24PVaI8ksRxr5y9zlNRAVaEda0dF0/+1Gxa451gxYqIx
	NA6AI
X-Gm-Gg: ASbGncvsgRjPCWVQVVTEiLKBNUCZol5hp3t2QPrHCsTdWOqioNIs8VgAk/FwQdA3IeN
	nNdc3bINDyZ+ey6O04df7nkyjkYXxadg7MJ726qyaIcswiKEz/hn7BxYcp5CWClLZwK9cmarNz0
	IfMQvzyvbVF6KDKHuhzMbBdBSBY1D44cs4EeueII85IZRUohhahlvtvUk2gvtKrWdMj3K9H1C5v
	pLgopZelsMW7hOwZuQyOUom5PYAtYD+AIDsS5FQR+qKRTUygtwTHkMovzon56OSkFSJihote/mc
	iffF+e0jbt0fMsntmII9yDqfZT017+eozFKuQYNulxxwfptNB4GqGsCcq3VjFeG451oAw81yowP
	zT35r5i2o6sGnN9Z8kK5YMA+F7EBG37vML8NgPFsIOnMs2VFWUXI3FAPZ7zhV
X-Google-Smtp-Source: AGHT+IFn9LEK6loBFV6v8fLp4a/T/Ql+/K7ygkGXzV0Qn1KbjV+L0y+9VHgNMe1iJbqy+hDNVMmn2Q==
X-Received: by 2002:a05:600c:354e:b0:459:d780:3602 with SMTP id 5b1f17b1804b1-45a1b657252mr19525505e9.23.1755173826111;
        Thu, 14 Aug 2025 05:17:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9a3b:9647:5768:a4a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3abec8sm52741792f8f.8.2025.08.14.05.17.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 05:17:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] nfs-utils: Fix do_configure when switching configurations
Date: Thu, 14 Aug 2025 13:17:04 +0100
Message-ID: <20250814121704.3068675-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 12:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221862

On the autobuilder we saw:
ERROR: nfs-utils-2.8.3-r0 do_package_qa: QA Issue: nfs-utils package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]

This can be reproduced by running do_configure with sysvinit, switching to
systemd and re-running do_configure. udev_rulesdir will then have the wrong
value.

Fix the sed expressions so the task can rerun correctly and update as
desired.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
index a2afe2cd150..039090df720 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
@@ -121,8 +121,8 @@ FILES:${PN}-staticdev += "${libdir}/libnfsidmap/*.a"
 FILES:${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/ ${nonarch_libdir}/modprobe.d"
 
 do_configure:prepend() {
-	sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
-		-e 's,udev_rulesdir = /usr/lib/udev/rules.d/,udev_rulesdir = ${nonarch_base_libdir}/udev/rules.d/,g' \
+	sed -i -e 's,sbindir = .*,sbindir = ${base_sbindir},g' \
+		-e 's,udev_rulesdir = .*,udev_rulesdir = ${nonarch_base_libdir}/udev/rules.d/,g' \
 		${S}/utils/mount/Makefile.am ${S}/utils/nfsdcltrack/Makefile.am \
 		${S}/systemd/Makefile.am ${S}/tools/nfsrahead/Makefile.am
 }

