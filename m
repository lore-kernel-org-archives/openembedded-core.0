Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DC4E7F13B
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:43:49 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.3621.1695764620302330132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nH+iuUg8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-564b6276941so6954633a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695764619; x=1696369419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJIatVraj87M3QBcTLAliUjGTeKSZowNJfYQJHkQKYo=;
        b=nH+iuUg8v7sWCMTft8yaxdDYbShpxas5hILQZGYGgISKo/zcFbm8k5VsG8SWuxZfZf
         Hw1/gRuNdvfdjyoK5/pT843qZw2gX4lxWgkOkmvEoZGfqPOwYeCWZS6Dcxv16vqMiZa4
         gmwmYg0wojlQYxYiTH/CfYn0Qmffbx9zYUl87E9Y1OIsQTznOvMzrt8WnVQtiDkGi82i
         dvFS+V5BUwgz7hwyPkv1iw0GoaIquVZrZOY8EvbwdnS69PeuU1Qsgb+/9xJD4Rz7EG+n
         Aa1aMUmtRNEQPxWFzwl65sSZRCKHZq181nJtKyWh0GkFHCEDHaZ+rJscE/I5THynfxTn
         10UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764619; x=1696369419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJIatVraj87M3QBcTLAliUjGTeKSZowNJfYQJHkQKYo=;
        b=unN+vLHKjn+QPczhxa38hcXT7Bn5ui1G+HD1qMOccvBE6Qq5IUjphGKG4SeBfNt7Ba
         fAL8tYOKwi34CoGEjrT5gKSXfSzK4xV7XCXFEGhDNVfnF0eGjk5uCGRgmjJoL8w3/yOx
         1Byq2PFLNUFlO4LHU7lA4/xnDsUCsWpHnTaIgfqP5HuELmU1uRyKMY04w/yR2pY/fP6k
         yQuVRF4uK2k+zabqB+K1sb/eIClcOyO9nCT/3qcNmvIlwQWMIoQHORp692gef8dcX8g0
         MD4qqknpELXU9HaC896JBCDqXoKwHHPkucOPgKycONbAs5/nWgZdxvrHILEVb6LblqJr
         lEgw==
X-Gm-Message-State: AOJu0YxoWGsmTFFnEerviJjF9H83bCKzgWb/M6LnT6OaDfPdg82bkwyP
	z8Jr9m4IteF8BZIGaOFrRLrDKoCx/RbCg0xo87k=
X-Google-Smtp-Source: AGHT+IFFav0oFWNGxz8p2SH6bKR1lRYfskeR1Ta3cgGNZY6bRCWLbw4BKctZxWYbV2OsAtQTFfpW6g==
X-Received: by 2002:a05:6a20:1451:b0:153:63b9:8bf9 with SMTP id a17-20020a056a20145100b0015363b98bf9mr204238pzi.0.1695764619411;
        Tue, 26 Sep 2023 14:43:39 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b5247cac3dsm11487713pli.110.2023.09.26.14.43.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:43:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/10] multilib.conf: explicitly make MULTILIB_VARIANTS vardeps on MULTILIBS
Date: Tue, 26 Sep 2023 11:43:17 -1000
Message-Id: <8ed254dd5e44d0685e5b952f724af08d75ce3d9d.1695764457.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695764457.git.steve@sakoman.com>
References: <cover.1695764457.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188276

From: Chen Qi <Qi.Chen@windriver.com>

This patch is to ensure recipes get rebuilt correctly and avoid
incorrect sstate cache reuse when toggling multilib.

The following steps show one example of such incorrect sstate cache reuse.
1. enable multilib && bitbake <some_image> -c populate_sdk
2. disable multilib && bitbake <some_image> -c populate_sdk

The error message is as below:
Error:
 Problem: conflicting requests
   - nothing provides binutils-cross-canadian-i686 needed by packagegroup-cross-canadian-intel-x86-64-1.0-r0.x86_64_nativesdk
   - nothing provides gcc-cross-canadian-i686 needed by packagegroup-cross-canadian-intel-x86-64-1.0-r0.x86_64_nativesdk
   - nothing provides gdb-cross-canadian-i686 needed by packagegroup-cross-canadian-intel-x86-64-1.0-r0.x86_64_nativesdk
 (try to add '--skip-broken' to skip uninstallable packages)

We get this error because packagegroup-cross-canadian recipe is
not rebuilt when it should be.

Current codes have tracked the dependency to MULTILIB_VARIANTS, as
shown in the following chain:
RDEPENDS:packagegroup-cross-canadian-intel-x86-64 ->
all_multilib_tune_values -> MULTILIB_VARIANTS.

However, MULTILIB_VARIANTS cannot automatically depend on MULTILIBS.
See some results from 'bitbake-dumpsigs' below:
List of dependencies for variable MULTILIB_VARIANTS is ['extend_variants']
Variable MULTILIB_VARIANTS value is ${@extend_variants(d,'MULTILIBS','multilib')}

It's obvious that the value of MULTILIB_VARIANTS depend on the
value of MULTILIBS, so let's set this dependency manually.

(From OE-Core rev: 9f47d8eb51816d16078a23c0cef4d697555f913f)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/multilib.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 7f3b9463ef..ef3605a73d 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -2,6 +2,7 @@
 baselib = "${@d.getVar('BASE_LIB:tune-' + (d.getVar('DEFAULTTUNE') or 'INVALID')) or d.getVar('BASELIB')}"
 
 MULTILIB_VARIANTS = "${@extend_variants(d,'MULTILIBS','multilib')}"
+MULTILIB_VARIANTS[vardeps] += "MULTILIBS"
 MULTILIB_SAVE_VARNAME = "DEFAULTTUNE TARGET_ARCH TARGET_SYS TARGET_VENDOR"
 
 MULTILIBS ??= "multilib:lib32"
-- 
2.34.1


