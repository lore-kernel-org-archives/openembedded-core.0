Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D68C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 15:20:40 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.36232.1723044037746993473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 08:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eim7Sl/D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.173, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f136e23229so20826721fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723044036; x=1723648836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EN7Jgh9INrEckEvreXtJy6d+jA/go0AuEBzsu01EOLQ=;
        b=eim7Sl/DtjiaMrCeGnyQ55zmzBzbJbTpY+k7vdQZ1cFSMDX9+EKpl6ef4rDtUlTsqY
         cAvYLk+jZbLGj614ybWmS77TtXO4eHi/P7tbgLaXS9rGUcSO1hlEi4by76sjC3RTQWBi
         wDmc2gjRWaw+Mg+v0GfPEicuCnHQu87olkwKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723044036; x=1723648836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EN7Jgh9INrEckEvreXtJy6d+jA/go0AuEBzsu01EOLQ=;
        b=XSkrvyDceDfn/ug8M4eq1c4q5YzRloDgYGTY/ue6ikgWBS6GzDoqIhz/47lDmG6+Hr
         T79nCXDKBzjEZJrLhI+UGd/TlpbbTj0qVXUFfrn5xyZrwBsXUUir8Oy8EwR0VokR9kkt
         7KqPh6z21f/vjvFX0RCtHC1KC9h9ruLr0LVk1xJEAD4TipPvyDSM4Uiszhc6vcqjbuZs
         E4oHqTVipm3Y9zh9GKeL5INLwuke2zfrnxQT5rms/DL18O8utbPr264Byg46ziDtoVn4
         ouRR11C8fcG26ZfupR06MQPFfeNUqLKVou9FBXnF2cOqdchKkyvXdlrIeEkaOq+tHkXW
         J5Cw==
X-Gm-Message-State: AOJu0YxXDSwDIIWvHsNT04F87HCCP1+I7U5yza0C8EwwotIah3eRIAFy
	NWRbw+cDtvSIDaZqA5buJQBQPYNG/RiOu6oAru97WYwSLayLIPZPTiULHWGBntJontqiI4FExI5
	7rPc=
X-Google-Smtp-Source: AGHT+IFnSp49KFxWqlkdP3GtAa38Uv06644IjjjhADVR7v0Pn7NzbEyXk4hFyb4mgTtd/zyKGHyX2A==
X-Received: by 2002:a2e:9907:0:b0:2ef:2d4c:b4ba with SMTP id 38308e7fff4ca-2f15ab0c33cmr128465721fa.36.1723044035287;
        Wed, 07 Aug 2024 08:20:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:db20:52fd:c091:c903])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cbfaesm32084155e9.42.2024.08.07.08.20.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:20:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-initial: Inherit nopackages
Date: Wed,  7 Aug 2024 16:20:34 +0100
Message-ID: <20240807152034.223155-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 15:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203079

Since this is a bootstrap recipe with PACKAGES = "", inherit the nopackages
class to skip the various packaging functions which wouldn't do anything anyway.

This fixes errors from buildhistory changes where packages-split would be empty.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb
index 7da28382650..acec7e9676b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb
@@ -2,4 +2,5 @@ require glib.inc
 PACKAGES = ""
 PACKAGECONFIG = ""
 
+inherit nopackages
 

