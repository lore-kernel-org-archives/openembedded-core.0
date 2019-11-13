Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4A66F7F7D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:39 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id n13so1910005pff.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VBftmu68V8MOQp78gEO3vcwpLa5OsuyZQtAwH8ypQbM=;
	b=J6h75oYQbA9Y5aqIytb5kTZeivj7Zb3ACdYEPIncq6Z1gbWQ+1RDha3Diyz1YtKQf2
	be3Mjs6lXl9dWevNJ3RDsQZjN2MHc7CnvQRd4qgQmo6YL1i5Nlk1pAKVUzP57xRwflxb
	rpvVPehMEQuwCnZlHE2cWtakbuMU+YMd5v7Zvm1MRRt79YBFzKmSj8dgaP89+wSauwX6
	iW2UxdTWaCALQunZPN5it7xA3bJsflCM632EWZtATikPj+99PvYuPPm57dwzqgypx6WM
	F9LihHlmakv3CnLNwG08FF0TC4aPBjP0e1SoHPHDQEFYdLfpmftB6PUb9STemsMJLHbK
	QJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VBftmu68V8MOQp78gEO3vcwpLa5OsuyZQtAwH8ypQbM=;
	b=hUn0a84uAFq8iiRTveZNCQMOzNOBoVBtHQiXZ/ZfaEtPu+Tb5KnODPvO7UI7It90hd
	PYxWm0/+I7gECH+G0AAzqd1q39M/LPXdvlEShZSNyasTw1IPu5mj5ZkFndivOG4LaHOE
	MzVZVVa66CZ9NFikUoB66RI1t/cVp9svoE7MpHP24LvL+wKmKG5wlKODNJX31dMBuBS6
	veJ42akxbhLtMYP2bFtqHYtdKdBvo227GNnKMTeDAX0LiQ/KzZXPxWqyfAOnxMV2y/Lv
	2BuAFn71CvqXb0q51aPe1RkZBSUDewZ/3acE0wthb1oglyk1bKiN5/ErZHYI8jrg4etV
	dYwg==
X-Gm-Message-State: APjAAAWyrl8GJ1jJagNSwoksOOkM86JFRE1G8ALgsNCJ/32lQPcnn7yo
	SCQ+/oygfMJ+4IMb9tVQ0dCvi3nB
X-Google-Smtp-Source: APXvYqzP3fFCvimAo6tSikW4qAPfzWUl/f2q0vCQF9sy5orv1H+RHx7I3/dZUtmgOH+Wp/urfFkJhA==
X-Received: by 2002:a62:8010:: with SMTP id j16mr5114290pfd.249.1573659160258; 
	Wed, 13 Nov 2019 07:32:40 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:57 -0800
Message-Id: <d0f285bd7d066e752b93e57b7f5468819016586f.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 15/31] mdadm: fix do_package failed when changed local.conf but not cleaned
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:39 -0000

From: Changqing Li <changqing.li@windriver.com>

reproduce steps:
1. add DISTRO_FEATURE_append = 'usrmerge' in local.conf
2. bitbake mdadm --success
3. remove DISTRO_FEATURE_append = 'usrmerge' from local.conf
4. bitbake mdadm  -- failed when do_package

it is not proper to change source Makefile during do_install by sed,
fix by pass correct config to EXTRA_OEMAKE

[YOCTO #13493]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/mdadm/mdadm_4.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 639382e..64f519e 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -43,13 +43,12 @@ CFLAGS_append_powerpc64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS_append_mipsarchn64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS_append_mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
 
-EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
+EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${systemd_unitdir}/system \
+                BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev"'
 
 DEBUG_OPTIMIZATION_append = " -Wno-error"
 
 do_compile() {
-	# Point to right sbindir
-	sed -i -e "s;BINDIR  = /sbin;BINDIR = $base_sbindir;" -e "s;UDEVDIR = /lib;UDEVDIR = $nonarch_base_libdir;" -e "s;SYSTEMD_DIR=/lib/systemd/system;SYSTEMD_DIR=${systemd_unitdir}/system;" ${S}/Makefile
 	oe_runmake SYSROOT="${STAGING_DIR_TARGET}"
 }
 
-- 
2.7.4


