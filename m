Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3644BC761A6
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:42:59 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.467.1679092971314275220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4a5Kiah3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id c18so6802852ple.11
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yui+zA39xyg61Yo1h7pkEKWqZ19kVosKBsvHkZ+S+wI=;
        b=4a5Kiah35wzRMatnNPcgNJaw8ejn5xUE8Hu2voIT5CNfoHAg41IrCYqmlo3gr38loL
         wvMk7GddhYYzgoCOQC8EeICMLLH72p1C0LZ02t0NIHsNvANJlUZKUXg31XTaxk2vjSsB
         4SJZuRJIktGx3jO4Rc5t6R/44QyAEnNUFmU7dkLHiSsiMyRuiEn9iS6/+KYl84snhDp5
         yYgYj2d4T3pwMFm0zLN1LhTqThNu/Hin23s1Nmg5CIOvXAA8pngkPp2Ep1MHNUBioo3s
         gpIgHblSwpSYsn3L2cS0dju8YlgY1lupUhdIej8WDclJW8looTKcKQnBVMHbR6JbSpEc
         IMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yui+zA39xyg61Yo1h7pkEKWqZ19kVosKBsvHkZ+S+wI=;
        b=JsubpOX8Z68/kIWAa6WSCw+k8ilxy9lMGiZ64Ix/gTtsboLZTEWKiHtKJcohmFJlNB
         Slwa4V/sdrNPBAYRaLcEDz30o0tT24as6ltmOOzshHKvIbXUvJ8Zgou0+XIMUppEt1Xn
         VwedQmygnJ9kZB9bbYDCxWpSaXGZQ8MDPdClY/HrXQxuiKsw9llgsJhn7WvvS+XNd4JT
         NcTDVMUePwwwPCcKirBnNT2YUSFTMA/ulhFIx5yXhcvD8J1JpJyy6aSygBMITyy9R6VO
         uSRfYu6sbQIX8DWDvzuGFdbfkKRNBD0LC094H67tsebaaEdLjglR8dmY1ztG2iwY4Wgo
         cjvA==
X-Gm-Message-State: AO0yUKXAnnlDgQt+VnOFCY1TwTd1oFvoNkRnYR2qJzZm6pPZJsS322Nj
	QRLCHAojN6E2uVlGW9uujgVUxeyxTZzCkKOQwnE=
X-Google-Smtp-Source: AK7set9NVdAo1yQ6i5zAgy1JPrZTAAB6f9QXZrgLyoRLuN9Ki+CT0fvm6JlrGN+2PpvW8YEyYZkcxg==
X-Received: by 2002:a17:902:e749:b0:1a0:45f6:d7ce with SMTP id p9-20020a170902e74900b001a045f6d7cemr9734342plf.32.1679092972158;
        Fri, 17 Mar 2023 15:42:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.42.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:42:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/21] vim: set modified-by to the recipe MAINTAINER
Date: Fri, 17 Mar 2023 12:42:19 -1000
Message-Id: <ec594fe190f0f41f8c0388904d72015fce0cfa55.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178766

From: Ross Burton <ross.burton@arm.com>

Clause II.3 of the Vim license states that any distribution of Vim that
has been extended or modified must _at least_ indicate in the :version
output that this is the case.

Handily, Vim has a --with-modified-by argument to add a line in that
text, so use MAINTAINER.  This is the distribution maintainer contact,
by default it is OE-Core Developers
<openembedded-core@lists.openembedded.org>.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit acc007e23445aa53182e13902dd9509c39dd5645)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 40ad44486d..42a2ba46b8 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -81,6 +81,7 @@ EXTRA_OECONF = " \
     --disable-netbeans \
     --disable-desktop-database-update \
     --with-tlib=ncurses \
+    --with-modified-by='${MAINTAINER}' \
     ac_cv_small_wchar_t=no \
     ac_cv_path_GLIB_COMPILE_RESOURCES=no \
     vim_cv_getcwd_broken=no \
-- 
2.34.1


