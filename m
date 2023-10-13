Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B9CCDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:43 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.51156.1697234017356912944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hxGxeIql;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.51, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-58111e624bdso1425478eaf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234016; x=1697838816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Od4FbCMx9lJ460sPk7oYrt4TWBuYZhGb1a/0XqnNICA=;
        b=hxGxeIql0qxFdbuBTdbp5fSqyM9TbHlFTSTjJUtDfNLkWjTgtUCLfpmElsdiGOPohZ
         2UzPHjCf5N9LFt+gNnRUammmQpxrHd+z3o+KSxT4+f/Cy8v1nXZ7vaV1C0JtDHMghHUD
         tCBuScK2YznGOSgdY1F6kfIYr7fjSKHngSC0vr/TRIoJXnd8DwgoiQ1qsF9loi1PtEqq
         KBNR3otT0ZFUb4Q434YzoekKFqPBNRBFovavYFu8aeTzfNKr2d+RX+Xj+0jWyXYBthyj
         n2b8ZFP/Nj9nvpHHmdr2ebFqlJKPqlcTSGPWgsR+zR36P69MdQhETqjHTKbdiy/sXN/Y
         AagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234016; x=1697838816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Od4FbCMx9lJ460sPk7oYrt4TWBuYZhGb1a/0XqnNICA=;
        b=Gj3vZufgcSSQ4ZCNvH/mJNvQOsIT+tp24zU+1l/FAnUu33KaK/uoB0ZFIIu1wT+xxC
         UoVdWD/yFAw3Xu3BrbPis3y4k77C3GVCJ1NX2tB05YYH5sEI1Q2XEKCwV3mSb6SAEplp
         v+1naTHB4AadKistGNLiffXyo4H7rKtPRWrQwc/SSnufIoh8+ZIrMk2fs9p7Q/SA9BNh
         Rt0DcdV9KVEdimKaLyBx4QujbgSibPb9jeQfyU0kkOTAZIyFzULi2jV25L7BH6uDIh8+
         UXphkkAIpNDVnjt1ZUDzw3BL80s4Tnk5hWlgKTdWoscECAv02xMyCBbIChRdvr7H+E5/
         W8Nw==
X-Gm-Message-State: AOJu0YxCKWXT2iA749+Ou5WwWRxkK1YPE3SP83ZNgE3DZ9wXGIEXdAiD
	O4K0y5LJZ9rrFbVV8c7dGfA3PUgXToVs+E8f/bM=
X-Google-Smtp-Source: AGHT+IES+34oEbq+EOWBPc+urGrLIS7LDAbor5Ur6Hai9jfQZaK34SojOqlthD41llQtsa94jtTXVA==
X-Received: by 2002:a05:6358:2496:b0:142:fd2b:d165 with SMTP id m22-20020a056358249600b00142fd2bd165mr31045955rwc.13.1697234016307;
        Fri, 13 Oct 2023 14:53:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/27] oeqa/selftest/context.py: check git command return values
Date: Fri, 13 Oct 2023 11:52:43 -1000
Message-Id: <776053f4af19e9c2de7ce725e6ec94312028fa7f.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189096

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Don't ignore return values from the git command lines. If something goes
wrong, fail the test right away.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dfc178a70d6fa60e89d4716f05d68e2c72c6ecd3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c98763735f..39325f4b72 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -97,7 +97,7 @@ class OESelftestTestContext(OETestContext):
         oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
         oe.path.copytree(selftestdir, newselftestdir)
 
-        subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
+        subprocess.check_output("git init && git add * && git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
 
         # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
         subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=newbuilddir, shell=True)
-- 
2.34.1


