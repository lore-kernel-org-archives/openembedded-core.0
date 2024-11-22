Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23E3E6ADCD
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:27:18 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.35421.1732310833147555073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:27:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TOomUUrJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-724e5fb3f9dso915304b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310832; x=1732915632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVDk3xEU2QpjSHmmbqDmI0W3f5YcaJaRWLgrUepxspg=;
        b=TOomUUrJPXnoiwjJQSLJeX4vLSgKGWV61edAATAxBlEX2IAEG3a3GJvLkIrpDkcFNb
         DCVgtLNtut7EWlXP8K1tYC5Sf9Jw9HmCaeIWK8tEVTFUnc25NTwu3IOd0GvyJ9FPert2
         Q2nTXA3vbtyrrDsci0sFF/2PQTeDy+n/NGXmfvf4FKt9nsSmT6R2RTrPVBhpb7jeSUp7
         Vs7JBohKLa3S/nzYnRyn/o3Zyg1q0tfy8Sg0qllSmsaO9yJPlsU6ulovGSH4nB+0KQXM
         9DpFrW/dORYRpXDLjDrpqM49LVoy/dW82UoUvrX13ub29q33mNRkkyV5mTbJNGTh4uhy
         45TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310832; x=1732915632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVDk3xEU2QpjSHmmbqDmI0W3f5YcaJaRWLgrUepxspg=;
        b=BSfYRwOYBs11wMbAOyQ1GYe1az9sO4WlBRp57X6t81F/l9JzANTV9h03HzByaedkDl
         9bmDP8pqZIFslht+yeEzwZwq5sVAO+MZHi2hWgcmyoRMgd3bE/Y2QVmTZ7tj4sjseuhN
         MEssO6v/xAKJHsAE0UnRXMjqViLfHtHFxsztTyRuzHoS7tfFAl3zSXSlW88NGtID+ZTH
         q2HuL2dr2/G96aqx6/o7Hgvb5j2S22A7m2UTFIgtVzzRpjjJLfFmBcY9rYRh7PMbnQny
         n+fM8/NBl3lPeypdOZTnhWZdtDj86LH/fy+WEF7rHB12131omukfM3P9FUj8XOtjUMrD
         ylcQ==
X-Gm-Message-State: AOJu0YyBDGoZ/kkDabWgYA1Qnx33sknk4RDM5gzmnbPwbdrhuCR+wWAP
	rucTHz2SNIq/iuls1FZOtJ8uYfWJZZQLRM6VRVpWIPvS0hTVx+cptOaVjQt+sQsC6vLjCGE0HqL
	/
X-Gm-Gg: ASbGncsM+f7dlJnyr6kcZDx1J9Ob6bu0dQZIvAVYOd1soEg0torijMj6jPYPbx1jjZH
	G/d80RPqh4vgipTxariYHabu9qeViJPA8vVknTIXBwdLGoz5h6ycFoF4K503dJ+1ay9bxmA57sF
	+CelGj7miLWqhVZL109X17rLyCmyh8vFxcOLfTczagJq4sujkak+BS8uQlyF/ZJCN52wXzWnCPC
	fwadn3OFB/8/+M7v2FJI2aTsXIuUfnQVvsEiks=
X-Google-Smtp-Source: AGHT+IEIB/02dCXe2cgawRiYLViOSDnzBlWzdlvsygf/5kq9+98PFzpxf53AdKx2yw2MTTuoK9EJlA==
X-Received: by 2002:a17:902:ecc3:b0:212:6a4:9b0 with SMTP id d9443c01a7336-2129f288b89mr58028195ad.43.1732310832375;
        Fri, 22 Nov 2024 13:27:12 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.27.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:27:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/19] webkitgtk: reduce size of -dbg package
Date: Fri, 22 Nov 2024 13:26:35 -0800
Message-Id: <287584ee1068e36c7e758aa1d69ef71382c9adaa.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207666

From: Ross Burton <ross.burton@arm.com>

Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of
the debug symbols (4.3GB to 700M at time of writing):

  Level 1 produces minimal information, enough for making backtraces in
  parts of the program that you don't plan to debug. This includes
  descriptions of functions and external variables, and line number
  tables, but no information about local variables.

This makes the sstate objects a lot more manageable, and packaging
faster.  On my machine:

  PKG          TASK                 ABSDIFF  RELDIFF  WALLTIME1 -> WALLTIME2
  webkitgtk    do_compile           -613.8s   -21.7%    2823.3s -> 2209.5s
  webkitgtk    do_package           -143.4s   -53.6%     267.7s -> 124.3s
  webkitgtk    do_install            -93.7s   -60.1%     156.0s -> 62.3s
  webkitgtk    do_populate_sysroot   -51.6s   -86.4%      59.7s -> 8.1s

Cumulative walltime:
  -892.9s    -26.5%    56:06.3 (3366.3s) -> 41:13.4 (2473.4s)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8361411ea0d67a2620680e2e86045799e072c80a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index a62d99b227..4849ee50ff 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -100,6 +100,10 @@ EXTRA_OECMAKE = " \
                 -DENABLE_GAMEPAD=OFF \
 		"
 
+# Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
+# debug symbols (4.3GB to 700M at time of writing)
+DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
+
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
 # By default 25-bit "medium" calls are used on ARC
-- 
2.34.1


