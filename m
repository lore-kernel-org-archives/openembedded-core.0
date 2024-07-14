Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4A6C3DA50
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:39 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.15286.1720960771656011672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NZupuGhs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fb0d7e4ee9so23042105ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960771; x=1721565571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+7mPfl124ROv6Oo7SeLsE5nvGVTZro9gT16Wfh8RFs=;
        b=NZupuGhspFDfuy5QV6dUaWpVuws9MXtpMLv6NN8aZTHovqJbgCODRBpzCJzXl8IoaC
         SAN7DC6SM9m1OoV5LzV8fpXa42jjeAQWgbnHw8MWt0T6zqeTw23URf43pR9dWzIn0fJY
         GNixqxDR39qItN+HdkyI7d1kXLXbAymK2NjIVCxdtMWujy8fmDi1j8RmNa8SOu1+FROC
         MbgtGIo0s7kArjsf8ZrdtNhS+HHRHas5G0Ym1rIM0jfI+4SN3bALmbYeg9j4JHNQ86Bx
         fmIY+yyi3dBAE1hBEmgYLbW3KnXuuP0qtVstxkuQ0anioeAOh87kkMO1XpfH+sT7Q7JS
         al4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960771; x=1721565571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+7mPfl124ROv6Oo7SeLsE5nvGVTZro9gT16Wfh8RFs=;
        b=sKtbUhjhU5rCISjuqRQwN0w5pKE0lSntq3IVcJ1AwnsIdHJAMccHQhqQeeylAk3u7q
         7afHmXiVZN7WF7blIGgtivU1fLOHCbWEx5QqX/LYOeQyhYtSlwOH5smVb/DQFRednpHh
         ICRiUX5ZZexzMFp07/zBtgQtVSmwzGGMx1qrPKDuZ8HX9OwT11PWNjBkyLqsp9lqfiVK
         bVZS7larkZibVeZTDBXuSAoaKGcyaNxZ0FTZFwthpVk0Etf9rlmo3Dv++/fyMMdnOPgs
         8AkA2r2ef+CLYhTzXfl/3v9ZRzUAFurFr7rg3QyKkFhIJKNcIm6lh+4nqd2mogUWS6gm
         1low==
X-Gm-Message-State: AOJu0Yy1i9TtMsT38lGZSSpjs+bLFudhYgnaiMpbbKdXbIrtHFXm0xqn
	6RPKCUK8nP6KVBatUHwrh1PtpkUY3cJ9iZfx9gP5dg7/uoud5W/M8SaAtEUYWqXYQUznedboMhP
	R0Eo=
X-Google-Smtp-Source: AGHT+IFTf4IgXZMLSouEjBJACRJf/S5/0XbmrBxVKOjwOp8CWJf11C7OAXP5H/ubXh3dt0WSVVumiA==
X-Received: by 2002:a17:902:eccf:b0:1fb:4fa4:d24 with SMTP id d9443c01a7336-1fbb6ee1e71mr160586395ad.50.1720960770942;
        Sun, 14 Jul 2024 05:39:30 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/27] sdk: Fix path length limit to match reserved size
Date: Sun, 14 Jul 2024 05:38:42 -0700
Message-Id: <98119e3f452ebf6cb5f17049aef3a9a3ef7116c8.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201872

From: Robert Kovacsics <robert.kovacsics@carallon.com>

There were two different interpreter lengths in use, make them match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b175f9cdc3d87bef5c89cc337c2a7e2674732b29)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/toolchain-shar-extract.sh        | 4 +++-
 meta/recipes-core/meta/uninative-tarball.bb | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 4386b985bb..89d30005fd 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -164,7 +164,9 @@ else
 fi
 
 # limit the length for target_sdk_dir, ensure the relocation behaviour in relocate_sdk.py has right result.
-if [ ${#target_sdk_dir} -gt 2048 ]; then
+# This is due to ELF interpreter being set to 'a'*1024 in
+# meta/recipes-core/meta/uninative-tarball.bb
+if [ ${#target_sdk_dir} -gt 1024 ]; then
 	echo "Error: The target directory path is too long!!!"
 	exit 1
 fi
diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 7eebcaf11a..0fd01fdb64 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -58,6 +58,8 @@ fakeroot archive_sdk() {
 	DEST="./${SDK_ARCH}-${SDK_OS}"
 	mv sysroots/${SDK_SYS} $DEST
 	rm sysroots -rf
+	# There is a check in meta/files/toolchain-shar-extract.sh -- make sure to
+	# keep that check up to date if changing the `1024`
 	patchelf --set-interpreter ${@''.join('a' for n in range(1024))} $DEST/usr/bin/patchelf
 	mv $DEST/usr/bin/patchelf $DEST/usr/bin/patchelf-uninative
 	${SDK_ARCHIVE_CMD}
-- 
2.34.1


