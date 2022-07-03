Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C79C43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:37:55 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.64472.1656877066250728027
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=c5BcRUFY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id b2so6832386plx.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Np/us0oCN8qSTfsi3tqkCKHrnWfXsZTT6727L3e1cHk=;
        b=c5BcRUFYp29yU3SkyzamdhP+2+duljxFkyA0gB6LruA6YTQw1V0pNUWqwnKv7thmgi
         r85ivQiunL/2ynz+ya1qyd/YSfemnPz1PeVf/XvZf8IiFpDrnPhsCpD/tGRgLceqEWAE
         8Wc+KWvwsfaOQvCxs+sMxQ0XUaZgwJraeF0bLRgK5r+psct62BGbEtv6qSHZ4o6nkvgO
         dwAQRdnMDPKUwBAYxwiWIwV9x4rbwpfCDul69rq1h/X2UC1tpv4d9lJ/e3oygS5wbHS+
         EsJ6JQeBJLTrMcB1u7/lmNUpo9rC9ON/ecyhd/T142o9ISKlmlGbTZYEl5oLkGwx2kQ1
         o0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Np/us0oCN8qSTfsi3tqkCKHrnWfXsZTT6727L3e1cHk=;
        b=PuYG4zYBzFExwmbjnJhYlAzxnnBrHB4eBzdfodk97Vj7w3q3CbsVQvATYQrZIw+6gT
         twqEMsQoUzsb9TpYQg1hHmvhSFRNZ4/poDzAhdmcoBg3udOTVfTvCYg/hX9+5LbeZOdR
         2uBw4TeidHWG0kD8+iAnykz9MLo7y9WbMLbRKkoKFm57uoScaH2H/gz7c8bbnhDGeCBF
         RUMh2d4hYgY6dBaoI4dxIrx71GMuLxAFV2WiXITgSBYJZWhTgTUz3Z1H94eAp4un2QGX
         kOl0YrA01KolPdvET+1sWA0ckQJaNRZYotcZaAzi+NoGQKODsw5Gbvn5FwkD4KKwBzzh
         nvyg==
X-Gm-Message-State: AJIora+4JwJcbfTdqXiYFG9HgUiZRbXxUIPzStHtKvjtdw5EO/ODPsu0
	nkJPF3REn2m1RbK7zbaa4wyUS0eoEuJOwCbF
X-Google-Smtp-Source: 
 AGRyM1uZ4oj73sgiKfDGO+0epe2dMIOmEEvLxPxI+Eb5H+tcho/f5/H4kS26LUa7Nbvy3qIJ91mLuw==
X-Received: by 2002:a17:90b:b12:b0:1ee:f30f:2fdf with SMTP id
 bf18-20020a17090b0b1200b001eef30f2fdfmr30989803pjb.146.1656877065144;
        Sun, 03 Jul 2022 12:37:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.37.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:37:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/30] sanity.bbclass: Add ftps to accepted URI
 protocols for mirrors sanity
Date: Sun,  3 Jul 2022 09:35:52 -1000
Message-Id: 
 <a9debe6e606ac389124cca032a902e99bd48b1e6.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:37:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167577

From: David Bagonyi <david.bagonyi@gmail.com>

Signed-off-by: David Bagonyi <david.bagonyi@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 10f3a9d5173ef4bf92ff4a7d8aef0cd2cb23e4d4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index eb0ca05804..b1fac107d5 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -858,7 +858,7 @@ def check_sanity_everybuild(status, d):
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az' ]
+                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az', 'ftps']
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var) or '').replace('\\n', ' ').split()
 
-- 
2.25.1


