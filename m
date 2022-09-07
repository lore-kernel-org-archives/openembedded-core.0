Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15398C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 13:47:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.7869.1662558419502182645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 06:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AhxkgwF1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so11866020wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 06:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=1bhmnFlzb7vjixLazw6dl/jDLa/Qqgi0mxrXuHX0MsQ=;
        b=AhxkgwF1JZhjgglIq7p6b7qbWetyJu1AOIGmch+2WUEH6GwEAKtZEBKRE+xVaPX5ft
         c8Enisc+/78a0vg3w0JWHht+9yxgA7t5SL7Wjs5Xd+9yfifseSUlJOoYhEpWcefTMVm/
         8JcLLb7nyfrEaZ7oZcjLY5igaG7Ljjc0QcIjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=1bhmnFlzb7vjixLazw6dl/jDLa/Qqgi0mxrXuHX0MsQ=;
        b=Ub1TqlqBZUYxj5VXO48RR0bz2PYH1tUlIxFp3oFlgNOvzBT8oExWSg6Cn5eiQSOfdd
         cMqV2o3JcSDPIVApMTu+OPZeg8JkS4aHjRPvUTDq3OjtYAwH37mGdYOGin6Z9JApgUu2
         sDNMZZHN6t/2CamGFvokdlKQ9SegoOZd5uk0H+Z/6/TmyaDsbi5Gusow0PTJpIDhVXIV
         7xKVPiCkLsF5gFbekHvgGN7TWuZJoZ621JEe4Q2/vWunMQUJ3yEoFL89I2tovRLLAZi8
         fWLf5Uv6ZLzc9PT8r2nbP+YHK1yPJO8qRkxR2/bXX1vU0Rh08g7zTsPHwHjTRlBhD21F
         WbZQ==
X-Gm-Message-State: ACgBeo0Bu2VYK9bXK00BaaFTdt/0MDSVznA6LyZAaM5lQrfiKoezgbG8
	mA8LGztRqFK/xdIouSvJUdv8Xk8NxzQo2Q==
X-Google-Smtp-Source: 
 AA6agR6HxutygVlObHlQIjcxNH5aliSub/gMthtTiIlObEACfq+YjIFO3KQ2QmQQydki/cki/Fq6Tg==
X-Received: by 2002:a05:600c:3c84:b0:3a6:9596:fa1f with SMTP id
 bg4-20020a05600c3c8400b003a69596fa1fmr2093628wmb.162.1662558417314;
        Wed, 07 Sep 2022 06:46:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:eb69:bb70:edb:6315])
        by smtp.gmail.com with ESMTPSA id
 c8-20020a05600c0a4800b003a5f3f5883dsm29829519wmq.17.2022.09.07.06.46.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 06:46:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Fix sstate file mirroring checksum issue
Date: Wed,  7 Sep 2022 14:46:56 +0100
Message-Id: <20220907134656.565298-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 13:47:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170392

After a recent fix in bitbake, the checksums may be checked for local file
fetches at an earlier code point. The underlying recipe checksums won't
match sstate values so ensure these aren't set via SRC_URI flags when
reconfiguring the fetch for sstate.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index cd77c58dbf8..2c8e7b8cc23 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -784,6 +784,7 @@ def pstaging_fetch(sstatefetch, d):
         uris += ['file://{0}.sig;downloadfilename={0}.sig'.format(sstatefetch)]
 
     for srcuri in uris:
+        localdata.delVar('SRC_URI')
         localdata.setVar('SRC_URI', srcuri)
         try:
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
-- 
2.34.1


