Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346EAC0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 20:57:16 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.4907.1738270629319080779
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 12:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lehusg0d;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21680814d42so21610975ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 12:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738270628; x=1738875428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MqQViNOgom2/XuTxPlcGXMs+QTELTlAn07Y1XB94emQ=;
        b=lehusg0d4ND4bCFKNl9/xArR1vyJ9Q+QXajM5mX0sZiw8TQCVxzA9V2Dz7EeYZRIFs
         FvZ3wUTSlrR/DhTSH+fX+SbKslo6qfNo1r5cXnGPtFaD/YOvP06l8SJYz4rDTGc3AOZX
         KwWLhHOsatEoNUcbg1PnP3n5b5077pDLlAje1gesQ/jo7TZtpoSfyfutGeRCdU9S482l
         EIE+ZaM9J8JTVwAyBXli2Kj4XRGx54MccrEzV78XWWZXEng/fVNOFc5BZxMGUtOKIC7G
         71vMdMpyRlisjL9NFR5a3NyR6U51uAItOo2tIZ9HOtoLJGC6yEK1inXnEBbjOcGOv5ib
         f0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738270628; x=1738875428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqQViNOgom2/XuTxPlcGXMs+QTELTlAn07Y1XB94emQ=;
        b=TZAJwpTmQub2VG5J/RxvNojNNxAaBTCDmPFyU+rqwKTnaaz1EBEkuyokFJMXsvFCkX
         No1qmrlzL6IunQAKW0AF7dXBdD3BSMkKnocxllAUeeoDp46AHsdixqkAVnXLxG28Ktmn
         /9tucGyGqDbL+CXjw48+q8mahsKKqAoMDXiCzq3sMR2yWIBPyZ1+SBCksETw9HV4hBTk
         0StwIOdmQGeKSdBJCm1Y1mGRMnt6Nf6+gnRe/s45Ij8Gs/CdVFrNlQbIKTyj60/wVfdg
         UC862TIVcyGR77nX7NRycl3ZQMBYBE6omEbr0XkRnf+govvJVbHBoOsjtx4+4utd4mm8
         6tyQ==
X-Gm-Message-State: AOJu0Yy5yaz7fUM5peo//kik/ZpqQbmc6FmixvQh5WbOhBUuzRu+An83
	788UjwTKVvOBK50YLfIaaCjGMgDSKY94KQLHJOuGwM4PxsdqnZ+eJEi96hmF
X-Gm-Gg: ASbGncurR8FaCF8yiOxrV11KC7FVS6vwJJEm9T0oN35LkAeDAh/0wKzkAVWjTdtNkk8
	T9vnbApZnW4AzAf5cij2Y9pvXmDWM3NBiRrxxu8IjXXFi4RZZ98E8G6ogic6hh75RRkU/k5/jD+
	zXpAsIVpeKnHPzjw549UNqKg37mSFzZruMSVZKCqWmB9h0Fbp9ScDC0gNRcvocPEE2Xl+YpS2eb
	g+ZUXTnlLdRLYkZn/CRdA20jJ8EW5FuCXWw/usVqrWaRXp18C2ZCU9QYYGL8Zw2JBjIQxjSvbwK
	lR6bbKY=
X-Google-Smtp-Source: AGHT+IFtjsMSFlYUxDtjEBLJRXcWSug8R2y6Cc4npe02GgQ2vCDalPJghcQDm9U4vjPBcMZXfmPx4A==
X-Received: by 2002:a17:903:2f84:b0:215:bc30:c952 with SMTP id d9443c01a7336-21dd7c49ad7mr116298505ad.6.1738270628483;
        Thu, 30 Jan 2025 12:57:08 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::c09e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3320763sm18287675ad.236.2025.01.30.12.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 12:57:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gawk: Enable high precision arithmetic support
Date: Thu, 30 Jan 2025 12:57:01 -0800
Message-ID: <20250130205701.4080639-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 20:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210468

This is now required [1] for running glibc tests with
2.41+ release

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=0feb6da94c435a81699bfeacdc84150098f64025
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/gawk/gawk_5.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.1.bb b/meta/recipes-extended/gawk/gawk_5.3.1.bb
index bd72fbf2808..724b561c93f 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.1.bb
@@ -11,7 +11,7 @@ SECTION = "console/utils"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PACKAGECONFIG ??= "readline"
+PACKAGECONFIG ??= "readline mpfr"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 

