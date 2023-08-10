Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F52AC04FE0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:57 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.21418.1691683548966586991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iopcncTN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-686f8614ce5so934959b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683548; x=1692288348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XG1pCgQOWcxZ64wSbiaSMcYDunGvZByAvA5Jqz1ujpY=;
        b=iopcncTNgP3RHccIF/9NcwQp+8jk60tGHxjsBe1bz2uk9WaYcIsViWHSVX5sjgRF4U
         nSn77NxBZnt16AmxZmCFzhwwjj+0MuadAOfliofy6Z38xOQKIuDj8CM3xJLH3jTezp4G
         KtrZq2H2AMAf+gddMH1k8acoxpk1EXpGDSJ4KhUM0DtNtwkCZQzHHGLh4DT+PdM/YvYR
         UU4/Ou3hBUwPvpyH//nspUzuyvFTGYv0UZgW5SmQ/c+DfYJijMkKgXiJdm/BfV6izurm
         m5MWtpPNJS/RRXE9Ph3HRfJAzUXy02VLlMb45QtK+GnTg35SDDs6iL2VfK2+d9m3jH06
         PNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683548; x=1692288348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XG1pCgQOWcxZ64wSbiaSMcYDunGvZByAvA5Jqz1ujpY=;
        b=LyJC//t8odPqENIKX2JhaSQc/+eh9s+uOWRmUeSSCN1RXzB3rlFaSPLLfmXK2Dx23n
         2L2UQHnXysK7MEbOTzapbKzbkvoUrwGi4EN7BqHr1z1k8I00LwdZDu+4R14hWP5oMiUf
         Dsx7/TuxSYbLDOY0m/4r+y5HelUCtHc/pvLcr4hnlfJ7Vd5vpJxhs8kd2N/9zVBiNghT
         7EDEv7UFMKmnG0kdgxc8y50a0oGC8iWpaNrsqwNOeWqLGM5yZGH+G5Jg/JgiKfII5X6p
         pqcO51MJvLdq+LtCc5Cua1m1+bD0b3tVMtaSx7dSE0xSJN+/TldWn9eB4WvYSw7EvayB
         FyyQ==
X-Gm-Message-State: AOJu0YwnqS1y7acrC1ActO7PgVVEqnDKGRKek662rFLR5eXZ202DJ10h
	J7VQ6Pl7HAUC63+G6W99iztpOZNxR9M7L2XQjlo=
X-Google-Smtp-Source: AGHT+IEeK10K3yFnZWrxSGA7NNg5e87wIEKm9iWimQszxrPzTmvIJcr2AK7RHPZWpzHtONv31AKpIA==
X-Received: by 2002:a05:6a21:1f25:b0:140:a0dc:c842 with SMTP id ry37-20020a056a211f2500b00140a0dcc842mr3128357pzb.35.1691683547927;
        Thu, 10 Aug 2023 09:05:47 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 29/37] glibc/check-test-wrapper: don't emit warnings from ssh
Date: Thu, 10 Aug 2023 06:04:28 -1000
Message-Id: <dddbca01474f89fade197cd3284671c859d01108.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185791

From: Anuj Mittal <anuj.mittal@intel.com>

Dont fill up the test log with ssh warning about having added the host
to list of known hosts.

Also helps fix a test case failure where stderr log was being compared
to a known value.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63b31ff7e54a171c4c02fca2e6b07aec64a410af)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc/check-test-wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc/check-test-wrapper b/meta/recipes-core/glibc/glibc/check-test-wrapper
index 6ec9b9b29e..5cc993f718 100644
--- a/meta/recipes-core/glibc/glibc/check-test-wrapper
+++ b/meta/recipes-core/glibc/glibc/check-test-wrapper
@@ -58,7 +58,7 @@ elif targettype == "ssh":
     user = os.environ.get("SSH_HOST_USER", None)
     port = os.environ.get("SSH_HOST_PORT", None)
 
-    command = ["ssh", "-o", "UserKnownHostsFile=/dev/null", "-o", "StrictHostKeyChecking=no"]
+    command = ["ssh", "-o", "UserKnownHostsFile=/dev/null", "-o", "StrictHostKeyChecking=no", "-o", "LogLevel=quiet"]
     if port:
         command += ["-p", str(port)]
     if not host:
-- 
2.34.1


