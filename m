Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230A6C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:46 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.162546.1680796957657966344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nfmYOvHW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso43298379pjb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796957; x=1683388957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLia87a0OHlk5P7VFltvOtJKzXidEBVILREuSyL/WLE=;
        b=nfmYOvHWaU9tktNdDlctaW4Nqh3clOY7RvXNVU0SYU33pspSBewlya9M/YJO5dhHSz
         ou2mXkKKr3/38jM9yeqiImwIKDa+7e9Aw2FS7lXFGQlT8byf8bya8QwZEByn0SVf8oOy
         9c7gla4UEKn+g2T4Rqcnwa/JPupJlA763cg33ccULqt+wJUCHfkPFoeY1DQgheDXq/D8
         6fn0snLQ4/iIQo67X0aePkCVKH3m/050l+7rxcFlE/WkMg19tIJFPsQ4RJmV/aGV+hu5
         88ePEBLbvM5VSYq3z3nWFrQIS+AyQWlYV/5TeSJ+chaC37vkUyK/XzyEjJREJ7Skr+qe
         BWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796957; x=1683388957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLia87a0OHlk5P7VFltvOtJKzXidEBVILREuSyL/WLE=;
        b=CoUNvX9ErLEfgmJGXGyWNbaYNrvAsJQxpR3P3Df1xfTSw4p+LSnX00UCkm5c2fl55L
         wssIkNsVZERjIba8vjLXeYgCqRnCn/WforfJsTZ/Abj8oDKy5NYeQvx5t/BLeDN8Fut3
         GePBIypLsHhFdKIZNU2s0TYS9bgNjMiWb+uWlOIJwwQAnNCLqrsuLTtJOlAFdKlNcQA9
         AqT1qBlBM+x8CPpDluoWx7v+MHQUkAsi1GM+szuyMJ4Nm/JvG8MLhrP+PL0o1UxH2BlK
         HsYT7ro2dVOQ4PomsRK3l2SvfChR/UdzLKGERj3IAP4+agqg68dW6CQMjpcBFj+rp10v
         h1gQ==
X-Gm-Message-State: AAQBX9dadkAHc1mDq8A/8wny2j3HCJ6GmGFDtLi4fdpV+PV4JJVIQzZx
	3+hGtJ23evQhME/JuNsbWtfesZ2kewIXjIW6uOU=
X-Google-Smtp-Source: AKy350bBT/EKnzZBIxVNEjeeMteI59SnhnxNHOF49ybbZBSFm7y5D8TmgMGDlLtrzJn80rTPIEES7g==
X-Received: by 2002:a05:6a20:6696:b0:d6:c9e2:17a1 with SMTP id o22-20020a056a20669600b000d6c9e217a1mr4010231pzh.62.1680796956618;
        Thu, 06 Apr 2023 09:02:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/26] package.bbclass: check packages name conflict in do_package
Date: Thu,  6 Apr 2023 06:01:37 -1000
Message-Id: <c6cdb13c8cf31dd2613817b0dab9599f77f59921.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179788

From: Fawzi KHABER <fawzi.khaber@smile.fr>

It is possible to rename packages with the macro PKG:${PN} and result in
a package name conflict if the target name exists already.

Add a fatal check to prevent this issue to go unnoticed.

Fix [Yocto #12060]

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6cb63d3a871c4eef52d981131a56bf41aa1dcdf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/package.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 7a0a428b30..a47da14ea5 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -2449,6 +2449,15 @@ python do_package () {
 
     bb.build.exec_func("package_convert_pr_autoinc", d)
 
+    # Check for conflict between renamed packages and existing ones
+    # for each package in PACKAGES, check if it will be renamed to an existing one
+    for p in packages:
+        localdata = bb.data.createCopy(d)
+        localdata.setVar('OVERRIDES', p)
+        rename = localdata.getVar('PKG')
+        if (rename != None) and rename in packages:
+            bb.fatal('package "%s" is renamed to "%s" using PKG:%s, but package name already exists'%(p,rename,p))
+
     ###########################################################################
     # Optimisations
     ###########################################################################
-- 
2.34.1


