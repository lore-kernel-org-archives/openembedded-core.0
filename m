Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7A8C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:05 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.1719.1645114204923672500
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VVEaF1We;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id m3so4550517eda.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kAO8AB83xz9GaBTKugreszjjW1lc3d7COiUcH5h+xzg=;
        b=VVEaF1WeJRI84K4EZooxKWeejfAuc9lGwmJbX9U6VsbzredIV69efD7Xjk2Bs/M7zS
         Tvti97brJK1Bp0qukqQMITTxKex/Kq43sBRTv04lhnpDj9OW5yCfZ4tPd5pyfVq8jXWC
         a5GSmrfX9zwWLL64nuP7lTnMYpiQeZQMgxHnZCqUCnXs21dq3DYWCZWnNkVebqa8viXZ
         cAoUX1y6PdIEKxv2jJagW+qQIyiIdKCRYpzV1WiZIt2Kh/t9tmnNHobBnzpa87pXfEdN
         OKAtCZ3hHnF37CqB3m8xV4hqLqqKvRsz9Sy461mzsys3SAhzLCf1jT2S2wwhv1CkbSvf
         OXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kAO8AB83xz9GaBTKugreszjjW1lc3d7COiUcH5h+xzg=;
        b=0TnX32s5ezQsJhMi+oKobppYXGXJKE/C6Yu7DHq6BFx9vAkNjC8MC4e3UOrCH1Y0vN
         VTRHM8ZiZttl/TiZDNt7J/6mO4WN2pBIfSLCwmP2frDG06gTDG9SEQBv1wuBrMf6TpjQ
         8km3lMnU27J2JHOjhLVxb5/YKK20Ukai3l44nW/2k+Dwq1X0ZIpS60XmMXT8D8VemfGp
         i+cPe59NSaH56wTnrcdkGhCzt8zlBUjMElL7Nd4xLEDsZdxXCI7YlVkrku2Oy673wtOc
         qvDhyZ6OO+RsRtj1XF3Ezkx213Fv0awqx7/bk1R377/chRQfTyspndOgyyfd0QNVqBEw
         NioA==
X-Gm-Message-State: AOAM5306poMGIxkwful/vsbxVgYdNrRUowAhvdADW9+LTyJ9ilNCyUqP
	7WToROYYJMsLYPpPYV2Eulr6KfgLjoE=
X-Google-Smtp-Source: 
 ABdhPJzNfZw1Wm3ZrDMdUu4GNL4N1+NI/8uGD2V7ax5OttbDqKtzWw2udeBsAkHh6BPdpkgT34Am4w==
X-Received: by 2002:aa7:cc82:0:b0:410:d2b0:1a07 with SMTP id
 p2-20020aa7cc82000000b00410d2b01a07mr3264248edt.359.1645114203533;
        Thu, 17 Feb 2022 08:10:03 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/28] repo: upgrade 2.20 -> 2.21
Date: Thu, 17 Feb 2022 17:09:26 +0100
Message-Id: <20220217160939.1424397-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161832

From: Alexander Kanavin <alex.kanavin@gmail.com>

sed-patch the sources from do_configure, as otherwise
this breaks automated updates (devtool creates a patch
out of changes done by sed).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/repo/{repo_2.20.bb => repo_2.21.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/repo/{repo_2.20.bb => repo_2.21.bb} (82%)

diff --git a/meta/recipes-devtools/repo/repo_2.20.bb b/meta/recipes-devtools/repo/repo_2.21.bb
similarity index 82%
rename from meta/recipes-devtools/repo/repo_2.20.bb
rename to meta/recipes-devtools/repo/repo_2.21.bb
index b56559fd9a..3c50793401 100644
--- a/meta/recipes-devtools/repo/repo_2.20.bb
+++ b/meta/recipes-devtools/repo/repo_2.21.bb
@@ -12,18 +12,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "98bb76577d9e7e0ffdeb643f1654ec006f6bbc8c"
+SRCREV = "8e91248655acf1c8044ed8c1b265b804a99eb07f"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
 S = "${WORKDIR}/git"
 
-do_set_fixed_rev() {
-    sed -Ei "s/REPO_REV\s*=\s*('|\")stable('|\")/REPO_REV = '${SRCREV}'/g" ${S}/repo
+do_configure:prepend() {
+	sed -Ei "s/REPO_REV\s*=\s*('|\")stable('|\")/REPO_REV = '${SRCREV}'/g" ${S}/repo
 }
 
-do_patch[postfuncs] += "do_set_fixed_rev"
-
 do_install() {
 	install -D ${WORKDIR}/git/repo ${D}${bindir}/repo
 }
-- 
2.20.1


