Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 919E77F361
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 17:17:02 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f72so4610831wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Xcf21skf9W/AALkfdPG/6nVX3qH7zx3F21vm32Rt2rU=;
	b=AKEinDSFkX/bwDv+FuWMT0O/Hr0Oy+wd0cHU0YCO4akf916e1v0QwM+TIQbU3euccs
	RH+aqeB+KEVn6UIliedsVLazvnNaU93SrT0iWa2P3r3h94JH4KwUMUCwZ8GTpLiD0Ur7
	NzKS8fwimpyrsie0IVq0UtNPLUjqwSPLsA1pLaui3cD0WosCiA3FyuAVu8M1k4tVFcq/
	v0MggszkZKW+gvSnYzOz2GeddhwKKBAoa/DtaNnyqch79hsgQt5sfU3nekAaKZJ/pO5o
	gEjOThIlHBzF/pbiGbTjzW8X08zrbYyktqplKxfKu1k84AnXHoTTKKZEWkPK5PLwS5rG
	qquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Xcf21skf9W/AALkfdPG/6nVX3qH7zx3F21vm32Rt2rU=;
	b=AwmW2GkfTEwL61W8t2aLHWCfuiRLjf5QvdaLK5BqA4OTaVW3mOiyEmn2Z6TNLhoUGV
	szjY9/d8iw1rRUJmYKcQVNmbRt9RhUu+kX0RhU3ZHoVqwRPFZYXuZYtHWsdAaWvxNDbo
	PlPX6DIi4ZfKDlamFyBzF3Hs5XPl0JQ3OOoC3BhEM6f305qjd1Nwc7Eha7q1ID3Vo/XH
	1bz+JwCW0SLr3wFqb4RS1/ajiky88FoEYFgBrZOYzy+H4enBbblHCASUd+knoP11meog
	COeNGTv4IJ4kbaYluRJdXk0A6vyWffNpB6yOixu5JHEa6NbcsBd6PysTsxArYYPVDscj
	h2SQ==
X-Gm-Message-State: APjAAAX8Y58fFd7gSg8N20hqUBRZwMzvZdMWb86tKVhuNa8ndJWjxILi
	+Zd3y0mDdrj8bjco/ESuol1hNeunxNs=
X-Google-Smtp-Source: APXvYqxe3YyvUGhdBxtRWM4JN00mwMhWIeAWO5fxklBKRR9rB39e5RLgswYKz4pMeqZqoYtIKQqgRA==
X-Received: by 2002:a05:600c:2144:: with SMTP id
	v4mr8603761wml.146.1565975823019; 
	Fri, 16 Aug 2019 10:17:03 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	c201sm10227660wmd.33.2019.08.16.10.17.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 10:17:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 17:16:59 +0000
Message-Id: <2fa242eb83ddb16e3af01a372d6c1b1255ad1b75.1565973637.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1565973637.git.Martin.Jansa@gmail.com>
References: <cover.1565973637.git.Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 3/6] kernel-artifact-names.bbclass: use PR instead of PKGR in KERNEL_ARTIFACT_NAME
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
X-List-Received-Date: Fri, 16 Aug 2019 17:17:02 -0000

* otherwise PKGR seen in do_install, do_deploy and do_deploy_links will
  have different value in each of them (PRSERV will return different
  value of EXTENDPRAUTO because TASKHASH is different for each of these
  tasks and also cause unnecessary multiple EXTENDPRAUTO increments for
  each build).

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-artifact-names.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index 529e0c565e..41ef6e884d 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -6,7 +6,12 @@
 
 inherit image-artifact-names
 
-KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}"
+# Intentionally use PR instead of PKGR, because EXTENDPRAUTO included
+# in PKGR will have different value for do_install/do_deploy/do_deploy_links
+# tasks with different TASKHASH, causing multiple EXTENDPRAUTO increments for
+# each kernel build and more importantly preventing do_deploy_links to
+# reference artifacts created do_deploy task
+KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PR}-${MACHINE}"
 KERNEL_ARTIFACT_LINK_NAME ?= "${KERNEL_ARTIFACT_NAME}${IMAGE_VERSION_SUFFIX}"
 
 KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
-- 
2.17.1


