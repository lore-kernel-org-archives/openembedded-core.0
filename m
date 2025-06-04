Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AB2C5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:31:38 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.11420.1749025888908237476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bh1Lf6Dl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so1947179f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 01:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749025887; x=1749630687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gN2kijbgYcIO/f4XXhUbUA1Ks7WnPehZUkr5qtbI+vM=;
        b=bh1Lf6DlpaX8jnXGnXnMWwpJXUYd5dTm2QzgCEV8Emtub3Sw7g8BXZDUUR/gf3bs95
         KNCEP+5zRmJCPS0pPCcQsjOuI8tl/nRpiMuHNkh7rglnF72+RemR9Rt+Uxwmwl3yktMO
         3PpInmcKexyDD1OqAyDHS95Lq0B8dv10gh6YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025887; x=1749630687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gN2kijbgYcIO/f4XXhUbUA1Ks7WnPehZUkr5qtbI+vM=;
        b=sJJ64BrUBOX5QhLi3CL54FeV0rbgRKupSg4LeZUITHgUVFustG4sKu+XnBcedV69c+
         KAxKaq0UYvJj5gnFsSf78zCQBumIVrciVtR1ggp1OGZX5To4G3gFYjdSYNesH8JCZ4TL
         s4jSzLxZDG/xMYgcedP/jN2/BD/eZWrAVVK1SHMH7GAZaQTMND+M+L/toJOjzQeFNy7S
         7mqoAJGfTp5nHs71eRYfBDwKOoCxAFdilFzW6yoqhFFJjljncJJi2dmYTVrQXMS2Y/jK
         6Dy0ahAUfTlLfNueWjeMTBD+kOp9CFNLWcEjsSohKexBRdF00YknAtxgsgXutRdYHSh9
         GaYA==
X-Gm-Message-State: AOJu0Yy0SJnibXkyrjEalth3FPwTtY3qrdg8Y9KoIyzGylXWScGdeyF1
	oUJI0gZDZGzJjtCrGz7U0n2C3nL31YWmuak+C9PRRe/UtRFTZXe0jtgOULega7/vCnCY45L3SCX
	164kUmdI=
X-Gm-Gg: ASbGncuN9bpDNZ0Zf5D6zkdRTHipK1UHQUXlWUnTjplOv4bG0vBc2L5KxI/eUz+bvVJ
	zzhH9Yk7ns2rGX7IUMJNMfay3GnnJ7BAf6seXb9A1IQXG5OE8Yy5UlPtOKL2mWSwBqlPHi43tdd
	97/Pc+2XG1a2heAx8Gig2IPgysORSW84UL6kQ/nH/gxAnaeOBKZMmTpZBt8YnnR3nj6PbY4yoHy
	XRZxusJlVauyOyksWOSEwhFdlZpb6HSz7vN+8nVkZ6ods1Uf9eCY8/dZJTQ2SSEwMAWzIqfOw48
	Oge15xH1rj+wh6sftTGaX6fCGqecHgU6tG4es/DSiXyA5048vL3F4sEHx+ntYOalo0Pdo7766SY
	UeYNW
X-Google-Smtp-Source: AGHT+IGZjZf7X09H4NHcN6zfM2yf1nmnlenFksfMBi10gmdifCwJf+TEVj0KfE2wM165Ojpc9jKA9w==
X-Received: by 2002:a05:6000:2087:b0:3a4:f6d6:2d68 with SMTP id ffacd0b85a97d-3a51d987a31mr1456073f8f.56.1749025886418;
        Wed, 04 Jun 2025 01:31:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:204c:fb2e:c462:29df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5215e4ce1sm760499f8f.37.2025.06.04.01.31.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 01:31:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Drop lz4 from HOSTTOOLS
Date: Wed,  4 Jun 2025 09:31:24 +0100
Message-ID: <20250604083124.3783989-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217846

As far as I can tell, we don't have anything using lz4 in our key
build dependencies. It isn't in ASSUME_PROVIDED and our code automatically
adds lz4-native dependencies where needed. Even then, it is very rately
needed, mainly so some kinds of SRC_URI (none in OE-Core) and some
filesystems/images.

As such, drop this from HOSTTOOLS and rely on lz4-native, which is what
was already happening anyway. This simplies host setup slightly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 13d55923b70..52e74a6879a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -518,7 +518,7 @@ HOSTTOOLS += " \
     [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
-    head hostname iconv id install ld ldd ln ls lz4 make md5sum mkdir mkfifo mknod \
+    head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo mknod \
     mktemp mv nm objcopy objdump od patch perl pr printf pwd \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \

