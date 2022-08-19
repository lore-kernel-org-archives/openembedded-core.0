Return-Path: <tomi.belan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B60CC32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 15:24:01 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.4364.1660922639491784597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 08:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZVKIlzu2;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: tomi.belan@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id gb36so9396881ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 08:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=aS/M8ZgMKeaC4/W8VanfxjexuSP2rSwyMkm+haahqwU=;
        b=ZVKIlzu26o2xfrqIgzU5QgmUhyrRiQm7l17kJirvnJ2a1VIOWx8sCPcNm1RZNx7Ar1
         cyj9ZMVlnaoZCsiJ5T7rGK4xhZo6Lrab3hv6cPjMEWub1aaGq8SiZgwstqcaVlgweBbc
         PXQVwxhpz1xFl3jcRdl44ihtrX4rz2MbEzd76ZQHBCqd8DjVDxp8lfWjwGVGQPonVcq5
         R6qqpAZNL1pfr5+D1Wm7Q11D4H9DSUV0VFTdMcc9wxdH6iccJHBVwXbeCTdA+1q4yrvz
         9K342/oNqN8wnF3mTkJR9Qr4/tLCLcMhE64+Ag936NvT3Jt0pZDLQTNS8As7/WLuQ4aK
         s/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=aS/M8ZgMKeaC4/W8VanfxjexuSP2rSwyMkm+haahqwU=;
        b=3ZZbUrSvWGBisk894EDUTJycDTPhGc9Flz9DbitWbYfkhpws2Nq5wJDQTqcxDenDty
         mxuMWKRpywzzYqSiGpZ8OxiEzXaSJw6XwOEx7hygZsg+2iAcYQKSoh0WTilExBL4pV0m
         v+l47PIcaay7kLnWb+2w7eNiXvhj4kDJvunH6Kt4iLGw+mFkvQviJafXKhGYE3WHj2hq
         zqJzMtVoe6PYDj4VEdBglcJfycXLCiri0pqS28WmD3QB/1FAb76dExldlq44AGmPF+l2
         JYUUDPUp02Z1YAyj+qQ6lfb0XZFUZr4n+MBddwM8WUwY4pmdOV8X9wzH8HdrXLB77aiW
         jceg==
X-Gm-Message-State: ACgBeo09Kq3icrxrM354eX7MiR/+q6pjlNteCJPrg7tJWXnMIn7CdO62
	pXV/vHYz6h4evhL3lYECQSI32Oo2xyCgxA==
X-Google-Smtp-Source: 
 AA6agR4CA/+/laKakELVhtBJEskbGlEeoBC1Aiht6akA27fHarYHjV1K9KutJIzuU/ysGAswYSuNag==
X-Received: by 2002:a17:907:87b0:b0:738:e618:99ca with SMTP id
 qv48-20020a17090787b000b00738e61899camr5191449ejc.357.1660922637465;
        Fri, 19 Aug 2022 08:23:57 -0700 (PDT)
Received: from smnd.sk (deuterium.smnd.sk. [193.87.13.210])
        by smtp.gmail.com with ESMTPSA id
 j15-20020aa7c0cf000000b0043bbc9503ddsm3251996edp.76.2022.08.19.08.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 08:23:57 -0700 (PDT)
From: Tomi Belan <tomi.belan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomi Belan <tomi.belan@gmail.com>
Subject: [pseudo][PATCH] pseudo_util: Silence symlink errors and fix
 resolution bug
Date: Fri, 19 Aug 2022 15:23:52 +0000
Message-Id: <20220819152352.590-1-tomi.belan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 15:24:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169637

readlink() failures are normal. pseudo should just set errno and let the
program decide whether to report it. E.g. /proc/$pid/{cwd,exe,fd/*,root} are
unreadable for other users' processes. The "pidof" program calls stat() on
each /proc/$pid/exe, which causes pseudo to spam stderr. "pidof" is used e.g.
by various dpkg postinst scripts.

This if branch also forgot to update *pcurrent, so "cat /proc/1/cwd/stat"
would read /proc/1/stat instead of failing as it should.

Signed-off-by: Tomi Belan <tomi.belan@gmail.com>
---
Hi. I'd like to contribute this patch to 'pseudo'. I'm not familiar with
git-send-email so I hope I sent it to the right place and it looks good.
Cheers!

 pseudo_util.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/pseudo_util.c b/pseudo_util.c
index f150a1b..e8e9803 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -679,7 +679,7 @@ pseudo_append_element(char *newpath, char *root, size_t allocated, char **pcurre
 	if (!leave_this && is_dir) {
 		int is_link = S_ISLNK(buf->st_mode);
 		if (link_recursion >= PSEUDO_MAX_LINK_RECURSION && is_link) {
-			pseudo_diag("link recursion too deep, not expanding path '%s'.\n", newpath);
+			pseudo_debug(PDBGF_PATH, "link recursion too deep, not expanding path '%s'.\n", newpath);
 			is_link = 0;
 		}
 		if (is_link) {
@@ -689,7 +689,8 @@ pseudo_append_element(char *newpath, char *root, size_t allocated, char **pcurre
 
 			linklen = readlink(newpath, linkbuf, pseudo_path_max());
 			if (linklen == -1) {
-				pseudo_diag("uh-oh!  '%s' seems to be a symlink, but I can't read it.  Ignoring.", newpath);
+				pseudo_debug(PDBGF_PATH, "uh-oh!  '%s' seems to be a symlink, but I can't read it.  Ignoring.\n", newpath);
+				*pcurrent = current;
 				return 0;
 			}
 			/* null-terminate buffer */
-- 
2.25.1


