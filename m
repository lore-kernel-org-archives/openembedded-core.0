Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03D7C4167B
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:45 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.16023.1672594715863712312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GndBBKRb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 82so17177822pgc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31+OPQretACHNJLGuwBFMpfKJQe3XrXLUVJug+BypZ4=;
        b=GndBBKRbKQedSwzXiupnUntJPn3XAk3WAAOatNuc4u8uReHD+8mRlNMGUpRNgeaweN
         ZO7y7mD7ZClNyR8iaC55D1lARtZ58siZYuM6LWO/UNQ9Vps6eVoXxgl1ArG6KZWpghjK
         joL6yo2+jIfpi7FbAsniAkdg4+wiwEc6fsqMmmy348ppAVjWItYLuMyF/Cl91Hbb6Qvm
         ELp+Qxq7QMLXvWvhW/ySugai8i2a91BtliUXSGN4NXLTD7VBQ/tVtD/i5gGeAWJ4OLbZ
         zBjqpeTPHzcsZWdd8YIWQ0JXG/pLNdUqZuRCOlws/1tIRBZwDF4QOU7G8HVgiqrPw8pL
         suDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31+OPQretACHNJLGuwBFMpfKJQe3XrXLUVJug+BypZ4=;
        b=NJh4eaiauT2TP5e72gZoee98th3366PMOYXTdBJCKKO/c7U2BfrNQlM3IALEHD10Eu
         q+w/tqwcAWBq8ntqoGjE8rwznwp9+PM7OGNGcw6nuxofSC+oY+sbw69vwCX9bA0DQ1Xb
         88nVQ/8Bpz+a92yC6mwHDLKCBFhzCfLDa6lWHXW1L7dT6x98nm/Q8qP1n9GICwGE6W3I
         fG5z/dwqck3deOSNYnqha+xcTWrixrZO1qmj8l8/t4kHUMIDfI9ePYAAmakw9TiejWXc
         778L/VNyxuKj5aN9ivh6EIe0OyJyGPILOK2slhVIwnHH0Ei23RaMD6bfht+jJ3Lsclh2
         Hymg==
X-Gm-Message-State: AFqh2kqaO29m+jmq5VyPZov9JNDJb5R8dTkYvyjfPc8gOUo8npMNG4nU
	HVcEUw/WPohwQUPxeKmvLSwKAumrmOTXT3NJ17I=
X-Google-Smtp-Source: AMrXdXuyuFal8eXYvMPx0F3I1Rr61dJJw7TRBV0aVxi6pSXdPkB3DTKUyLb/1zvtUUyVKp1wsYyY8Q==
X-Received: by 2002:aa7:9486:0:b0:581:e756:76a8 with SMTP id z6-20020aa79486000000b00581e75676a8mr13348766pfk.19.1672594724619;
        Sun, 01 Jan 2023 09:38:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/29] libxml2: fix test data checksums
Date: Sun,  1 Jan 2023 07:37:46 -1000
Message-Id: <203430eaa86b3248024e9a374644d94fdfd0225d.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175212

From: Martin Jansa <martin.jansa@gmail.com>

* switch from tar.gz to tar, because the tar.gz archives upstream are regular tar as well now
  https://www.w3.org/XML/Test/ still has 3 separate URLs for .zip, .tar
  and .tar.gz, but both tar links return the same file:

  xmlts20080827.tar:      POSIX tar archive (GNU)
  xmlts20080827.tar.gz:   POSIX tar archive (GNU)

  -rw-r--r--  1 martin martin 5.7M Sep  1  2008 xmlts20080827.tar
  -rw-r--r--  1 martin martin 5.7M Sep  1  2008 xmlts20080827.tar.gz

  9b2c865aba66c6429ca301a7ef048d7eca2cdb7a9106184416710853c7b37d0d  xmlts20080827.tar
  9b2c865aba66c6429ca301a7ef048d7eca2cdb7a9106184416710853c7b37d0d  xmlts20080827.tar.gz
  96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7  /OE/build/downloads/xmlts20080827.tar.gz

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2_2.9.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index fffe7dda98..e15f8eb13f 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -13,7 +13,7 @@ DEPENDS = "zlib virtual/libiconv"
 
 inherit gnomebase
 
-SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=testtar \
+SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testtar \
            file://libxml-64bit.patch \
            file://runtest.patch \
            file://run-ptest \
@@ -28,7 +28,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
+SRC_URI[testtar.sha256sum] = "9b2c865aba66c6429ca301a7ef048d7eca2cdb7a9106184416710853c7b37d0d"
 
 BINCONFIG = "${bindir}/xml2-config"
 
-- 
2.25.1


