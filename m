Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387E7D2ECFE
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 01:55:45 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49934.1768872369897305614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 17:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igorinstitute.com header.s=google header.b=MdtIq1fc;
 spf=none, err=SPF record not found (domain: igorinstitute.com, ip: 209.85.219.47, mailfrom: trent.piepho@igorinstitute.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a288811a4so50753986d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 17:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igorinstitute.com; s=google; t=1768872368; x=1769477168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2n8GY7/sm4tH+CCNnBxOYXXfyJYyTQLe1tzkGqXatq4=;
        b=MdtIq1fcUKw4bwZZo1WmkAhkMFXx9diRsCnv05zsbKcAAzpD0LKqSvZzFpFo3VlKUI
         25JulKPuv8n4UxbONXNJJa4hFm3UmaMlxGfBSuCKZssZCe53tFFk4nLX9+IBk8RCuA6Z
         96IA4c/pQFvpXEy6PTh8dHDppOUWd8INyeCRLBu98mIV2bqdZYUFxaYoaSW4xRuzPABo
         KmAxNV2usFokKil53tPngiYu3dK7JEu5HIhNhpVSa+3QZJYL63E+1hVZXOLRQS2JxxQS
         L5nVBgljBSb1Yee7twSYL8gqAS38UEfnLvTkml6DYze5gkKbhsNzIcGIThag/aaiF0/t
         71vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768872368; x=1769477168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2n8GY7/sm4tH+CCNnBxOYXXfyJYyTQLe1tzkGqXatq4=;
        b=sHZ0mSxuDQZWkmoySdO1f1U8wbgmSpO7bow+uVIDjSKLZyRqqzq8Q9F3wq0dceGttf
         nJ/T26Hem0RgAEzLoaauZHg8yuItKXIfBoh3LiyAsXyfsFZ9vtfYjYfS1CUHSPdMjEcm
         5bILnMtaZdfei1ZJTVBCS+jxdPZyccpcJLWBiCNB2hmL5VV2UV2EH0KtDqF65mhiPRmy
         OPlP85DiYC1VVAQxISrU1aFZu/YO5LxVObG1+E59pd3QhbAb2UDw8rxgEDp8bwtHIso6
         hqGPEiCpLU3NEKsxKIZfv2kYEUVp9oWVyDzHJUJASpyPfJ5AT3Pgpni64D5LWRaDzbuh
         QVVw==
X-Gm-Message-State: AOJu0YzFPY7pSTmhGdmomfpO23+7a7qGIEJGG0q5cxulXh1PmIPtZskT
	ewW+NReS2oB1cbYVpumlKdx9hWPle9xIfMZAQxMlWD/26oU6qmtZlIsyDdrA0KSdzYY9yPJgbpH
	JrB04
X-Gm-Gg: AZuq6aJy3Vk+SDtYawkvG2+dGXb0IM0SFn8WABiv024d9XNsdHaByyXcOnjRfd0eBJl
	u5/35YVjqhpzxg12jXCRGBBV51p7+uH9Fzdb1s71Zj4neghzEyd1xsnerhWOfXgHALP7Q/Jn7/t
	lqqGQgQRJ4BWgxVtmcYirhGYjcrLlb2jMCW0SfvzhDfrMLergmL9BvI1tjwqTagcxotM4dQ5e7g
	zF7Uzq09tSbVpc5TZ0+I8p9bX+rjfuX+paLZtK5TsVR2iJvhB5/ziYBcKkhyZcLgn/pxSmmlwV4
	Ol25DtGGJLZlp8R5lN/6FXG+ONd+e7vditTlDNTVHxNu2y/9MSLHc8bns+0n9Z4i/bsZRipJaFZ
	CalTm5pbAz6bi/+Wkcb3lFf7RPDCPe1CNNTLy8r+ut1YaSz6/oLpAFHqcGmg2JXvCq+i0DYm0+K
	/XG6HhoRBQtRjnkim/+rezvxDavYjLjZ1exj1i/Utproz4x32mZBnqw+dhpSSV6jhCZDy1UIIRK
	h5GmYDOQ20jVI0oY4Lio/fvDzCqRpc=
X-Received: by 2002:a05:6a00:22cb:b0:81a:ab38:d4e with SMTP id d2e1a72fcca58-81fe87c7fc9mr327462b3a.9.1768871878903;
        Mon, 19 Jan 2026 17:17:58 -0800 (PST)
Received: from zen.local (97-113-82-89.tukw.qwest.net. [97.113.82.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12784ffsm10158981b3a.40.2026.01.19.17.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:17:58 -0800 (PST)
From: Trent Piepho <trent.piepho@igorinstitute.com>
To: openembedded-core@lists.openembedded.org
Cc: Trent Piepho <trent.piepho@igorinstitute.com>
Subject: [PATCH] systemd-systemctl: Fix instance name parsing with escapes or periods
Date: Mon, 19 Jan 2026 17:17:45 -0800
Message-ID: <20260120011745.2474832-1-trent.piepho@igorinstitute.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 01:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229638

Fixes [YOCTO #16130]

When extracting the instance name from a template instances such as
'example@host.domain.com.service', the systemctl replacement script will
split the instance on the first period, producing an instance argument of
'host' and a template of 'example@.domain.com.service'.  This is incorrect,
as systemd will split on the last period, producing an instance argument of
'host.domain.com' and a template of 'example@.service'.

When constructing the template name, the script will also pass the string
as is to re.sub(), which will try to process any backslash escapes in the
string.  These are legal in systemd unit names and should be preserved.
They also are not valid Python escape sequences.  Use re.escape() to
preserve anything in the unit name that might be considered a regex
exscape.

Signed-off-by: Trent Piepho <trent.piepho@igorinstitute.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 2229bc7b6d..b9e04a9070 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -202,7 +202,8 @@ class SystemdUnit():
         try:
             for dependent in config.get('Install', prop):
                 # expand any %i to instance (ignoring escape sequence %%)
-                dependent = re.sub("([^%](%%)*)%i", "\\g<1>{}".format(instance), dependent)
+                if instance is not None:
+                    dependent = re.sub("([^%](%%)*)%i", "\\g<1>{}".format(re.escape(instance)), dependent)
                 wants = systemdir / "{}.{}".format(dependent, dirstem) / service
                 add_link(wants, target)
 
@@ -212,13 +213,13 @@ class SystemdUnit():
     def enable(self, units_enabled=[]):
         # if we're enabling an instance, first extract the actual instance
         # then figure out what the template unit is
-        template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.unit)
+        template = re.match(r"[^@]+@(?P<instance>.*)\.", self.unit)
         instance_unit_name = None
         if template:
             instance = template.group('instance')
             if instance != "":
                 instance_unit_name = self.unit
-            unit = re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
+            unit = re.sub(r"@{}\.".format(re.escape(instance)), "@.", self.unit, 1)
         else:
             instance = None
             unit = self.unit
-- 
2.47.0


