Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id CC04C7EE84
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 18:01:05 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id b3so17163187plr.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 11:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NU+2og9yoDKIdsq7LPjGEMLtpjxlf/na2GIUZelodWo=;
	b=nMp/BvldrL/jDp1IHGT3WVlTGgjadE5fwHeKuoxvHdszmPUgn4UFzI91cKFKJAh5Z3
	j44qe5EpDZdHIvy8ScP5/FsZ9mA5G5/ypZzq9pBh5HiNOwGJGl6xaYNZ1I/AvIJMl1Ox
	lniaH2Q8Yv1qCNLiso5Uh/RXWTZQeYwIwLAgDInv6kCnKYV6+nqi5etiTUUfvqle82K8
	hc9S+EE8Y2scKBdVdApFLIXBmNT2Xl0EJ0FR0Vz72eFxVFSbImQL2K6lyc382B4Ys8Du
	IlMkYdodpl8ExzbxeLIvaN6NnNKzIJhjNXuUyti3WQpf3GpvxBUeToSUN1aQcqs/7eOi
	k7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NU+2og9yoDKIdsq7LPjGEMLtpjxlf/na2GIUZelodWo=;
	b=SS3poHXmTGV4w7bjoyarsy5ck5X0RiWUvpFuMQB45Z+1OqWqIZNaO4OxpXEZDUzQnG
	VZ2rdaOjdxeb0XOWPtOuWcvjFBtwAwub1dyjpUVq7Blli/WDlGmLQVzPqkY1oB2xRAnI
	BCZA9xw2Uf8IFp/f3JZdiYMlyyw8HJVCNgJIiYumWxaFyYKW5B4swGjxc3yVK1NkL694
	i4gMD6acuW/mmeQ5O04eW3xz4nYBK7sGrn/2h9JDW0OALTzj3c0DzCcqur+of0dHuU/v
	tX87C5nEbn7TxqRPNEgSY8hlBfaY3eid2cjLDa/D32WsWnTst8FqTBJ6kkON90xbn2nh
	fggw==
X-Gm-Message-State: APjAAAVQgDLd8S87GBRhs8IFuAC5oazPDDwMsNTGgHAQ3IPDPml1kxR4
	nLsks7lguh/DGIYy6T/nxIyLD9/lZUU=
X-Google-Smtp-Source: APXvYqzeLN4ZJUt+U3C/+Q2QFZHonH8CBBFWuFKHZoeH8bpKI6YeGr/7h5PMawF3cS5giiX+ismyDw==
X-Received: by 2002:a17:902:b20c:: with SMTP id
	t12mr64737381plr.285.1563645666522; 
	Sat, 20 Jul 2019 11:01:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	v27sm46118706pgn.76.2019.07.20.11.01.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 20 Jul 2019 11:01:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2019 11:00:56 -0700
Message-Id: <20190720180058.10672-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190720180058.10672-1-raj.khem@gmail.com>
References: <20190720180058.10672-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH V4 2/4] musl-obstack: Add recipe
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
X-List-Received-Date: Sat, 20 Jul 2019 18:01:05 -0000
Content-Transfer-Encoding: 8bit

obstacks from GNUlib is used in some OE-Core packages e.g. elfutils
and other packages outside OE-Core, this recipe helps provide this
functionality standalone on musl systems, and helps in getting full
versions of dependent packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl-obstack.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl-obstack.bb

diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
new file mode 100644
index 0000000000..3003935fe5
--- /dev/null
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2019 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "A standalone library to implement GNU libc's obstack"
+DESCRIPTION = "copy + paste of the obstack functions and macros found in GNU gcc libiberty library for use with musl libc"
+HOMEPAGE = "https://github.com/pullmoll/musl-obstack"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3d23e4eef8243efcaab6f0a438078932"
+SECTION = "libs"
+
+PV = "1.1"
+SRCREV = "d2ad66b0df44a4b784956f7f7f2717131ddc05f4"
+SRC_URI = "git://github.com/pullmoll/musl-obstack"
+
+UPSTREAM_CHECK_COMMITS = "1"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST = ".*-musl.*"
+
-- 
2.22.0


