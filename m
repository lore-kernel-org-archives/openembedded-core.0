Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8051EC4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:20 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.13208.1668953750517925500
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FDWHasd1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id y10so7238470plp.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOzMv6i0Sm1ZCtVj/6OwlXANLWfFabiZtiv0PE+AvGQ=;
        b=FDWHasd1OjW2AB3wLrAbPTw1UxbcbLzPyBkIfHnFH94TIpfT+SaOICVkTTvHresM1l
         k3wD7z6FG2wXaOTOugkNV/LJd8xyzI8D74OfZF5vpFKbcc6hxsn46d3IjUQKYI1nqPNC
         mcsZIuhT9eenK9zuV8BqWUYHESZ9rOjnEer0WBmraK2j1X+sZNpYae9IWW6c8c+YNLtR
         KfmeuHA9URmcSTaG+kyfNjfhzc3jrndx5hqyZau29THQwJVJnUhX3R27LumMOgyoqiUJ
         WaGRn8EDxA01m7KBZUOspZh2zMovOwFFZcWVWjHrwxyguE2QnKl0YugI0hUYr72hBGXW
         wHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOzMv6i0Sm1ZCtVj/6OwlXANLWfFabiZtiv0PE+AvGQ=;
        b=Z+TlWWwndO86YVH+lzPMU/TrUbuVdE7PXlYr8Yv04J3kVnF2cIVAjLNPsd8aZRQ00V
         BdmAjp+fzgFO6QmJLVQsCTGfjLgVKMGaPVwYyZ5F/qaOObftEV9YAscK6nq1F2qj45XT
         yoXJjjbeh0hbtzr95xNW6QtheNzJzyKOKjlAx9Ju2NSyddN5GUP24VqZw6oaDehjARX0
         Psinj+AbzQ1MBKIRRCD3xePm4iig6pF/M7of5CxrgqrStySxfc4mvccdZ9X6E5s4G5Bk
         KL3+NItJgOhv7Ur2GXD6vh2WHsOD2KXFsaGKh8oZp9RGDhqYNRWdK13NOY5S9nBfEtcm
         tf0w==
X-Gm-Message-State: ANoB5pmlyQYsutQRIgh45/MwmiKQnqq8V3TFLZ8fbxlCG8Htj2kqtEwL
	zJElKc1/7cY0kc1NuOLqsKVqGGVqHAvTwZSgxmI=
X-Google-Smtp-Source: AA0mqf7z0t7OF6pV2N5sFbWVCD2LMnoe9B8wJ+ahpCf937yRgLzVOq/H5nwYL6fU4CYYfo2wjkCjdA==
X-Received: by 2002:a17:903:300a:b0:188:f6c8:2ca9 with SMTP id o10-20020a170903300a00b00188f6c82ca9mr7752109pla.6.1668953770138;
        Sun, 20 Nov 2022 06:16:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/35] archiver: avoid using machine variable as it breaks multiconfig
Date: Sun, 20 Nov 2022 04:15:07 -1000
Message-Id: <8e65e5d9204cbc04587b7e90ff4ed8cd7bffdb65.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173618

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
index dca4271a69..4a5865d7b5 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -461,7 +461,7 @@ def is_work_shared(d):
     pn = d.getVar('PN')
     return pn.startswith('gcc-source') or \
         bb.data.inherits_class('kernel', d) or \
-        (bb.data.inherits_class('kernelsrc', d) and d.getVar('S') == d.getVar('STAGING_KERNEL_DIR'))
+        (bb.data.inherits_class('kernelsrc', d) and d.expand("${TMPDIR}/work-shared") in d.getVar('S'))
 
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
-- 
2.25.1


