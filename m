Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8C3C282C6
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:31 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.17129.1740678021726444893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZDWRrgjY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223594b3c6dso17691945ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678021; x=1741282821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6DEfRTJV/rGGh9Mm/amqPLL8nx4aox/tBT7zoLJsmQ=;
        b=ZDWRrgjYDGxyloOLuj6qtFcm4yFUXbBU5VbaKBbsW3g8xE3RQAcpELpyontymbbRos
         CV/8P/d06kTdKAOVG84u7D9SQtmqJsz8sMv5dY0kuHdv8m/6NvWjnWluYca4jrRmdg+n
         FOcCrxu+g8NDan9UqPe5wrixWE8MZjRmpA6l6/IX9sZ/8GP+Y2cdUMTbRYEDz3Ah8hWX
         v8pEtv9cLxRtLSKZFYELoOCovDWtUsDiVG+0n63xretDw+nK/Y7V2AN/r7qq4JD5Kt+5
         2CYmR+h52JkHr4NCpq/o20TihLFJppchPU77yt1dTYTPbIwiLbkPn5e9EkWgBwAXDtvu
         7GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678021; x=1741282821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6DEfRTJV/rGGh9Mm/amqPLL8nx4aox/tBT7zoLJsmQ=;
        b=TI1SQPGbXgDP3D1ywGCsaRV4KOdImOoxPFh2t+H6e4hJ8FDq7RVjpgHKNuGkJQsXk/
         1VfFy2Iu+e8tRaUk+4M8VPUKwR2tXXB5dq8E5qxLLvQsF+SsTftyf9IZNFA53s/K3Vgg
         p+Cgk5QN/aTO9D7+Fb4ARwvIPG1yQeSOpaQ0+cJB56DFAgwSCzBQ+sRSEQ7Tb2rEZnnO
         03oDSA0i1uWrCJEmqSuuLbM+yF8tSUl/to6wvyIzv+3LghsgNdGnILtBETlgsV+UPiIQ
         RkmsHA6j8i3/3eu/DTKKiPhB0gJUFnAEfZevfehSJu3f5424fqZIRlwc4dnfagZBp7qT
         E/Pw==
X-Gm-Message-State: AOJu0YzzYklbeXfDW8JmZ2w+Isct/fNvxpWPAEk8U2fxKMgCvUtC31CD
	UHHZvLyarKfWoBM0QUDotU3DUd5BA9IMKZx/nQoZq9SZ3nrYM2n8CChwiB/O3hzxOUPfPHlS6E9
	D
X-Gm-Gg: ASbGncsL+3B99TuGBLOgKxsLgBic1oX/Y0WDo3rLKVUKHY5HVIizqgmPbQexXbgGhBy
	AIQRatbKnD2xNxx/y5xZry5msA/IWlcSbFJ5s5V/2gz2o0zzJ83qdMf+5mZYpBbT4zXrv6NubFV
	Z6YfrZwf/1srDgGC63kUGnN/gMmKd09RnH96MK7sbeudywRhLLoV9s5Ppc8Deo1rMym2yObIRb6
	L3RhYCqUaPrNDgGbAuiFRsGVoF867Tf6S9VeOB5JR5A3DSnK/v3GNXz7WgpvT28QJY/WgLGAiVQ
	KW2AEGOYm/UrmsD0Fg==
X-Google-Smtp-Source: AGHT+IEzSO+Pwlw/LAkzV4zLPRaEAXkK03PnCwuGPRqKJit8CYEBUk5UIGriyGOuUtC22zQtUUvRBg==
X-Received: by 2002:a05:6a00:856:b0:732:5a8f:f51b with SMTP id d2e1a72fcca58-734ac35ccb9mr528909b3a.8.1740678020883;
        Thu, 27 Feb 2025 09:40:20 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/15] meta: Enable '-o pipefail' for the SDK installer
Date: Thu, 27 Feb 2025 09:39:48 -0800
Message-ID: <1de469f1ffb1680e3a75da2c3895fb1e4f43859f.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212035

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
index ec5e4aa922..380a25e761 100644
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


