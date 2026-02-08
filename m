Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A39DEF06EF
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:54:11 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24850.1770554859665411569
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 04:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GV0fvDOT;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: logan.gallois@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43638a3330dso669645f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 04:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770554858; x=1771159658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=GV0fvDOTv0Y378500C9nR2iW6PO7q/Hsg2wyL7GgVZ1lKDCJoM0CurfKq1Svr2PPqs
         x0HN48yw1P5hcW3mtrH3+WhG1YmzP0Rh9LtbRBAmGbTC5Sm+LTaQ51OXXS1IsyBdHr/p
         4S7+0ZoIbKNoKHKVEHJ1kg+MJu4bvRyGEf+9v5eA2xvSS9gpfW+f9uaPyVCLB/0XTkBV
         SjK4fZXO5G4fBuiw/jfVPdul/20HBiRhJDQ0zZPmCm0u6evakBO0c8uNUW/CwebL+kwK
         jiR4ajQwCvXd1PNRPuf7o0AmrTLwPREgLW/L/PM0d5x3OCbAs1mNdofiFduyR6TZFVY0
         qPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770554858; x=1771159658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=jojsanPI4Cnop2UTJMnuZ+lEvMcp8vofsqhI6ZCQfDiAOGWMt0GOXihEs61UK9EJZj
         gIr+O2SqXFJcoUwrUucRjaTsKm5U1jzuUnnxCD4GPTCvqhaXOAYYBY+fQMgi637LM/K3
         EG03Y/0QK80tIzhO2fzUhKJJMT9DAommKYiVbwnFZsOPSW9hQnxXQ6Z/ZGZ8ACO7e9Q9
         hKpmMZLUe6OJNN8Q3cKxWn/KQHnOEbKHLAvXS10yo3N+h8x0TaRLCfvgsNAUludKuUFw
         J4ZTwpTGibj/RN0fuOvYFWHoSEFwC1bGqIiR4XnRg2HBbgWkwTnjDIimgN1R+qsNZ+KP
         4v0g==
X-Gm-Message-State: AOJu0YwvBrk7EAqJhWRmUF1gqfEUERvmUkaX3UuMWUEjI1vLI/zvNCed
	UnMmWQuUZRIUzGA+rM30v/rUjyxJuGdEd1igGrWKyHaNyVOzuiLtg5JsoSAf8A==
X-Gm-Gg: AZuq6aJNo2k+gLOeChrkrorpP8TQXdF/hGr2o46FtZ/Dmhu6HlRWQKFxaf1+Fc6g5Tt
	ysWHoyX/AvJxdMJDAmgeIoVofpg6ayT1JdgbWYZRlu3X7HiLthx5Xwa15/7VRzu3GZWFchdrO3O
	TT8COFk39mIoEpNfCHmYup+T3Swq32/xUUIzjLs8hCp5I5NE17ns0Yd7JiMlf1DvoVkXo/ousz5
	mbbbVJ1peQzrQRWoqaAg/gWKbKeTWtepYOPk/KPsSBlEcrTYUQmqLHCHevG8IrPQPBTrxJV530o
	VEyIc8rHNBIvwYPjopN5c94Bm5ZhK6Jf7trp65cNVmPFx/QkmvL3MTO1xPpy0MdmLnX/uf8W4Up
	LOGmTjCxQn/lE7S3qDYMKclqm4ZbFWwTfv7HClMMBFskDikiJpkLnuaN8+ftGNUrGzAmWp0OY76
	iNUFD4RiryK8h4lRmQZ/IrmDtjF6yT2WQVnsHagZkK26IZCif7UutE1sDogEIvWZTyfA==
X-Received: by 2002:a05:6000:2c0a:b0:435:a136:b891 with SMTP id ffacd0b85a97d-4362933bd51mr12388799f8f.13.1770554857511;
        Sun, 08 Feb 2026 04:47:37 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd211sm20593017f8f.13.2026.02.08.04.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 04:47:37 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: patchtest@automation.yoctoproject.org,
	Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH v2] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 13:47:34 +0100
Message-ID: <20260208124734.7348-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208000829.343627-1-logan.gallois@gmail.com>
References: <20260208000829.343627-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230693

From: Logan Gallois <logan.gallois@hexagon.com>

When using the new bitbake-setup tool, an oe-template created in a
custom layer was ignored because the TEMPLATECONF variable was not
exported to the environment.

Export TEMPLATECONF so that bitbake-setup correctly picks up templates
provided by external layers.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index b391f3b9254..0a3146fd503 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -101,7 +101,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "export TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


