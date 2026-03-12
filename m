Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0135105A592
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 12:00:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19834.1773316830780177760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 05:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M0ikH2no;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439ce3605ecso763482f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773316829; x=1773921629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MOZoWqFUUwaWUpoANEf+t474+Eata6aHNv7GDECwoqg=;
        b=M0ikH2no+qVaV9zK4Q2MV5WdermOs+iFw+ZsBuBGEttt4G4a0an1obzwetlIhAnSbo
         IRIkrsflcqkXx4yF/1OO5jdDQ763oMo/PT/7UhNwTaihV/v6ZZt9JwlWRNai6lOvrSgv
         zz2gIg+D8LXxvIT0Wgxqnnd/1faNeeUdgGyVW6hRiT7Rec/jPxmwafIUr6iLx60NZsb3
         qZ1GO+UhA2+vZCXuAXkjLkZx+Pc7+Vub1zbdzQkSLUNPYRbLXUOUydlZPTDJ7Sii4JHf
         XHnnnlkbdHcl/uuU/KsBmZd+N+9xYG4N+VP+rEB+7yALrvcxsGXmbpinu0RLKCCSvbiD
         GLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316829; x=1773921629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOZoWqFUUwaWUpoANEf+t474+Eata6aHNv7GDECwoqg=;
        b=RykQ1zG+HyOoSjoeg15aI2Xd/hhJohDKUa2DJizGnxR6qSX8UOQNtaJ9+/T5NUE1sf
         cUymWL/suyv2OJJh4GuBzW1J7/na3WqapdnD1lSN7JwtOY3/6JEwEqrS2rFLB1bFulDS
         Sq/71uHpKFVvaSwvzuxYYcVJU/d1ITtB21CGvFGOa2zhtd97ceSks9mNtIMrDByVCqTc
         es2HMMsFpb/pMC6rSTWWil3L0XVsTJrJ9edhxFW0HT9IOI5Iqy6kfLXktJemcQYrq1Dd
         z3TjXc+HUn8t+Yppt39LyXYH760G6vzMX//XAnLQryPw9cYPiNLEgeEdw9sICOHiadXh
         Dx8A==
X-Gm-Message-State: AOJu0YwMFgshghGcaaJ237H2DgNwXkHzY+ltk8tok5/cDDrJWZrpd9fm
	6J7pfiIJ/+wJEGmFxgzA1aVaBZqSwOrJ5zR0o5sCU39QuCVfE3ZTnULx0lHuVA==
X-Gm-Gg: ATEYQzwp9fIClazgd9nbylH7okQVhnj8JSF1koS1YBSyUx3f00R6bdpVltQkjU8Og4m
	/IV1+h7VqW4NDsHCPW0n7VgrLZyAworMPMk8xrwERo+uBczyIEB0ys11c2ayslDsXzG8NDKTDQs
	BEbqfmAIEQdEBi6E0IGGyLe3fUugJsz1AwzywdemzfTLzmcIW2RnpWwzhdJuIQ7RU4enooqriks
	ZoAaaD0FlzUbNUMw7kc0q2SaEcjbGwpayYxLqSMdd8kgyEy385j7Bp0zeUNUHoDs60cZWMi48F/
	sEqTVfiHASh/qtJpN/+X3618migR9AgF14xOuXXpsordbHe7uKt2aVglvNoD6vpiLZUHnEZrPB2
	WipwC7x01ZmBV1Qr/H7BuWw2g1/jH+UfJ/sMnpllFp4DU/vPBW0QBezCdM2ypnt25xDuMlbH6rQ
	kaEzs77sTPTbk23rE/e05xfDzG+Vu8XoxW+JJ/VdD3UFAKqwPn3hd6Kg==
X-Received: by 2002:a05:6000:1863:b0:439:8d76:853e with SMTP id ffacd0b85a97d-439f8222fb1mr11122076f8f.45.1773316828563;
        Thu, 12 Mar 2026 05:00:28 -0700 (PDT)
Received: from fedora (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm8216018f8f.20.2026.03.12.05.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:00:28 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2] python3: Add a new PACKAGECONFIG knob for free threading
Date: Thu, 12 Mar 2026 13:00:24 +0100
Message-ID: <20260312120024.3745232-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 12:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232946

One of the main points in the Python 3.14.x release notes was
that free threading is officially supported.

Add PACKAGECONFIG[freethreading] to turn it on with --disable-gil.
GIL is the Global Interpreter Lock, which is kept enabled without
this option.

By default, keep free threading disabled, i.e. GIL enabled.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/python/python3_3.14.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index 7047cd8e8d..7a1ad1e386 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -112,6 +112,7 @@ CACHED_CONFIGUREVARS:append:libc-musl = "\
 
 # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
 PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
+PACKAGECONFIG[freethreading] = "--disable-gil,--enable-gil"
 PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
 PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
-- 
2.53.0


