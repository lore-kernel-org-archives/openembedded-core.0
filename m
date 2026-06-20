Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FFBCDB477
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:27 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5957.1781960420518292576
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1NdOiyBP;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-463b2f6fc9dso3061048f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960419; x=1782565219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOKNI9zuU+vb4dyySmeKQtYPSdHP9fwvCEZw6WBkQAU=;
        b=1NdOiyBP28CrddZON7KDxA41erShEeITHNWj/x8Jm7DZ5gnf0r4z2vPyjr527diUgQ
         S1bJwUVgNU3JhDUlXlQVWdyldzuy9zwmzjUU9WLpzzt1jJce666CHhPblMzsRe4oynA+
         lTWD0dDZa91Z9orTzYJhW9uGok5osf5ONcdQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960419; x=1782565219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOKNI9zuU+vb4dyySmeKQtYPSdHP9fwvCEZw6WBkQAU=;
        b=Sj/YTkxDb6l0wul8mA3DpvsrpsjoHT4zn1pQwXgEhjDiPPre7OcF5hLo/UfobHMR3D
         MZJHWbDPBWSeF7CJH9zs9TZh+rWEA5P99HCMKYyzXUo+6Wo7J3NaTVyPavXXxMlXfG2z
         vr9HJOTJ+Tev66quekzi5YqP/m11a3goS9PcjUtpVMhCCKAxMImLbDeD24EQoOyddu83
         T1lj8yhZubz0sb5l1h5GBuM/t/+gpP94nBuYQ1EItyyrDE4G4R3dIomn3odMdvScP7vS
         70m7pAsIxJk7pWTY9FXuXUsNPVIagLK5DTvGiCN1J8rTqDlK5TdlPaWNN2/BbciOh3cq
         cAWw==
X-Gm-Message-State: AOJu0Yy+E5JVSHFGauH3ju3f6BFNmZp02AQOEHhkPhJpreXFz+T7nI5Y
	3Qzl/dCp4qCyqVLpXM8N6P4tdDyAoqyoSb6wsujHqrAufusB98QYq0iBtMFPWb6T6SuSdWsQPTa
	qTSj8
X-Gm-Gg: AfdE7cnnodiGc5CQnfD94Su9F9cPn2kyy7Lec5ge2xX9dr2kas/P757HuavCrOG2LQV
	95hZ52+uHuVyJY9kUjFPF2r61/TK97I1QZKsk2yG4Ma57Sj79xEI8dPlZr5YGfG89I5IXSzDbZW
	79ICQsM4ln0QG2c4IotfLoQhEZ9iwVj15OttEb0zWDSc9pT2EAHk9pRkCU7JXPNneaVyUwXt/kH
	qrcrib37dUhDhjZPT3O0bMlQi7qcZJJFpAo1/TEwUtBocuZL3dGJPvZQkbyucjaptZifRweqzEh
	PZT4OxPxEluoq7MJOHXfyeKEA7jFrJtzfB2IhHwtvNo25FKmWMlgO60PJROo1z2S1c44HvysE5J
	ztEZIbfNvypLW2hgsbS83fapGnN0+jnzO8uHcdP5xPm3Rxxj/9364TgN63oa8II0EjQGHfB9zmW
	nSVk7RiquCua7vm+vorlHDlKHLI3tMVxYrpaED4kBNFRWdJMg45Pg7eS+er+pvQm6Rqw9gPBWKa
	bAST7bni/mhm5/8
X-Received: by 2002:a05:600c:c4b7:b0:492:3773:a230 with SMTP id 5b1f17b1804b1-49240e9cb38mr118659975e9.27.1781960418702;
        Sat, 20 Jun 2026 06:00:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/36] udev-extraconf: use -H for unmount tmpfile find
Date: Sat, 20 Jun 2026 14:59:30 +0200
Message-ID: <df3dbb5085f6fe4dfe2df78973a48f80c32a5356.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239224

From: Jate Sujjavanich <jatedev@gmail.com>

Add -H option to find of automount files in /tmp to allow find to
follow /tmp if it is a symlink to a volatile file system. This option
also avoids following any links within /tmp.

Otherwise the find for the automount tmp file does not work which
prevents the removal of the automount directory. Then subsequent
auto-mounts fail.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a79457cfdc8b3e0136a19099cd7cfca19183a55b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 3ddee84b785..81c5d1c58cd 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -207,7 +207,7 @@ fi
 
 if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
     name="`basename "$DEVNAME"`"
-    tmpfile=`find /tmp | grep "\.automount-.*${name}$"`
+    tmpfile=`find -H /tmp | grep "\.automount-.*${name}$"`
     if [ ! -e "/sys/$DEVPATH" -a -e "$tmpfile" ]; then
         logger "mount.sh/remove" "cleaning up $DEVNAME, was mounted by the auto-mounter"
         for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `

