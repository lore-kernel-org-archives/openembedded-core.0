Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917D9EB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:39 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.61512.1688484634619702453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5YMXlbUX;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a04cb10465so4016567b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484633; x=1691076633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzBAMLNg60PNzVxQEEqjEt8mwrs6+qt9fcv4Yn1FHEg=;
        b=5YMXlbUXC7V+ocGI/c2Q5bIOVS2de2hvb4r3Hgtjezg4Vqqf/W+Uy/9SB+uoH/a9kA
         tch+loPpKiIpCYt/V3QPtB/pc+qYHq1gDAQeyJY2GhKf1cX4BB5GuRnLMHSDt9G2kUbl
         eM2mea10F6VKChMco3vzDlhnpAKBvAcOUSdekr3yjfWHgmDEUga7Zmatr+sZE7l9Pgeg
         TBG31Vm454GRQ60YdIkxBMrErk+UUK9rXwCaAOnXrAXdC1xmVQHzSEiAJCpIcMRpE94W
         ydRkhOt85MoG5AFPVSryMa37AJnejPmsbyYNoqjVEsAWKAmaxkC0CJz53Pp8VZJjb1sM
         DuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484633; x=1691076633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzBAMLNg60PNzVxQEEqjEt8mwrs6+qt9fcv4Yn1FHEg=;
        b=BpYxdCK+QYpM4vxvte2/IhxImCLOOspQtAkT3hrhFK19B/VkScVpuP0uSI4H1SC0+h
         fP1VSlvTKVdZbOPkZZ/dC8C3p3kD1SqxjeP9tWFrlbw6d2IGYSyG/h/Isb3AUAjTXgmr
         LzUkCgRLwhQnY65E+OcLWvKk6YPSr/3ELKa7g0WU1c0/niP7Mb8dY0CGRASK+XJVIbz6
         jVWQknPgmGSp2JXNrNbFtRbPunU/d5wLwzyyzd6IEY+/Z6UDW7S+RipTqfOL4/db+NLx
         UPGZ7fJtmlnUZoKBn3Fkz2cweTkz6CyrDlGH8AZoOlintxPQLgP2BDNNjXdrdau599i/
         K/sQ==
X-Gm-Message-State: AC+VfDzkkIXfxjFmjreUVEQO4ZfkKWuZ3V3hZyIMnsSSrVoEc9l2iw8I
	PyUmOVrJh4cCw2ozwZcNXzFoCBrg0zwNOme76xW5NQ==
X-Google-Smtp-Source: ACHHUZ4KL58rkCcmQAL4CJqoj3Bzu29yvAicv+6utJsrOE64fUfDUWZbWxXLYzm2C48QgXUWWd0WGQ==
X-Received: by 2002:a05:6808:1390:b0:3a1:e12b:2f80 with SMTP id c16-20020a056808139000b003a1e12b2f80mr16665804oiw.35.1688484633538;
        Tue, 04 Jul 2023 08:30:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 27/30] ptest-runner: Ensure data writes don't race
Date: Tue,  4 Jul 2023 05:29:29 -1000
Message-Id: <d73b83da26722890dac8ac9bea19890927b9ea3b.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183862

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently the code can race as there is a read/write thread handling the stdio but
there is no guarantee that when the process exits, the thread has handled all the
data. This results in output where "END:" isn't actually at the end of the logs
but somewhere in the middle of the output.

Update to a revision with this fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6608ee551ed7e8864cdeabfb09832621313d3191)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 67dd887c24..9a9b8ec260 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "ea2a9cc159ad5f64ee75781d55101d7c340e0303"
+SRCREV = "a6c7dcda520402adb62a31b8b1c7686c5b8a4875"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.34.1


