Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7FDD5C0D7
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.14253.1731077641356403727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N3aYfcxB;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d47eff9acso1364727f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077640; x=1731682440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nyiTl0lZZ+jN9A00ooXC8T6dyeHZJI1KvNDTNf/7+zU=;
        b=N3aYfcxBYmhDa7jtKTs7QXXnOLlF492kqJjoNrEU2Y89uQCB4hixmZCGa1gGeMHx6K
         /IEdLqvcdFw2eeJKi+6uLASyxrSxemVEwfQ876VSRzg/bPe2pGVNSwyGvFmjuJ5OtC32
         64aB2A3hsAAzokKGn4DrMjFjzhCJQY2nksaN5QJ0R6jFCiXq6HMaTBbApJjr+4Y35v34
         hyT4n4h2mAAGNhUVJW5B7Ggp8oJeHe0+0V9UVDB7pNKdVG0MP7wr8lwbAxkZu8cAz16A
         UxxgP42CtlI45kwZ0tDxIkzdB3+8wLUjaJlTY6CeiDlvPhDq1VDyrz68yoTkvbzZj/gQ
         LWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077640; x=1731682440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyiTl0lZZ+jN9A00ooXC8T6dyeHZJI1KvNDTNf/7+zU=;
        b=Li3Kq6P7KX/BwjJL2vgLRXyzL7zcn6+ofIRjhdrPJpEIpcAVIdNjs/YQMEKV/GX1Da
         jGmq/lg7JpFTyqY65cxlydt+qMkpvpnElbCtgy6NvJzvbc8ffoRBEkhwqFjeshilinfZ
         ViIP7YCQ2UyEHsuhbGsUd/0G4b8u3mmCvfiKrMZaTAGevS9XQXmp4C3AkYU7E8T0b74I
         NwouJTJUYmcTk+GpWjxdCW5izq8nyP7jxULlef7bMSKhvwnsBHgMmwmBnFQOEZPth1/a
         k9741ca/sA/Xz8ur+nBABtnDLktIVtVkXT/+Dw330pY4rem3ztQVBAKMO4u4kzzkf7Lj
         YEfw==
X-Gm-Message-State: AOJu0Yyf+OOEi530u8un1+HOoCTnlfSIVEtJfv52X5OwwqbRQAB29dvX
	qWPN0RPNBoxdECG4DV+5fXgxCbqHdsu1PPT6BneoY9GDrSLgg/4kDwhoBA==
X-Google-Smtp-Source: AGHT+IHo7abR5FNyYYYcvJ0dtPQf1dqVTmltwMcOuRM/Hh9i9nc08e7ivar9O5/e3Et5Nn809LcLuw==
X-Received: by 2002:a05:6000:710:b0:381:d890:b503 with SMTP id ffacd0b85a97d-381f18854d1mr2441409f8f.57.1731077639509;
        Fri, 08 Nov 2024 06:53:59 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9707c8sm5151863f8f.17.2024.11.08.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:53:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [kirkstone][PATCH 01/12] pseudo: Disable LFS on 32bit arches
Date: Fri,  8 Nov 2024 15:53:25 +0100
Message-ID: <20241108145336.224466-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206875

From: Khem Raj <raj.khem@gmail.com>

pseudo overrides certain libc functions which are aliases when LFS64 is
enabled. In anycase pseudo may not be of much use on 32bit systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 4dd9156238..10e006eaa8 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -18,5 +18,12 @@ SRCREV = "c9670c27ff67ab899007ce749254b16091577e55"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
+# largefile and 64bit time_t support adds these macros via compiler flags globally
+# remove them for pseudo since pseudo intercepts some of the functions which will be
+# aliased due to this e.g. open/open64 and it will complain about duplicate definitions
+# pseudo on 32bit systems is not much of use anyway and these features are not of much
+# use for it.
+TARGET_CPPFLAGS:remove = "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
+
 # error: use of undeclared identifier '_STAT_VER'
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.47.0


