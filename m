Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web08.74077.1629400120920205719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 12:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MZjtzE0h;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.54, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f54.google.com with SMTP id n1-20020a4ac7010000b0290262f3c22a63so2130129ooq.9
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 12:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JEtGLdB/KDP1J+SQrn3MV6mFtk8YarpFG+BpvGyVrUI=;
        b=MZjtzE0htO36dcBMGXSwLZd1QBIGs/o1B17YSYMwrbCahHJsXn5PCmbc+h5LCbF47C
         AzrkW2JJECdGERA6/A2Ik0NPChZvV5lDbIt8OqfQQtC9IANsS8xTs3urdSu6Uy0gG+Bc
         zsS1sq2a+plTnQcYRpRg2ylH7/tNGsrfuMFQ3mEGascTro0ZeG49de9L4DgCssuebDy3
         qsAAHwcp3iH/U+bSQ2JCDBuUe4n+EXJrApPkJH6yAPXOCwx+G0HJjJEsG4QmQYuqEZfY
         7Tqpt1/CrBfwk/mL9JX7rN+97e9+sEsGmNmNTTouO5VSCsGgL3iC5lpuj9dL1WAAdy7K
         tmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JEtGLdB/KDP1J+SQrn3MV6mFtk8YarpFG+BpvGyVrUI=;
        b=tDhvUN3Yc7awkiY0kcruV/FIaF9+VfjsXkusclw5tZG8XJZA5cwKck5Pt6/5Re8331
         aP3jotYBrZkCqdQ2071wDYg6Pz0XJXEROcDgzo/1ONso/CTP0IOe41ECIcYuef4SMWdF
         mSFlQ7UpHZ2hvipjxM1IX7a45zXcptQmnlckN7Iw0vQ1HzV53By+DtdUs+g94UJs4v6U
         YFGS7qMO9PtWG6HRbfwIAhZ5YoPiIVHZsNtL4hkOECspsTCxqhiRED20aT0R1Hs3kQji
         UHlNKUz3/rPEiVGa2R0rLVWx96jXPZVmaoPmjUjFufYqpM0liCxmQnGRSQjVKzDS7jeL
         latQ==
X-Gm-Message-State: AOAM5310CCjDu3noSF2fMgm+VcMGe7VE9ntoQ3LsbBbdg/KG/JpqPbNp
	I+u/TlY2S7MVO00KmpzXmEBMfKWKNfEhI7G6
X-Google-Smtp-Source: ABdhPJxdMluBKVujlwd1vHFqGygA93uS3AEuS0OI+j4tAJ3MNywbkfb0g5Y+HeGrtCrINYUHD81HPA==
X-Received: by 2002:a4a:d991:: with SMTP id k17mr12778378oou.74.1629400119820;
        Thu, 19 Aug 2021 12:08:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s10sm765080oog.14.2021.08.19.12.08.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 12:08:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/12] sdk: fix relocate symlink failed
Date: Thu, 19 Aug 2021 09:07:53 -1000
Message-Id: <a155c4d4ca841ef492213a5f0b9121703c62e2b4.1629399953.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629399953.git.steve@sakoman.com>
References: <cover.1629399953.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: hongxu <hongxu.jia@windriver.com>

Install SDK to non-default dir, sysmlink mkfs.vfat is invalid

$ ./sdk.sh -y -d ./dnf-2 -S -D
$ ls sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat -al
lrwxrwxrwx 1 hjia users 99 Aug 10 20:38 sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat -> /opt/windriver/wrlinux-graphics/21.32/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat.dosfstools

Since commit [bc4ee54535 sdk: Decouple default install path from
built in path] applied, sdk relocates symlink failed, it should
replace $SDK_BUILD_PATH rather than $DEFAULT_INSTALL_DIR, just
like above commit did

Without this commit:
...
|+ for l in $($SUDO_EXEC find $native_sysroot -type l)
|++ readlink path-to/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat
|++ sed -e s:/usr/local/oecore-x86_64:path-to:
|+ ln -sfn /opt/windriver/wrlinux-graphics/21.32/sysroots/x86_64-wrlinuxsdk-linux/
usr/bin/mkfs.vfat.dosfstools path-to//sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat
...

After appling this commit:
...
|+ for l in $($SUDO_EXEC find $native_sysroot -type l)
|++ readlink path-to/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat
|++ sed -e s:/opt/windriver/wrlinux-graphics/21.31:path-to:
|+ ln -sfn path-to/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat.dosfstools
path-to/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 942c06a7348070b92f722fa5c439c8c4404485b7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/toolchain-shar-relocate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index 5433741296..ba873373e2 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -72,7 +72,7 @@ fi
 
 # change all symlinks pointing to @SDKPATH@
 for l in $($SUDO_EXEC find $native_sysroot -type l); do
-	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
+	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$SDK_BUILD_PATH:$target_sdk_dir:") $l
 	if [ $? -ne 0 ]; then
 		echo "Failed to setup symlinks. Relocate script failed. Abort!"
 		exit 1
-- 
2.25.1

