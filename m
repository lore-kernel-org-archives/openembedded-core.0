Return-Path: <dit.kozmaj@kynetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA28BEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 14:33:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.1160.1689086034378801672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 07:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kynetics.com header.s=google header.b=ZFy3HAXs;
 spf=pass (domain: kynetics.com, ip: 209.85.221.50, mailfrom: dit.kozmaj@kynetics.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3142ee41fd2so5819484f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 07:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics.com; s=google; t=1689086032; x=1691678032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xmwdcdtjyZ/zlAaVfAuB8aOBTsj0k5Hy/UtdUEVszI8=;
        b=ZFy3HAXsRQ5+l5SUeDOswANufo8gvtkZ6gjiI174B0mfXo+L3suG16UbJFqSQMMoG/
         Is6j6UXBzbk5cbzXYr2YlO1z96SixkAZvaJ0Ifa8jytxnSzMJExH8IEanT0AiMMOCBoM
         3j2vEmPsgLwzaMKA1QeT18qNVUkHH+VumgocQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689086032; x=1691678032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmwdcdtjyZ/zlAaVfAuB8aOBTsj0k5Hy/UtdUEVszI8=;
        b=XQaTupSYHQ5fD/vXGCia2mc6KjOASHqA7WiFtr9Q6Ux+LKMSMCPabO57DpeNHO2nbf
         U23N0zjCcH01K51rCDGmL+z8A8scfsXuEPG5rUOKi9d7h0mle2yTBH5R11quGezf8ALj
         r8TwP+Elqk9j2Y1j4BWmsikJB7A5iA7XIYJLBliL/9j5zmRw3lam/mhdrPCH+0gT51Kn
         H6SPN+qWj5206TosDgv2LKyNSSz9ySeae6wE8RgO+CfZ7H+9TjfJoOuV4fbaaiKKRTW3
         VjH1pN0PXpdZXlgZR6XlMWeSVa1eycoCk2tpxg4pXrWXAnvBjqht2GIGyK/5kMRT0xkP
         r6+Q==
X-Gm-Message-State: ABy/qLZwrbqHHe+Vegd8lrPmtMwzQ+5O1GAia58lAJtnH3ITCOR3CeLT
	Rgm5SOTKj0QhRavXd9zAzlWRc3+SXrJ3gHb3eVU=
X-Google-Smtp-Source: APBJJlEpI/VTqGnT/p6vxv2kjiyJDftGVLQMbo2A+HTZ+EG3fkLksqhCiMuSgdcNiCKdsLo8b1GZew==
X-Received: by 2002:adf:f910:0:b0:307:8c47:a266 with SMTP id b16-20020adff910000000b003078c47a266mr13386689wrr.61.1689086032421;
        Tue, 11 Jul 2023 07:33:52 -0700 (PDT)
Received: from ip-172-31-5-183.eu-west-1.compute.internal (ec2-3-252-106-40.eu-west-1.compute.amazonaws.com. [3.252.106.40])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c021800b003fbd597bccesm13192759wmi.41.2023.07.11.07.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:33:52 -0700 (PDT)
From: dit.kozmaj@kynetics.com
To: openembedded-core@lists.openembedded.org
Cc: Dit Kozmaj <dit.kozmaj@kynetics.com>
Subject: [PATCH] fetch2: Set maxsplit to match expected variables
Date: Tue, 11 Jul 2023 14:33:20 +0000
Message-Id: <20230711143320.255308-1-dit.kozmaj@kynetics.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 14:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184141

From: Dit Kozmaj <dit.kozmaj@kynetics.com>

Set the maxsplit value to match the expected number of variables.
This also avoids an unnecessary split as the parameters are in the form 'key=value'
and the 'value' could contain the '=' character.

Signed-off-by: Dit Kozmaj <dit.kozmaj@kynetics.com>
---
 bitbake/lib/bb/fetch2/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index 3e6555bd67..79b289eaec 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -388,7 +388,7 @@ def decodeurl(url):
             if s:
                 if not '=' in s:
                     raise MalformedUrl(url, "The URL: '%s' is invalid: parameter %s does not specify a value (missing '=')" % (url, s))
-                s1, s2 = s.split('=')
+                s1, s2 = s.split('=', 1)
                 p[s1] = s2
 
     return type, host, urllib.parse.unquote(path), user, pswd, p
-- 
2.25.1


