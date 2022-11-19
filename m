Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3046DC4167B
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.30672.1668892565393655430
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CweJRdhr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id g10so7413378plo.11
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgliD9rIF+ZEH/06N/JwZ7CsnFTLuaUGy83vT4AWPCE=;
        b=CweJRdhrv/UFX/PEdrJ/W3tnHeqRJ/crwI0IXSKUfAgauHkw6SDrZson4JCvnIHeaV
         FBc/vpIxLFayRHSp4hJoH7DHEOoCd+j4nIkjPsNwQAMPwcrnBOgKX4jw2OoqVe//XTyG
         s/7g30CMZvP3IaiSfk0wz7FjjDpJsV/v9zztaphfdA3mOUxTcQSWdMaK6zvZdN/5IOZi
         HoVSu6pckd8uB7TeUFMLdnvJmGV9aZbmBE4toT8RUXW/97eobqlTgu9ncuVJF+NcR236
         Mn1+2cZw2z0Aj+q9Ur+zVQmnqAOk6w2P3xZzUGStlfI2Z16hbKJPXkUJLbFqyls62amr
         YO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgliD9rIF+ZEH/06N/JwZ7CsnFTLuaUGy83vT4AWPCE=;
        b=OXzW6JD/T/G4qt80fmXoKG6r3wjLoIkt22IDZRAmdpDRRaOrpBeYWSYwImdsrBhfV2
         +kwcU0A6A19nk5yiBEwgmPRu1A+vHZQ3iszlXjuw8lSDP5gkzfeTyph4k7TESH1kd+4q
         TENtst6UaBe9mQXDlvrjQGUWiwpUlmBKRjMEeZ7BjjV7RTkEwWhz3k4o26+Omkgd/rh/
         dR6rn18DDe1lKxrOH4NKImnYeuULawhHa9XUQXTWpmUsgpuCFpBwIbUhwSKOsdPJXELO
         IgYaezCl3PHkkIAGBPQlzVWU7oACu5oCVAAmYBWx0culvN/tXSUGfh6b4fVkITxquhuX
         s8/Q==
X-Gm-Message-State: ANoB5pnwDdmuhoPQ0SWRTDSmBQirvVzk/bSeZHJLIQAGY+jgaQ/WpFEu
	R6xQ5KOktrGr/sdw6c8vx+43D7wmjkmZs/FqOlo=
X-Google-Smtp-Source: AA0mqf7Brpi7Fo5dGICqwhIpzCXuc4rSfrWw4f7CvdLVp2mqFXlARAXIIcFvxQzjGBjCcPBsMFZYCw==
X-Received: by 2002:a17:90a:fe85:b0:214:132a:2b90 with SMTP id co5-20020a17090afe8500b00214132a2b90mr19740249pjb.195.1668892564364;
        Sat, 19 Nov 2022 13:16:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/35] archiver: avoid using machine variable as it breaks multiconfig
Date: Sat, 19 Nov 2022 11:15:01 -1000
Message-Id: <a71a5343838571e094ead68a42c757f0c43a41b1.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173562

From: Jose Quaresma <quaresma.jose@gmail.com>

STAGING_KERNEL_DIR uses the MACHINE name so it breaks the multiconfig
and in this cases it will run the shared recipes twice, one for each
machine.

STAGING_KERNEL_DIR it's been introduced in commit 5487dee2e1

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6050d1f74c02495490d982ead2993b6b3c9cc04a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 0710c1ec5e..4049694d85 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -465,7 +465,7 @@ def is_work_shared(d):
     pn = d.getVar('PN')
     return pn.startswith('gcc-source') or \
         bb.data.inherits_class('kernel', d) or \
-        (bb.data.inherits_class('kernelsrc', d) and d.getVar('S') == d.getVar('STAGING_KERNEL_DIR'))
+        (bb.data.inherits_class('kernelsrc', d) and d.expand("${TMPDIR}/work-shared") in d.getVar('S'))
 
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
-- 
2.25.1


