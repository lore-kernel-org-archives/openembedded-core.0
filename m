Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019C9EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 09:05:29 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.3346.1689930325712059359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 02:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=B9T293M+;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b95efb9d89so25661731fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 02:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689930323; x=1690535123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6rd9A0Oiyh7zHKi40Pr3gZkTX9ZZKcudcwEuSRZFmIg=;
        b=B9T293M+XQrgUA6xTMiBZ8tFra8laavDRQj//03cnRtT1hgcY76Jho4W3dHUIcy8I4
         /r5f7HU1Vm6IKnJIQG7LVNUUTaMe1LS0GTq7+tU9blIri3l5gQQb6TZr510kOhb116K4
         zlqIBAWRImx7uaSGBEaoygCprTiVmPaeVN3cIqlFy7lWebR5clonbXIGaCzXhZxWCUZQ
         WgDwjTlPxkE84bI24/tPh4679O9TvWYCUoGf7UptsRtkOuVqy/clkGCNPedsibkKKG+i
         ZL4PnbidYuw7X6CrHKqjUtTmIxwTXVIVIm33hDONtBWpRYMz3wqIvL/CpUxieAG2vDdB
         ymrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689930323; x=1690535123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rd9A0Oiyh7zHKi40Pr3gZkTX9ZZKcudcwEuSRZFmIg=;
        b=Nfqvr3kKO3b7SqSt8cvPQj4snZxP+qvLurMiR2WdxVpGO69X6geJxn0uUzSCCaWs/R
         I1No1sH+blsVnIa2/wuUsoNDtTmboAeEKawYFI5NVTRaN2I+QwaphqO6QhqZ/frNEHJ9
         ifYafynM+xhopHgHAR2bCP69KMNUReOKkuqQZLKxJQiBTC+KG7pmYUeBVHdxxKrcrkjM
         cmCESNPCP6vNzQGv6XDa8ci3agiqEe9N2guQFT6Psh+qJdY7mqWxalvo1bNHWXmjkvOn
         o0PzHroVBBzHRXgYTLP9ZeYr32aqKb08kgaS7ujqpuAf4HgtYIf5y+skmAJO1YKgf/zN
         0tYw==
X-Gm-Message-State: ABy/qLYQSxutX9zA1AK2CjdRoIA/Qckm8q8Kg8OgkchQJxhhm3eYrxHf
	MsP5ZF3YwpXwVpAFSY7aSa5qy+B6t52CTg==
X-Google-Smtp-Source: APBJJlFuVWD+ZrB2exwOJ/UY4sWxaIwGqxokUuDfBKjkyrDqCvnBkaCndhh2ez/jplANjKQ+1Cgo3A==
X-Received: by 2002:a2e:8916:0:b0:2b5:8c17:d0 with SMTP id d22-20020a2e8916000000b002b58c1700d0mr1107878lji.2.1689930323207;
        Fri, 21 Jul 2023 02:05:23 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c229300b003fbcdba1a63sm3014038wmf.12.2023.07.21.02.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 02:05:22 -0700 (PDT)
From: "=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?=" <peron.clem@gmail.com>
X-Google-Original-From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <cpe@outsight.tech>
To: openembedded-core@lists.openembedded.org
Cc: Xiangyu Chen <xiangyu.chen@windriver.com>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [kirkstone][PATCH] package.bbclass: moving field data process before variable process in process_pkgconfig
Date: Fri, 21 Jul 2023 11:05:20 +0200
Message-ID: <20230721090520.125019-1-cpe@outsight.tech>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 09:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184676

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Currently, the latest version abseil-cpp contains a new library named "absl_log_internal_format", it's
basic package config(.pc file) as below:

prefix=/usr
exec_prefix=${prefix}

......

Requires: absl_config = 20230125, absl_core_headers = 20230125, absl_log_internal_append_truncated = 20230125,
absl_log_internal_config = 20230125, absl_log_internal_globals = 20230125, absl_log_severity = 20230125,
absl_strings = 20230125, absl_str_format = 20230125, absl_time = 20230125, absl_span = 20230125
......

Normally, the process_pkgconfig() would process variable data before field data in a .pc file, but in the
absl_log_internal_format, the field data in "Requires" section contains "xxxx = xxxx" format, the
process_pkgconfig() treats them as normal variable and using the setVar() in bitbake's data_smart.py
try to process. The absl_log_internal_format field data contains "_append_", this hit the setVar() checking
and finally bitbake stop building and reporting an error as below:

"Variable xxx contains an operation using the old override syntax. Please convert this layer/metadata before attempting to use with a newer bitbake."

This patch move the field data process before variable process to avoid the process_pkgconfig() treat the field
data as variable.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
(cherry picked from commit a73e269d3e591a10bb397b94b82e3fb960112d33)
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta/classes/package.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e3f0a7060b..433bc3dc4d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2090,18 +2090,18 @@ python package_do_pkgconfig () {
                     with open(file, 'r') as f:
                         lines = f.readlines()
                     for l in lines:
-                        m = var_re.match(l)
-                        if m:
-                            name = m.group(1)
-                            val = m.group(2)
-                            pd.setVar(name, pd.expand(val))
-                            continue
                         m = field_re.match(l)
                         if m:
                             hdr = m.group(1)
                             exp = pd.expand(m.group(2))
                             if hdr == 'Requires':
                                 pkgconfig_needed[pkg] += exp.replace(',', ' ').split()
+                                continue
+                        m = var_re.match(l)
+                        if m:
+                            name = m.group(1)
+                            val = m.group(2)
+                            pd.setVar(name, pd.expand(val))
 
     for pkg in packages.split():
         pkgs_file = os.path.join(shlibswork_dir, pkg + ".pclist")
-- 
2.41.0


