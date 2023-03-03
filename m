Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2650BC64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:57 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.27558.1677860270170731301
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fObyWKu2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so6623247pjg.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjWmTW+ZrvJ0bjyT3AY+pGSOO38N3bJuo8/0dXAXyUE=;
        b=fObyWKu2HDp2XZMFqozPtt3W9OUd/Y1v3r1wPH2EGgZEGSZtweR8ZqcjGIHpH9FFv4
         dduqXjc3S8/H1Q05Ldr8qYYNqiGUpNZod696Fx/FhPJN9E3Tge9brOVwviMxgog+JRTK
         eDQXrC3Vu2YLLEzYKpv1xV7MJw5ZLuyr1lReZSjO3qwqwithfRl0dLs/66Mgblehntsk
         xAhO5S1oHJRaP5mGMu0LoiUA2aBQMpuI/bKHyiNaYCyTEXu42jeZRXxWqwoOWX0HGI6W
         AAPicyEn7trEDM8pg1T9JpsIPE0A6oBl+trcCbpdbj1ZU5FwY86X1jiS+wIV1m75TZfg
         cuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjWmTW+ZrvJ0bjyT3AY+pGSOO38N3bJuo8/0dXAXyUE=;
        b=Wu7tJGd8Xz5hK4Xs9dj86J8Ul7360eEfMRe72HqJ2Co1JNoF0nejniAIwhvY7rMIP7
         nwbaFUTA1kyktzKFjd7xY7q9TmXbjOcWeLbFUVsDxdO0pZSmpRIm/QCnSspZNOltifp3
         xOiTF5AdzkksjHGOFZ28t+6jLWD6bQxrkyc/PB5U3+dXXHLFKSti2CKy1KKV1y03+BuJ
         631CY94j+mG9sBpahRD9ycG27IsN1tvzvIaYvRmoWX3YmBmX3cdR5JLATXGiecmt1MKs
         /O3XBEeC9wx6uqEy9XaEVGxBsA5i+B+qc0Ulcr9ERCwiMV83xm3bosfYMYKyrWgkGoiM
         D7kw==
X-Gm-Message-State: AO0yUKVyLPfHBwk4ZuVybAiywwKki1X9YoSAuCNzpQhdzj9tL51nAkeG
	dlp2hu3DSocQ0aN41FaOB5HJFgicsot+2T9ggVY=
X-Google-Smtp-Source: AK7set+x0cCqMu8PG0g8dsVjzZ+gQAjLxSpF0FfBmWmHYlAg5cNrqCZl65kcP3cIgqR+Nz/SUbetOw==
X-Received: by 2002:a17:902:7007:b0:19d:47b:67c8 with SMTP id y7-20020a170902700700b0019d047b67c8mr1969750plk.48.1677860269174;
        Fri, 03 Mar 2023 08:17:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/29] dbus: upgrade 1.14.4 -> 1.14.6
Date: Fri,  3 Mar 2023 06:17:08 -1000
Message-Id: <0623230fcdc02492c0a67506530b25438cf75c79.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177999

From: Alexander Kanavin <alex.kanavin@gmail.com>

Denial of service fixes:

• Fix an incorrect assertion that could be used to crash dbus-daemon or
  other users of DBusServer prior to authentication, if libdbus was compiled
  with assertions enabled.
  We recommend that production builds of dbus, for example in OS distributions,
  should be compiled with checks but without assertions.
  (dbus#421, Ralf Habacker; thanks to Evgeny Vereshchagin)

Other fixes:

• When connected to a dbus-broker, stop dbus-monitor from incorrectly
  replying to Peer method calls that were sent to the dbus-broker with
  a NULL destination (dbus#301, Kai A. Hiller)

• Fix out-of-bounds varargs read in the dbus-daemon's config-parser.
  This is not attacker-triggerable and appears to be harmless in practice,
  but is technically undefined behaviour and is detected as such by
  AddressSanitizer. (dbus!357, Evgeny Vereshchagin)

• Avoid a data race in multi-threaded use of DBusCounter
  (dbus#426, Ralf Habacker)

• Fix a crash with some glibc versions when non-auditable SELinux events
  are logged (dbus!386, Jeremi Piotrowski)

• If dbus_message_demarshal() runs out of memory while validating a message,
  report it as NoMemory rather than InvalidArgs (dbus#420, Simon McVittie)

• Use C11 _Alignof if available, for better standards-compliance
  (dbus!389, Khem Raj)

• Stop including an outdated copy of pkg.m4 in the git tree
  (dbus!365, Simon McVittie)

• Documentation:
  · Consistently use Gitlab bug reporting URL (dbus!372, Marco Trevisan)

• Tests fixes:
  · Fix the test-apparmor-activation test after dbus#416
    (dbus!380, Dave Jones)

Internal changes:

• Fix CI builds with recent git versions (dbus#447, Simon McVittie)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 31245df3061c1a913bffe5e11ad6ac7fa9c83915)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 83e9bd1507fd5f79c680dde30b0f66df84cde6b0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/{dbus_1.14.4.bb => dbus_1.14.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus_1.14.4.bb => dbus_1.14.6.bb} (98%)

diff --git a/meta/recipes-core/dbus/dbus_1.14.4.bb b/meta/recipes-core/dbus/dbus_1.14.6.bb
similarity index 98%
rename from meta/recipes-core/dbus/dbus_1.14.4.bb
rename to meta/recipes-core/dbus/dbus_1.14.6.bb
index 85db58e214..cc81047cef 100644
--- a/meta/recipes-core/dbus/dbus_1.14.4.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.6.bb
@@ -14,9 +14,9 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
            file://tmpdir.patch \
            file://dbus-1.init \
-"
+           "
 
-SRC_URI[sha256sum] = "7c0f9b8e5ec0ff2479383e62c0084a3a29af99edf1514e9f659b81b30d4e353e"
+SRC_URI[sha256sum] = "fd2bdf1bb89dc365a46531bff631536f22b0d1c6d5ce2c5c5e59b55265b3d66b"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.34.1


