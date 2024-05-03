Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F149C25B5C
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 13:53:29 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.13400.1714744404112597471
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 06:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qdJurIg7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6f43015b763so1248054b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714744403; x=1715349203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ue3sfaaHxcXo2C21VmFxlpEGL/76/YvB/Cv4QQkH+xA=;
        b=qdJurIg7mmHk1hUo0YjEfRiEs95qkWol65c6Gng1QAvqiTd6GDQ9Bwmpg2UfyIaKRg
         6LCV4ZOd1XW0LFktgEL7KIw882lO2hUkTKNo+r2o5dPL1zDlvTv4DuHZBrmPW4ASRHPl
         p0ToVGMlgM3ES88pc16vTDZKB/EYKa/DeLbSYYrqkNWnVFIMCHDvNsv+dm0QolL9n43y
         8msvW9t3jP5eMucgzlY48NIDEEed/O/J2/GUX7ZOEaxksYF6JEZxtG9/WEofVNLsa6qA
         8TZ57n77v+d7b/f0voeUgt6OywJ1FdmtepANjzNUht3/hEBmJTIYCyD7wjgKNAdFWt0G
         cB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714744403; x=1715349203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ue3sfaaHxcXo2C21VmFxlpEGL/76/YvB/Cv4QQkH+xA=;
        b=E2352rD+KgtBxvL9ln9Ea8hLbXHEOoLU+rJD2L7+eol3yDUejOVOwegpdNvBXNlGl2
         SX+OVrzeeN40VhWNvmkhQJutXK9I6FsK1OzZnDYVdBpYcuTZuJ4mDKV08KoaKSLTvKme
         HJ8XH4CrT17fW6ehK/1Tjbuosc2JyyyGpdTlvYlzCYldCYKwzVbfJk6BOqWOYyh9scJT
         x92Zyd/Ch7NbXRE+I15vIDWa2Sy53qh0c5qoR5yzLsfdrWiPa72Uxp3rWVzzK3XqGOyu
         gnRXtD6WQkhEGqQFXJs89ZSVE7btvRPpIjhK2PJy56UHE76apuAvu6ua1icCO4A4/vs9
         p1sA==
X-Gm-Message-State: AOJu0Yxu96xk1Xs3C9KYBv2yaCFHkTjqmYQCi/Bq/7RMoG/NGap5vm0z
	gdstd2okp0yICPF6ONuYieb5NunqziQGH+nnjyHMosSOQAbOE7Ptea06pSldYsexVJFGMn+Qp1q
	5
X-Google-Smtp-Source: AGHT+IHtq7jIgf5pHzbxyjKWgfe0IJKpac0L99NW/5CgQqyN4zEbgyZnJhA7zoUzx5mMOgzljWZpAQ==
X-Received: by 2002:a05:6a20:9f0b:b0:1ad:7e68:570c with SMTP id mk11-20020a056a209f0b00b001ad7e68570cmr3996823pzb.4.1714744402958;
        Fri, 03 May 2024 06:53:22 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id e2-20020a056a0000c200b006ecee611c05sm3044941pfj.182.2024.05.03.06.53.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:53:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/3] sstate.bbclass: Add _SSTATE_EXCLUDEDEPS_SYSROOT to vardepsexclude
Date: Fri,  3 May 2024 06:53:12 -0700
Message-Id: <4138f0a048149195d39347d97f8155199b6cf0cb.1714744247.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714744247.git.steve@sakoman.com>
References: <cover.1714744247.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 13:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198993

From: Mark Hatle <mark.hatle@amd.com>

When using tinfoil to control the build, multiple commands (serially) could
trigger an error such as:

  When reparsing ....bb:do_package, the basehash value changed from ... to .... The metadata is not deterministic and this needs to be fixed.
  ERROR: The following commands may help:
  ERROR: $ bitbake esw-conf -cdo_package -Snone
  ERROR: Then:
  ERROR: $ bitbake esw-conf -cdo_package -Sprintdiff

However following these commands it was not able to be reproduced.  Forcing
bitbake to dump the signatures and then running bitbake-diffsigs showed
that the value of _SSTATE_EXCLUDEDEPS_SYSROOT was being set in one run, but
was blank is a different version.

Upon inspecting the code in sstate.bbclass, one usage (without the _) is
already excludes, the leading _ version is used as a cache, only if set but
is not actually required to be defined.  So ignoring the value should work
properly.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4ec704ed6a1cfaf0a6c20f2038e7192e361ef590)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 04539bbb99..76a7b59636 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1115,7 +1115,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         bb.parse.siggen.checkhashes(sq_data, missed, found, d)
 
     return found
-setscene_depvalid[vardepsexclude] = "SSTATE_EXCLUDEDEPS_SYSROOT"
+setscene_depvalid[vardepsexclude] = "SSTATE_EXCLUDEDEPS_SYSROOT _SSTATE_EXCLUDEDEPS_SYSROOT"
 
 BB_SETSCENE_DEPVALID = "setscene_depvalid"
 
-- 
2.34.1


