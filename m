Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.174.1602186559660792235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 12:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O2UttG5A;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: banerjee.sourabh@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id c6so3275208plr.9
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 12:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4daIfh+2Mgye4g6qlI8iMa7WyOh4JwcDcmI0CZeKqdY=;
        b=O2UttG5Ab3l746DIRT8hG8FQtBSgf/kh37ObswFB/GoVg1PfEThN8phjq+B4lxPn2R
         YaK7onVNC3f+L3+eqz+wDOOg7DE+LMrMWTN5ogc2RpAzvEAzMw7bD3Jow+MMgJP8oN8x
         FGWerdeR5FU8TQ1rfhWd9uG5h0vzaGwJKSXxHOl090Vag21nZtmQOw8XoT5aHIn6CPI3
         SjDsHUSEXtGvkDWR/bPfpww7AWN4XBbOCfw6j6iP99wo2XmK1jfyTm+ZNfTxF1+VhaQg
         gCs30i2KwNBsexDM3NCga3lVwowDqnI+rfBibTG8zQcMux+DFH7JGYbpjQrauO6ZGV9h
         E/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4daIfh+2Mgye4g6qlI8iMa7WyOh4JwcDcmI0CZeKqdY=;
        b=k/AkX/XGUh8nnD5LLWSNZkeCBtd8TOP7jGySpXk6/VQ9LT8EO4niNYYR5eGpFbenkt
         eE7ymPwYGpM2J90uaWIEcz2zNnufuJkbcCQ5TsE7CRm4XwnM0OUg8V4I8xpQE3+++JFG
         ZEPv9jZ/5Foy8DG7WU+r6tyT8yY84+hJ36brd+pvDqFsBdD+89FMqJPpyIlPKBT+c5h1
         +y1lOa3ClbToMXSm9J3adJCdwkf9OZCwCchbETVEPfHOGhhBFQmN4HyFu6Z9saBdrMZ7
         KIktYQQgS+4lg2eZnWfSsd55dghz5hu5Hpi9CB/wYSytgZ2bVsiGdlQCPrLGlU++Gw40
         +Jcw==
X-Gm-Message-State: AOAM5325Hm10PRWhDudrBl8s2+qg8aW8G4O/d6cGLfPJag4nsH5q/858
	/2tWQXkgoHUL36U0sRSiOCMLObGM2JI=
X-Google-Smtp-Source: ABdhPJxvhuUad/iO9lYTPhvWaPjNEOEb9pHFDDOgantq/RCFkqrwNimlVr0KR07WoGcKdoAGCZhz+A==
X-Received: by 2002:a17:902:d888:b029:d0:cb2d:f274 with SMTP id b8-20020a170902d888b02900d0cb2df274mr8742958plz.13.1602186558788;
        Thu, 08 Oct 2020 12:49:18 -0700 (PDT)
Return-Path: <banerjee.sourabh@gmail.com>
Received: from hydlnxeng07.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id j23sm455067pgm.76.2020.10.08.12.49.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Oct 2020 12:49:17 -0700 (PDT)
From: banerjee.sourabh@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Sourabh Banerjee <banerjee.sourabh@gmail.com>
Subject: [PATCH] layer.conf: fix sanity error for PATH variable in extensible SDK workflow
Date: Fri,  9 Oct 2020 01:19:06 +0530
Message-Id: <1602186546-25220-1-git-send-email-banerjee.sourabh@gmail.com>
X-Mailer: git-send-email 2.7.4

Sanity checker reports following error for the PATH variable,
when bitbake -e <recipe> command is run in an extensible SDK workspace.
   PATH contains '.', './' or '' (empty element), which will break the build

In case of extensible SDK, PATH variable is formed with two consecutive ':'
as bb.utils.which(d.getVar('PATH'),'bitbake') call returns an empty string.

This change adds the ':' only if the bb.utils.which(d.getVar('PATH'),'bitbake')
return a valid path.

Signed-off-by: Sourabh Banerjee <banerjee.sourabh@gmail.com>
---
 meta/conf/layer.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 38df0f3..ff9c004 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -102,4 +102,5 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
 SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 
 # We need to keep bitbake tools in PATH
-PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
+PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
+PATH := "${@('', ':')[d.getVar('PATH').endswith(':')]}${HOSTTOOLS_DIR}"
-- 
2.7.4



-- 
Regards,
Sourabh
