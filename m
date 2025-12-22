Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53054E69182
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:05 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87781.1766434083812867063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gs+QhSiY;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b7a38f07eso5291683a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434082; x=1767038882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuWPYoHd3y2cyRF/RfYZJe/elz8UoeqP2G9N4ppjxTk=;
        b=gs+QhSiYNHP2d7EfJALdF1MmBMxKEFFZ8OpH7bvhKhvFS6Zpsk4VSiveiLw581Cenq
         CrkLlwggmPg5uStpeNf5la3tdMBb8Ih0qo+/T5vKqEydowSWEYMcC8HbN1hzkOYtKHKb
         ofnR3Ky0L+CPmjysrpwwMdlQG12EIvVSYAtYyjBXba3KCPzQ9Tq8lMGUGGN+VNQFIt32
         Wf50pb8CjsNjzIHPSnK51SzUv45CQWYOon4cISOmDeVhqkEdkDcNQCdfjAbAdc0ypuu0
         56EXTqwYjGv1CDZaTF14RXKSLAW3i7C5Qw1bcf6kL3QT4LYPAr6wa7jRaBY3jV4eyX6z
         9KXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434082; x=1767038882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OuWPYoHd3y2cyRF/RfYZJe/elz8UoeqP2G9N4ppjxTk=;
        b=O8P7A3N4DYEyTA9zkvSHqBHXISsUPIHTIU6dF8kv0e9j7fS+Y8elJZWga1bgier157
         /BlUSaX1Broj1iYlwIRCscsxBeYK6nsNPIyLIArQcbawJA/81T63ZEHlGom5z6XoBMbV
         O9zvHXEEA7Ah3QLwHBzUhbhCj7rzM5/7i/IL04sjPCzNMtg3X902oxlAgvwcLE2DvszS
         ZfHaXj2zV8smsqpft+yA9FOFXp/uttwj7M0p8gEItMQm9xu9RsuJpbN8Oq26Q/og7w6U
         0GSI7WuohGzU+vEwi7KYJ3xZig+igAGzGwg5PmzW+FVSu8b5FVsxogySqkbpfWrP5eKs
         S59A==
X-Gm-Message-State: AOJu0Yy6GneyK8ZyEmxWSl0gfk2GWewV7RP4uupcXSk5gVwv2Wep5dVU
	k52l3oHaie9bUtRtn/6iYv2uzvU9t2DscVZySv9JOwwHquQpsC0JOF/Z9QuJNQ==
X-Gm-Gg: AY/fxX5rqTlkQCHQ8dc8Fm2IcZw6g74D7qLiWAIBA5g5J1em9S4bP7AgOzfa/Q9Wr+Z
	WxxsreDfmprc5XfFK8rx1SimdRYLzOkYpqC3Y+E3GLdJ4f25dBX1+4/6yYefY+hYJSpLvaRz+7t
	+guZ8vVwDj68vHD639rCYnNnSSFY2Uc9dUeoD+Cm63xmAqG52Fc16a8urvkIp82RlrglrKhg44J
	1XSOK2h4L3fS75bWJM4aotkNhjW/03ujnrvEeErQrf9XRJhwTEhpwYJMm8+hYhGSh3Ykisxwj/R
	DjHc0xoXCHRGA+xvCSyD7SpimrV+7w3AGogcH0MH94GTt6TebM6hOCUtqkh1O8n0uSyjzrk0jcn
	JYKxypq2X1FTTfklw0ds6shmEWfRf/OqFe+x3xhc8OB74lD6BT3szKwDM0A/XlWiQoTYJY0eL/r
	9iSnA1S2YokrIQX1/k/NelasVHOxQl9+/PDVTCevLroMKcpIo=
X-Google-Smtp-Source: AGHT+IF3rTcPesWUuQ06ebiJmIFG/amcGQnWjYcWpRGkazEkm7DO/MyjbgzY8pxALaXZVgUC+OCblg==
X-Received: by 2002:a17:906:f58f:b0:b80:50b:6c8f with SMTP id a640c23a62f3a-b8036f5ac89mr1420663666b.27.1766434082106;
        Mon, 22 Dec 2025 12:08:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 022/114] inetutils: upgrade 2.6 -> 2.7
Date: Mon, 22 Dec 2025 21:06:04 +0100
Message-ID: <20251222200739.2278706-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228347

From: Alexander Kanavin <alex@linutronix.de>

License-Update: formatting, http->https

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../inetutils/{inetutils_2.6.bb => inetutils_2.7.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/inetutils/{inetutils_2.6.bb => inetutils_2.7.bb} (97%)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
similarity index 97%
rename from meta/recipes-connectivity/inetutils/inetutils_2.6.bb
rename to meta/recipes-connectivity/inetutils/inetutils_2.7.bb
index 9dcd494694..6cffade97f 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
@@ -9,10 +9,10 @@ DEPENDS = "ncurses netbase readline virtual/crypt"
 
 LICENSE = "GPL-3.0-only"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI[sha256sum] = "68bedbfeaf73f7d86be2a7d99bcfbd4093d829f52770893919ae174c0b2357ca"
-SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
+SRC_URI[sha256sum] = "a156be1cde3c5c0ffefc262180d9369a60484087907aa554c62787d2f40ec086"
+SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://rexec.xinetd.inetutils \
            file://rlogin.xinetd.inetutils \
            file://rsh.xinetd.inetutils \
-- 
2.47.3


