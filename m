Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB616142B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 15:51:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t3so16674083wru.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 07:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9vDYHdspbxAc/saq2nIu5gLnS77KqTCv1irK9SAhghc=;
	b=a0Vb0BbwhGhf8Q31PW399SziKxTzDfSDECqmYkLOg18488RLFzwmMH3oTO8oPFpYI/
	IcDgTlZ+C412eXdQcE6ciuRQQYPxWRY/fqYOr6vI+qJhLsWoo49sJewok4shwWsjLOxC
	7YpgLqrVF5y8HiY5T4V/pVPEAPCuBlbPd2uM1NeRoMJzulF1qWqm1kuRoVdSmcdZIRFu
	XuCxudcclhiWdbCRlmxvMOb9qt+Jb6dxH0Q1DpccWWQ9Jb2cHEcdvSXTxRFbNlsJBQ9J
	0O+fgS10HLH7MDq4g8coLGh7fs0pXdS0lQWn0vhihuTPx1z7qlXeXlHe5QaCXgVQZfpM
	brjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9vDYHdspbxAc/saq2nIu5gLnS77KqTCv1irK9SAhghc=;
	b=CDNG3eDxhJgsr5+VbfVX0W2OwA8tbU6FyPbfKpdGAEJyQdib/Kso4hJ/ay4/cmXrkk
	DBBqy1LOzg6e1EMOjjOOh5ZdKtdbETitMrRikdwVjbjoFolCxjExg+AxlWpH/wQxSmY3
	TZVfSSoI4Ngv5yXBQm8gCCJdF8KSPy9IU7ofmdzmBfR2hquxfINOciWm7kKJ0KJZouFc
	8ZiAHamX7Zknm/WPaHYFDt1CwZ+5UBCJCeAns3GiY3qrXO1HI/BTBW3AW22SvYPEMabm
	FCCmOywlfM7rejeH9aCNcsUwTYRDdqxSPxGqRvgGoEjsgmnRVAFqk8P+1LZSoY5Il4tb
	sOpg==
X-Gm-Message-State: APjAAAXSQVtCG9RfL6Dlu+O771vT+EbPXeGz9OcoOO5pCimduAVYPMPB
	9dgYmH7paxEbegleB1bWLx7jYwAa
X-Google-Smtp-Source: APXvYqzl+WcUyaKU7AeVa+SC0zHSV77qMURdtCIOvPux/ccU+Kb5z2FNNlkLBe39ay0OcOZNaX4vlg==
X-Received: by 2002:a5d:4a8c:: with SMTP id o12mr15940763wrq.43.1581868266462; 
	Sun, 16 Feb 2020 07:51:06 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	t81sm16513271wmg.6.2020.02.16.07.51.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 07:51:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 16:50:09 +0100
Message-Id: <20200216155015.21738-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216155015.21738-1-alex.kanavin@gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Sun, 16 Feb 2020 15:51:06 -0000
Content-Transfer-Encoding: 8bit

The fbdev backend is not documented, and not the default;
as the emulated hardware in qemu now supports DRM/KMS
(both std and virtio), we should align with upstream default
and vast majority of users.

Note that 3D acceleration is not required; the backend
renders fine via the software driver in mesa.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini

diff --git a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
deleted file mode 100644
index 17ebd7fdab..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
+++ /dev/null
@@ -1,2 +0,0 @@
-[core]
-backend=fbdev-backend.so
-- 
2.25.0


