Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E799EE14CA
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:52 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.4114.1694019411137634490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UZZdbJ29;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so5707447a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019409; x=1694624209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYeJ1ij2R8jG8j2AcDrMxvj7BXDMpkI+ORnKjhm3HmQ=;
        b=UZZdbJ29wgPcLf/AS/sAh3JtPvqVxsg0ZuGupPip24Nl8FvNPsWX7k6jqnmfjCTIra
         10FeKdJEqgmKiBEsHs6wnKIBADUYX25/D6yhPnRSH8X1AfPnfx9JHIpW311DPpMP2MDq
         hKew5BHkzKR8+PWp3Usp0M3LJyaKMXOvw1XaLv2JDYJ+K/lobSgKgTS6fopO8XdaXSg7
         qB8rjR1zvLNQNaIYDr7VO/yXKO1KesCeMIODd10rwB7+ks4cnGVdpXV8uaGK/aKhH/Q9
         7Dp+HPX2AIrVjF0vAdXhDvKBXsozHciTAlgDASPpbpX+6GQjLvHCXs1V0Lkx/cmIpJfC
         HAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019409; x=1694624209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYeJ1ij2R8jG8j2AcDrMxvj7BXDMpkI+ORnKjhm3HmQ=;
        b=jE2cKKIC/QStb6T/a7hRL+gyvhTvZbeUBosHlf8UX2fYJDJOwhVgrEm/m6ix1CXKoe
         ljDW2yReCBuFhTHSdXSrH5Nza8Vnt2qD5FcxL/bYAjs77I7K5Pt84R+dR46cc7+04gGt
         ue68sZiQ6Q8NXl0CfT48LX3OVnpWWEdn1LrTVVof/ltosegPbqBE9/+TWxQjPenfJwDZ
         dbtICAMEoR4hZaayKlcX3Eq/LndfdsjRbWy11ww8TyoW4eoOwdDZ5PZD7R81DttINftC
         sG6PvgL58DWicbs4XEyyzCLHr4nrX42MIn0tjE+A0v4fUgjb9kTpSFWeD3lDt07DUPR1
         JlzQ==
X-Gm-Message-State: AOJu0YwdLav2mzHuQYR96paDwMqveGVUWck8xemDkCHi89O8S8uTiEMr
	Ugz2Lb42Clv2ba9tfOCD0c0VAi1Fm74=
X-Google-Smtp-Source: AGHT+IFs+nz3N6JlV0VxXYrZ9VYlP2SxEeWUhIA4am+NUpYFyQlyl1my5MyxGMpICyL5KqWcvPZFSg==
X-Received: by 2002:a17:906:2091:b0:99d:fab5:e888 with SMTP id 17-20020a170906209100b0099dfab5e888mr2619274ejq.34.1694019409528;
        Wed, 06 Sep 2023 09:56:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/17] sstate.bbclass: setscene_depvalid(): do not exclude shadow-native from task dependency resolution
Date: Wed,  6 Sep 2023 18:56:30 +0200
Message-Id: <20230906165633.2382629-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187336

This results in executables from shadow-native, such as useradd, falling through
to host libraries instead of using native ones that they were linked with,
because the native libraries would not be installed because of this dependency
exclusion.

Until now that could be coincidentally fulfilled with host libattr (which is
present on all hosts), but latest useradd also wants libbsd and libmd, and those
are not typically installed.

The original reason to add this exclusion was:
https://git.yoctoproject.org/poky/commit/?id=0d2a301bca4eb9d43243f1a03c1cd1ab3f27f30a

While I can't be sure the reason no longer applies, sstate and sysroot handling
has changed massively since early 2013, testing on a-full revealed
no issues, and avoiding incorrect fall-through to host libraries
is better than pulling unneeded dependencies.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index c50198449c2..5f8c9c1f809 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1137,7 +1137,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
         # This is due to the [depends] in useradd.bbclass complicating matters
         # The logic *is* reversed here due to the way hard setscene dependencies are injected
-        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
+        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
             continue
 
         # Consider sysroot depending on sysroot tasks
-- 
2.30.2


