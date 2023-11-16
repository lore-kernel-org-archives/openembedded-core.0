Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E952C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 16:52:59 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.11783.1700153574571875406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 08:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bzq3D+Gf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c83d37a492so12731741fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700153572; x=1700758372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Q6tK56gofBNx3FwQl6I3gwm+kEipL1usUHnAJdaET0=;
        b=Bzq3D+GfCmu2JsAraCndGwPgwjDL7q9iMgoAu/oHvAsCfnpGZZt1NTUBjLsc9dKkdh
         lzuZWM+Hddq/znVnstuRCK2RSJH6g3aopMQZCt6uayO5Od9q4vELiUqO88zIgN5qXzb/
         aUIP48AwTKPUs6nCD5ael6Pc0NZlzuaAD+EAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700153572; x=1700758372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Q6tK56gofBNx3FwQl6I3gwm+kEipL1usUHnAJdaET0=;
        b=rUj+pZLoYtu9TgUpOCwxlpuaY7y5lDlOn+dNcp6Pg9Iu5deIh2MZ+IT3xcL2Us7FkU
         dCi7E7clgM+53qt/N/Fn+xiyvWTwTBIC2aoQY8iaTDcGlz1L412ntN/4u5FnpDxdMza+
         H40HyuDgUHRMTvplrwmd6OpG3nOjcOvuD/UXy5KLiV5uzE61cqoWRPR/rjLmITOW74Wh
         xD8igioG8oVt/15ugMmzsjkOF8+pbmEY70WjHJRQ3uS86nIfJT9N+FCPfMD72pYNGBYF
         b9TD6jFIOVyb33lo2ajYxd3BB42Npd9SzRHxl3zfWnX0GIx+Gg+LyuwxV16/QK6A8M6g
         ZHqg==
X-Gm-Message-State: AOJu0YydGE18o3Oae2H3weVhsANglHcexiW0EaCiKGX1b67BKH4kV4pn
	hIz2FqjidRRT065RZUenxuQvhnm2n0AVuSthcYU=
X-Google-Smtp-Source: AGHT+IFhoq2xNWDwT3hmaV7oUol0FtKNutvqhkg9GD9YHX29rAffYjgQUYmKErbypDw6lmK+wM6B2Q==
X-Received: by 2002:a05:651c:30d:b0:2c6:f136:96bb with SMTP id a13-20020a05651c030d00b002c6f13696bbmr5866758ljp.17.1700153572235;
        Thu, 16 Nov 2023 08:52:52 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f8ae:b070:36e4:3937])
        by smtp.gmail.com with ESMTPSA id be14-20020a05600c1e8e00b003fefaf299b6sm4395047wmb.38.2023.11.16.08.52.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 08:52:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] bitbake.conf: Drop oldincludedir
Date: Thu, 16 Nov 2023 16:52:50 +0000
Message-Id: <20231116165250.2863415-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231116165250.2863415-1-richard.purdie@linuxfoundation.org>
References: <20231116165250.2863415-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 16:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190807

Autoconf defines this as:

"The directory for installing C header files for non-GCC compilers."

Whilst this is something autoconf does allow changing, I find it hard
to believe it has much use in the wild now and that headers don't get
split like this in reality, it would probably only be useful on really
old unixes.. The values are the same in our configuration anyway.

Drop the value and just use includedir everywhere.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/autotools.bbclass  | 2 +-
 meta/conf/bitbake.conf                 | 1 -
 meta/files/fs-perms-persistent-log.txt | 1 -
 meta/files/fs-perms.txt                | 1 -
 meta/lib/oe/package.py                 | 3 +--
 5 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
index 5ed21a3d684..1663307b061 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -76,7 +76,7 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --localstatedir=${localstatedir} \
 		  --libdir=${libdir} \
 		  --includedir=${includedir} \
-		  --oldincludedir=${oldincludedir} \
+		  --oldincludedir=${includedir} \
 		  --infodir=${infodir} \
 		  --mandir=${mandir} \
 		  --disable-silent-rules \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 12292714d2f..500f0112742 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -46,7 +46,6 @@ export sbindir = "${exec_prefix}/sbin"
 export libdir = "${exec_prefix}/${baselib}"
 export libexecdir = "${exec_prefix}/libexec"
 export includedir = "${exec_prefix}/include"
-export oldincludedir = "${exec_prefix}/include"
 localedir = "${libdir}/locale"
 
 # Linkage between native/cross/nativesdk layouts
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent-log.txt
index 518c1be3c93..61f0a6e26a1 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-persistent-log.txt
@@ -38,7 +38,6 @@ ${datadir}/locale	0755	root	root	true	0644	root	root
 
 # Cleanup headers
 ${includedir}		0755	root	root	true	0644	root	root
-${oldincludedir}	0755	root	root	true	0644	root	root
 
 # Cleanup debug src
 /usr/src/debug		0755	root	root	true	0644	root	root
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index daa4aed840f..48191f504ce 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -38,7 +38,6 @@ ${datadir}/locale	0755	root	root	true	0644	root	root
 
 # Cleanup headers
 ${includedir}		0755	root	root	true	0644	root	root
-${oldincludedir}	0755	root	root	true	0644	root	root
 
 # Cleanup debug src
 /usr/src/debug		0755	root	root	true	0644	root	root
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1dd20f85ebd..f69bf9c353c 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -456,8 +456,7 @@ def fixup_perms(d):
                 'sbindir',
                 'libexecdir',
                 'libdir',
-                'includedir',
-                'oldincludedir' ]
+                'includedir' ]
 
     for path in target_path_vars:
         dir = d.getVar(path) or ""
-- 
2.39.2


