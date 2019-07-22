Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 313497EFF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 07:26:42 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id f20so8005370pgj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=cwOzglr40ogbE30J9QjFg7lUZxWWqy2isLO/L9aVvHM=;
	b=qFN86pCP9AXaHdXK91YixA9sgsSeKiz/m3VX7bhpdvmdqOQDs01xpEmHMMgtlpZx2h
	Ba9SVbb6NV1fg8xsAcseygRj9MmDijjMXF89jE3jlzj0CQmGFIemoMqZLgka0k71/G8o
	FMjEoWtDrvRtWZB9vXiR9iBn3/UZ+vobHvBVMP37pBWkPko6acAvWX4PK9fP8ZrMd3yb
	j2DPgwtK67ENZntvGm4PNBwoNOM6jaNsWjHbqUCY3dCVBRRvymm8cBHu5v1zGt82mv/Y
	23oKTvNgKfz2vbSeEMbHC5zBAWw1hkHI9dThKlc88HXayMrf5RUmml+Ppu/Cf4hBd5ey
	WTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=cwOzglr40ogbE30J9QjFg7lUZxWWqy2isLO/L9aVvHM=;
	b=Zgj++m9scMMfD5WGZAcLWSwyYg5tFuaAYVIeqCpqpOaC/Un9g+s1Vl/kYHHv7k1QbP
	sBWzgvo8Syfv/kEDIJWawc5eSVOhpZIIXVxFgLZC+/6OBdusRJLxjjY2Kw1YJvOqxw0i
	maqpYxPfQo3f2arWguZ2svCVKf7hRrcqN5p+dmIZFFNlSrbJZnMhWLHNIux7l6Y8MZKb
	kvCPocl51WahkVp2D7BZKObrweIQ9nxwoq4/kZJ2HaKyQ0cbB7QLW64IipVMy4Vo4IwX
	ujGADk7mZOFSAxF9DPZxhlNHS/bnYuQaEHfLseyUfZJjU6dOD6ZVxNEU0ENLlniyoAoP
	9ecA==
X-Gm-Message-State: APjAAAWcj5n9S47AffD/CvQv4c3fJL8XHR3PlRlCDiv/YAd+RBIifq0R
	qGMj7oKnKUcYnaPGaKGs6fbk0DLaGII=
X-Google-Smtp-Source: APXvYqyo5WaADi9b3/9RjyVkumJeMfwquJI2qoEGKc8k/9taQPojM+JG2Tn2TcQk+s+PJnEp7T6ysg==
X-Received: by 2002:a17:90a:2190:: with SMTP id
	q16mr73193018pjc.23.1563780402882; 
	Mon, 22 Jul 2019 00:26:42 -0700 (PDT)
Received: from apollo (c-73-71-176-3.hsd1.ca.comcast.net. [73.71.176.3])
	by smtp.gmail.com with ESMTPSA id
	i9sm30513421pgg.38.2019.07.22.00.26.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 00:26:42 -0700 (PDT)
Date: Mon, 22 Jul 2019 00:26:32 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190722072632.7q2t3zxuo6p6h7en@apollo>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
Subject: [PATCH 2/3] mdadm: Include sys/sysmacros.h for major/minor definitions
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
X-List-Received-Date: Mon, 22 Jul 2019 07:26:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixes
implicit declaration of function 'minor' is invalid in C99 [-Wimplicit-function-declaration]

which eventually ends up with a linker error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mdadm/files/include_sysmacros.patch            | 14 ++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb           |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/include_sysmacros.patch

diff --git a/meta/recipes-extended/mdadm/files/include_sysmacros.patch b/meta/recipes-extended/mdadm/files/include_sysmacros.patch
new file mode 100644
index 0000000000..8a1d8342d8
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/include_sysmacros.patch
@@ -0,0 +1,14 @@
+include sys/sysmacros.h for major/minor macro definitions
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/mdadm.h
++++ b/mdadm.h
+@@ -35,6 +35,7 @@ extern __off64_t lseek64 __P ((int __fd,
+ 
+ #include	<sys/types.h>
+ #include	<sys/stat.h>
++#include	<sys/sysmacros.h>
+ #include	<stdint.h>
+ #include	<stdlib.h>
+ #include	<time.h>
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 0cd9626f27..74c94f6ecb 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch \
 	   file://mdadm.init \
 	   file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
+           file://include_sysmacros.patch \
            "
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
 SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
-- 
2.22.0


