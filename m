Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5193C00528
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.78402.1690740097180281774
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EedfCFcc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-686c06b806cso2618529b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740096; x=1691344896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRTkbdpO3b3K+GftmcMuKo7VDKdEHvAPlY2iymvfLh8=;
        b=EedfCFccPhZeLMLH/VnsXjeGiK7L2rJr47g3Ho3v1DWapZNNKgEmBzYyMFFqAQZf3l
         6l9U7S+v/vMwrFBDVGfTN98IsgjdPY7ENvFYm8JgrNZZzHm5KkolV209lmMX1LjDVZL7
         /jvMS8ZLf4RweRLqZ2g6dgBTGyGeOw/Rp7o7N1OiU6zlLFvRYBEFgMmRS1adMuH2gGY9
         9sQUvCI1gNuTaPhZtR5bg/V+YpZiHVoXTyPRjIQbjRklGVDuB7ngy3UTf+PFgdBoPEA9
         m+k7dG2Os4KTox4jtSoNCJJlTM/7DiSsHZhJ6gllyw3OUClD3dyLLID8KHlzeks1rMBy
         XS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740096; x=1691344896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRTkbdpO3b3K+GftmcMuKo7VDKdEHvAPlY2iymvfLh8=;
        b=Co4QOB3Zkg1u6VH+iufl5tCyhA6SDtiqIIiboYsrykaShdSvaii9FJm70RcBYJBA17
         w8HvujfqRL9h92jPmEypjtnIV7nPkvpKYLN+xWPLKtOWiwTLcHqBA1vpqLACAOkJvm5B
         GL7a+Fz7UhiKE15YXmRGpycs3wz14pD+Ipow/CRQREYnnht9k9YSL3HtBtV5rmLZNVNB
         Zj1BYopA7JmgSFRvodLyao2wA1ZGuxNH2znnyK5PctHr9t1brr0HGAavTKpS+Uhxd7lP
         qr/geCgL+7EFO6kXybzmNqRBD6/KlKWThOIlZOxphAcEj2jnTrzHJhNB7gtkOTTQp4Sd
         qtfQ==
X-Gm-Message-State: ABy/qLYzU8+I0yhGjX+MCkUaX2xN7fo7w3HTz8SF0Ko8gTAap8yatAlA
	B9+9xlDO8p8PdLJ2qCtT0HQc8GW68K8rpUy+0T4eTQ==
X-Google-Smtp-Source: APBJJlGebQed9ZIaFfqBwZMUUDM6qgqRDiZ+SG4YlLPqePE3soaQ9C1GuuBzIXuyHkJ3p5m1bRENww==
X-Received: by 2002:a05:6a21:71c1:b0:13d:2f80:cf1c with SMTP id ay1-20020a056a2171c100b0013d2f80cf1cmr4418327pzc.17.1690740096327;
        Sun, 30 Jul 2023 11:01:36 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/30] mdadm: fix util-linux ptest dependency
Date: Sun, 30 Jul 2023 08:00:43 -1000
Message-Id: <d2c0f1b17288bbc99c2e75f75fae0dd05d479b03.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185098

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Trying to run mdadm-ptest in a core-image-minimal build will result in:
root@qemux86-64:~# ptest-runner mdadm
START: ptest-runner
BEGIN: /usr/lib/mdadm/ptest
which: no lsblk in (/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin)
lsblk command not found!
DURATION: 0
END: /usr/lib/mdadm/ptest
2023-06-28T10:14
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Remove util-linux from RRECOMMENDS and only add util-linux-lsblk and
util-linux-losetup to RDEPENDS.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3004f7589974c135cc82630d980ea281b97ecd83)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 4aa3737562..af486e6d9c 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -99,10 +99,9 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs"
+RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
-    util-linux \
     kernel-module-loop \
     kernel-module-linear \
     kernel-module-raid0 \
-- 
2.34.1


