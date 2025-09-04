Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F217CA101C
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:22:55 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.924.1756999372044229891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eDBuKs0O;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4c8bee055cso883252a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999371; x=1757604171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNbDkRw6yHs5Z1ufBe8gITeQMpCbCsMbcZ2sYdN/CXY=;
        b=eDBuKs0O+QYYVwEc/O5TMeo47OcvHyhUlnK/p0kbdgv5VjqipBc13uNfwc1siNyqai
         vXmI0Lg370qvsUr1UrUgp5MCRvXg9GTFlO+e+U4dZWBjjHRzlTRL8C8aBnSzzrKalHhx
         A7NxboVh1t3FsHGubM28ITKVWzf3Mk6xQ6WQbOl2FKPuJDwkM1/Pt7mEB4ou7llVhjsc
         M4XNp4tA0+hNc2MphGKZJYmRKiDnNrCduGnWXaOnRyS15RMCjdXcRA9BpOJJtpZ1b0CY
         GZTK40dbz86VcKKdMx/+fIDVWhVttGjUwoAKfO132+npl+PQIMIiBbOwfSJQ/swYDHNE
         XxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999371; x=1757604171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNbDkRw6yHs5Z1ufBe8gITeQMpCbCsMbcZ2sYdN/CXY=;
        b=cIHKhSMEUrWyCGNhTt1oylRTBS9uzLlOAZIk/gTz0K4WlLuJ8aC0oH1mA+S4rmij8a
         cCmSNZ4ULpevFlHa2SGRtBheHrPAcJvhgBP3COZWBiE2aRO4D8Y185vRDQcuF373NjQi
         2DxNBJIjhYaygUlV9nPPdQPp0uzoxMYtKUfHXdFJkPGpu+DjNNuD3lEv4EpDsEYLwKkw
         6jNqxyxbpx5pdDwVzQVYOwLe2nHb78FtrqBpt+p2sYBIzVtIdAmVsBsk0T1ID2DNaoSC
         sERO6lWy+64/eiCANPk1Tr8RQZQSiGpMzj/tMJOUpB73ds8N/w/cmRhj0H1au4THvpvo
         S9jg==
X-Gm-Message-State: AOJu0Yw1mSs1IjC6D+rkvoIif+BRWupvppd7WQLyqWwpDhY5KG8ABlvK
	08SBTKuzYIFBdVqUdjz/Ltn1S8+hKeLvuB5rE2RkVYwez99H/dO8dj4OGuLiZtgDyoU/EgmSM+r
	4Aham
X-Gm-Gg: ASbGncsoBQsFK+sgz+3IBM1Jj2XfvpKlR3rizlkrquq18rWehlwTF+LxKuoQlti3rPR
	IUxwRyMf4nx4LJAnbQre6iLBZZSCVtUJjtFx94LqW+lNtYBTsBNJWLH+rpjQPeLoCXdaCmiiRk+
	psY1HbrouIKlXOoh+f9+5SBj7FJlnmJtPXIsLOkzMJ8oXukfoCo7re+fKQlO5tNDIVcoJCmhkCq
	BEl0yZB4SHKF1ve2UUa9rzJfxhXetrmPovmtOtz3rZsqJZ0RFbl5vUtrzxUEjOqcFGRnz+wKQb1
	sTQz4ETsgL1NX25/5fOsOJd+TKmzE7igsl8h8ivZjd4F1N0dhzI0TDJCKvnxpYFdkTxjDpYDV/8
	GZ8/Cz3Db/6xr7FK2NitsModW
X-Google-Smtp-Source: AGHT+IG1ue5eFhpoHCpXpTysoQmLx6tvs77SYwPmlvG8myNfYCj88FvNEqK7BwWKYDITcgUYdib1GA==
X-Received: by 2002:a17:902:fc84:b0:246:f13b:1b92 with SMTP id d9443c01a7336-24944b758c8mr253471675ad.55.1756999371013;
        Thu, 04 Sep 2025 08:22:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b11448a5asm82528085ad.54.2025.09.04.08.22.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:22:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/5] rpm: keep leading `/' from sed operation
Date: Thu,  4 Sep 2025 08:22:35 -0700
Message-ID: <cab720b5508411f9a63025e2765d4d46914a1404.1756999195.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756999195.git.steve@sakoman.com>
References: <cover.1756999195.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222958

From: Hongxu Jia <hongxu.jia@windriver.com>

For /usr/lib/rpm/macros, Yocto explicitly set OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM
= "ONLY" [1][2] to search tools from CMAKE_FIND_ROOT_PATH [5] which locates in
native recipe sysroot or HOSTTOOLS_DIR. If found in native recipe sysroot or
HOSTTOOLS_DIR, the sed operation removed leading `/'

root@qemux86-64:~# vi /usr/lib/rpm/macros
...
%__xz                   usr/bin/xz
%__make                 usr/bin/make
%__zstd                 usr/bin/zstd
%__quilt                usr/bin/quilt
%__patch                usr/bin/patch
...

root@qemux86-64:~# rpm --eval "%{__xz} %{__make} %{__zstd} %{__quilt} %{__patch}"
usr/bin/xz usr/bin/make usr/bin/zstd usr/bin/quilt usr/bin/patch

This commit keeps leading `/' from sed operation, and similar reason for
/usr/lib/cmake/rpm/rpm-targets.cmake

After applying this commit:
root@qemux86-64:~# rpm --eval "%{__xz} %{__make} %{__zstd} %{__quilt} %{__patch}"
/usr/bin/xz /usr/bin/make /usr/bin/zstd /usr/bin/quilt /usr/bin/patch

[1] https://git.openembedded.org/openembedded-core/commit/?id=f4ea12f6635125ee793f4dd801c538c0186f9dc3
[2] https://cmake.org/cmake/help/latest/variable/CMAKE_FIND_ROOT_PATH_MODE_PROGRAM.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d0773879ab9520c475c4a8c930b2e663de0e032)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rpm/rpm_4.19.1.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
index 9330323797..7505e3452c 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
@@ -130,10 +130,10 @@ do_install:append:class-nativesdk() {
 }
 
 do_install:append () {
-	sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
-            -e 's:${STAGING_DIR_NATIVE}/::g' \
+	sed -i -e 's:${HOSTTOOLS_DIR}::g' \
+            -e 's:${STAGING_DIR_NATIVE}::g' \
 	    ${D}/${libdir}/rpm/macros
-	sed -i -e 's:${RECIPE_SYSROOT}/::g' \
+	sed -i -e 's:${RECIPE_SYSROOT}::g' \
 	    ${D}/${libdir}/cmake/rpm/rpm-targets.cmake
 
 }
-- 
2.43.0


