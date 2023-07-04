Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F4AC3DA40
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:09 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.61399.1688484608946842583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=nVyqRJDx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b7fef01fe4so32993735ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484608; x=1691076608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0z3MzzXfAqwCHLbsPdASimpSLgsW7RMIvnNJ1qzYi1o=;
        b=nVyqRJDxw/4ReRnSnN+h/AYt5MyO6Z0RcEaVtZ6BaVCQkcHUDvn9r6Qt6dKL+O7C0e
         /M1pPUTX/TlcFgHoDQ24NevqSpIJdyiixr92M+7HOarbshu2PPbFMry9S8aNqG6ENVls
         dFBMlF/Ye83sV/xwXn5Q0AzQTRgMK/9HCv9HJjTdfkm6njfrSTE1EccXC/4rBsqc8Kf9
         +KLKsLavnyxOQ1aZ+oagSVFpPjiGMz7wMKXHB+MqJX3QQGsGdLlAC+yr2AyeQFHoeK7E
         SoPcC2qFzS6uEgJwh8BqsIAIR51hFvj0VbeevIVgpHUeckOVKpkvdMsMt5iq3jyhaLtC
         y8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484608; x=1691076608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0z3MzzXfAqwCHLbsPdASimpSLgsW7RMIvnNJ1qzYi1o=;
        b=db9RFHj8uquGJ0KzpM7nCeBYDHxMUJAhEd6doqjHm0GqMilYO9NDg2SqxdO+jjgPpH
         ZrynqISkV+xhaSRArPFR8IvWp50haRSty3YRE8HkbGCcmziwGsJKedtAFrx13QUVy+l9
         zwxjwUvrUQxVg+bjUXabH/T5rNTpZvnjXC24hMEDfdV+HEYLQ2pkTvQPwUr0yDvIJEVR
         JDfRHnII2JxhGhe+IytILxICOiWdwBjZa722QcikmPkDGCFTEVUEVrln/UQVUDJjC1Kb
         JsCBzcQtNO8smX+RA4JTR21azP+84rtfwtZYk9w0helRPLTl9YHxROcqm2k1Xq88ROg5
         fe7A==
X-Gm-Message-State: ABy/qLbilWRb2aUvZVdXaMPS7yhMtiHhd6HsdA9qQkiFPMiypu1S3ves
	WdSMyFnc0IUl/UjbOd1ghKS11tlM77SyupMIkbsBRQ==
X-Google-Smtp-Source: APBJJlHAWvSeHVNbp3VuoZKmWpak1JutMudBza2twsznwinI64Nk1/Z3X2yAFDLmz/7njnyuRVhqeQ==
X-Received: by 2002:a17:902:c409:b0:1b8:6cae:4400 with SMTP id k9-20020a170902c40900b001b86cae4400mr11071962plk.37.1688484607765;
        Tue, 04 Jul 2023 08:30:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/30] bitbake.conf: add unzstd in HOSTTOOLS
Date: Tue,  4 Jul 2023 05:29:16 -1000
Message-Id: <d59c5c1e78a1165bd2b00b3185ff8e9119aeaf9a.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183849

From: Alberto Planas <aplanas@suse.com>

rpm2cpio.sh can make calls to unzstd to uncompress the RPM payload that
conform the cpio file.

zstd is already part of HOSTTOOLS, as a link to the system installed
zstd.

This patch add unzstd in HOSTOOLS list as a non-optional binary, so is
available to rpm2cpio.sh when it is required.

Signed-off-by: Alberto Planas <aplanas@suse.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bff58d337890e804d33d7decbaa46065a4d3bba4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 52ef64b50a..f679a49eb0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -529,7 +529,7 @@ HOSTTOOLS += " \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
-    uniq wc wget which xargs zstd \
+    uniq unzstd wc wget which xargs zstd \
 "
 
 # Tools needed to run testimage runtime image testing
-- 
2.34.1


