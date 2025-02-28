Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1FEC3DA4A
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 14:43:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.17297.1740753823304409714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 06:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uC1HPIqy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223594b3c6dso35488005ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 06:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740753822; x=1741358622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfxTuonsKWhZ8lX0wyfKbqKf5r/4GKXbv3+TGqzGJ1I=;
        b=uC1HPIqyAR/f5ICPW3ZiUUAwwKC++WTtbo2s01rwNTcU6JZFQQ9L5Ke0+otNVVi1Ga
         BHDKwZya1mcMFsQp2k30wzvwv1t6tOhKJIZs7tvRBLgwiWZXoejaQcdGkJfHAhoW30iH
         CyTTwaiDEC9yVbLZ6DGh8MPmK2ZEl9JB4SbB5b3Q1FAzXqI8NBTxWfDef0Tu2+pJaM+g
         BxTKVVqEppCo8bEo76J12X8K4LcawDwe3KrDwQ8oGyG34wr8l86m4iADIwV++j3zYBRG
         n2I4ghXqVc+/dT6d7ksL2UDPPvtOKV0jBpWdRYt1wrhwk5y7aTH5vN4Btp2kBdDxlYCH
         gPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740753822; x=1741358622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfxTuonsKWhZ8lX0wyfKbqKf5r/4GKXbv3+TGqzGJ1I=;
        b=U0rjdEblOcIsyDbqys299jkLX6rc5dGFUVJraoD78S3Om9xI9jsUmlM6Vfcptk3E0g
         iIqs4e0GoWbKbjgYTy6omydrg8nrdWxuYPGIucWyYL3g2tf50b82XtrNjmSw1Y1icQmX
         4i3jD9A3k1/ffKyyVh8gD3Xew6lsDy8R0LqrqY1fqbTLqzo/x6Un2lLzO3q/LvDXYa9g
         RicunEnHNoyA2LtJXNuz/rMwcUevdngj9G5okiTlRbu5T+jiCbwpuORhjPMB02RHjGiG
         2g6t9Ay3ZoRd13G+mAwmr0bwcTDasnKOOL/+ibgHg1zsuo8wVeBoaOllDSqtQdeJrA72
         HxvA==
X-Gm-Message-State: AOJu0Yx+0bfanpoJ2BgzLoyMEzKlA1JJnkH06iMRLgyJqpDyCILxmOtK
	903cGE8dJxsCtnzIKxK/Qcbjb6SijIPjrC2fqvvkNgghu1ZdXXDCLaq6/F/hKYFbHr8ITlwD36A
	p
X-Gm-Gg: ASbGncuzwcwdUkj9eZesHMxLbRX/WhsswlDV2MNswdego9da/Pa+eawy/IMVIXZNVcZ
	DFDLvCGJ1yEMoaJXXuyI7Seh2te6AP5Z4h4KmSaMVFwsUp5glEKCrRLePUaO/ptqWT/GCUGbsXs
	55kZiMmrXWRQmCUIXn/Rs9Jr69RJwHDGqlvkvzH4jCS/Fzy/VkWdJ2tnWomRhK4Yt04C4ZfAwNd
	T5NOJL7FnYTjx4RE9Bz65U+0bAUPuhA5/zOIkb66X40/yvoSTq6CSArkQheEiBwaY4X8TY9HQe1
	9JKhd7htOElmyQs=
X-Google-Smtp-Source: AGHT+IGBhKC/b1Y/ZIYz8ypTPLHeqom1k6LdgPrNp8v6EGz7VIBFyLuVzeiZs4bQ5gm1NbDDHuD/tw==
X-Received: by 2002:a05:6a00:2d8e:b0:732:5276:4ac9 with SMTP id d2e1a72fcca58-734ac35cce9mr5634301b3a.9.1740753822500;
        Fri, 28 Feb 2025 06:43:42 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe6cd66sm3806559b3a.74.2025.02.28.06.43.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:43:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/4] meta: Enable '-o pipefail' for the SDK installer
Date: Fri, 28 Feb 2025 06:42:59 -0800
Message-ID: <940159f060e9a851cc9ff5a9e1c590ed8de4b38e.1740753632.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740753632.git.steve@sakoman.com>
References: <cover.1740753632.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 14:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212063

From: Moritz Haase <Moritz.Haase@bmw.de>

When testing a Yocto SDK installer on Alpine 3.21, we recently ended up with a
broken SDK. One of the commands the relocation script calls in a piped
multi-command chain failed (see [0]), but the installer did not realize that -
since it doesn't use 'set -o pipefail'. Thus, the error was never reported to
the user and the installer claimed to have set up the SDK correctly - which
wasn't the case.

Given that the SDK installer is a POSIX-compliant shell script and that the
'pipefail' option used to be missing from the standard, it's not surprising that
it isn't used. Thankfully however, in June of 2024, a new version of POSIX
(POSIX.1-2024) was released - and that one finally includes the 'pipefail'
option (see [1]). A number of shells already support it, so let's enable it if
available to make the SDK installer more robust.

The change has been tested locally using SDK installers for internal projects,
based on both Kirkstone and Scarthgap.

[0]: https://gitlab.alpinelinux.org/alpine/aports/-/issues/16797
[1]: https://pubs.opengroup.org/onlinepubs/9799919799.2024edition/utilities/V3_chap02.html#set

(From OE-Core rev: 1cb4b41c7faf77fcc347b1276d86d4288968c926)

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10dce263f0230f94a44a017b5614811e696c5ce9)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/toolchain-shar-extract.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 3b4647fca7..29c52e3b13 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,6 +1,11 @@
 #!/bin/sh
 
 export LC_ALL=en_US.UTF-8
+
+# The pipefail option is now part of POSIX (POSIX.1-2024) and available in more
+# and more shells. Enable it if available to make the SDK installer more robust.
+(set -o pipefail 2> /dev/null) && set -o pipefail
+
 #Make sure at least one python is installed
 INIT_PYTHON=$(which python3 2>/dev/null )
 [ -z "$INIT_PYTHON" ] && INIT_PYTHON=$(which python2 2>/dev/null)
-- 
2.43.0


