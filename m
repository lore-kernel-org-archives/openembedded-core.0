Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EAEC6FA8B
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 19:52:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.235.1662580369164309533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BvZNwzK+;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id by5so837950wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 12:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wx83NSkDe2C4n2+WTwQGt8fmdHI0wo5RHrhemJsi1Bo=;
        b=BvZNwzK+8I6pVhwBGjkhQwfu7H4+TKCcPg4KLwuDjyWjg3cX8oH0j+/BuRMUd0j7Wz
         jAdDhOZLbO1VYZ8VJ3j/NpnZ6zSVSz6WQ0Gkz++8EN8dpMyWQpBcfGf7DuG/ULjFxyiB
         xtO6RPTXL01xY/uNY1DceXJjmI7b+NCiq0Vj77CBdLBJ3CAfiR7ZHbIgaC8yxvgB3qRT
         2XVVk78LK/RSEuRuqK9LfMznmslporYZRyMUy4FZhZVgplRwkZ1fj8Io0GUsOAV1GTHi
         rEcRDCurb1zrEqoFVXD+cIuyK4Jgss5yARvqLOXZ2iqJZuowTEk7aHm6LL1WhqHh0E+g
         d+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wx83NSkDe2C4n2+WTwQGt8fmdHI0wo5RHrhemJsi1Bo=;
        b=SZ5yfMeuZBKCdOpMRO//2IjDJZw41aFlFlPLmwBMRoG0HsWa+mrKWSuDmowcillz0h
         7S9ctDzjwdP1jh2/yGqHKZNllhkbt/E/h6waHhACxDLtiLCwyntYJmXzxE4hyecXrIlQ
         d3Is7/nZITD46zYwD2NJmeqYEQpRPqVBh8dYjVjMrWQCv16YA3HOwn1yuwwyIj21q+SH
         SBUNhNJXq0L0cJwOzjwFrHXZ+v9DvftaSFHdUIfqM0wBMGwFzeISh8uitFHLqLpzZXoH
         noXlh3fPg1PI4yEJ27otHO7441IJD+A1bLYW4MUpHtXOQnETbduikcjkoq8B8dR3pi9X
         PCaA==
X-Gm-Message-State: ACgBeo2C0NK+FdQ8me2PMaAsIhtzpoIJORO0ZFltvrZzEGzLOCWUgDox
	V1OpfxPvljtrzChMYGWqtbfhXXmpjTD2ag==
X-Google-Smtp-Source: 
 AA6agR5lBUJmK4Un3/AjTtNVbHgxNaZRNpkFchfzebEYR8OGxnIW7aYhbOye++J74+gOPg1MEqrH/Q==
X-Received: by 2002:a5d:5955:0:b0:226:dac4:a713 with SMTP id
 e21-20020a5d5955000000b00226dac4a713mr2914891wri.245.1662580367369;
        Wed, 07 Sep 2022 12:52:47 -0700 (PDT)
Received: from developer.localdomain
 (dslb-002-205-007-019.002.205.pools.vodafone-ip.de. [2.205.7.19])
        by smtp.gmail.com with ESMTPSA id
 r9-20020adff709000000b0022862fd933asm15030361wrp.96.2022.09.07.12.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 12:52:47 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <v.yurkov@precitec.de>
Subject: [PATCH 2/5] classes: Update overlayfs classes to use new bitbake
 functionality
Date: Wed,  7 Sep 2022 21:51:36 +0200
Message-Id: <20220907195139.814465-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907195139.814465-1-uvv.mail@gmail.com>
References: <20220907195139.814465-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 19:52:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170427

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

OverlayFS classes belong to a recipe scope

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
---
 meta/{classes => classes-recipe}/overlayfs-etc.bbclass | 0
 meta/{classes => classes-recipe}/overlayfs.bbclass     | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/{classes => classes-recipe}/overlayfs-etc.bbclass (100%)
 rename meta/{classes => classes-recipe}/overlayfs.bbclass (100%)

diff --git a/meta/classes/overlayfs-etc.bbclass b/meta/classes-recipe/overlayfs-etc.bbclass
similarity index 100%
rename from meta/classes/overlayfs-etc.bbclass
rename to meta/classes-recipe/overlayfs-etc.bbclass
diff --git a/meta/classes/overlayfs.bbclass b/meta/classes-recipe/overlayfs.bbclass
similarity index 100%
rename from meta/classes/overlayfs.bbclass
rename to meta/classes-recipe/overlayfs.bbclass
-- 
2.30.2


