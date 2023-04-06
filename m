Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA8BC761A6
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:03:06 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.162545.1680796977406173180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=WlhWKScW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id s19so24060929pgi.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796976; x=1683388976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfJTgfKJL1AHYr0wqsoKCd53Jaqu1EXfaQA3j0hjcwg=;
        b=WlhWKScW0ipBLMfjgcFr74RJN8lW9KP49fN4Xjozdyu9Z2+hk7E1jAWUGWZZ9LUJqA
         RN0EUfScLTHfsD5q+j78dIB09s60sIIJSIxQqstC/xml7gx5GeCogxPj+Kg2DvRpCmCX
         nAQe7ZbRlTNf5XXPNMVJBdgojnUFxF0K2q7fwBh+UJmt76l6QNzGFdBxmPupe2YJwhoX
         k8hb3uJZO5/FawcW9rfUSapcDn8vZzJonzkViDDbDIm9Z2VLVmLR14k6xnPnZYw5Jg9W
         RCOOFB+Xlh8pkAuPwkkBzEiobjOap7/85HhxqojsWXpRCxLU6c8KDJ/hz5S3fgP2dwPZ
         2b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796976; x=1683388976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfJTgfKJL1AHYr0wqsoKCd53Jaqu1EXfaQA3j0hjcwg=;
        b=nFifHaSTfscqG54iM0d1dscFgLwRouiVI/s3FeG0nqEpTnxuc/RWbSt6SMzqJaXJIm
         TEbZyR4IhcnOmSkFAS0vTD73wGzO3aOC/CX3W+gF76p3H819ATSHw6BomVtyK7B4d2in
         /1eCtPhNI5kWE3PnOGpbCcEOBA5K/SZO5IO0tj3yUqNjRUr5afi4+h+foMSNec5TX6y2
         3nTarb7xPfM/cP8C/scURZ17cx5Nr4OzTu1hxFlRoO1LRNKurdvKz9GMx3GXI1VsbDmH
         1+FbC26N1jPzj1GVFZGd3gOpvy0w4vO+brEDvYKm0bL9nn5bpVprpKohbcRthW9iLQy9
         Rm2A==
X-Gm-Message-State: AAQBX9d293w9GgShLWyMdFZ04XIUON1aq6Own57g4CXFT44Hzc3BNs3b
	x8Z327jnHqmXnaqaFbphbcaki5+ELBrO0JggpCM=
X-Google-Smtp-Source: AKy350ZRQGyIbznks9i7F79aEQOGCcEzK4au9E07dbmewMcLGH0n8SK06fVifX1naT6Z1FVP82V4Cg==
X-Received: by 2002:aa7:9a5c:0:b0:623:cc95:e517 with SMTP id x28-20020aa79a5c000000b00623cc95e517mr10005729pfj.17.1680796976436;
        Thu, 06 Apr 2023 09:02:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/26] oeqa/utils/qemurunner: replace hard-coded user 'root' in debug output
Date: Thu,  6 Apr 2023 06:01:47 -1000
Message-Id: <386f55d2ba5783038c810dfde98b421191fa00de.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179798

From: Enrico Jörns <ejo@pengutronix.de>

Since login user is configurable with boot_patterns['send_login_user'],
unconditionally using 'root' in the debug message can be confusing.

Also fix the debug message to say 'Logged in' instead of 'Logged'.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 900e3d42b918b5a33d8d952b3a8078fbe72ba98f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 1aaba02bd8..a455b3b389 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -511,7 +511,7 @@ class QemuRunner:
             (status, output) = self.run_serial(self.boot_patterns['send_login_user'], raw=True, timeout=120)
             if re.search(self.boot_patterns['search_login_succeeded'], output):
                 self.logged = True
-                self.logger.debug("Logged as root in serial console")
+                self.logger.debug("Logged in as %s in serial console" % self.boot_patterns['send_login_user'].replace("\n", ""))
                 if netconf:
                     # configure guest networking
                     cmd = "ifconfig eth0 %s netmask %s up\n" % (self.ip, self.netmask)
@@ -522,7 +522,7 @@ class QemuRunner:
                         self.logger.debug("Couldn't configure guest networking")
             else:
                 self.logger.warning("Couldn't login into serial console"
-                            " as root using blank password")
+                            " as %s using blank password" % self.boot_patterns['send_login_user'].replace("\n", ""))
                 self.logger.warning("The output:\n%s" % output)
         except:
             self.logger.warning("Serial console failed while trying to login")
-- 
2.34.1


