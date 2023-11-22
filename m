Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B17C61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 14:13:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.20345.1700662437708148083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 06:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gPNobz+6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40b2fa4ec5eso6419365e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 06:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700662436; x=1701267236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1d9KRAeZP2FQi8Ey8a0VD9hNjkaNsvQIAk56eEjD1E4=;
        b=gPNobz+6Ci5Vr15HJ6W5xDOffANWNQKtgoxFROtWearJK9EXeCH6ufY5YwDV4hJG7v
         MhoY15A90X322333vjMF8UkX7BwYD/mQ5acEMTQNXTptHzfU1NtQJeDvDR3VvFC7TFW2
         rUvzt2q4KI+0JLwfToJVTruvwQiFMuvZ4jvZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700662436; x=1701267236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1d9KRAeZP2FQi8Ey8a0VD9hNjkaNsvQIAk56eEjD1E4=;
        b=vBC/9sc/tb4iWlz5wAKEreL7XSJ+KFj6H88Z4BAX4h5zgwbk3DilVEAyez1DouB71D
         WQlHOgEd+Jl2HfZooMPx4PJfyxl/3cR4Pgaoal7hXaAQpq4/YrPZSO88WOv5wYuejJiC
         rPf9s35ovvYNixwKQYuli9rNUdkcsI9HnFW2LbR55jJm2ZTQ+JTvdBdFqyv0YP+0u8C3
         f9dpKYBrRkChM7bAYSC4eutb8Av4rmTzWpjAaQttfadBUeQFufxnnzOuERg7yFgzuXYM
         4bTKo1myRm2ZTCkNvfDi0e8+YZu9fwkP7ejdrq3QiQ+ExBfpn8ayAxG9I/tW9DAvZafs
         X4Aw==
X-Gm-Message-State: AOJu0Yy0ytpSGgy49DuSwH1uTbQgmCYYp3sBOxu3E1iHUUWokZCaYRQW
	3r8Fz41e47LL0/Hk4prkeJJttdN/WSPE9SV6QG8=
X-Google-Smtp-Source: AGHT+IFoL72EDZ5qwaaoisGIWfOn5tyYYRuBArrp5jbcYvPWAAVeTUrm6IuRsCKvs36SHD/ouCnJDA==
X-Received: by 2002:a1c:7413:0:b0:405:499a:7fc1 with SMTP id p19-20020a1c7413000000b00405499a7fc1mr1761565wmc.40.1700662435929;
        Wed, 22 Nov 2023 06:13:55 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1718:e534:44cc:c75e])
        by smtp.gmail.com with ESMTPSA id q10-20020adf9dca000000b0032f7f4089b7sm1902938wre.43.2023.11.22.06.13.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 06:13:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] package_ipk: Fix Source: field variable dependency
Date: Wed, 22 Nov 2023 14:13:52 +0000
Message-Id: <20231122141352.3484673-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231122141352.3484673-1-richard.purdie@linuxfoundation.org>
References: <20231122141352.3484673-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 14:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191109

The Source: variable is generated from FILE but this is excluded from checksums
normally which results in a reproduciubility issue when the filename changes.

Add in a dependency by reworking the code a little to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package_ipk.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
index 1ca1308967c..71ffdd522ac 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -47,6 +47,10 @@ python do_package_ipk () {
 do_package_ipk[vardeps] += "ipk_write_pkg"
 do_package_ipk[vardepsexclude] = "BB_NUMBER_THREADS"
 
+# FILE isn't included by default but we want the recipe to change if basename() changes
+IPK_RECIPE_FILE = "${@os.path.basename(d.getVar('FILE'))}"
+IPK_RECIPE_FILE[vardepvalue] = "${IPK_RECIPE_FILE}"
+
 def ipk_write_pkg(pkg, d):
     import re, copy
     import subprocess
@@ -62,7 +66,7 @@ def ipk_write_pkg(pkg, d):
 
     outdir = d.getVar('PKGWRITEDIRIPK')
     pkgdest = d.getVar('PKGDEST')
-    recipesource = os.path.basename(d.getVar('FILE'))
+    recipesource = d.getVar('IPK_RECIPE_FILE')
 
     localdata = bb.data.createCopy(d)
     root = "%s/%s" % (pkgdest, pkg)
-- 
2.39.2


