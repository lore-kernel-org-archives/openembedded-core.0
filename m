Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7C8C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:03 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.53154.1638136743137324060
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WLoGZgCN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso12272706pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vvLByr6uJYrFCvSL6/zI/RaDW0+le/Z8Ke2ot6MxH2c=;
        b=WLoGZgCNKNy1OdTZvv8Swm1wIlmuYWYMn4Vxpl/tG4taI8/wzBVJj6vvL7Pl0CaThL
         KoQoEq+zh9MWIZc5CdbFj2dJ5jFcZDMVFmnjvIvXjAHJJbrs8wR5UW7VTony0j3w+jYw
         NNGohpDx0CXDWYTDNOyewa0mtKRyiA/u4Nq0B5c1ZmLqKdats7iq4ykbjmzkKMxLfo0S
         2dh+lTPeM8RczEkmbY9AkkXz5TAjUjLfpEgGKx6g7rdKi/KttmFylN8Ga3qLsTw26wOW
         W37dwIgLTZZ1wPVj5DK3PEIxvvVLUG1XBpyv2Bj3ACYhhB3dbKvj0+O436szgJ+fX9WI
         0OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvLByr6uJYrFCvSL6/zI/RaDW0+le/Z8Ke2ot6MxH2c=;
        b=pncnjw2bqpOKwQPoEdKtvCz2RrKeTySFyfj6CPYtJH5c9KKMs8MnmpKr8nTxeq9/EK
         9aNJeUBbYQqYa1R1Kit6+xwiolUvFqxWJnGzi19xFPl4Ts32yf+e2igAc+RztsXFZiKP
         WW6Kras8X78aJDZ3VmABLyGxZGI4yhzRBLJuKQG2LObj3diTTErdNKKiQzKHxhpQzd1R
         jgO0n7XZUj2BljEFKlFiZE0YHnpm/YMLWVKY5JNS1r24IYieGjJeqJrw73T8fegNl751
         CgP/Z91umKI/H5NCx4zCnLdngOD3ZrY1w/YzRwZ+j6C4eHRdI6T81YqtpMy3nX9Cqb6P
         /ffQ==
X-Gm-Message-State: AOAM531hIk+t6p25/H2Yj/KtHmO4fPllOTP94Bq6hfwLxGXkK6JaUEFn
	I4Y5SUUjizGq05DgtWMRDxTR/jc5pB886NdxHOw=
X-Google-Smtp-Source: 
 ABdhPJyjvW6pi47Am12klzrZQTE1TlbxrARVHZwiZY8Fx0Ma5C4KmaDxMmPgKzf2mLtLhKDZJmrhjQ==
X-Received: by 2002:a17:90b:390f:: with SMTP id
 ob15mr34337599pjb.82.1638136742055;
        Sun, 28 Nov 2021 13:59:02 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/42] cups: Fix missing installation of cups sysv
 init scripts
Date: Sun, 28 Nov 2021 11:57:29 -1000
Message-Id: 
 <a4c8e2abb7d71697c8d0c53894e82bf2790ae5ac.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158899

From: Claus Stovgaard <clst@ambu.com>

The packageconfig needs to be --disable-systemd as documented in
configure file for cups. With the current value "--without-systemd" the
SYSTEM_DIR variable ends up being set to "no"

It is caused by the --without-* section in configure file resulting in
eval with_$ac_useropt=no ;;

$ac_useropt is "systemd" causing the variable $with_systemd to be set
to "no", because of below test

if test ${with_systemd+y}
then :
  withval=$with_systemd; SYSTEMD_DIR="$withval"
else $as_nop
  SYSTEMD_DIR=""
fi

cups configure test for i if SYSTEMD_DIR is empty to decide if the init
scripts need to be installed. A value of "no" results in that no init
scripts is installed.

With --disable-systemd it works as expected - installing the init files.
Though cups should properly improve their configure script.

Signed-off-by: Claus Stovgaard <clst@ambu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 967fdd2ba12f22d8e46600ff085833993a32cfeb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 151ef065fe..15f46937e1 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -41,7 +41,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi',
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[pam] = "--enable-pam --with-pam-module=unix, --disable-pam, libpam"
-PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--without-systemd,systemd"
+PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--disable-systemd,systemd"
 PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,xinetd"
 
 EXTRA_OECONF = " \
-- 
2.25.1


