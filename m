Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2013C53210
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:45:24 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.22323.1672418719575768703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:45:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=maxdypIY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so13672979pjq.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apG46M/ygAAWuO1t/h86S4DqNXuVw2xAgBjKrjandYA=;
        b=maxdypIY7+twy6g+jND2KGKGp0dZ7ppi+trxQHvMaivKdSYKcYdgDzxqNmBvhf4RGJ
         Ff3fP+tmQ9bUNz1xIwan+9FpiHZO/3m4kK11Br5MAjZad13srcbec3TG8BhxOdZUkN0b
         wrRYDx63q3TN8tZO3tjo9N7JzD7NvgNSVmrJ2SnmwlZfzqU2gzI4jmW2xAYVjzEjeItd
         rHmKd9X5l3VB4323Jqrr/uPK6ErB4gNUM/JOiY9zdAL+Q//A7zrYE6mEloGNB59Z++9s
         OVqJ0BsUJh7i5I9vyePvEfJfL6KEEifuIHc52H/ZY7x76fsB21xdXI0ktLhx/yvZHU5L
         ph7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apG46M/ygAAWuO1t/h86S4DqNXuVw2xAgBjKrjandYA=;
        b=s0diSTjChqUfeZc/iuisFj4cygaCyajMyzJvFKJxJexeV5Y5vECsjt142Qd+MkRPiK
         KqbO/xEAmZWHYr2dy4UfvVTSu64qJQd4Tfy/BPsT0z0zcJbrgDrvrEWuLUrnXkTXikXy
         xjRNLKUPH6TJt8q6afKmcj/YKXUF6XqIioylNcMej9GJLL36H4DkS8+0RFcqBzZjH8Uw
         +qhOpPXk+mlcZL7GZVkAnAm/DO7dmqFIBxr6VHuu34Bzuj4EDEcSocjvG+gR2OK8jgVI
         M1ShS1ZcAeP4+MtMD6+k2l+MuF66D+JoAD5sSR5A6kJj0dgNOk8GevPj2KfqYfLeTDGe
         eXfg==
X-Gm-Message-State: AFqh2kr2hP2X+NNw6bJDhR/+Qq9cjoraRu/aUkGU+XmJgc44M3lPQTik
	mvnPRSgte2HTvos6bO90n6PpuKzviYUE5D219e8=
X-Google-Smtp-Source: AMrXdXsZYv1XY7JMFhvx8rnV52ABYieFGnEEnGgvG95tPPp4f8wU6tFxyYB+YbvAem2r0L9j6y/JGQ==
X-Received: by 2002:a05:6a20:a584:b0:ad:a5fd:b664 with SMTP id bc4-20020a056a20a58400b000ada5fdb664mr37828157pzb.37.1672418718650;
        Fri, 30 Dec 2022 08:45:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.45.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:45:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/22] systemd: Make importd depend on glib-2.0 again
Date: Fri, 30 Dec 2022 06:44:08 -1000
Message-Id: <4394da9f4d9b7bc5296022205f140da7371e2295.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175159

From: Marek Vasut <marex@denx.de>

It seems importd still requires glib-2.0, add the missing dependency.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 224cd8ca540a2c9d7d407a44dccd63f808c1ea15)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_251.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_251.8.bb b/meta/recipes-core/systemd/systemd_251.8.bb
index 5fb0e86982..8f2fb90455 100644
--- a/meta/recipes-core/systemd/systemd_251.8.bb
+++ b/meta/recipes-core/systemd/systemd_251.8.bb
@@ -144,7 +144,7 @@ PACKAGECONFIG[hostnamed] = "-Dhostnamed=true,-Dhostnamed=false"
 PACKAGECONFIG[idn] = "-Didn=true,-Didn=false"
 PACKAGECONFIG[ima] = "-Dima=true,-Dima=false"
 # importd requires journal-upload/xz/zlib/bzip2/gcrypt
-PACKAGECONFIG[importd] = "-Dimportd=true,-Dimportd=false"
+PACKAGECONFIG[importd] = "-Dimportd=true,-Dimportd=false,glib-2.0"
 # Update NAT firewall rules
 PACKAGECONFIG[iptc] = "-Dlibiptc=true,-Dlibiptc=false,iptables"
 PACKAGECONFIG[journal-upload] = "-Dlibcurl=true,-Dlibcurl=false,curl"
-- 
2.25.1


