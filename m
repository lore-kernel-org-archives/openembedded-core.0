Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web08.35519.1612792515128031828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qShWnAVo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id k25so12117879otb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kEd56iN5JauUh5IweFpP0UzAHgT3A+SORmw+Cj/FkjU=;
        b=qShWnAVoJRHCOVO1oC9/N4BOWese1PYkiJL83GCRNiH9UBxux8jSbl61J8/v7YTxsJ
         VtzlTuBggeHVhqkULiNJ3c1RD6KhPopq7vKtDsdbEmwrGN2pxtwWwbX4N2AUXSlnU6I4
         TJDclOjPVE1tu1hWZ/5oEYNppve8m5AHGL9c5nTn1SUz8jHzm7RfR/Yg1wMD5EdUIPP4
         yzNjsLyC2ZuGPFqbjJzH0FbmBV2nijwx+Kcr4rQHuNwr/j5qMHI1p1wCLfsR21zymrKZ
         CJnJvd8VqiWYQK3KgvuCjiEISray80/ZSyq5/1ThYSVoTeg+vKITJO0LQeUDb3G0732s
         av5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kEd56iN5JauUh5IweFpP0UzAHgT3A+SORmw+Cj/FkjU=;
        b=IPMMnQS03/lM1f1t/alFe306XbmFGYaD/xCq3QynFEO+vW+7udbRM5NNvF8ehYOCyV
         lLj9KYH9cC/ESlpoo1B9RjRHoNazkxyzUK81aA7qs2VgZzbpm3LYv/pgP1YcpYMdCmP4
         5nmn5cqG8qBFu27Smem+8eGL1yRHYvC5TERKRUbDQ4Zp6mQuW7BIjddkQIOh0mrbx9HF
         wgV8yvXkh/4InjcytGk6cMRVXDlPTKGBiLfEA9PtSmFpk7GEk/joLJABUbrmzU3RFSsf
         /IOuhyWtLubJhoPHJls+Uw35uSlJAbWnqgGdj411zdvUjXTlbwgG0mG1C13Y3bUi/WCf
         RiLQ==
X-Gm-Message-State: AOAM533IgSBKkG/mHCCCmvB2d253Fw+O4tZeNhHjUXMugc0Ad/ASsURD
	5MoKobcK8UeYr3b9NBhvphwFa69DSGpWADH5Cxw=
X-Google-Smtp-Source: ABdhPJyWW5aFVwcce9q8zHfvEtKrBupGjkyH70YwXBuqMjZnDVHGDjvn9qiuJ6HOe1XlDh67rfzxBg==
X-Received: by 2002:a9d:4c13:: with SMTP id l19mr3828371otf.226.1612792514062;
        Mon, 08 Feb 2021 05:55:14 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.55.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:55:13 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/28] layer.conf: fix sanity error for PATH variable in extensible SDK workflow
Date: Mon,  8 Feb 2021 03:52:13 -1000
Message-Id: <a0f57ca42601005658202440947c15de360fe785.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sourabh Banerjee <sbanerje@codeaurora.org>

Sanity checker reports following error for the PATH variable,
when bitbake -e <recipe> command is run in an extensible SDK workspace.
   PATH contains '.', './' or '' (empty element), which will break the build

In case of extensible SDK, PATH variable is formed with two consecutive ':'
as bb.utils.which(d.getVar('PATH'),'bitbake') call returns an empty string.

This change adds ':' if BITBAKEPATH is a non empty string.

Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 05a87be51b44608ce4f77ac332df90a3cd2445ef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/layer.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 0249f21d07..1c432275be 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -100,4 +100,6 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
 SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 
 # We need to keep bitbake tools in PATH
-PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
+# Avoid empty path entries
+BITBAKEPATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
+PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' is not '' else ''}${HOSTTOOLS_DIR}"
-- 
2.25.1

