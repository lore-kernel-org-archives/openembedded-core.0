Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2846BC05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 12:55:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.73298.1674219328301310191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 04:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fTEm1YoP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id m15so3983763wms.4
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 04:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xta1J0eMwm0qfyo+mEHFU0CxAUlqJNvFPD6uaehiOR8=;
        b=fTEm1YoPdJnITcBPdfWvs8A8gp/QT9DyaLty7l0byWvf2f5I8VPgWs1qOhj31kmkWX
         hNS5M89b+DZSTg7FqA6KnZuuJv5wzqElhyq78+T3U1NHmsdoF0IMf8i5x/jblgjmazhT
         edUqPsxGPjq6cDPpdbAhje1EI9B5h/m97QtRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xta1J0eMwm0qfyo+mEHFU0CxAUlqJNvFPD6uaehiOR8=;
        b=KmaZd2yblIi6T0NrA0vdH7YzhAMl712UN1lR6I5pZP5hPOUNtGfm8ZVA51HLaZ3sAM
         MSYuh8QPP49A9/osWZpPmv06upHn0cKjov45N90G5RDLdwYp4C0YmCLKyRHHvRV0trlQ
         045KeRiB//qeKtSN+r8GiyYbOPHkrKF4q3FAM9xZ7sGvf9cDTxWkfErVForUj8+Aj5X9
         vf1x+o6+qVAjIlyc3N77rZSNEcYw0l0HQNlsXAPnYxJpFFGOrbP3rJdc7qwP2u4c1ppY
         So9LmnsJ8oHWtDyYDxmlqvoSowvhL6w7ge37nJduCtFBZlr7/bbekHgeRRrqcO1LJX86
         dh5w==
X-Gm-Message-State: AFqh2kqDVZiTiI6dPLvjezvjybSQ8ly3Sr/btnqjslJaQKyFFyvpAJ53
	k/kfZ/ZW7u2c8gXySmObJuHbLV3ByoXa6R5T
X-Google-Smtp-Source: AMrXdXs1BIlw70KiDYtLX/3mpdNV6RQ6CCPGgeJXN+w0V20txPImV0HOIUY+xT8zQzZaIKnF/dEDrA==
X-Received: by 2002:a05:600c:1d8e:b0:3d9:f9ef:3d23 with SMTP id p14-20020a05600c1d8e00b003d9f9ef3d23mr14350886wms.23.1674219325808;
        Fri, 20 Jan 2023 04:55:25 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2783:7b11:cb41:d2b0])
        by smtp.gmail.com with ESMTPSA id u3-20020a7bc043000000b003d1d5a83b2esm2199076wmc.35.2023.01.20.04.55.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 04:55:25 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] native: Drop special variable handling
Date: Fri, 20 Jan 2023 12:55:24 +0000
Message-Id: <20230120125524.2064270-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 12:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176188

Back when it was merged in https://git.yoctoproject.org/poky/commit/?id=c4257ed8b1040a5a0e9a95846d81961741239116
it appeared special handling in setVar was necessary. Likely due to
other fixes and improvements it no longer appears to be. The results of
"bitbake world -g" before and after this change are identical for oe-core
and meta-openembedded. Therefore drop the "parsing=True" special parameter to
setVar() meaning overrides can now be cleared.

This means that something like:

DEPENDS:append = " bash"

now functions as expected, adding bash to the target recipe and bash-native to
the native BBCLASSEXTENDED version.

Without this change, it would add bash to the native version as well as
bash-native which is clearly incorrect.

[YOCTO #15010]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/native.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 61ad053def6..1e94585f3e3 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -161,7 +161,7 @@ python native_virtclass_handler () {
                 newdeps.append(dep.replace(pn, bpn) + "-native")
             else:
                 newdeps.append(dep)
-        d.setVar(varname, " ".join(newdeps), parsing=True)
+        d.setVar(varname, " ".join(newdeps))
 
     map_dependencies("DEPENDS", e.data, selfref=False)
     for pkg in e.data.getVar("PACKAGES", False).split():
-- 
2.37.2


