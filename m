Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5412C44523
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 09:18:39 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2816.1784366309399792339
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 02:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hvcl9N3O;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47640541585so4284984f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 02:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784366307; x=1784971107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K/nwFjCU8iq0rD0aW8n7mf1tBwAkxEzFUeqsu1XElM4=;
        b=hvcl9N3OjGj3CZ3U9gvXrV1dZmlbQxxMu16UR/Qk6KJ3yJBV2382S94q4ExvprRWjG
         ayCARMr1V4wQp9E7FDAW9Z7vQQEg7zwV+P87seJSbIvVvYoaNO6RExEN+2hvzQb00Dbv
         K4LUJ3zIj6rID3gMGhJvugSWqlW4lyet8tNWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784366307; x=1784971107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/nwFjCU8iq0rD0aW8n7mf1tBwAkxEzFUeqsu1XElM4=;
        b=oYA2DAEYIBQGxt9upTWdlYcAbH+aOinFHQ+BWM6qA9bdPo6MSXW/Zu3IYlAfuz7/kT
         Jn34ijVpY7oH3sEoZImjsscBP+q0sDH/IlOFwupN0XZ9M5m688Ujc5abZo7c8V0Lv8sn
         SsPP+hL+PomVJQ85f7aFrsi22LKl+j+7qgV5jAfyQmWCwsfnxTmJzYU/CEGELtP/pSiC
         Krx3Keo0wuNQxrmiSAHvLEAabbJfdhunF6Wyo0v7ipqo5b3aNYplLIjBewIQvUXuR5c7
         sq6jpKZV8vEstNU7xrviHeO2MPGqdBbsgeum2OZiWi/5+chVDZ2kpNGXoBVf0vTRL/Zx
         fzSQ==
X-Gm-Message-State: AOJu0YzvvSrQrvelhsujE8bZYxW1lv/BHkH57082FS2NxAzKS13GhzIT
	UjdGx+A3ljAl+dA8Y1Y0jEEOyWGCQf6lwuWe/jlX9pH5FOa1JN38INExIC119RpIMb16OPA5ZLT
	WxL6Zzms=
X-Gm-Gg: AfdE7cn7Jiq8zNSAlp0WLyuppxZQJ9iQF2VHSKiURNkA0DYt+lK3sYC2cgh7rnOk813
	vlaBMo4/V57T2VULbd0sU4/d6csmYZbz0fmECaXeSr9AyTednmhozoNQks1Sf3PkBZB4Qswhq3D
	0hPKHrauijw22+G7GalN67B36lUVABFduUL1OmR10IeBY2wwVO7GmJnPU+5BNVhxT13nDpMSI3t
	Akg4vvWRT7TBsjVt+STFTKmMIZ4Lnw+ib0nckzYZ7tj1GFwutI7EKFKj2WZs2Z/olfM89UMwZdn
	w8wICRapNFTjNZqe9VhhfdYLzPuLfImeXq5INf10jY1F7O78epr6RJkdVY54/ljt17SIhybf1R/
	BNXp8I923sn9X148Ev3wKWDtbaIpvVOCIy+PYZJCJ5qWj5oWxOAByLegig8Ii4YX5IOdzHe1PhF
	cfyiDlYiS5Il94pSVvgHohqTEvNXy8Xscov6tduNG1+NZ9vtPVG2PoPidNRThM1qz1/lA8CfdfL
	uiMS/c=
X-Received: by 2002:a05:6000:2285:b0:475:f0f0:9f01 with SMTP id ffacd0b85a97d-47f6234e3b5mr7325680f8f.56.1784366307526;
        Sat, 18 Jul 2026 02:18:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e496ffsm11408425f8f.3.2026.07.18.02.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 02:18:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2] lib/oe/patch: avoid duplicated "From:" in generated patches
Date: Sat, 18 Jul 2026 11:18:03 +0200
Message-ID: <20260718091802.3466388-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 09:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241255

From: Yoann Congal <yoann.congal@smile.fr>

To workaround issues with groups.io/list.openembedded.org/lists.yoctoproject.org
rewriting "From:" email header, users are encouraged to put a "From:"
header inside the mail body.

When using the suggested git-send-email workflow, users may use the
git configs format.from=true and format.forceInBodyFrom=true:

man git-config:
> format.from
>    Provides the default value for the --from option to
>    format-patch. Accepts a boolean value, or a name and email
>    address. If false, format-patch defaults to --no-from, using
>    commit authors directly in the "From:" field of patch mails.
>    If true, format-patch defaults to --from, using your committer
>    identity in the "From:" field of patch mails and including a
>    "From:" field in the body of the patch mail if different. If
>    set to a non-boolean value, format-patch uses that value
>    instead of your committer identity. Defaults to false.
>
> format.forceInBodyFrom
>    Provides the default value for the --[no-]force-in-body-from
>    option to format-patch. Defaults to false.

Putting those configuration locally in every groups.io related
repositories (That means every bitbake-setup repo setup) is tedious, to
avoid that the configuration can be made globally (e.g. in
~/.gitconfig):
 $ git config --global format.from true
 $ git config --global format.forceInBodyFrom true
... but then it applies to the devtool workspace.

With this configuration, devtool generated patches look like:
|From 4457b9d7805551e6b35efa25f998b63901d4bf86 Mon Sep 17 00:00:00 2001
|From: Yoann Congal <yoann.congal@smile.fr>
|Subject: [PATCH] Add a new line
|
|From: Original Author <author@example.org>
|
|[rest of the patch]
Notice the duplicated "From:" header.

To fix the double "From:" header, use the --no-from option for
git-format-patch to override this configuration and generate only one
"From: Original Author <...>" header.
"--no-from" is the git global default, so this is a noop for users with
default configuration.

Note: The "format.from" configuration is in git since v2.10 (in 2016),
and the --no-from option before that.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
v1->v2:
* add more context in commit message following Alex's review:
  https://lore.kernel.org/all/20260710185207.3999639-2-yoann.congal@smile.fr/T/#mccc1ffe8c4e39a51924cc907857ae1e767632333
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 1d50e83ab7a..0a201afe0ad 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -530,7 +530,7 @@ class GitApplyTree(PatchTree):
         patches = []
         try:
             for name, rev in startcommits.items():
-                cmd = ["git", "format-patch", "--no-signature", "--no-numbered", rev, "-o", tempdir]
+                cmd = ["git", "format-patch", "--no-from", "--no-signature", "--no-numbered", rev, "-o", tempdir]
                 if paths:
                     cmd.append('--')
                     cmd.extend(paths)

