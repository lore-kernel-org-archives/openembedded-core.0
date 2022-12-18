Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E92BC4332F
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.32116.1671380020258117908
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=AaT5Kbqz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id 17so6926306pll.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnoFRnLshTDK5azenxv5Ns1rRq+bTH5nJWrxZeIwS44=;
        b=AaT5Kbqz75iIPKOjP+MDiV+jWvZntch9yGoqkhJDBcreVyoc/8Oh4YKiAthjhRjlqR
         AuxUiFK68H+gR9VHuzPwX98Dn1dPN1PojFw/4ymVjyc7Oe2srFF/KR+QRT6G9p0PggSx
         ydVrmDhW/zg5rtnaDINRUwjDveWvZ62WIlN+TSgegcjPfoweWVCWxby2kWIJ7uqDUJBr
         7grNaZTmxt2bANOvZQ+4w58nDaPZFeQdXoYvGvB16TgEsfeSxmcw2NDpGUHFfEZOeAze
         tqrYRHpEbCy5jO0qwQ/dPf2DmPDhGXWHo5+Y2pp/8T2tnH7Sr/S4NQZ7FH2DByA/8zeu
         xqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnoFRnLshTDK5azenxv5Ns1rRq+bTH5nJWrxZeIwS44=;
        b=JI1nXUQqftx++QDx7GARxWs2z6wDq+G6adjyyeyXbMSanrHBKPQ2KJyyOM/BBbcp8L
         Di8iF05e1O+zeNnH3FZvlqueV2U/ECNtk7Qfd0G0DNfXPiEty5FwEtxcM5h+u2aj73qw
         jdx1jf63Ck6n1E77Mu2xf9ytf+eKpOkDczlH7c3cqDaZ/LSiDcTgNdzgyUY+QT6JIhdK
         QWaotK+0XkuLFY3YAysDjnAQrK2F3arrldxhUpUviWdzRZzY3pdQ1YpxPwRM5cLaA9Wz
         mHaBpZ8MpgziIhFm+cQ+OvBqw+py567Xplq6z5ouiuge5Ec4wAQO/eXkQjfuqMQ29u/d
         sc+g==
X-Gm-Message-State: ANoB5pkwt3o8OyuqFrznoF23pu6nKIzTDW2hJfxzpxdkotGkjALEJHAk
	a/gDKJZQX8HTqJGFHobmWe4G+/IUUvymuqeWtas=
X-Google-Smtp-Source: AA0mqf6c4zq7FGdfH5Qal9z6f7oQgai6PVFhUP3zh/ozQFUMxSXdpIpzGRcTEryUnFvQnwOsmoqJ1g==
X-Received: by 2002:a17:903:22cf:b0:189:ad19:dd11 with SMTP id y15-20020a17090322cf00b00189ad19dd11mr55935713plg.46.1671380019189;
        Sun, 18 Dec 2022 08:13:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/19] externalsrc: fix lookup for .gitmodules
Date: Sun, 18 Dec 2022 06:12:57 -1000
Message-Id: <1f3b39c4d6828940934a341e9f8b73214dc67fdf.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174800

From: Peter Marko <peter.marko@siemens.com>

Commit 0533edac277080e1bd130c14df0cbac61ba01a0c broke
bitbake parsing when bitbake is executed from directory with existing .gitmodules
and the recipe in externalsrc does not have .gitmodules

The check needs to search for .gitmodules in sources path, not cwd.

iParsing recipes...ERROR: ExpansionError during parsing <path to recipe>
...
bb.data_smart.ExpansionError: Failure expanding variable do_compile[file-checksums], expression was ${@srctree_hash_files(d)} which triggered exception CalledProcessError: Command '['git', 'config', '--file', '.gitmodules', '--get-regexp', 'path']' returned non-zero exit status 1.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 66ff3d1f65cd2e7f5319e98fa41f47a59b714c72)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index a6a8ca6318..57135f2e4c 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -229,7 +229,7 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            if os.path.exists(".gitmodules"):
+            if os.path.exists(os.path.join(s_dir, ".gitmodules")):
                 submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
                 for line in submodule_helper.splitlines():
                     module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-- 
2.25.1


