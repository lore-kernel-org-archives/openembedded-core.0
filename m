Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF53CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:21:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.33723.1759756876365198875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 06:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZnAkiI9+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so46966435e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 06:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759756874; x=1760361674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jZdhQukWj6gEtIRAMs6nUCpAjBE/pPJRrrvOsA5FtIQ=;
        b=ZnAkiI9+/gv8NuPrNeIPr0TShRx4njcP1hGHdyOXvJXqDIpWvObfAaFk1I9tbA/kRi
         ZuegPeakWfNKHqAbEkz/Bnz2hcyvUnF+7Pg4rhTBbICn6nwKEtftarxJpenXof4i+Vkt
         vfRuNODf07UYKSsRPz5SofJMktT01OoMfQNYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759756874; x=1760361674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZdhQukWj6gEtIRAMs6nUCpAjBE/pPJRrrvOsA5FtIQ=;
        b=Nfd1EeRMJkuyePr57GzMh4LaMFsPPIO9+XgvlzSD17sMAOFmgtRhv9QG5+2w4JXnxC
         CZqK2LWhiOc/G66x8yhvnNe7ycfjrfbZwQ0tSHFlJpwRgTVbPrilIFG+Qn3CQRXVAShw
         qKP+vMbGaCc7i5lrNiJwQQobP3LaJ0l/Con/Ac9Zryhsrv0f4VzIxxIfYpmMts3kn9BD
         su58AQ59RKRW2dPtKVkP8q5V5M6ic/S877qG/365Zq0mX89s09NSmyxcoJohiwLLYeXH
         4StcJN8WX68kShEAa37r/XMIor3zYtbMc2LHBqbYWPGk9t8MA8XHpu8xaj+nJ9gosYX2
         Q6+A==
X-Gm-Message-State: AOJu0Yzu5aseFFvXkbteHgg9KnqnJtTU1BcU7JFfUlXkmnTluua8GO/6
	58AISafx/gpNAvqiRndJejZCVAWpkAeHTKAXFPCc/IWx9y+MVEg8zfNccn4MrVeSs23bQC3jLTd
	q9pwP
X-Gm-Gg: ASbGncvtZSmp9YmZyFzZJjOzXCNzyEo5hSO2jxtW4O0cavP/O3ETu3vnQNGVX/xDMJz
	2FGS4pCiUafzkQ9XR4NPErP33MEVmpfRlF9PydSJwuNHE3bmkuD2Va0wjvFCUybEqXe+02zW29P
	/xhQ6Cli6thOhscu6QWJvAPlAFXelXARNFFufofm+SfPnPP424UdVlFFOI9EVdx21AkCG4H4Bky
	TQpuz0ASJ76n9X22L9DShqoZRANUBmb+z3EUmtd/hLr6lajkOJ5leEEEw2AY/4DMcqPM0TV75nh
	FjwY4b+evhJkvhFqfTBErOOHSG2xmP+vAtKN8hsShAZppTdsRRhx1Wswowi4D4+iPYRHVIqnumH
	BtpOLCdjqf8hke5pB2XLU4VhnZehLRMebbg40OoE1I1XMUI2AN+7wRH+YeorR/j3BmV1eZXBPLQ
	==
X-Google-Smtp-Source: AGHT+IH0BpeeCCGVDHvIaLVBzDZhdmL/gfQSxxPZur5RbKkjTPyCdHinx6K9JlS88PFmB6FsgvUyUg==
X-Received: by 2002:a05:600c:3d90:b0:45f:2bc5:41c3 with SMTP id 5b1f17b1804b1-46e714ac847mr76407715e9.8.1759756874187;
        Mon, 06 Oct 2025 06:21:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3e9a:117:edd2:a796])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b5e4922sm140218165e9.1.2025.10.06.06.21.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:21:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf,lib/configfragments: Use a new dedicated toolcfg.conf file
Date: Mon,  6 Oct 2025 14:21:12 +0100
Message-ID: <20251006132112.847125-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 13:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224485

Rather than using auto.conf which already has established use in CI, or
local.conf which users expect to own/control, start writing "tooling"
controlled settings to a toolcfg.conf.

This frees CI to handle auto.conf as it wants, but avoids the tooling
breaking users local.conf files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                    | 1 +
 meta/lib/bbconfigbuild/configfragments.py | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index eebefc48406..8d1ea5491de 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -813,6 +813,7 @@ FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDE
 require conf/abi_version.conf
 include conf/site.conf
 include conf/auto.conf
+include conf/toolcfg.conf
 include conf/local.conf
 
 OE_FRAGMENTS_PREFIX ?= "conf/fragments"
diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index 34c6a3b4bcc..21baedc9a42 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -115,7 +115,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
     def create_conf(self, confpath):
         if not os.path.exists(confpath):
             with open(confpath, 'w') as f:
-                f.write('')
+                f.write('# Automated config file controlled by tools\n')
         with open(confpath, 'r') as f:
             lines = f.read()
         if "OE_FRAGMENTS += " not in lines:
@@ -184,7 +184,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
             print("All fragments removed from {}.".format(args.confpath))
 
     def register_commands(self, sp):
-        default_confpath = os.path.join(os.environ["BBPATH"], "conf/auto.conf")
+        default_confpath = os.path.join(os.environ["BBPATH"], "conf/toolcfg.conf")
 
         parser_list_fragments = self.add_command(sp, 'list-fragments', self.do_list_fragments, parserecipes=False)
         parser_list_fragments.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))

