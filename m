Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 05A2460130
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 17:35:57 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w25so6362353qki.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 09:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RSa44dX2g6nQVud0zL3I+oPqxnRkx4bzLKn+F8PfS+0=;
	b=osvrIb1tTKkm6Ys3RloA5sdQuVWqO5rl/nxM6yJgTM4/c/L44sZudymwQWFwLmgkCv
	/Tem4vtwPCOv0rIyNWa/eD4K+VXKTWmrSTx/CHpdgw5GxJLk9tXumORfYu4YPu8As/w/
	zOQFuX0wkeLQQ66qgGNGxw5P0jD3lH7m5vucJxzBuQ/KR1HuMmhSWSVinZIjxVa4CeQq
	qqHqtz+z7bGN5au49g31g/ut80EHgHEE/14HAHksHig9KO1TQP8LLjcA/Ljl+T1ynRtK
	Q+XgNoHox0EiJBlyLuUJVG1Zjz+f718tJM2oUqnfARj4i+bvTtO1IiFVdd1LHwX4hCYZ
	6rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RSa44dX2g6nQVud0zL3I+oPqxnRkx4bzLKn+F8PfS+0=;
	b=n25NiJqCZT+8aQ9dWz+y4m/5/nBClp+lyriqOgIxEEyStWrxwNVS8B16CiqwYer9cg
	j5g2FG1V7VMyntb/YlC8VPt61M8YHI/FfAL3ICOL1EfrQz17eiAYBLc1JrpwGW4RMvUg
	XBxCxlobsMvFL91091CWgp20N6ljnybH6D7/WEGp8u0u5PY8itiELiVVHIeiLjQysQ49
	6e+/5lR5BDBpBkwFOKySw5xIfOWX/aOF457AJ2z8X5byT1Alx2X2EuEwFxirp8NHl8Wn
	jTA95xyH17V4ztTSiGqmFhDgXjaNp8Bs4jVnE7P59pOG5EAnnUvokXOlrkPfCnRIMsiQ
	KADg==
X-Gm-Message-State: APjAAAUW+MbT1GiCoy2pho3zOxUyiz9XttvBto9CSYCughfehtCWeM9z
	o5Qvd0Kz/3Mp1ZRKn+T8WzwBaXdDSZA=
X-Google-Smtp-Source: APXvYqwL4BZEmfhrXW2ZG26s+0FszuFFzw7cVXAiZ4+znvotwk5l7jk/6/sFzAF2LFc3yOjRvyXhIw==
X-Received: by 2002:a05:620a:22f3:: with SMTP id
	p19mr3396377qki.200.1581010558902; 
	Thu, 06 Feb 2020 09:35:58 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	e26sm1715138qkm.80.2020.02.06.09.35.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 09:35:58 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Feb 2020 12:35:46 -0500
Message-Id: <52b98a7fb4dea5caf2629ebe3339a559bf8e7ef0.1581010425.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1581010425.git.bruce.ashfield@gmail.com>
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] kern-tools-native: use more common S value and oe_runmake
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
X-List-Received-Date: Thu, 06 Feb 2020 17:35:58 -0000
Content-Transfer-Encoding: 8bit

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../kern-tools/kern-tools-native_git.bb               | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 3f9cfe7fe5..f263421234 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Tools for managing Yocto Project style branched kernels"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249624278c3e343e501"
+LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249624278c3e343e501"
 
 DEPENDS = "git-native"
 
@@ -11,14 +11,17 @@ PV = "0.2+git${SRCPV}"
 inherit native
 
 SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
-S = "${WORKDIR}"
+S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
 
+do_configure() {
+	:
+}
+
 do_compile() { 
 	:
 }
 
 do_install() {
-	cd ${S}/git
-	make DESTDIR=${D}${bindir} install
+	oe_runmake DESTDIR=${D}${bindir} install
 }
-- 
2.19.1


