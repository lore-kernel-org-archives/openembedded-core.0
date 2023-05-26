Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E11C7EE32
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:30:01 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.112.1685068192901850013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rnKCWk4X;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-528cdc9576cso159531a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068192; x=1687660192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wpim3eOEUGnzdi1RPm+k6td6BedGmHR8k6Z/+nASxe8=;
        b=rnKCWk4X6tT08gs8JrnlpByNj+RI9tbHsy8FseZ0birPz83sKl97PKmdqYkVpFveM+
         Bfl9bqW2o6I5PCwWnH+Yvq+LcM3UDXTKKtuOSco9LbdetqTCuMfOrEB3JlE22ZAct3GP
         zoA/DHIR6ScnhLck8Yu8pe3HMVVFzC0QipNfeREc0xQaBjkoJdcCF9wTKFuBt5iOilZ0
         p1R09I8AtykCBwTxoRuRsKCv3pRabMOy1MOPw/VqxluBuD5if2+3F8whUrnzZXUEICRk
         d5rd088+u4bXJ3N8EuHnUL1c5YWnWqvcUrPPCd97uWV9sU1BKj7SXJnR8fdpLzhqdg3M
         0owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068192; x=1687660192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wpim3eOEUGnzdi1RPm+k6td6BedGmHR8k6Z/+nASxe8=;
        b=irq9ctiAQ/em8gPhHMeY9n4bw7omCreAKvWGnKylE4FW10Bnd65J8vIO+ILEaxwKE5
         Jabsi0N+lmNMXUosbqyv5s6+jTH18CEZrDqvQANJpZ84jStk+R2mPuwFX0IjdV1vX+LZ
         CxjCJHfLKqakdaBJi1CC5wR5ZPbffLrYgg43iQN2WcfuJRDISzRH15DfLrjaf4Z8gEmI
         KEm95qsw2WVx5Si2BmV9r9+SCKlg3LNH5QKwGT+/HHH3zPakVQcQ+rCwC3zt59u/fLKt
         dbSRgXOlFT8AWH0+rY0xZMTtFXS6l2QYxvybzDtI+4DHYYIAP5hKCCEd73xlxUJ5DGg9
         wIxw==
X-Gm-Message-State: AC+VfDz1i/uXMbZeabSAW0wjSSVZ6mI3jlLUAzvfBbWgPULUCE9U1n2L
	JNJsaTHLxExUWUkC7VcJkh+cv+hHG3oeEyhVVQA=
X-Google-Smtp-Source: ACHHUZ7y/DB5BO/iqOtVw/1UxbZ/G6ffP147XKPet63IIOLVhnXyTtgO3PmkYIeKk3cs/HfqBw70xA==
X-Received: by 2002:a17:902:e541:b0:1af:cbb1:837 with SMTP id n1-20020a170902e54100b001afcbb10837mr1035776plf.65.1685068192097;
        Thu, 25 May 2023 19:29:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/21] license.bbclass: Include LICENSE in the output when it fails to parse
Date: Thu, 25 May 2023 16:29:05 -1000
Message-Id: <1dd008511cc62bd32f85b529f8d6031bd57e4cd2.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181749

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a5197760da3890cc80ac7da8d589766612d9051)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 4ebfc4fb92..b92838c030 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -223,7 +223,7 @@ def find_license_files(d):
         bb.fatal('%s: %s' % (d.getVar('PF'), exc))
     except SyntaxError:
         oe.qa.handle_error("license-syntax",
-            "%s: Failed to parse it's LICENSE field." % (d.getVar('PF')), d)
+            "%s: Failed to parse LICENSE: %s" % (d.getVar('PF'), d.getVar('LICENSE')), d)
     # Add files from LIC_FILES_CHKSUM to list of license files
     lic_chksum_paths = defaultdict(OrderedDict)
     for path, data in sorted(lic_chksums.items()):
-- 
2.34.1


