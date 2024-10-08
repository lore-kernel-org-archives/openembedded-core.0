Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A3CCEF150
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 11:07:41 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.6572.1728385658314591872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 04:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=idpVSrMC;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9932aa108cso498237366b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728385657; x=1728990457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ATog6SFAdTXaIL5cqOmr/Vb0fZCJThtuAuXmt3GV3uQ=;
        b=idpVSrMCdfvUDMEt7kDeYZropI6av/XnmmaAQY1szIZs9RMSM53RF3+u06198EtvV6
         PabCVnmJT6IwidjVMvZq5zCYGm+hwvKQQvOfoNRG5hhWcrrNpPTSzSrgqCpaTbpdrhFW
         xYvI3QWI8y93ahYTDbS7B24u9b0kzer+DSWUIfNRX5Ay6F3h7Q0/8+82PVak+5kLn6Yw
         8E/FyyVUphdMLiqTVyiRok+SxuQHckEwa/o07cRtJZ4PvKHdwP4O19rSD7ncm4xZpPhg
         9q30ZqgtV6VyQEbyKRP9/esanjnrHXFgc2xMrN3fHyW22N9aI3+VzuVWVNlR7Z3JG1y2
         7Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728385657; x=1728990457;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATog6SFAdTXaIL5cqOmr/Vb0fZCJThtuAuXmt3GV3uQ=;
        b=DJ7BAFlVD7QR5QQ2Ib0Brnzf67T9lYcwpXskaGfnJjQr2CTjB/xerRRK4QwVpxI95S
         LmXhtvwLS2rGd21OOX6Q7F9XUD6g+LD/jyI4BEzqaSrsg8ljjjR7A+TxDZmvQKKVSzk9
         0EQuPu2HTTuqfHKlWHNRJODemadSyBeobrvkfKQoG3ZMiDPYbzn64uS84ZT7PVNbDSmC
         /luH2arzc6nQkqVxhkxNHBb2iGKao2mYcd4Y0JuwZ/BoI6Yh/e6DXoybTFnv9Dl1rIV0
         ZnHA9zwvv7D5K+csHJgXotyOkxsxSZnKLmTJq1aGguZNMjDmRHItohsdiY2TO45mvY6s
         zDAw==
X-Gm-Message-State: AOJu0Yy4G+gBt/z90eWlD4tNDf/42naFzYw9NFCG7rNWqY7n35KAHFk7
	4yeSfJ9M0W7+xqYq6S+YWdlN06peEBgySj6hjvd9lnUoX8sjr3v8cq+voA==
X-Google-Smtp-Source: AGHT+IE9Bf2gYTGw9lDkXi75hoZuBIzbf31Gqb4vaIWVdW4po40i674KwMp9wUNaW70/BN7t2pZYfg==
X-Received: by 2002:a17:907:1c1f:b0:a99:7e67:cd13 with SMTP id a640c23a62f3a-a997e67cfd7mr66876966b.36.1728385656095;
        Tue, 08 Oct 2024 04:07:36 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a993fd777e6sm418570866b.79.2024.10.08.04.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 04:07:35 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH] libarchive: Update SRC_URI to use https
Date: Tue,  8 Oct 2024 13:07:14 +0200
Message-ID: <20241008110714.2312-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.45.2.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 11:07:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205286

From: Jermain Horsman <jermain.horsman@nedap.com>

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/recipes-extended/libarchive/libarchive_3.7.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index da857641168..11a64a70656 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 SRC_URI += "file://configurehack.patch"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.45.2.windows.1


