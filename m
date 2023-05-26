Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C797C7EE33
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:31 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.103.1685068166159755700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hJoWCu2C;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-64f47448aeaso345216b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068165; x=1687660165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PX7VJG8BqOoGE7M/mNMo5GWlW1zBLCsAhIhCIbxWSmI=;
        b=hJoWCu2CjnlUJ8jqVXRDOH7yFGQgoMfU8d1hrSVqEebKpU0+1hbqt/8WMe7s2zmmjr
         YQqUIkL/pRbe8jjDPAZkbXqbjnIgz/POMmt51cDutHgE1rTFYjZkwGV7ONx2JoGFd0mM
         DJ/bOOLTyzgRch3I3fwxaYVCB+HZdw9ZYdVjyNMZu3WrLiY+ICqvO6E11q6b5VVMXTlb
         aTis6+vVs/XwMMfjpezFaz33VhgCMoZNnmB5KTRZ7v9RQqFWP0PzO0mDGOxKY8IYadVn
         yUjxmga0pYG8Sp0pxrPi0BbOVNS1Dr5vnmO1KeF9hTsfScW0XW4d4WXIxeL0Hj4p6sC5
         dTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068165; x=1687660165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PX7VJG8BqOoGE7M/mNMo5GWlW1zBLCsAhIhCIbxWSmI=;
        b=IQyHxmLoHHURQjcnIjzUfGshWMzQ4G716zIBbWLCPGijy6/LDZ79W0EQ/nQI6fCK4f
         qh8WLTUtOOvMxvIrC4OzjxQZ/VHncpp4stX+mG7aioSha3e6CIAG89vNTWJMXIu4vge+
         MCe5l6vwGZR9qIvlJ03J1ZjVjpb7yD0It/mlABi4MQPAQSdARLRkibXBkUjg10lBvOTV
         own0ebN/ldIPshi4z8PicKkkHf0iQEHO2wbIEGbpzNjeHh4/z1GilAzQ/g8qrTz0bNnH
         K63HyzLirDtHwEnk9LC3AbK+ioqo9DLm2QBB+vUDrL2QEVZmp/x5g6nLfANoySwUXvZe
         VzfQ==
X-Gm-Message-State: AC+VfDyqbj2S62Dg3i8lbpxNKEhZ4ndo+hncRvajPt2LcPkNVySGdvJP
	UdOfuwn+wmeMvLXDrj6hmrpHBSzbRdx3JKSBCJM=
X-Google-Smtp-Source: ACHHUZ6QOR/gEYBdTE32F3QRS4G2sBlBWgKISTp9cW2j5RbqkR2TccTzRQEh7OMOiNejxt/3qwVzEw==
X-Received: by 2002:a17:902:b211:b0:19d:1bc1:ce22 with SMTP id t17-20020a170902b21100b0019d1bc1ce22mr991970plr.5.1685068165029;
        Thu, 25 May 2023 19:29:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/21] git: ignore CVE-2023-25815
Date: Thu, 25 May 2023 16:28:49 -1000
Message-Id: <472a3e05270deace2862973dee2e65e60f9c0c19.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181733

From: Archana Polampalli <archana.polampalli@windriver.com>

This is specific to Git-for-Windows.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git_2.35.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.35.7.bb b/meta/recipes-devtools/git/git_2.35.7.bb
index 99d3d70683..9e7b0a8cff 100644
--- a/meta/recipes-devtools/git/git_2.35.7.bb
+++ b/meta/recipes-devtools/git/git_2.35.7.bb
@@ -37,6 +37,8 @@ CVE_CHECK_IGNORE += "CVE-2022-24975"
 CVE_CHECK_IGNORE += "CVE-2022-41953"
 # specific to Git for Windows
 CVE_CHECK_IGNORE += "CVE-2023-22743"
+# This is specific to Git-for-Windows
+CVE_CHECK_IGNORE += "CVE-2023-25815"
 
 PACKAGECONFIG ??= "expat curl"
 PACKAGECONFIG[cvsserver] = ""
-- 
2.34.1


