Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B314CD37AF
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:26:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7704.1778221608349899346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 23:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o1uZsCPP;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso16017695e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 23:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778221606; x=1778826406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHTrFOqq1RhncdqkZIRPovHgTszz+sYh6Lwl4zbNtUs=;
        b=o1uZsCPP9vTbQLWj1682qg3hcrGvAx5nL4FqH9l1cOFHs3fr50FYuAyTh0/xbx629W
         uZYKGdWIsbEkEbiVTxwsWJC+BX0n/dvxFf/++ABeubtCb1XcJWri9gzsNx2sZuiQadzo
         dQ+9MdlzyWc6+oiY/r+2bzS5ACxHZqsEnGDkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221606; x=1778826406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jHTrFOqq1RhncdqkZIRPovHgTszz+sYh6Lwl4zbNtUs=;
        b=Aj8WUkYyK/vWtVpVjYbbGS/ehehdD6FrCxV1dfOABE/3nhEz1CSvVyc2QxSF1WYa3V
         zJ5BBF5OC0+ebEhdBLcLyaHF5tdS0uvR+YtJP42t+atXnj+jP7wEz1yMDgnS8W2k35BY
         Hc70g1WUMnZ3FPmBkoC418WXwxTyS6i6npVBj/L/oHkBV0f4UWvnkjprtximv3Hcql3Q
         5ODY/7oMcnBmOpUZMTZDkEFzhxctc1kBP7tMWCJzyBM6Jv6arWymTjCcfDMfMARmXjxA
         uXECnCWujCt4Ww+RNdG2O2R5ywX2mzltAbnXnnSU8ywacNZ0yp0bMX58Y4TRL6EdMSmS
         AYqg==
X-Gm-Message-State: AOJu0YyQVizB4K+aTEJ6RoLi3B76vXtqlvMpPjlJ0k/biq3SBCtC0eOU
	hQW6XMn/vSp9xC2E16veSFUN/U2ZpP4amRscF6QwVWFkxJNdPObj/el4Af8gFFoma4PsSHGNy5y
	xZ8XM3CM=
X-Gm-Gg: AeBDieu+fn/1DeX8T166oYAyD8+nP7LxxqOgfamNEccQVtHdlX8fDuk11cJVDeQry1P
	Itlw63kDfEuQZ6+8bGi7OcE92yjCIIcYZGAVOQ3ikviqGFqLmBHhuNeTg+2KEyiExKq7JxbbB8r
	XXSYO1Jb9lJ6YdC+zaUk0Gxyw7uMdxU5+aWilN5VJiWtpY470q+Kj6dSlBHvA1H78ZqUeuH1ts8
	USxaxHxeAJ20NcJ83e0g5q/S+3XLYsLkw7sVrmIdAhfanm0MhvzaU8ensDmKaDihPs6dIrvkacu
	eeHraTSXoS7xYR2hKqpjND/9tgadoOusrd5KwGGHYuf5tioHBMXueBI0U6ZJ/N13TwPUZzVehhP
	8F88Du1ZMDqa7I12wKBw3urUDAf4pH1PwTMj2XmSf6CFaW+AsKoXISP2Lh2JoPH+9ZzxKlE+7mt
	7pGjSOJsTKsS6/m5PrsPUvyzosXdVzFYUDvgiVtheB7g0fBR00hYbJukofJoZ/A6GfvsyzsSu00
	CuUwm9esSIhQTzuIQXdqe/COmI=
X-Received: by 2002:a05:600c:17d8:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-48e51f46abemr102404285e9.28.1778221606476;
        Thu, 07 May 2026 23:26:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68ec5c49sm15202695e9.11.2026.05.07.23.26.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:26:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/8] devtool: Disable gpg signing when setting up source tree repos
Date: Fri,  8 May 2026 08:25:59 +0200
Message-ID: <bbe0df71933174d8becc52184cd235277f10a141.1778198884.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198884.git.yoann.congal@smile.fr>
References: <cover.1778198884.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 06:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236639

From: Moritz Haase <Moritz.Haase@bmw.de>

This stops 'devtool modify foo' from failing with an error message like

    ERROR: Execution of 'git -c user.name=\"OpenEmbedded\" -c
    user.email=\"oe.patch@oe\" commit -q -m "Initial commit from upstream at
    version 1.90.0"' failed with exit code 128:
    error: cannot run ssh-keygen: No such file or directory
    error:
    fatal: failed to write commit object

when GPG signing is enabled in the git configuration.

(cherry picked from commit b5c84b07b87eafb4f68f7662b6cf26d8b73e3247)

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/devtool/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 6133c1c5b4d..c18887c6ced 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -202,7 +202,7 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
         bb.process.run('git add -f -A .', cwd=repodir)
         commit_cmd = ['git']
         oe.patch.GitApplyTree.gitCommandUserOptions(commit_cmd, d=d)
-        commit_cmd += ['commit', '-q']
+        commit_cmd += ['commit', '-q', '--no-gpg-sign']
         stdout, _ = bb.process.run('git status --porcelain', cwd=repodir)
         if not stdout:
             commit_cmd.append('--allow-empty')

