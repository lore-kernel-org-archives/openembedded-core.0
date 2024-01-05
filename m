Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5601AC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 07:12:34 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.18673.1704438747978192615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 23:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KmkCIfTL;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d426ad4433so8525675ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 23:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704438747; x=1705043547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+ZSVJdN3wMuWPyyp5ShvD4AHaYEukvUvM1W6Ql9hII=;
        b=KmkCIfTLJmPmnfzIMfhvoFYMgxMDHLho46LrXDzidlcTtS8EixPddgCuJDQZ0UgZ/g
         kJPOocDzJf2iER26Dc97W6iD2QGiePcc1wDI+aMj0BfWWI6ZjB/9A0SDL3AG/59g/6St
         2AaDGpo3mpRKD6eCmNCqqbaG+6oynCc/y/Mi/Kjmg4tM57eS1mSQdB7VVuPEC2LHIwl+
         gQIzqjfY56Xj4DrWbRGavUqCWVbM8ivroiQdEVmdg8ZgVNmyumgfradEBs4zL+qAMq4X
         v2D6tMyxlBrn1FJrjaF71M+5Nxwx0ngQri1xQ4TJKMYFic7XjF9RNujTnRCUCtbF2WcF
         k6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704438747; x=1705043547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+ZSVJdN3wMuWPyyp5ShvD4AHaYEukvUvM1W6Ql9hII=;
        b=sy64vxfGhWkF70HGHZcrp686Umqjh/Ndc4m7Yd/a7zvkl4UjEdzE76jx8qHYRcLlbG
         48SqzbtMAZ/fJewd0Mt/Ub6z2ckscO5DeJA/hh1NHWO73o4HhYaL+ylEzLKJGTy43JIj
         wRJFC+dABt+fcRUHQViA1kluJoI6glC0HH8aCiBQaVYsNxB4aLDDEc4GRwygFQxde0no
         cR2SHD85jLDas2c9ofQ26mTqDtqUcJLHHRDJEg9H2Kn3UuvuSpnWWWfe4RUx/JDliraX
         RNePvltXlWowBE2A5gX33AbIi4T/pS/rJamN2igjWvZJqbTgSUYSE67xouDcJ8bw0ht0
         K2VQ==
X-Gm-Message-State: AOJu0YwU+avknC++25eNtEWF9Br5bn9DEhc+Mj+td0WtfRR2bveXCsR9
	Co6YOPz6wPvr6JDbLAcmWORF+rIXx1g=
X-Google-Smtp-Source: AGHT+IGI4IGEEt0H5LwdmUiVICjQzMUE8VH3ayCemkT8lcqf8TR808y+BwCb2yalCdz9VFlYwiTU8g==
X-Received: by 2002:a17:902:788d:b0:1d4:1956:80d4 with SMTP id q13-20020a170902788d00b001d4195680d4mr1388991pll.47.1704438746814;
        Thu, 04 Jan 2024 23:12:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id c9-20020a170902d48900b001d4e04b4938sm712928plg.85.2024.01.04.23.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 23:12:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gawk: Add coreutils to rdeps for ptests package
Date: Thu,  4 Jan 2024 23:12:24 -0800
Message-ID: <20240105071224.28619-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 07:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193343

newer gawk 5.3.0+ added a new testcase test/cmdlinefsbacknl2.sh which
use od utility with -An option which is not available in busybox
provided od applet. Replacing -An is not possible because default output
for od is octal and the test wants to use none for radix thats why it
uses -An.

Fixes test/cmdlinefsbacknl2.sh failures in ptests

which fails like below

   Usage: od [-aBbcDdeFfHhIiLlOovXx] [FILE]
    od: unrecognized option: A
    BusyBox v1.36.1 () multi-call binary.

Sadly, this prolongs depchain if ptest distro feature is used but there
is no other option if this test has to execute. Perhaps its best to
report this to upstream gawk and request to fix the testcase to not
hard depend on coreutils/od utility

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/gawk/gawk_5.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index 3d652da6e5c..d7a0fc616d3 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -79,7 +79,7 @@ do_install_ptest:append:libc-musl() {
 	done
 }
 
-RDEPENDS:${PN}-ptest += "make locale-base-en-us"
+RDEPENDS:${PN}-ptest += "make locale-base-en-us coreutils"
 
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us.iso-8859-1"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
-- 
2.43.0


