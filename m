Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.10981.1611768475663063906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 09:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZA47oCpx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f43.google.com with SMTP id d2so3413498edz.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 09:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SK1FBk2UfV3z6NhpZRumr9etf/cjGOGhEjvc5Bu8aZ4=;
        b=ZA47oCpxd/exyzNf9LvbroAIvpKlcb6uQAlJ1Duby+/5fl3q+oqO7zgtz/Rii7zDUP
         mcnU2j57pq+BcZw+YyI5a1GvHmTlsAQNO4yTTo7XaJbcxon5KZXqIJlmLY6V/a0WsGmg
         qnaBr06WUJsWzIGxW214/kYetVL55TtGLnVXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SK1FBk2UfV3z6NhpZRumr9etf/cjGOGhEjvc5Bu8aZ4=;
        b=mWhCluEUmJXrBBfz0QkhY74iK4yAHb0TMoDbD/tcYhAWVHBpE9fXwnI4wy2it7foHV
         RAZY9mipWH7z5WLh5ytE3ESGbUBVtUHPjyf0w/WQ7w5Rx8dEf6KjEcOFm8XoL43xSsbu
         RuiF5mLx0bHKwsQUhG62sR5ArYmgPMoGikIZSrDB9DcRk+94Y5qYw/dX2X/tURc4mUy3
         BZXG+GvH6N8yRBP5LsK7LUkezSccoDAk7UHp4JrQTOvq/bCxYNsj6oRbjrubDMu/nVf1
         OVx5BklxijJ2DQz0HYxxR9c4CrmS0UUXeMfXfGnw39zGoW2gqtZ7kCDZ7MFJ9vL04L9A
         GS1Q==
X-Gm-Message-State: AOAM533FJ5bMx3yuDlx9LarpK+H1/lUeQtmqAQVzAzqIVdYswpSD/ezE
	N1ZAZo/Ud2BJ6+6WMnW6MYvNsXi5MYmqgA==
X-Google-Smtp-Source: ABdhPJxPwe6qpywXBBawsskBnJzOEsNPh3NbIUoMecEQQXxJV2nm3CTxEZSxBRiImd51V7grx2jkeg==
X-Received: by 2002:a50:ec05:: with SMTP id g5mr9959333edr.182.1611768474043;
        Wed, 27 Jan 2021 09:27:54 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id k27sm1115581eje.67.2021.01.27.09.27.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 09:27:53 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] ncurses: Don't put terminfo into the sysroot
Date: Wed, 27 Jan 2021 17:27:47 +0000
Message-Id: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This recudes the file count from ~2850 to ~100 which is a huge win
for reducing build directory clutter, its unlikely anything uses the
terminfo data or man pages in the sysroot. This is especially helpful
as we usually end up with two copies of these sets of files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ncurses/ncurses.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index fe4e8a5d6e1..ef59bc3b0a0 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -324,3 +324,8 @@ FILES_${PN}-terminfo-base = "\
 
 RSUGGESTS_${PN}-libtinfo = "${PN}-terminfo"
 RRECOMMENDS_${PN}-libtinfo = "${PN}-terminfo-base"
+
+# Putting terminfo into the sysroot adds around 2800 files to
+# each recipe specific sysroot. We can live without this, particularly
+# as many recipes may have native and target copies.
+SYSROOT_DIRS_remove = "${datadir}"
-- 
2.27.0

