Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102DCC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:13:47 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.8463.1646748826205596075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=S75c5J30;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id p8so17430724pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C6BuYMnXmdaZBwVvERSl/PB1l82kH6j2CxyopF+uHbY=;
        b=S75c5J30ynlYa+JGHBVlLITyiFa3g/KXIRrceXecKbamqMjdaaIh2Zy02guUOFNmce
         wtz493N+ezaq2KBj22U0Nsf2KfCsyj3iQYcdEwEWLhODBk19VlWedVVQodkM7srQKf1S
         rGYfXyfJi+shZ8sdWaGNUkdgF0W7dYHPKk/jiSgw62xHYHebxZCSRKmLKitYX7bYdc9J
         f8bPy3SbdTDCJFVCZFbtgzU+Sz/xVZWxA1dvRvK1Ca0oo34zbIwVjaF35FYvWZf9WsG8
         tYpJGX+YedhA3Za6xSfhqoYFhwBURRnAo/HxUv8cuXCmc72T0oBqRhDg27U50EOPKDNG
         HQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C6BuYMnXmdaZBwVvERSl/PB1l82kH6j2CxyopF+uHbY=;
        b=1ydGMVBWNJ6D1UWAZERx9OCeANGBeyZ4YzAQ1KHMrYqIZjbxdR8XsbUWk34eZvWHS/
         5MnjsfqqjsE8lvl+7wISHOGBe0QheLogph1tIkeNd1kf65fDZGzZbelM8o+i9lqi+gwa
         nje0VpM1C9VcScWgHLeU/onlHDn1Ky+AORbHQH4/yFKmqZ56TVSEqoOJIMQnc8RkMGBw
         XsdplO8qYG+Ha9lMz94O8BdzO7/Ja4DpjKWloi9L/OttthHpit44zKa6zfbVrmWrYiiP
         Gfdh1m9mZs8uUHHcRfEVNZtDK7Aigr+RwjMSMpDy3g03iJusl5+rBpnZ/lUd/qIYfEZY
         +pXg==
X-Gm-Message-State: AOAM53105DtryAyDpkYJmP2OUaVsiZeWE8DstMps3YuqrDDrT57kR1xj
	cyHsqoz5q/XfJ9RNZmeV4me5DWkigdGACbd2H60=
X-Google-Smtp-Source: 
 ABdhPJxjFGKG36QRlkSiU/CF0Oyv5C7u3JxKv2MRGluBbPDWd0imfOcrpO19IdR5rEE2gC5zkQ0rbg==
X-Received: by 2002:a63:864a:0:b0:375:7999:e83c with SMTP id
 x71-20020a63864a000000b003757999e83cmr14408362pgd.144.1646748824812;
        Tue, 08 Mar 2022 06:13:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e21-20020a635455000000b00372badd9063sm15160884pgm.11.2022.03.08.06.13.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 06:13:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/3] Patch review
Date: Tue,  8 Mar 2022 04:13:29 -1000
Message-Id: <cover.1646748150.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:13:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162903

Please review this set of patches for dunfell and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3335

The following changes since commit 51844f2d60d77fb8cb46ffe460402f76ae216ca5:

  uninative: Upgrade to 3.5 (2022-03-03 07:43:07 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Jose Quaresma (1):
  sstate: inside the threadedpool don't write to the shared localdata

Richard Purdie (1):
  systemd: Ensure uid/gid ranges are set deterministically

Ross Burton (1):
  asciidoc: update git repository

 meta/classes/sstate.bbclass                      | 2 +-
 meta/recipes-core/systemd/systemd_244.5.bb       | 2 ++
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.25.1


