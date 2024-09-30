Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315F8CF6498
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:06 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.45294.1727661484556719642
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vUZVBHxR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e0a74ce880so3044342a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661484; x=1728266284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J53/jlblQJkJs1pdijtrxuNz/sDtH2P0dIfL1tLB7p4=;
        b=vUZVBHxR9lwC4ZgHneQQWEhN3H3tkoVDt3pYoZW7OhbmWW2ROdsr6+YOGYppVhwmtb
         CWeORSHvII2kVRy/7S0/fZq5etaAaGnQvkRDMRR/pHhOAZ04Obimjdw0U9cpA8zeA538
         uZeAa1G1aOmKY7YC8OUDLk7kc/M97TQq7+uV1xiEbOy9SvzUOUU4txhPboA4N4Iyqwmh
         s7tPRjAgUlKBCFuEIiZpUpEDc4JT6Pbk41OBmc1etXZAaA2cvlWTrOhYeNClSAfajQJz
         fK+3myTQKPRnFROwdlHZHkgnG5uGTh90qPI/P9SPZWCkEwDPj3nbEky2mgPFx6ghL625
         69tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661484; x=1728266284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J53/jlblQJkJs1pdijtrxuNz/sDtH2P0dIfL1tLB7p4=;
        b=pgHL+XFfRabM7I7m+CymEbeWzj8kbecHxEKedA4kzLzG7J6q8STUEDeyIL4cU5qPrl
         2kTFkqPyQTcSQcQtwURVMPKXII6FW4dkfKjuN2wwgVPFrEFONOaJlp4igTYmOjdq6SYX
         cIZYqCmdVtxKomEHRsymgDTtvFUCztpo8HwKIAKJmeexFTLL3N3dpsWlKoN1+8r2YNYY
         w9ESfCf43TEOhgECbg1k2s7wtk+K0OzkvUMHgve2PyBZo13dJ3WDmmAuPIfUaDtPFyuI
         7365N1PzWfzqexkfo/FpFxFi7s1Vaf0vQjchCJQs+Psc6rw7UvWDfBhgPatsGKD2iIoi
         +GYA==
X-Gm-Message-State: AOJu0YyjA/1RwPQD4frg9cWnO7QKlQVq83puWS1WWVIvE1npUgfrctNP
	/e6rPY0MAMEwu8LXxXf7m6pfluXfh+1rfp1vOuovBPGaPXzXHrIDbGLt4nyjiBqbGxvhskWhihT
	Zhho=
X-Google-Smtp-Source: AGHT+IGgoHoPEwUL8ywcmPOMFBbSD3pgoVgUPAlMRbpIM/POZKlkH75hSBreK6I8k1x8vf7xziYFVg==
X-Received: by 2002:a17:90b:f06:b0:2d8:eba2:ac6e with SMTP id 98e67ed59e1d1-2e0b8e8ebc7mr12700407a91.29.1727661483880;
        Sun, 29 Sep 2024 18:58:03 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.58.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:58:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/27] scripts/install-buildtools: Update to 5.0.3
Date: Sun, 29 Sep 2024 18:57:16 -0700
Message-Id: <9028036392df4c49895c3c980596d26e0461febb.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205083

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to the 5.0.3 release of the 5.0 series for buildtools.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c922ca720a0c3b7b4d3d3187539e7cf77d93d457)
Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 5b86c13077..92a4c9dfb1 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.1'
-DEFAULT_INSTALLER_VERSION = '5.0.1'
+DEFAULT_RELEASE = 'yocto-5.0.3'
+DEFAULT_INSTALLER_VERSION = '5.0.3'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.34.1


