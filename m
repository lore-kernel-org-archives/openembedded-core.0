Return-Path: <sidali.teir@cysec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19566E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 07:47:59 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.32375.1733471270753129264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 23:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cysec.com header.s=google header.b=Opj2Z31n;
 spf=pass (domain: cysec.com, ip: 209.85.221.41, mailfrom: sidali.teir@cysec.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3862d6d5765so133683f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 23:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cysec.com; s=google; t=1733471269; x=1734076069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HPvuJlLFvXXq+bxLGZN7PTnHIl0UrMxViUt5stCJu30=;
        b=Opj2Z31nZOZ6SyIGCuEN2ix4/f/3PhHzAk2QwREp1RA4USRDC/AFxBG0GLh9ahLiF6
         szJf3bl/6lAHhWiQHCQcsl+c1W/Xlru15BWl//Rb/OMYXHpzbvwodt9eCf2C63uOQeyd
         BHoPYabiclNrhbXjPNqVxJ9MJ0IDBqXC27npDmH0CPtrjL9886hOR1b1j872GXe14BXd
         i8rf+JMYQappnKOkAcxNLDi43zB/oRGE79SeeEwglt3CTPuPI440zJDJ1DsX31WVugWl
         A3Q0mGc6i1qHzS8s0rEol9CkbkJJuO16NwVcAbIjLLqSEMeT4pYCRRRpsDFs9amB6MlM
         jKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733471269; x=1734076069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPvuJlLFvXXq+bxLGZN7PTnHIl0UrMxViUt5stCJu30=;
        b=cWEnqgKwVYQ3yzcODdcHJHYnexcZ2LDcRKf1otvoH019kSRyKi6BCmkjXcGd6Fu+mE
         v9rN8fRIzUiv2VffRTluI4L3c8E8Gjnk+NkKOhvp5LDw2PczDDP/XPrDn3gC2u6zCC8R
         BytnPB6wFRdGr/P8pvL0K3zwQL0wUvp1L9AFtfTpiZR8WmMETiWrKidVY0+KW5htHDSp
         FbSWflPZp3JloxgbxlYP3c5OxyxYmi23C3CdfsIwB2FYMIQTU0lqaLoOa7hwXHYNgk5c
         LPugoc4KZGaccswXYMYapmBgxa5iFb16kfJ5BSaQAmAgg60G/aqGV05QHp9VoHFWcctc
         2+bQ==
X-Gm-Message-State: AOJu0YxZwL2XDKL2/eteWMqPxvb0JBvmOnipBxs4V8U64+YHEDnFAkD/
	h/a3U1T+E615xLUhjZv+ckEaPckOhZfp5PVUg8EemUwC3UziIMcHUg73wu1SM0OT14qOrwULmdf
	z
X-Gm-Gg: ASbGnct9+JqUQcxIeC0UVOysUnVBXCUwDDmkkmCP05YhQgogzQr5D31s2vRMTLZi51e
	EuXqxG9i78WZ4J/LyozeR5gqwThE+bsKG+1gUSxqw0I9pU9JUZ157WrxDQKStXK2lm7bMrnatYB
	m/CY6Uqg35X8POi6kpRrPhmltNtmhU7AhIWSurvecVYA5+8NPpDJg1KmFkWCRCG+KujJlLH2N9e
	3wWRHJBBVsSw9abmQCX/yKrF0iKrcJq61isUx67wELoKT71kHsIEp75gnfT1Jwm
X-Google-Smtp-Source: AGHT+IFnEFrfHWr+dgBa0qCICgFg4P47Eh6EZZf8QvuH+y4b56o/jewmq4KEHiAvevo1llp7sW42zQ==
X-Received: by 2002:a05:6000:480e:b0:385:e0ea:d4ef with SMTP id ffacd0b85a97d-3862b3f7372mr1207584f8f.58.1733471268512;
        Thu, 05 Dec 2024 23:47:48 -0800 (PST)
Received: from msi.taila1104.ts.net ([105.110.187.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf3ee4sm4004530f8f.6.2024.12.05.23.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 23:47:48 -0800 (PST)
From: Sid-Ali Teir <sidali.teir@cysec.com>
To: openembedded-core@lists.openembedded.org
Cc: Sid-Ali Teir <sidali.teir@cysec.com>
Subject: [PATCH] shadow: use update-alternatives to handle su.1 and nologin.8
Date: Fri,  6 Dec 2024 08:47:33 +0100
Message-ID: <20241206074733.347617-1-sidali.teir@cysec.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 07:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208404

This patch fixes the following error at do_rootfs:

  update-alternatives: Error: not linking
  /PATH/TO/rootfs/usr/share/man/man1/su.1
  to /usr/share/man/man1/su.1.util-linux since
  /PATH/TO/rootfs/usr/share/man/man1/su.1
  exists and is not a link

  update-alternatives: Error: not linking
  /PATH/TO/rootfs/usr/share/man/man8/nologin.8
  to /usr/share/man/man8/nologin.8.util-linux since
  /PATH/TO/rootfs/usr/share/man/man8/nologin.8
  exists and is not a link

The problem can be reproduced by adding the following lines to local.conf
and then building an image:

  EXTRA_IMAGE_FEATURES:append = " doc-pkgs"
  IMAGE_INSTALL:append = " shadow util-linux"

su.1 and nologin.8 are handled by update-alternatives in util-linux recipe, so
do it in shadow recipe too.

Signed-off-by: Sid-Ali Teir <sidali.teir@cysec.com>
---
 meta/recipes-extended/shadow/shadow.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 171d6e27c3..6ba5a9c7f1 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -200,10 +200,12 @@ ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
-ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1 groups.1"
+ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1 groups.1 su.1 nologin.8"
 ALTERNATIVE_LINK_NAME[chfn.1] = "${mandir}/man1/chfn.1"
 ALTERNATIVE_LINK_NAME[chsh.1] = "${mandir}/man1/chsh.1"
 ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
+ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
+ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
 
 ALTERNATIVE:${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
-- 
2.47.1


