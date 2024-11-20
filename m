Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808DBD63954
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:44 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.13845.1732111056983256422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=htAmb7wE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c803787abso7434835ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111056; x=1732715856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/9ISed6Dq7PhB8BCgyZJZMIPGaOQcl7C3628B3wTcg=;
        b=htAmb7wESQptlbjlZloyc/keAMoC5WIZNvMPTKAdCcGOMpl4x9z6N3025zV1ww5BVM
         4w9EpWCxZzH19Bn0CJRPlBp0gOmLyjK7uis6vQrIAETXK5ieXUDfhmceM4V0IuX+wzzq
         HjSNL02m5ASVNRTPmD0RF1dNiXI2j1cNvkoIrdA7Vrtm9ov4bkSI71ZxGDSoKLBMS/j0
         j9lXXE/lgTMOuWQtl0EwPh09qIIwA2s9/RoUaarxVFdawuMGEkx6NUPIFfEd3dhF9tTA
         HWtpzGs9LOc607e41TJARc/k412NEbEMIupcPLrGNxT5XLw3F6I8rT6LRHZSoP8bbtmA
         fUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111056; x=1732715856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/9ISed6Dq7PhB8BCgyZJZMIPGaOQcl7C3628B3wTcg=;
        b=Gdeh6JghAT+UCaDhSWLIWKSSlZv/k/J8Ebk4DcAW/KwuXfcKc7eale/Gdwh4/db9ts
         1VVstIwnGbGONZHYTw/tHucwrlJ5J1Ti8LPSDYmg4RT7RvK6u7Wrg78J0BbzwmGW+pc8
         quNsXEivT89nZEZT4wQh6l+3I+7at+5C/2OvrBsjLBo0sitKxIB0IJ7189pgt0AmlFu4
         9/A8liQOrQ7uGwKcZjdW8ejWbzqhIvXxaKpA9YldMh2e3/OzBxdFkJyEdKD1arpiABk8
         2T4kiQpHnHWDhkE569xV4dgRtixQQOZbvuBP3CY6h1tokAsK85c06c8j9i0yF7vJ7AKl
         EEOw==
X-Gm-Message-State: AOJu0YxwsoDQmqVKiFlGpeTjI3WIAcDn6zW/IO4lhiBzvFDhseuMMJ98
	zuoXE5Uzy+KRZJA9vruqxLApo8AHlo0dgT6NIkT8omR3sz6jbrwK8AHMTh+CLLbAg0FpHa9Ms6b
	I
X-Google-Smtp-Source: AGHT+IEZkVTZ8QHJYgbZhD2Zv4rBxTVhpm0b3SpjRjtOYlf4ikSxNar3SexsdPKx7/twvjYNcFotwg==
X-Received: by 2002:a17:903:188:b0:205:5d71:561e with SMTP id d9443c01a7336-21269e8379amr49695225ad.26.1732111056279;
        Wed, 20 Nov 2024 05:57:36 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 16/31] cml1.bbclass: do_diffconfig: Don't override .config with .config.orig
Date: Wed, 20 Nov 2024 05:56:48 -0800
Message-Id: <aacd87a4499102355fea4022ea4ff86cfc86f946.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207440

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
1) $ bitbake virtual/kernel -cmenuconfig
Do some changes and save the new config to default .config.
2) $ bitbake virtual/kernel -cdiffconfig
The config fragment is dumped into ${WORKDIR}/fragment.cfg.

But the .config which was saved by step #1 is overridden by .config.orig, so
the changes will be lost if run 'bitbake virtual/kernel'

And the following comment is for subprocess.call(), not for shutil.copy(),
so move subprocess.call() to the correct location.
    # No need to check the exit code as we know it's going to be
    # non-zero, but that's what we expect.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6cccf6b02f92dad514e65fd779ff659b19eb6be7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cml1.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index 8c207daec4..0bf171a668 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -93,10 +93,9 @@ python do_diffconfig() {
 
     if isdiff:
         statement = 'diff --unchanged-line-format= --old-line-format= --new-line-format="%L" ' + configorig + ' ' + config + '>' + fragment
-        subprocess.call(statement, shell=True)
         # No need to check the exit code as we know it's going to be
         # non-zero, but that's what we expect.
-        shutil.copy(configorig, config)
+        subprocess.call(statement, shell=True)
 
         bb.plain("Config fragment has been dumped into:\n %s" % fragment)
     else:
-- 
2.34.1


