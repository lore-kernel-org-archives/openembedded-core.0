Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id D462E60C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 07:03:50 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t14so3371721plr.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 23:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9L2B5XpHMr6wk9NTU6r5HxZYyZxzhtyYZdzVEpr0nJE=;
	b=WUA8GlIGzBa7vIUPfk0E49Hh7nYtgCfQ4XkgBABbM+5jxXZA+RmDmyDOHpwnwNN/Px
	F2mckcq/Fi6t4+zKSBUnW/5B3E1YGPz5dUIJIs2pNP4N34rHmOq3xz+KPfl+B1a3s15t
	CNCNOklG3pn5lJb8db5bTdJf3+ALPaW5K4eLT087b8nkGSiZZqBSXmpnCDkB3DVwJlNA
	5L+7BgDT6i0Q15bYsk5q8DLxy4RwEe5MLvVD3CcTNMDTZWs6uOV3zayFA5+MYDZqpddA
	bktKTlfEw5NYJnvAIdgjSmLshNgg2dzOdGuqRbQjWSwKqHr6CiNGaR7bqPUg06hQNgV0
	mt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9L2B5XpHMr6wk9NTU6r5HxZYyZxzhtyYZdzVEpr0nJE=;
	b=oNrj3GZj4hw7hnq9uc+ycAoDGXcz/cU2XUcsYdPVbOSL+wM5K5H128J9a4fRzJfjQL
	A+vgJaD7ul+1zC54/S0Sf7bdxpxKgQz9grqSoNUpF1PTcuQ7HJdqXjD0OTA+00EM8BBq
	8zW0lcrcAbU9JxeWHQGygKVi6/zdEK1QL5diYE7SIHFo2UcW+9J8vidCZTANd1c0/g0c
	ANTYaWav07Wp9VHU4Mdb9ufWUHvkoaF0d5sg/HGs0hHrtFoOuw0qtcfEM6DoUEbHuq6Z
	xVbW2MuS6Qt3xyoLQRj3j7Z+P9L/i6YvmXk3n4f4EUCVx1W51SpgEAWjyRqApxTcT8SC
	mmGw==
X-Gm-Message-State: APjAAAW6sqe7IZv3tM98LK3hQRitS8xnpWzJ/D432uwFnxOn94TL7wPi
	gXPo9uCWEX1SmXTtni/SMH7EvHWVkqo=
X-Google-Smtp-Source: APXvYqxHHv800RMgWZ4xnAbrPOvthDaPDv+F8FKq7T3FYJR1kroHruncJytYyfMHandx9T8tvZUvdA==
X-Received: by 2002:a17:90b:46cf:: with SMTP id
	jx15mr1903686pjb.2.1581663831318; 
	Thu, 13 Feb 2020 23:03:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::709])
	by smtp.gmail.com with ESMTPSA id a9sm5444958pfo.35.2020.02.13.23.03.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 23:03:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 23:03:52 -0800
Message-Id: <20200214070352.1206450-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] swuashfs-tools: Enable on musl
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
X-List-Received-Date: Fri, 14 Feb 2020 07:03:51 -0000
Content-Transfer-Encoding: 8bit

Upstream has a patch [1] to fix musl builds, Prior to this it would not
build on musl due to missing GNU extentions for fnmatch

[1] https://github.com/plougher/squashfs-tools/commit/4280e74de14070869787a9166242f9ce2dafd82e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 4fd33f8048..9bcf026ce2 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -12,9 +12,6 @@ SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
 
 S = "${WORKDIR}/git/squashfs-tools"
 
-# needs FNM_EXTMATCH
-COMPATIBLE_HOST_libc-musl = 'null'
-
 EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
 
 PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr reproducible"
-- 
2.25.0


