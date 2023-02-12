Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1C7C636D4
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:23 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.7.1676236282335627071
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=elZRfbK5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id o13so10162682pjg.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UV7N3NZ6ITdFRvDzmXkzwLWyuj1XW76o5WhYJBdJCX0=;
        b=elZRfbK5trjEX9KNuc01SIHKzyvgihBiNM0SWBiR4dY/+GCB3x03gpay7wbLVv4VTh
         lrjmocnmIIbKjEP1eSRRXBHR3JtdXdl4YQPz3xvWqW9o2+77jPWglhlFWA28Xn8fFcJb
         QCdg9zwXMCG37mA//ObY5Sx0pAxp4tPl7aBnvGoykt/2JSKXBC/uJpCL7kME4rAKW0uz
         38WpJY2mTLaflxeeKo4mihK9eVF5YImOZCOnhw/ey6c4LkKjAVwDjt3TRVIcRz9moI53
         kYb/SBUCZM/zCJsvjybcQeaE+sBb6R8YgbGcvjLHNEeql8T6ItU5dVNlcJl2XNVk1dAH
         x2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UV7N3NZ6ITdFRvDzmXkzwLWyuj1XW76o5WhYJBdJCX0=;
        b=QIGPAHm4P6XTtL52bSHAkV/2YtR9HNjfi+IQ+tvFk1pbVQVfwhP8dILmCxDkrfnn5l
         kFzph//uysJMD/e5uCBjQHlB+y9DhCJTH3H2K2aci443TgbW6DQzU6AnwRN89Yin8a0I
         3NrMTUb+RZs8NMXll4vCrKG/IubM/uuExHNBxVQw++LMSGlDyzOT8uI010RN7AxFVsTZ
         fIHfNqi5LW+eggTdJmogFilimbMyQ0lxqWZ6WiKgUcgYcXUtoBqt1nCJ+81qlmtWOjfW
         obtMSDnahY2EmqdEbABveVqrlZ8q70D1IAMteOGC6SJ3I1LZ49lOFLFknAJElYb38rjN
         RGbA==
X-Gm-Message-State: AO0yUKWMqY7oewILdF+K5jMIYj6dwa/AiUBYDTqzADefHtnSVgLvlEEF
	DLhu5ILz4ZwF8TRlX9NQ5JAIkyKVoRu06tKNXnE=
X-Google-Smtp-Source: AK7set+iuK2ZMxDXY04Vbs56JK4pysj+eDKBPGS45N+69lAgJrlRKTtm3rhNrl1x9da4aaeAZ3/1Sg==
X-Received: by 2002:a17:902:d40a:b0:19a:8284:83a2 with SMTP id b10-20020a170902d40a00b0019a828483a2mr4396281ple.10.1676236281285;
        Sun, 12 Feb 2023 13:11:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/27] sdkext/cases/devtool: pass a logger to HTTPService
Date: Sun, 12 Feb 2023 11:10:32 -1000
Message-Id: <032b0a834b7b1583d3d2bd4ac55414583ce8dfdc.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177059

From: Ross Burton <ross.burton@arm.com>

Pass our logger to the HTTPService instance so we can see the requests
and any errors.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3485df2ff61143aac03d92300b7bac4e5d6b2427)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdkext/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index a5c6a76e02..5ffb732556 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -112,7 +112,7 @@ class SdkUpdateTest(OESDKExtTestCase):
         cmd = 'oe-publish-sdk %s %s' % (tcname_new, self.publish_dir)
         subprocess.check_output(cmd, shell=True)
 
-        self.http_service = HTTPService(self.publish_dir)
+        self.http_service = HTTPService(self.publish_dir, logger=self.logger)
         self.http_service.start()
 
         self.http_url = "http://127.0.0.1:%d" % self.http_service.port
-- 
2.34.1


