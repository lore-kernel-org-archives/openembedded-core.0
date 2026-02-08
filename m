Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CC1EF06E3
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 19:12:31 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27206.1770564017320377699
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 07:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NOHQY2ZD;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: logan.gallois@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-436e8758b91so358737f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 07:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770564015; x=1771168815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=NOHQY2ZDkCziCKV+ZA4OvwzsXYbix6LtnEZyGqYRtwApdxgfm7sk1ceHpfAWDuf0Az
         vV8egXu+1JJp/ReWhnXR250D3QM7+HmK+pGI4724D0u+OnZgsrmaFlMkes76+HVLvJcK
         EgwIoETlo32lXVAKPt63Ctg9rt/mTHAeulJdaO4qVjjb2RitXZUArny9tBDY2ILoUJSD
         GZ9aRMXr+gcofrwiJbF521XNwVLnnODj6iPAPGUqAjW3sesVT3okqtgKLSmRO61hvjrg
         t8grfDDWX318KfJtFfwto/bOHq0M3FaG5YOPzwvIHgZtc1HuAcfGeTpLZIE2MkbPA4Qh
         gaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770564015; x=1771168815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O38CQV6Rqd17a+yTuum9KwCqXqqTlP3CWYNRQWJOIds=;
        b=Z+Jkl0AaCT5tC8dh+WchZ7OGj4GjKI+avxHx1k6uPLoiMCbCv4kceEfWb4UmShkwEs
         iCYEztx/HimpIZpE21FOdsUcYEoZofkP5vIF+SDn2MB1hzB7Q7gehqiSpGBmG+XKy0Ag
         qTK/ASIK9DSRmjD5CvvFhNk7GtYfCYJYB0n7BC8E0FT73Rjx2hDhm/7Ufo6GcG9mrWQH
         iOVIptmC5jSgtVPBCJi13hrsBArthX4XGEJDFRqBErBMagszzsZdYt1mEWUL0OL8TtB6
         LB8b4xjTA4IAzgBtLsGJSWBg65g2QgWawQ8LrM0fLMu3Q80nknwJnhb6nDHodCBb0C4m
         bWCg==
X-Gm-Message-State: AOJu0YylhQHRwAZRvmAsLfXJ6UEuu1sUzfAkHLP191phyQpxrMcoprSm
	kkWBKs6jwAikWsW9q8M7TNf7JUnbZppBjUukTgIlCsIyqHm5eh5Cw1O3bp7ajw==
X-Gm-Gg: AZuq6aJX0kJauFVYp4PD4aEyQckYgpj0lgy3AExg7fw70RK9h9sk7qpP/nChKkm5yp7
	DKuS38ecrLjSCIAxBTeJAP8fpfzRXxc8Vmv2F1qUNEMJo1Ze1DlSQU8CLl7mejUINMRDlL5Mk7u
	uiUu2pQhtaoTJciCeBHTZMpZGBcKFAaOMN2Dm1vU/AlwIvSvQVv5ty1FpzTW3WnYLBR70E2g05W
	XMmQjR0OuG5Z9PoKvGS73cky4SXx+i0OWRVkU8zInfuB59Rk8XoRewmL5Tjny2Sg9tQff23I8tF
	1Y65ubwb/uBcrRybNzjf/TI89BZ8U2kprtSHhfS6flbwCO5+DeM+jEiyB5Wsa+SEeBCYJtk+E8u
	R+RomJrPG8+KFqkqYGJYNeVasziuNnP0LgMWgWkaHyFkSD0N0UYg9V3frXPQ1zPDekFJP4/vyIN
	ZkjgAia7LyCWiJbc5MPzMJ/VLcjPI4aUmHSNPlxm1DaORpzsNtPY9mL/ICDMABW1kADg==
X-Received: by 2002:a05:6000:2386:b0:436:14fa:a3f3 with SMTP id ffacd0b85a97d-436293782e5mr12105602f8f.21.1770564014989;
        Sun, 08 Feb 2026 07:20:14 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376806626fsm6796273f8f.37.2026.02.08.07.20.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 07:20:14 -0800 (PST)
From: logan.gallois@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] oe-setup-build: fix TEMPLATECONF not being applied
Date: Sun,  8 Feb 2026 16:20:13 +0100
Message-ID: <20260208152013.11582-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208000829.343627-1-logan.gallois@gmail.com>
References: <20260208000829.343627-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 19:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230681

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


