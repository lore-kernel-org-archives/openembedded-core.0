Return-Path: <nhorman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A9CECAAA1
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 20:43:01 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.29298.1661460174854084771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 13:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OyJ4Ycvk;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: nhorman@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id g21so16160935qka.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 13:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=LmoaBNrSchWvNgHRbnPbRJadCMRorRoXrkvvsFlJ82E=;
        b=OyJ4Ycvk4pmvt+qGcVufCNM0WXO7gMhYpTUvySoHHIm5QOvWEZwZ0xSp9BzHRllvuu
         EqU3+msDB1MONUOdZcli2rd6LTOlS1h/eo03vw5cecjaywmPEJx9q9ZiPJVEbQB3nUW2
         BBKZ6qEc1D0+0r46PsMmfdv2BtQMqTL0GczmXhYMq8jS2JiOzREEk3erhpb19ndf8R7a
         5ziJ2BgfwBi9cOEaUcp7NAYwPXBIqJvzsTVbshIvXb4gGzSUbxNXAJ/cBZRCesVYqWdL
         PjMrxGimF+4u39OEkSSKnJnE+h486QHw5hheqgzfvS8hyKCGtdl+usMD6f67HwYBhaae
         POfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=LmoaBNrSchWvNgHRbnPbRJadCMRorRoXrkvvsFlJ82E=;
        b=zkH4q/VISUVPVIMZiz0kMgjrEg6E+sBuV3DNM8ffKzK6+m68DMpBKBnGYnQMknpfrs
         Ow3UuxC2BkGZvYdRFnMsn9Jyi88QPt5PNSVTjW6yWcL3MsW0E2H+69tA4tyuy8hbULvh
         uUpbusuYeoKICgOpiovfBEYzGGZ+EphFxx6X9KIaCcSJKUQgXkHWFnZCzjnCKTF7ld6H
         QCaxS/aKAvXxiSZGcoPxasbCoADXIfaVoDjxmqkvq9cTMU3H77qmpfkJPnJFWLh5zqc+
         4hrlmbtiixaWFyzNKOqpc7lUyPbqTNGF8z0RCiEUsNMBhc+p7rj4qLtd8dhms7QBaLPt
         STcA==
X-Gm-Message-State: ACgBeo0a78FQySZvu09lSneOvgTpYI4GXBrEKyBg6xhp/bBOH5bFOmqv
	9Nsn2UfJad8g9BuZ1Kk0At7kFpWJ9wnxNQ==
X-Google-Smtp-Source: 
 AA6agR6G4Dir4GrwlHgW/sft3oFuDGvw6a8roOMdBVzYhWGSsEKtgFaHeVWc6CpnfGyn8FY2Sn3j/w==
X-Received: by 2002:ae9:f50f:0:b0:6bb:49da:e1b2 with SMTP id
 o15-20020ae9f50f000000b006bb49dae1b2mr4290958qkg.21.1661460173764;
        Thu, 25 Aug 2022 13:42:53 -0700 (PDT)
Received: from hmsvengance.lan ([136.56.11.135])
        by smtp.gmail.com with ESMTPSA id
 q45-20020a05620a2a6d00b006b5e296452csm340181qkp.54.2022.08.25.13.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:42:53 -0700 (PDT)
From: Neil Horman <nhorman@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Neil Horman <nhorman@gmail.com>
Subject: [poky][PATCH] Fix npm to use https rather than http
Date: Thu, 25 Aug 2022 16:42:50 -0400
Message-Id: <20220825204250.3241214-1-nhorman@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 20:43:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169894

Hit this error while building nlf-native recently:
{
  "error": {
    "summary": "URI malformed",
    "detail": ""
  }
}

Some poking about led me to discover that:
1) The npm.py tool replaces npm:// with http://, not https://
2) Some versions of the npm tool don't handle 301 redirects properly,
   choosing to display the above error instead when using the default
   nodejs registry

It would be good to go fix npm to handle the redirect properly, but it
seems like it would also be good to assume secure http when contacting a
registry, hence, this patch

Signed-off-by: Neil Horman <nhorman@gmail.com>
---
 bitbake/lib/bb/fetch2/npm.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/npm.py b/bitbake/lib/bb/fetch2/npm.py
index 8f7c10ac9b..8a179a339a 100644
--- a/bitbake/lib/bb/fetch2/npm.py
+++ b/bitbake/lib/bb/fetch2/npm.py
@@ -156,7 +156,7 @@ class Npm(FetchMethod):
             raise ParameterError("Invalid 'version' parameter", ud.url)
 
         # Extract the 'registry' part of the url
-        ud.registry = re.sub(r"^npm://", "http://", ud.url.split(";")[0])
+        ud.registry = re.sub(r"^npm://", "https://", ud.url.split(";")[0])
 
         # Using the 'downloadfilename' parameter as local filename
         # or the npm package name.
-- 
2.37.2


