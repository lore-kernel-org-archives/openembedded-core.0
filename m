Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBF2C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:15:10 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.11305.1645452909358852486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EZP+YeGt;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 q8-20020a17090a178800b001bc299b8de1so4164411pja.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HyiUaxniwunpCNiY8046K+6QOEBll9d2Ct/E6FsQaFg=;
        b=EZP+YeGtrvNiqJMH0BO2Mud3pLNQypvF7cTBaEKptUJPlnlSuskbsKJ9V9PGZXS8/P
         IIGfiJpl5+rB97cqEM3RAaAiAmAM9oVVz9UKOiIu1DP1Ia9e48+akeyK7Zppi6lS1Bpn
         aSXh6lOH4gNimi1amIsBl/TlbnlQEdcJ0lYVZS6wjtmjy5KRh8GhXbwJUwrnUYcIbWQq
         jKsr+O54tfbgWszbKo6dSHvb5nG/0J++JbzbQib5qJu2aiOdJWKufFwtHnO/LvmJAPXG
         Mci16Z6iryCr+6Shpi/XEb5jTHeKgYmBzARVeQPADJKpf6wEySn9wnvxR540Tn33afU9
         qRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HyiUaxniwunpCNiY8046K+6QOEBll9d2Ct/E6FsQaFg=;
        b=2gZzyGox8T51axM4HWaLWULSU+lIm8Y9V27cLEBdzRuOvxESTFUR02KP7fchAqfbYo
         pxke3blozfm+qjaGv08hL+q2tAImYKUHvs4y6Q4DyWNxJ0bgRFga1N5NHhu44ss+Q0Rx
         7f9yUR32NM1M2I9PfIn54qod8MhqBJyhA/+GsxaDdm79ZFqGGlMzlDKwfkGfDWxE8UxY
         N+Z3NMezRgNQUBcUP8vQcA+RkR0P8o+xkBuDo2nIPFne+l4klXN+QSv/40UjPyGMsgc2
         pX2CMS/QJNs/4tOL34h5Jud+lctXihXYk1nFLvOM2Y8O0maS+OgiHV9lhEy69Fjd96wY
         K+qA==
X-Gm-Message-State: AOAM533ynngRqUlVK2ZwiB0VUWUNz+1nn4FuUSMwP/NOPxSU3ADY2jFI
	s49r/yfujml7YKSlVy+o4YU5ghCvlg0GZXPw
X-Google-Smtp-Source: 
 ABdhPJxziKDdM1Kt1wUOWBbfXOxDPA0oNoJHiesJrrZ9D9aZMT/ooH5X0ZeVUZ8gn1IHeMZQszDr/w==
X-Received: by 2002:a17:903:292:b0:149:460a:9901 with SMTP id
 j18-20020a170903029200b00149460a9901mr19238433plr.44.1645452908370;
        Mon, 21 Feb 2022 06:15:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.15.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:15:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/20] sdk: fix search for dynamic loader
Date: Mon, 21 Feb 2022 04:14:16 -1000
Message-Id: 
 <c95695c220a1bd1984920b893418d6822b75ebac.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:15:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162046

From: Christian Eggers <ceggers@arri.de>

if the package "nativesdk-glibc-dbg" is installed as part of the SDK,
the existing search expression finds two files:

$OECORE_NATIVE_SYSROOT/lib/.debug/ld-linux-x86-64.so.2
$OECORE_NATIVE_SYSROOT/lib/ld-linux-x86-64.so.2

The generated relocate_sdk.sh shell script contains then an extra
newline and segfaults during SDK relocation.

Limit the search depth to 1, to avoid finding the file in the .debug
directory.

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit baec04b936ab6b3d2039978fd568c3824cd0a501)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/toolchain-shar-relocate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index 3ece04db0a..cee9adbf39 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -5,7 +5,7 @@ fi
 
 # fix dynamic loader paths in all ELF SDK binaries
 native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
-dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
+dl_path=$($SUDO_EXEC find $native_sysroot/lib -maxdepth 1 -name "ld-linux*")
 if [ "$dl_path" = "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
 	exit 1
-- 
2.25.1


