Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD696D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 11:52:19 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19756.1764589930386844478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 03:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J10CiDKS;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b736ffc531fso644931266b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 03:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764589929; x=1765194729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3xs0HpgqPS6a6X4YvPNh/lL0l82HwzRkt7cGs/qja4=;
        b=J10CiDKS5hSNr8bAglEbu847SYVcoCQu9qpT4RWmv1jjBhrtx1wxzoSRGVKL0b2Igy
         Q9e96PtxcoMBkx6nqvmP/PGhRdOjXFaQmjFBfpat6F2x5aFEncjj2NkGYixrnGnCM/Vd
         cYi1+HSyfKJmwudtJqruq6t3s5dYi0N+p6TJraSuirThg3udKqzrqda9Cmzu2zVX54Xy
         z5Cv4HqIJb8ztx2Sbj4rIvaZBhLV+Z89EnTsZBQmSoYergwVoFkvGbj/G5YRzCFW8h2b
         ikChWIYOQpRRVQXWA9L+QaGffAJY4A013zvbBCfX88PBoLSsUFeASpzZQllur4MNyDu2
         timQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764589929; x=1765194729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3xs0HpgqPS6a6X4YvPNh/lL0l82HwzRkt7cGs/qja4=;
        b=Q+18pmB6vsCTVrtp79AtLMSEu6OeeSl1Z40fbE9L8nJpZr6UiDGvo2rl3DwqU3ivMf
         e57quWcNjL22mp5qZ7zeSOaUOZasoOW6ehQkHooaZ4MJhyHm/BL33dP+Rhhv4VOWQVB0
         25PFrOSpV434JXLCC4jKbOo5vsdkjR25I8d+71zo8rQCIPDLANl9UYiMYs5atKtsC+mv
         lTOyxAfFLnL4Cliu27SXYXEcS9vDJxwDcfYN1s7RHhV8ydaZWoAtVPV7dgTAxWGmifho
         2x4ZKO2Nd6TOtcdNZ8dsyMHb1lZQRF8OdcV9E9FT72HOj7OsVluvm7i51vFlCO0sgpL2
         HrZA==
X-Gm-Message-State: AOJu0YxJzdk6O1hylTDK6lHpMCo2gKuJbwiBFrfBQBR+qUkaN9LavCUX
	P4/Qy/Vcn2Npga8RZ945Bf7yZrvx8ow5z1tCuALV26F41nxoMTp6L4vqhVyZ0A==
X-Gm-Gg: ASbGncsT1oVJcmu3N0PSt/8VOAJstjuQDgor3qhnI3PumiY7MgZa2OtXAtoNEDIpKk8
	XRIKemSwKXxfUnaEzBAw/7hI6C7lXKiDN5Hpt6RJzfcJuVacCv/CR0MMM/QSD6ZHicXtjNhdSt5
	i/o5j+snxzTRBeyjKJKpUO61ppmYPvhXATSDjojbGnc4+0Jl+2jf48dTls+tyzfQwLXC25pdil1
	d7PO7PdCY5EnsjUrTWE2MCTgg0Uho6x1pGrj3uFICam+NcuDcQRAe7YH0N3IPNiAxE0QYcgsG95
	UQaGD/EJhA1m+ozPj6vu1s8oIcFvf/Q4/aCWmBpewhG8bmWQqT/jsmzPRsxSHfcME+4gwag6RbF
	a4VhS7LsMTpa05pDunOHyz8lYjm1IqzyCA9VwM92LsJj84P8y31a1+/PvtvBuOWkvjz1KD70syN
	3liJyB2MbZDcqPsf9p2LhJN3nSSApuTD++VmLKKnUk0hG6UTQ=
X-Google-Smtp-Source: AGHT+IH0uxavsPJTYlNvwnEuI/b9PKK3xFPEIJ17rga6aXHAQC5kW4fIEVaRn//m4IHgX/InIWtEaQ==
X-Received: by 2002:a17:907:3cc5:b0:b71:51b:bd4c with SMTP id a640c23a62f3a-b767170c7dbmr3691807666b.50.1764589928565;
        Mon, 01 Dec 2025 03:52:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90c93sm12173596a12.9.2025.12.01.03.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 03:52:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2] lib/configfragments: when disabling fragments, treat fragment names as prefixes if they end with /
Date: Mon,  1 Dec 2025 12:52:03 +0100
Message-ID: <20251201115203.1223192-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 11:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227122

From: Alexander Kanavin <alex@linutronix.de>

This allows disabling classes of fragments without knowing their full names, e.g.
instead of

$ bitbake-config-build disable-fragment machine/qemuarm

one can issue

$ bitbake-config-build disable-fragment machine/

to match and disable everything that starts with 'machine/'.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bbconfigbuild/configfragments.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index de521f0c149..47605f3ddb5 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -161,16 +161,16 @@ class ConfigFragmentsPlugin(LayerPlugin):
         def disable_helper(varname, origvalue, op, newlines):
             enabled_fragments = origvalue.split()
             for f in args.fragmentname:
-                if f in enabled_fragments:
-                    enabled_fragments.remove(f)
-                else:
-                    print("Fragment {} not currently enabled in {}".format(f, args.confpath))
+                for e in enabled_fragments[:]:
+                    if (f.endswith('/') and e.startswith(f)) or f==e:
+                        print("Removing fragment {} from {}".format(e, args.confpath))
+                        enabled_fragments.remove(e)
             return " ".join(enabled_fragments), None, 0, True
 
         self.create_conf(args.confpath)
         modified = bb.utils.edit_metadata_file(args.confpath, ["OE_FRAGMENTS"], disable_helper)
-        if modified:
-            print("Fragment {} removed from {}.".format(", ".join(args.fragmentname), args.confpath))
+        if not modified:
+            print("Fragment names or prefixes {} matched nothing in {}.".format(", ".join(args.fragmentname), args.confpath))
 
     def do_show_fragment(self, args):
         """ Show the content of a fragment """
@@ -210,7 +210,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
 
         parser_disable_fragment = self.add_command(sp, 'disable-fragment', self.do_disable_fragment, parserecipes=False)
         parser_disable_fragment.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
-        parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment', nargs='+')
+        parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment, or a name prefix (ending with "/") to match', nargs='+')
 
         parser_show_fragment = self.add_command(sp, 'show-fragment', self.do_show_fragment, parserecipes=False)
         parser_show_fragment.add_argument('fragmentname', help='The name of the fragment')
-- 
2.47.3


