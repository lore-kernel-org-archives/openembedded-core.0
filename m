Return-Path: <lxy204899@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69959C47DD9
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 06:42:05 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by mx.groups.io with SMTP id smtpd.web11.9385.1711780920759497662
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 23:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@163.com header.s=s110527 header.b=PgdpJeCo;
 spf=pass (domain: 163.com, ip: 220.197.31.5, mailfrom: lxy204899@163.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Z75mC
	hlHERb/7YoLxUBZk879XgfcrASjmOAgk8D/LgY=; b=PgdpJeCouOuIoxGyjEt0s
	+DJ24HGG/NaIWLPMzG1glw112/LveN955szl4LYtfxbOjF45vHoL/oKe3NUymOU5
	lBDCERgTkKLwxCvqQWN78wDbonCsTTwdnm9vbsInZuU0cUbvbHa4XxKE4cTcrrTC
	p6mnAiEWgikOA1DuXtRq5c=
Received: from ubantupc-ThinkCentre-M920t-N000.. (unknown [139.159.170.28])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wDnl6YktAdm9nRIAg--.28555S6;
	Sat, 30 Mar 2024 14:41:52 +0800 (CST)
From: lixiaoyong <lxy204899@163.com>
To: openembedded-core@lists.openembedded.org
Cc: lixiaoyong <lixiaoyong19@huawei.com>
Subject: [PATCH 2/2] oe/package.py: enhance objdump command call with llvm
Date: Sat, 30 Mar 2024 14:41:11 +0800
Message-Id: <20240330064111.2531269-3-lxy204899@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330064111.2531269-1-lxy204899@163.com>
References: <20240330064111.2531269-1-lxy204899@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnl6YktAdm9nRIAg--.28555S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW5GF1rWF1xtry5Zw1kXwb_yoWkZFb_u3
	y7tw4xAFs2qF1DtFyYgFs8Jrn2krWUWF1vqa4YyFnrJr1Iy3WrXFWqvFs2yF4UWasakr17
	t34fWry7Zr1SgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8_-BJUUUUU==
X-Originating-IP: [139.159.170.28]
X-CM-SenderInfo: ho01jiiuyzmqqrwthudrp/1tbishSxomVOChCrJQAAsK
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 06:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197646

From: lixiaoyong <lixiaoyong19@huawei.com>

Replace `${HOST_PREFIX}objdump` with `${OBJDUMP}`.

When utilizing llvm for compiling packages, the invocation of GNU objdump
will consistently occur during package precess. This behavior is unfriendly
to llvm. So prefer `${OBJDUMP}` over `${HOST_PREFIX}objdump`.

Signed-off-by: lixiaoyong <lixiaoyong19@huawei.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 587810bd..1511ba47 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1660,7 +1660,7 @@ def process_shlibs(pkgfiles, d):
 
         if (file.endswith(".dll") or file.endswith(".exe")):
             # use objdump to search for "DLL Name: .*\.dll"
-            p = subprocess.Popen([d.expand("${HOST_PREFIX}objdump"), "-p", file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+            p = subprocess.Popen([d.expand("${OBJDUMP}"), "-p", file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
             out, err = p.communicate()
             # process the output, grabbing all .dll names
             if p.returncode == 0:
-- 
2.34.1


