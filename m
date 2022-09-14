Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447E4C6FA86
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 02:26:20 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.1788.1663122379267986142
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LueMdS03;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id b21so13702968plz.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=wLTcUPV99ak5fcHCe3y0Nl+akjK88iNScgO+M/8qSL8=;
        b=LueMdS036vpn3y79gDBrgRFuoxz3xBiqU5MMfRzx2OlSg4DaMR0OIHLZyNcWA90GDg
         D2A5IPv9EhNA0UeZACSLQvLzOmbri6n7Bzd4zYTuWZwe2nyEx1yUKpAeG50MTX62CprZ
         w8We9QSm3Q20MZmTAioENHvuXRxJzuKsC6Vi1W3cGhsLQX3F5oAbeEtK58mH2SnOl7VE
         ghCpo7oAfMKhBEiYqihkjPO/xwCXDKrchs3SjybNqjsjVlWZHF3nGYqKtyYaq0fDdRx8
         6XLUO6lmGiE4J00a1qXR2zw3W80ZiaCyFUqYwKlLkPyaUzZnNNz1VBwRkd3kuIl051+A
         EhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wLTcUPV99ak5fcHCe3y0Nl+akjK88iNScgO+M/8qSL8=;
        b=VYHbgK4X+LnISnZM6uf43G7kF6SRsGLIxFaNa1ztYm05pdVmb5pXUK9dsTuhUq139K
         crlS0MohIbGbIwZ7pG8u2UjjrFQi38PcnvvaxRcY079PgGOALI8rpPN4dMNcOzVgxWT5
         VXPrGmKCqwFDp/1zRzNDkZU2bvkgSpY14p4bqKbha4M/PJ+Zmyy22lRFZQ5oKNP3/M4z
         d23iw1G8zwJeLf0uBHuSJkbaW98sqjUdwqXnqgp+VQ6Z/urv8A5nWP4HLKZvJp7U6iTj
         zsMGJFtjRO+szNcwxcwunqwUvwVa2CviWMlpS6k6xerWtND0mTGXgp/fRlV/2s1IO+SP
         LVJA==
X-Gm-Message-State: ACgBeo3H4BeXLWE3H+flG4lvOKXBXEMXZVXtE4vTobSnoMq3AUGQt2Mw
	9pPjm3NRSg6M4DBdOY3iNyza83LRIpbxKrIj
X-Google-Smtp-Source: 
 AA6agR4nwUaUf/nmKxUVgfb87flga4ct+lXCUSn5qnnWNgi+Ui38dPhPPUuWjDhot07SJgsxAWBTWg==
X-Received: by 2002:a17:902:f549:b0:176:c033:db03 with SMTP id
 h9-20020a170902f54900b00176c033db03mr33957818plf.109.1663122378319;
        Tue, 13 Sep 2022 19:26:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a65644e000000b00438fe64d61esm5259871pgv.0.2022.09.13.19.26.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 19:26:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/9] systemd: Fix unwritable /var/lock when no
 sysvinit handling
Date: Tue, 13 Sep 2022 16:25:17 -1000
Message-Id: 
 <b8aa4d53b636bec55ad0ff4de764222662647859.1663122098.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663122098.git.steve@sakoman.com>
References: <cover.1663122098.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 02:26:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170625

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

Commit 8089cefed8e83c0348037768c292058f1bcbbbe5 ("systemd: Add
PACKAGECONFIG for sysvinit") decoupled enabling of systemd's sysvinit
handling behavior behind a distinct PACKAGECONFIG feature.

This new option affects among other things the installing of
tmpfiles.d/legacy.conf, which is responsible for creating /run/lock
directory, which is pointed to by /var/lock symlink provided by
base-files package.

In case the option is not enabled, then base-files provided /var/lock
is a dangling symlink on resulting rootfs, causing problems with
certain Linux userspace components that rely on existence of writable
/var/lock directory. As an example:

  # fw_printenv
  Error opening lock file /var/lock/fw_printenv.lock

Since Filesystem Hierarchy Standard Version 3.0 states in
https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s09.html that

  Lock files should be stored within the /var/lock directory structure.

Ensure the /run/lock directory is always created, so that lock files
can be stored under /var/lock also when 'sysvinit' handling is
disabled.

(From OE-Core rev: 85e5ee2c35cf5778c3aefda45f526e8f6a511131)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd/00-create-volatile.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
index 87cbe1e7d3..c4277221a2 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -3,5 +3,6 @@
 # inside /var/log.
 
 
+d		/run/lock		1777	-	-	-
 d		/var/volatile/log		-	-	-	-
 d		/var/volatile/tmp		1777	-	-
-- 
2.25.1


