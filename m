Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF70C47E49
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:58 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.23146.1706104914182177288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KFuZ6z3W;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d427518d52so39677195ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104913; x=1706709713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCVUseB03gHVXrEEDgpyFv8FK3Zk8MeTNKfmERlSW0w=;
        b=KFuZ6z3WQXea/g1fGcLJhLwv3y8Chyu+QupfpLZxqpUf0dVYw/WF3SeRDHDfBt0yBP
         O+aH810LH84x61L9NyikelFpbkeXgi497CQEDjJxCx9nuFqJbQOJW5dV19KcUGdlewEf
         WrquccaQeNPImaroZrTpevF6bO8oBCofP7JzUNKb/nflbg9zAtqwppteDcXk737Ho1pI
         o7Qoy0gcDt48iPUpgBpagJp2BbD7NH5lu1YeAvTfqd51gJziI4HmZna9gpbe76zwHrOf
         /qORJh+3PK7CDes/ylAKXFUdr16uyGycBB8Ox8cl3zZfKqmnHQbEHM4gMaZ/kEQXJ0fK
         UHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104913; x=1706709713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCVUseB03gHVXrEEDgpyFv8FK3Zk8MeTNKfmERlSW0w=;
        b=bXaJ99QyWGUJsVzb6pczqmkwizVh5eNQXezqnFeNQi1nRoWwZ8x514Ncm25b3u1/ke
         hY4YycswK4QiEY6fLGXky+DINSaD9IFwNLGt9c2Zp81D5Oas5PchAqqJRqzmI7BPctj1
         /ojqrXc4MMa1rfO7UyrIAEfdtA7vWqKGwrEOc7Pyci8jQ2xSX8XgCZNjlvVI8pQnvsTe
         o2cw8iPGOCmnbuyOSF6qTATKaT4bpPBPnjUSE4i77ej3KrJvkpABH5GgjJCFlA68lbjo
         J2jkpqQbTRF6S9V18pSVqO+wSBdzgMVOEwx9YMTUZYMalB5ED72VxnhbOcy3DXbWqa0z
         aNEQ==
X-Gm-Message-State: AOJu0YzhgkH/4mgS06Zq1325jlpzrxKpbLKu7dgFgVlLCHKu7eKfzirC
	mJQG2/YcLzju3naLA5N2q0IsD3WttHxAvkeoRqK4ndVk74k423BWjnglBnXb91Cb4U28/m2Y8lP
	JFKs=
X-Google-Smtp-Source: AGHT+IFknspu1NAWAspc7YlGYt7IGJtu2tu88mCzY4GF6yeP0sHSdwGH2PebRYSIi2JgqKRLxQnf0g==
X-Received: by 2002:a17:902:9a4a:b0:1d7:8531:6978 with SMTP id x10-20020a1709029a4a00b001d785316978mr1049298plv.68.1706104912657;
        Wed, 24 Jan 2024 06:01:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 12/12] rpcbind: Specify state directory under /run
Date: Wed, 24 Jan 2024 04:01:15 -1000
Message-Id: <3d5a85f173dffa14a6829edb9e6adbd5a3946d9c.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706104658.git.steve@sakoman.com>
References: <cover.1706104658.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194288

From: Joshua Watt <JPEWhacker@gmail.com>

The state directory must be correctly specified as under /run because
RequiresMountsFor doesn't follow symbolic links which means the unit may
run before /run is mounted if the default of /var/run/rpcbind is kept

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 561e853e97e2cfa325ed310233577a5e124d9049)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
index dd89726afc..dbd4d32e0a 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
@@ -40,7 +40,7 @@ PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}/
                           systemd \
 "
 
-EXTRA_OECONF += " --enable-warmstarts --with-rpcuser=rpc"
+EXTRA_OECONF += " --enable-warmstarts --with-rpcuser=rpc --with-statedir=${runtimedir}/rpcbind"
 
 do_install:append () {
 	install -d ${D}${sysconfdir}/init.d
-- 
2.34.1


