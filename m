Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7297C982EC
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:17 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1692.1789682896301029686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I/LXFC0J;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so701105e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682894; x=1790287694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qLHBkJPeDLHxG6F2ovknGr0/CTuiEk9I6SfWOArHTfo=;
        b=I/LXFC0J9XXuzXmvjxlYpwkwg2xbYyro3Be2j4pOjb1oFz+l0t3a+79dewcBDFZhb/
         miRte+SSO1CFSRBgF70lxtXBtPeTlcXz/YJbY3uwGTT2qvD1hufUzKsJjRRipE6wmHNt
         pMUNqkszjyF1gnsQOMBVkSKfPSOt9r/W0r1Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682894; x=1790287694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qLHBkJPeDLHxG6F2ovknGr0/CTuiEk9I6SfWOArHTfo=;
        b=PGUGObcXtUNx4tmH9+6tQxNY4iH7zUsokN5073eEZ/BWse3K3h5PaqMiNHDaLzowH8
         W9FfQKo6nxwYRoCqKfP+thd054zMQ5pvYN4dNAi7tQ8PztObJFJdqe4MQMiZ6Xi3K5mh
         S992iiqba357xvMHeElteNwrUSUtnkycP/GyWWixNf2pAsJnCbfeaTLylvmQLsEx2EKu
         ZeuCECnClELft38zYzjKXGxTnXc7KyBD2ndJZEQixZpNeVKE/eMByatfZB+dgXIjkJpo
         2o5oPFcpsxFg+o8d8PTuaDWO7pRhj8gvqLMXFCR4f4+Xw1NeRG1waIapEX09mBK7wMvs
         vE0A==
X-Gm-Message-State: AFuF++kJ0Jf2ERNbT3yAWayzLDf4HRRB2gMPXlb4Q45LX/rcY9twTwO/
	NYeRqdIKWZHqEw52kA/1UOAqASgpf9KHWqrTpK4p96Pxj3Bf0SwHDG3mxn/q+v7E86wuRDpekbG
	w4FV4ms8=
X-Gm-Gg: AYBFou3AH3pyMRXRP3mJV+ie4+f+KoRAQYxEggSxdoiWifc+YjW6QLgf3IIqobcpjL1
	XlG6iYfY31bfuJbgGEQ+5C5WShFSLdt0JBidwTBRpeYenA/GCmQ3BufAiPYIQwdW17poRzBpms9
	u8G1QajaXooTDlAHQKMfsqAGnS0XfTJ46fOkACwIf+VzI3BRjQU8kudzAERCmkjAqZosBiDnrQY
	x/aJGfhaTfzl4/uW/yoHpGQPhtOqnZSYlvrQ8zcrz5U4QSGdgla8EjcjnnnxKXY0rPo2Zr/z4uk
	Q4MQhJeYQTgfL+cl6dKjnQM8nAD9+FC1AtQe8pszoNZ52nIX+sEen6ecL2xnHSnIREexkjmgfkd
	jY3KTb2WNT+L43Zs9TsTzJ/rbM3GtkabXwF//cgqbYNnJ7fVmCUWuDh2GwpVqlN72gDpCUCiYeW
	y6xWX3/isGiwduXcIdrssgF0Oxf4gIjeS7vsI8Unu8jwL9K45gFzxFjcX3DdG+GeVcVJbXMyl0C
	SChQLWbbbNwvT9dNhxhsZxoGnJ2ugyxWaSDGyrkVnSZ3GIEyi2AhFqSa9sXbYzz84iZ0xIzeCI=
X-Received: by 2002:a05:600c:3e06:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-49fc56d2ea3mr3499155e9.11.1789682894624;
        Thu, 17 Sep 2026 15:08:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 47/79] libslirp: fix upstream version check
Date: Fri, 18 Sep 2026 00:06:32 +0200
Message-ID: <b4b6c8538798b6b652109a5f1f85b1997d8993b0.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246142

From: Alexander Kanavin <alex@linutronix.de>

The regex excludes bogus old yyyymmdd tags which sort higher than real versions.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 2a60e5db4460cd8ec99b43d8f2ff733ba509c373)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/slirp/libslirp_4.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
index 9f7005d7098..50577fd4ae2 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
 SRCREV = "9c744e1e52aa0d9646ed91d789d588696292c21e"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"
 

