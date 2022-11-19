Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5CAC4321E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:19 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.30680.1668892574271238578
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KcitUQVE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id jn7so5574647plb.13
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQYi2yccbM+r/SnZeX5MNM9dMTyKAzUECiQrvlvJeQg=;
        b=KcitUQVEZsTW0rVe/HlNaiB2HfGwYlsE7NwreVv8ii9hT4927AA2vhzVPB7jKt0bwn
         qWCQfFm6UKFLjZFHM7R1StnqWwIISIkZpgY424/epUfQrKZ8jQvRasEw7RGz1OuMscoE
         5S9FnWtiKATvccYutxdcdCFGxA1+eWrqUBHu+LWGpnLwFaWMka+mKLjSH1rhnIuo2xBn
         6tqnkx2U8+EZdwoW2y183PGL3hPYfSTrul8vf3F7/KfNGmSXesQVQ5PzfK9Xe6iIneK5
         sUQS1KDqVCmL0VEDF0QnjHFn/JPfX0u2/nG2iUxzZ5AZoBwTfg5EoYhIKgsxxj6LK3G+
         u9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQYi2yccbM+r/SnZeX5MNM9dMTyKAzUECiQrvlvJeQg=;
        b=Qxqm/v6p9xu1yhK5o8CDBYZTc8wRhc+MmwhvuONwdBijp12ebzrAbXtd/zKwkduQib
         iDkSUeryb2NulszYkFCR0ponbPAWs6oqdQMjC2dAmJdAqIApoIQnR6ZvTiU0rZltccmm
         UFEFhLaeq1N7wbuDiutUdPztfELNhp2QGYhnXuaLwFiNdVLUyVVMuYBA1SiF3I478R/W
         6oIEstG/EaQcdocYW8cv9+PtMSyy4/8O8s7OgOFx1DUBmJgZaEFAroQ2yl0wd2Yu9iqU
         3WXjJArQn+8+7w+BjQDn7PEi5xNX0LHcovTJ+kWnk9mnlcWC1F8G+Nrp996hBhGkF02o
         AjVg==
X-Gm-Message-State: ANoB5pkWFzEeCJMdiaR9m4/sZwyDKaVbzV9y+hu0HGbTDk/qlrjX+Gix
	93lQbv7xM7rvBn6G0DxIbo9ltxAYBmaZQHUCAUk=
X-Google-Smtp-Source: AA0mqf4D2F1Ei260EZ2khflV3lWvpUjiAnw0b5Hp9tILN9/+E/Mg2NtVsUm9S2PhxENuJAxGsHxJ7A==
X-Received: by 2002:a17:90a:307:b0:213:ff80:b37f with SMTP id 7-20020a17090a030700b00213ff80b37fmr19967443pje.118.1668892573318;
        Sat, 19 Nov 2022 13:16:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 27/35] libuv: fixup SRC_URI
Date: Sat, 19 Nov 2022 11:15:06 -1000
Message-Id: <40e8a444b4ae379812a0862dc0a51474380f0777.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173567

From: Kai Kang <kai.kang@windriver.com>

Add the trailing '.git' to git repo uri in SRC_URI then it could share
source code repo on premirror with grpc which uses libuv as a git
submodule with fixed revision.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit cecdf616e7cf192cdc723a446be1d14c197c980d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/libuv/libuv_1.44.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.44.2.bb b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
index 4c1b8eed56..27e79276b5 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d"
 
 SRCREV = "0c1fa696aa502eb749c2c4735005f41ba00a27b8"
-SRC_URI = "git://github.com/libuv/libuv;branch=v1.x;protocol=https"
+SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


