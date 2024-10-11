Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E941D0EE2A
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 19:43:02 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.21042.1728675774627366634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 12:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=adiZAqgn;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e053cf1f3so2196178b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 12:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728675774; x=1729280574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQyi9+NUVchCk1Fk8hhSz5bQU1v8QVBtd8u4lvDLvMA=;
        b=adiZAqgnKP55cLIRArMcrKpuVHuAAzFM1FJCzw2nqCY0+EeVeFUoxY0KJH/t6sSt6U
         mlnVbC91WHGKVnYWpE1FhHG7CySnS4e9z6N5W/ogC086OHRuaPolbG8HwUUtXI1e4Jgs
         LRSkPeuhJzKZTCoPs9vNlMDd9VPb7aJBL/LGky+aLSkhhaxeMrHTXyz2wLz8N/G5PFT+
         YWWJfGUYzyjjSBYyp1I46Lgm02A6AK/GvL8bUU0T3aj8KH4wjQBdLNNJSmStZjCZ9U78
         iY4Yl63iTi/BiYK49Bu5qJ7RiTLGBZsiNr1uyb29K8+EQopLmxGr6v/tTke5ETYYANGH
         AyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675774; x=1729280574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQyi9+NUVchCk1Fk8hhSz5bQU1v8QVBtd8u4lvDLvMA=;
        b=PP9dnFyRi6VeERK1HCeJA7VgWsXDcRO1eV1i7sEvqXftpkDGuYq3vF3xCUipYifklx
         /uecSuQ6tAaPnS0Emijw56YBEm53u1keTiVDHXoCZ2r/t0CX3oeFeHW5Ox1kjXxlWhNX
         srsjjrHDjx1eR821tlxQ4dR9/6SmNccTZy4QYVKr8Pfyi5Aogjnu53JLZzYy4rIQDKHy
         DrTO5PqwSEj/PmZHR2MZCyGf/Esrj2JW87Bcmqh7BqvhYvsroQoJZpPpEvXJkk7TW60b
         nmhaH3rG92jAPJJH9V5e+HmrP0IcjGauJ6zVbgwNsQ4PrJVOxYm4XoUAa6QuHMv9YYOJ
         mXYw==
X-Gm-Message-State: AOJu0YyvPtL+CpoqXT7wKkixpGcPq9ZdwPw3uHWz/PeYo4XkvdV49WOg
	ho9hO8qQeJZvj4NVh2/2rOi4bcu5bkxZDABczWnZk41a4WNFOAbFszxiv0dL
X-Google-Smtp-Source: AGHT+IFfgXU6GztuOj0XrGMvcFWrGKZX+7UgP0dPqxJ5ALi03vAINuIurj2GtRt9ZtEQClt4leGjgw==
X-Received: by 2002:a05:6a00:2e18:b0:71e:316:8623 with SMTP id d2e1a72fcca58-71e37e4a7dbmr6654725b3a.10.1728675773705;
        Fri, 11 Oct 2024 12:42:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f083])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9f5246sm2955589b3a.49.2024.10.11.12.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:42:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jean-Michel Papy <jean-michel.papy@exail.com>,
	=?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH v2] openssh: Be more restrictive on private key file permissions
Date: Fri, 11 Oct 2024 12:42:51 -0700
Message-ID: <20241011194251.1053651-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 19:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205697

Sometimes default permissions on filesystems can be more permissive
e.g. 0644, this can make the private key file created here to inherit
those permissions and these permissions can then cause ssh server to
not allow ssh connections due to non-secure permissions on file.

Reported-by: Jean-Michel Papy <jean-michel.papy@exail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jörg Sommer <joerg.sommer@navimatix.de>
---
v2: Remove o and g permissions only

 meta/recipes-connectivity/openssh/openssh/sshd_check_keys | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
index 606d1894b55..bbb6a149088 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
@@ -8,7 +8,7 @@ generate_key() {
     mkdir -p "$DIR"
     rm -f ${FILE}.tmp
     ssh-keygen -q -f "${FILE}.tmp" -N '' -t $TYPE
-
+    chmod go-rwx "$FILE.tmp"
     # Atomically rename file public key
     mv -f "${FILE}.tmp.pub" "${FILE}.pub"
 

