Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFDBC3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 11:28:00 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9600.1720697272338121709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 04:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GGb/WG8N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-367a9ab4d81so381387f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 04:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720697270; x=1721302070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuSMTAB9JVd1U/G+11A6pIludDmm/W8DkGxpb5BGlHU=;
        b=GGb/WG8N5pdleSI18WAEeoRpoHFNB/59DDlC3WhZoDXyRkU1BxXYT1MJkmVj8y/oyV
         u/gOQP2xfSa8KaJqQChrR7Jh/UvEKtPZpz09SUndFP5/xyMd9H2czf1uWNLzGlYCPpEe
         d0ABUnE7vXxfnrVxGtoz4997s72pDWMuDqwKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720697270; x=1721302070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuSMTAB9JVd1U/G+11A6pIludDmm/W8DkGxpb5BGlHU=;
        b=m8onju/wJmW4ZouzvYrBL/01NOphQS/AclX0lva3HoIh86akqJDYLGsO9H1tCEzXAw
         BwvTqTCVB/xtUexcdc0+rjt4m17xyqLZubLuwJXT0sZ+kpDTp+b7igrW27qpqQCXsL4V
         feggGELOhqoduJWQBRtUesphvB6apq+sYsMf32TfLEWTmNgV01JcgKN8JEwiF6zqUmq1
         JLasqJGtM9qbd4LTwk5YmMVmdsc3AEQkvi7EfreNXiaik+rVPvgO975jzcTjpCeCkydx
         DSup8envwDD5gr3H0zWPiLhwXwgM8E554d+CyoCPvoXdpOJat3yW8ftztHMmQRp+o5TA
         GQUg==
X-Gm-Message-State: AOJu0YymMphzbG6NyOjJm53hzPusQ1OBqa/x90kLq0n5ZzntX6ITY6+n
	Y7CvzpAxx5S+hNjV5crccTMScDJq61V3EpWb+Jgzwtefqp5FJyl8fL6HfHHNwKYs6rjh2JgXkJM
	0
X-Google-Smtp-Source: AGHT+IEwdXFwZ0+be0nW/ZRItNq2ulUuodrsLaVsCJ7bH1U5UtpvaT639iZw41CsPqXyr2BL5oVJhw==
X-Received: by 2002:adf:ae59:0:b0:367:9854:791d with SMTP id ffacd0b85a97d-367ceaca9a2mr5647408f8f.43.1720697270503;
        Thu, 11 Jul 2024 04:27:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde847bdsm7465336f8f.41.2024.07.11.04.27.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:27:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] python3: Drop generating a static libpython
Date: Thu, 11 Jul 2024 12:27:49 +0100
Message-ID: <20240711112749.1212183-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 11:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201776

This currently puts a 60MB binary into the recipe sysroots in the native
case as well as the implications for the target. Since as far as I know,
we don't need/use this, stop generating it by adding a PACKAGECONFIG. It
can be enabled by anyone who does actually need to use it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.12.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index 77bbfaa069e..743ba0b1f1f 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -107,6 +107,7 @@ PACKAGECONFIG[tk] = ",,tk"
 PACKAGECONFIG[tcl] = ",,tcl"
 PACKAGECONFIG[gdbm] = ",,gdbm"
 PACKAGECONFIG[lto] = "--with-lto,--without-lto"
+PACKAGECONFIG[staticlibpython] = "--with-static-libpython,--without-static-libpython"
 
 do_configure:prepend () {
     mkdir -p ${B}/Modules

