Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E440C109316A
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:38 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2627.1773966515994707289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H3Iiqpxc;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486b9675d36so10352275e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966514; x=1774571314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3jg9qRQJKqrFYwXUcwwjymeKCBaDCPPh1JmZqHQNfY=;
        b=H3IiqpxcikfBDDtA/fGA9iqGV2+/ykD6Y4+c21Gu50eXTazrCH470CnyPbaSYujNV3
         VXexJrtjRUuBin6aKxW/x56lrFYUliazedbaOtQhsubg1ClWnrVreprspxHuTbJxct34
         41RdIumP2E+9JGUNh2qK/hsKF3qNUKqPsG2rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966514; x=1774571314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3jg9qRQJKqrFYwXUcwwjymeKCBaDCPPh1JmZqHQNfY=;
        b=Ollexy9pEjldWQvZcGCEjk1329ppWVd9+1nxU6FkNVFU/XzTbofkW+u/Qrdmj2GkRh
         GoDrwcPJNcnuqYEWBunQtkL5Ck7354DpWo1DgWx/3WiQY3ieevFf+EmK/NGWvEt0S3Ef
         Lf1ZOrJwtmsW5npgOjrLHqco1Nubrgzx2U3YHCDdC1s8on94HONNKolr6vUanDXZUWHh
         HrX0uG9hOY2Gd7YxIVxPFHT2wLUAGNu5Pzen8PUXP/eJOZhlQ8rvkGdgEMT6M5PziyZj
         bAoE0cgNvzY+gWnlgTNwHTV8TsVym7r0cyYYgPh/G86RcdtwQTcUZezjMgT8l7HY5jk3
         6b1g==
X-Gm-Message-State: AOJu0YySy6o7TRGoOZbY5ycAVghELnATOKGqZxv/e2aVgb90UuYf9JJd
	j6HAifCZboItooqKzH44h/avGBAlfG21SBNRC0MwjTJvBiQtiv4T3J6yGTB3nNvQLFdUKgym2Y6
	dkoT8
X-Gm-Gg: ATEYQzywHIqsIpHSe9HhC/LE/LDcFG1kRWrFVkqPHmAnFOvvEyKFDzFcQjY00wWHLsV
	Q/FkpWyBFl5NWPfH+SEfWAJSOZEj4Xa2DQw334JM/wPHHSYjNlsOF13phejzhffK7cvs01uxPmt
	AstLqZLEZ/SS0VM0/VUyS8zA90Zai6G/eSSvNm5x5F7xpsuEBFtR0gA8M0l8kty5y0aOeaQyc+V
	q8cQ+oUROhF8SfuzJpgK9jtc6rZ33jCVUdlLeSMkJqZa4arGVzafxIZjTpPSzzL/5GsASTp2HLc
	EygUHOJd3OoPiivb2WhLILkFi2niikkZK/CkSB0IDvttmOrHIYSJ3OnXIU/uLmR8i/Ybj+YuKIB
	hEGSYvoiyMl88aIlAmrjFH8/2UA/ztQwoj10R0SRNIPMRefsT6BqqszGBQkbOrziTiIOKy/niUX
	gOiztT0dTMhznElaiJ97mGJm+BtjwuJ97iKbhD/9wD3jfcctUqu6zlXxS+kAQaInG6MrpYJipxM
	quMAYMaD8ps0/hG76BWk7Piy8E=
X-Received: by 2002:a05:600c:1f86:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-486fedb551dmr15621015e9.10.1773966514029;
        Thu, 19 Mar 2026 17:28:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/15] systemd-systemctl: Fix instance name parsing with escapes or periods
Date: Fri, 20 Mar 2026 01:28:19 +0100
Message-ID: <e84c18db267cfdd5e29a6ac7f7e44ef644b366ed.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233573

From: Trent Piepho <trent.piepho@igorinstitute.com>

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 2229bc7b6d2..b9e04a90707 100755
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

