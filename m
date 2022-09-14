Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C084DC6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 19:10:56 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.1197.1663182652259481417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 12:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zwK4t2Qd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id g4so15227233pgc.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 12:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=4jq1w4yypDR5XfFIKDZbot2c5s7e/2tWncn8KutH+14=;
        b=zwK4t2QdrxpQv6JjQmSN55hS39bgjenSFU5C1G/K6oLnegZ187DDH5pEVF072/iOUv
         fOMf/2376n1ItmFyJs6tzoxcB/m96/SCseM/oPo1JGNafHP+AV5oq84/t1ABLpzBr7hF
         TuxW0hvLkn/2wkZ93xxdYN24avjIA14xDf5GuIbVYb+o4rqiEbTfYV0yBdQYFmv+E5F0
         U6R0zNmC4rInG4PIPkU5JWAZdJ+sYK9Eqt94mfWvK/PfdR0WYwr+d0NK94zeZeadCfdJ
         SNtjPC3nPmBvLVgaNc9pbyb1/iv56M9Ed1mRGONiSCFG97EWocwtP7Lsi/7SSEkw3uDc
         IlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=4jq1w4yypDR5XfFIKDZbot2c5s7e/2tWncn8KutH+14=;
        b=sypeQnJrJ6o4XFThTj77y8WBo2Lu5Ji+/r0Fa3BOnmaLqvb2NjrGk61hJ8n7Srl9/6
         fhgHbz5QZCrc7AyCKp4aWGya3QzSLO3K+Bf+NZEbmypby+qrPSOQHu5q2iz/h4hK3G/0
         vo6v9gXh3I7oS3+SmCZCRnb/tZrtxNN3iPLW7l0okZNToL0ACRwCTIyQBog9ilUTk34A
         1tkS1QHkwRB99n9sCK3SE/Q7UxWtwuH+eu3/et/zW8Iu27tay8OGMzDnpSaWKtAVqfI8
         hPMwOat6nNhhwXLrR6vjDITYa85nmI5eJE+dxq5WxHx6j0mzp50wqNyKeczxbb3RAB4w
         ln/w==
X-Gm-Message-State: ACgBeo0LWCn3KLsv5lBPoVnaJHR9AoiN4U6wISWa0A5z7MhH15FXEo+G
	cEFQmbz77VaDi5NZVK8aj4s5DKKZ4cP+3RFH
X-Google-Smtp-Source: 
 AA6agR6Wu6CCzDCAbTO7RqcAOn37SY3zvUW21c728I4raLJwCUySPtQbA0c5tW8I6rjXkJhu6tMTjw==
X-Received: by 2002:a65:5789:0:b0:438:fe66:966 with SMTP id
 b9-20020a655789000000b00438fe660966mr14109176pgr.425.1663182650962;
        Wed, 14 Sep 2022 12:10:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w14-20020aa7954e000000b00535e950aa28sm10551156pfq.131.2022.09.14.12.10.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 12:10:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/5] Patch review
Date: Wed, 14 Sep 2022 09:10:28 -1000
Message-Id: <cover.1663182524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 19:10:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170668

Please review this set of patches for kirkstone and have comments back by end
of day Friday.  This should be the final set of patches for the 4.0.4 release.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4225

The following changes since commit 08406e03abddc7290c0c2296aa179725a58155d3:

  runqemu: display host uptime when starting (2022-09-12 04:45:14 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  lighttpd: upgrade 1.4.65 -> 1.4.66

Richard Purdie (1):
  vim: Upgrade 9.0.0341 -> 9.0.0453

niko.mauno@vaisala.com (2):
  systemd: Fix unwritable /var/lock when no sysvinit handling
  systemd: Add 'no-dns-fallback' PACKAGECONFIG option

wangmy (1):
  lighttpd: upgrade 1.4.64 -> 1.4.65

 meta/recipes-core/systemd/systemd/00-create-volatile.conf     | 1 +
 meta/recipes-core/systemd/systemd_250.5.bb                    | 1 +
 .../lighttpd/{lighttpd_1.4.64.bb => lighttpd_1.4.66.bb}       | 2 +-
 meta/recipes-support/vim/vim.inc                              | 4 ++--
 4 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.64.bb => lighttpd_1.4.66.bb} (97%)

-- 
2.25.1


