Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7532C916BB
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:24:59 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id n7so3724823pfn.0
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mHZK3ldVkmW5X8rgEgvdJOviTNDLEpS0VkdgG2Ycu9Y=;
	b=QnuXfB61SwFnqmamnrXym05njicKU9YBA60LrlKtHAaK5natc8zlDQylTOFM2IlKJA
	m/fDZz9BAJJFpoX5XiRJ+hvRpf1+e1qkN/fGEPpquCmrW3uM91ei/XZnanaxiqMZnziR
	kiL3IWgCiK3eL71bFgKVAEKjjC+jp0ScItgYfD5miez6GfNghk1yIbrulvXEVbMb2MLV
	cbEd99NODT+MRiGIuclPjX+aCl9OSuPxciHUdx23CzJjWs8a5snZfmSBVZAo0QaoqwE9
	o3brJ+0Wh2V97PBJHq0qLhSp4tXcUtZV2wBOMDPItzk947NrkelQI8nLmPUqm108OIkB
	PVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mHZK3ldVkmW5X8rgEgvdJOviTNDLEpS0VkdgG2Ycu9Y=;
	b=D19VETMoZhUhQ7Tt2lILwzWmJh7ugnrHXXCvpcDyqvu8q6FRwCfPLslXxbTEREgDMC
	mVcL2JQhkAtCYvsq/I8tc+cujIcWSxGINmp6M40Jpzc3V7HQXdw7MZnHhIEvuDrWpuAI
	mzvazSNc17/7tV3jNlZxUGUH1olfF9mF+Qp7OTB6sIhyVPsikitOF79ZmjlnZPyzVKqq
	4YhXuj0ut8zgXAgZ75mJA3YBXkUJTWQtc96PukmBsNV6yXqN7WqQqL2ncdSyRs8Vw8jN
	i4mMFuhBpT4w0LKvqJn+hf4PkGOawBfs72bn8/IA99ErsPNQypJK5AWelqPLvhAa7FIA
	Lofw==
X-Gm-Message-State: APjAAAVbIZ48RYPiR73wGTFaI/DxfuLatvlxnOGoPh6KhN16o2twIPJk
	7tgd5ViCvpOp3Vbt45cNlQGxTdSg
X-Google-Smtp-Source: APXvYqxWRom/hUR1NVuz00gDouC8thaB8+COfGv6EZNKkx8+s6p8feMrVFKthkpF0TQglcUUeMB8mg==
X-Received: by 2002:a62:296:: with SMTP id 144mr12690476pfc.120.1580055900416; 
	Sun, 26 Jan 2020 08:25:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.24.59
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:29 -0800
Message-Id: <04297ee03f5f4e4edafaf332a6648465f52ba1eb.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 04/29] python3: RDEPEND on libgcc
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
X-List-Received-Date: Sun, 26 Jan 2020 16:24:59 -0000

From: Joshua Watt <jpewhacker@gmail.com>

Python uses features of glibc that require it to dynamically load (i.e.
dlopen()) libgcc_s at runtime. However, since this isn't a link time
dependency, it doesn't get picked up automatically by bitbake so
manually add it to RDEPENDS.

There is an outstanding bug in Python to make it explicitly link against
libgcc at link time which would remove the need for this. See:
https://bugs.python.org/issue37395

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
[ merged the fix to make it glibc only ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/python/python3_3.7.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
index 7a569f9ca7..3efd3bcac8 100644
--- a/meta/recipes-devtools/python/python3_3.7.6.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -308,6 +308,8 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MA
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
+# See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
+RDEPENDS_libpython3_append_libc-glibc = " libgcc"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-- 
2.17.1


