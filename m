Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id BDAFE7FE6A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 21:32:57 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id z124so3797642pgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WhjkTDurcfw1UXu2nMIpZEO6oq4IUVDhJ9w2K/M7doU=;
	b=tdm1THyliTNYNMsWxat3maHNuzlSuTp8R54VsFSdCC9fxmCD5k1oMONzsE03RdyPxn
	RGFMCvRlfLyf3+sVcvJgWXbk4cJ2BZVuH/QeR5uMJ88X2j/w5sGrTVcOQFR0EWg8ebdt
	8W9lWV7y+OGRzXfTFNa0RmlOFWEFiPXi6RUJ4rMMcjNQxVEgZCu2LPKFBzOVafFG9O5p
	y5iSjY6cNI9yh5U2D2hs8FOxXZqcLmWAQnFALh52XtOdwFsX1iUYCcK5vaqinaMvzLpS
	flSxJ7amQxZoRnkgTS1BXbY6jPYRJgSDU5gGDnNKb7dgrTOOulGUPdafTNzp85sp3gbs
	GJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WhjkTDurcfw1UXu2nMIpZEO6oq4IUVDhJ9w2K/M7doU=;
	b=INvUEqrE8TTj1P+L2kYwRIVtf4RS1+pHwg0HFGcCavOmgFAQhPJpo6k7xuly5os0q0
	ZJ4i9ntPzb3SidP/JkvsWFGIZNj3agGUc3+WypQiHRDUoPSjZy9g9/enGQ7itN0wsRE0
	BPkUWktPxvdz0Z0XqDwwTLfH4bWV9ndO3eDHXKN7C0mmJhuaq6AW6OL7odY/FDHnaRJp
	eY/b92TUslgyqC6zKzaRobPbCVTY85fZQOneVfa5Y1d3VYrR3PLGu6kqnyuILwze9zkf
	9ghTSvGgFvU2SpM6TpERnFlXxgtVuY1bPCx9B3CfZpF4j5w/v+VosoMbGkfOgH+u3clq
	ouDA==
X-Gm-Message-State: APjAAAUCDZL35GoxKjDZZeXD4ekyZO7+Tsyq+rrgwnXtgjEB9CTT+HtD
	oSsDAlCrWvSizDynQZqnfR1/MB6FrYM=
X-Google-Smtp-Source: APXvYqzE7/IdiVZ1KfwJfVFg30KZjQrlfNeh0AqrHxIAdvut9jZm3zFtoxD7QTusd9/4I5vcTsllng==
X-Received: by 2002:a63:1e5c:: with SMTP id p28mr11470784pgm.235.1576791178242;
	Thu, 19 Dec 2019 13:32:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b])
	by smtp.gmail.com with ESMTPSA id o6sm8587061pgg.37.2019.12.19.13.32.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 13:32:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 13:32:49 -0800
Message-Id: <20191219213249.2292743-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] cmake.bbclass: Define LIB_SUFFIX
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
X-List-Received-Date: Thu, 19 Dec 2019 21:32:57 -0000
Content-Transfer-Encoding: 8bit

This variable is used in lot of cmake based packages to denote libdir in
multilib environments, now a days there is a better way to include
GNUInstallDirs module but thats upto these packages to adopt. Defining
this helps compiling a bunch of recipes in extended layers when using
multilibbed builds.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cmake.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 14796ac053..6c33777c8a 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -174,6 +174,7 @@ cmake_do_configure() {
 	  -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} \
 	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix') + '/')} \
 	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${@os.path.relpath(d.getVar('datadir'), d.getVar('prefix') + '/')} \
+	  -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
 	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
 	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
 	  -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
-- 
2.24.1


