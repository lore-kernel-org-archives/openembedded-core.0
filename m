Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B00C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 19:31:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.6482.1679686267048717867
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 12:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lvqArvaI;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so1647309wmq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 12:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679686265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VOxhS5wnLa8Uxc9H9e9a5Og+n6NMDzWbfaJWGTR869E=;
        b=lvqArvaIXOfXGmCMVok01AUkl84oewqStVWfOMqmQRbLGMVGH8R4ZhHLoICMYpdcGm
         dcmC057TyNKkY6Q3zRrdFWqjm/EciUT6+yTRukYhD7rJxSEo0xI9k/S1i2mZGCENDcar
         G709q4kpFBshJBtsUo4ShkkFFg63ag9lczQrTOX/s76uTvUVfwNfUK1+MC4Ck73Qmakm
         gJN+kbZkLVPgUY2rdrvo/WQk64MudTlSjJoMJmTsUQ9iegqKzH6Za+J9ssRG82Tb0Acn
         LMylR7iQYgMgVKi2OkX3CNmbzuZvf/37ggtKQVr7dVOyL/MJV8UI77R4YOUTwAKter1N
         g0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679686265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOxhS5wnLa8Uxc9H9e9a5Og+n6NMDzWbfaJWGTR869E=;
        b=R0MsllqiosI7bTnBeNz8Si+z2eOlKr0UzSaJJlsZZi3HFMwh/innd0oX86RHW8o7II
         pnwiLx1MnVtXQ66+fv6tsV3GUCXClG47Lmk3E7L3F8SDidpIryf+EQUuvZHIzQIPa7q/
         U5y7X87YUwkvUxX3TwLgQpyfCDvpL0PU0aAhU1M/vO9ey4Ain/qKeynjswFEoSuaEJc2
         JE1QYFvyObCufIWbQACt4KPzcQp+Rre+iY+iXhDRhb2I279GoKWfQx/Y9uzA8ZhABlPG
         /vN+0iC9yb+bJhQaX+AP6X114SGjhEbQYtR3Dxw2Il82ClJ++Wmu+ANsLyGFGbuZRfHs
         r8+Q==
X-Gm-Message-State: AO0yUKXAS3mXbefE20sDNyZngopGIbLvJkQayZeq4TOGzJt6bNS+O/FR
	Sw/EGQLygRqewZn4dzY05mL0chLxJwY=
X-Google-Smtp-Source: AK7set8M8344RE/JX5FACzOjiDAIOgt2cZXxl0+7pbFnoRq85P5N7fqB9mKv0fhwux29YMgLtUh+WQ==
X-Received: by 2002:a7b:cb81:0:b0:3ee:1a70:7ea2 with SMTP id m1-20020a7bcb81000000b003ee1a707ea2mr2863883wmi.3.1679686265035;
        Fri, 24 Mar 2023 12:31:05 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003ed793d9de0sm11464503wms.1.2023.03.24.12.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 12:31:04 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH] buildstats-summary: add an option to disable bold
Date: Fri, 24 Mar 2023 19:30:31 +0000
Message-Id: <20230324193031.3059235-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 19:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179076

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 scripts/buildstats-summary | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/buildstats-summary b/scripts/buildstats-summary
index 89348318af..f521d78650 100755
--- a/scripts/buildstats-summary
+++ b/scripts/buildstats-summary
@@ -75,7 +75,7 @@ def dump_buildstats(args, bs: buildstats.BuildStats):
     for t in tasks:
         if t.duration >= minimum:
             line = f"{t.duration}    {t.recipe}:{t.task}"
-            if t.duration >= highlight:
+            if args.highlight and t.duration >= highlight:
                 print(f"\033[1m{line}\033[0m")
             else:
                 print(line)
@@ -111,7 +111,7 @@ def main(argv=None) -> int:
         type=int,
         default=60,
         metavar="SECS",
-        help="Highlight tasks longer than SECS seconds",
+        help="Highlight tasks longer than SECS seconds (0 disabled)",
     )
 
     args = parser.parse_args(argv)
-- 
2.34.1


