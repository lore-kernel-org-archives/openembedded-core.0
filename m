Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4958BC55174
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21346.1785666572919539218
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L8SSOr6t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495590dde14so11166635e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666571; x=1786271371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qhs3J+cWjgbp2ZE5TacPQdFqlRcN1/Vl0cHF6OJfVO0=;
        b=L8SSOr6tiX/SM4ZU6qkYc3zS6p3D5T+zCbBZUbZIdl0i9+JaPsQ85rKZ3zmgf8ryGU
         IUYweKU2e+70IrjQQEEtqIbPVtCvcC0W/LhcHi33wue9bOvBmdV3hYUZTP/mz2LU1HBj
         E0c16oxPrBkUMbPJCOEmuv3yH1b/x/fTUErQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666571; x=1786271371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qhs3J+cWjgbp2ZE5TacPQdFqlRcN1/Vl0cHF6OJfVO0=;
        b=HT7rWXXyM5MR3AyZzHIvcPRqLNdjeH+tzzEGbqUMqd+bp8AcZ+cCqdDYz0eCBEyD81
         j8qTEa9pJ2+yBu/xXIRjBf6Bc2bR+bVcrBvx2lnvQuXpFXiCqX3E8PenVBI+1rERl9Al
         u5BddKOuiTXf6YTcmXrLqU6XNXhaZA0p0iVDHaUs0nk146ni/46BBwT4pYIOk3VX562X
         ow2lR41Fd6iqvwAk8VvxCddXhcwgAYPe81mRec/pOEhW1hhpi6N6D4Z1a4Yu96uWj0vS
         GEL3cP4ep27XmgYQL3AAvad5sJ+uTUI72/Nus9MUTr058SdUPRZlNuQ4ePe4nKOBHqta
         Cbww==
X-Gm-Message-State: AOJu0Yw6CZhdqLbsOzocuoWzH3Jiq5CDX+PLTXRa8Dgplekl0i8nIUWF
	BnnDcZg+3qRnhMAUhUesFuBGjT+CEWUs+sY3gm0TZJW5cduo+ZW4XgOFqiIoS3u4qf7vTSxhllk
	ul4QZjOs=
X-Gm-Gg: AR+sD13lWD+JcTVHzpsjJMQp0CxIylqoz7bTPkqnNZaFeiRR5IcDqMHanSy5L4vgg/j
	N6N2vji2KvaD4R0y2O4zWW2VNPVWkYZrMw2KvdRHncIqUWzr2XONU4Kr7Q27Ubg6+1tRAQPugZT
	TVLfPHZNp706VBnI6+TnB/Geuz1gd2hQhDb/SMbkr3UP9+ZKFFvIjTn0aC/I4St7XxXq9VoKO57
	xyRX15+8CcadQFBLRA76rqS/CFSCx4eluO9qgei470I/3fcySUnkpirvFHYRvBTSGSAI4DW2QGa
	8FR4NLNgflF2exneaW2ltdtpHU4kf3g80jHohBgs1oPqkc9M2vb+iIoPafi3Htrw2rzeSDDIdkj
	Vbl8PckaalhPtFGjrqPljWwaX7fhxz8UiLIfxtRPwdIxlpKxVS/6ROZhoMNkkrexE7cKWRNQtAg
	v/Hi7GaDEufM1EHApJTRidmZoewrZYGrFAR5CP+mafs3QY5YoXEoXz38w2Si9Glx5AsUnC/Mwwn
	Uu3l2eAo+yq9cNxIQ==
X-Received: by 2002:a05:600c:811b:b0:495:6934:414c with SMTP id 5b1f17b1804b1-4980c696c7emr114845455e9.19.1785666571230;
        Sun, 02 Aug 2026 03:29:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/25] sanity: Drop unreachable code
Date: Sun,  2 Aug 2026 11:28:54 +0100
Message-ID: <20260802102854.3952760-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242549

This code looks like a paste error and could never be reached. Drop.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sanity.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index af9e2c3ef1a..9514e7d2189 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -121,8 +121,6 @@ is a good way to visualise the changes."""
         bb.note("Your conf/bblayers.conf has been automatically updated.")
         return
 
-        status.addresult()
-
     elif current_lconf == 6 and lconf_version > 6:
         # Handle rename of meta-yocto -> meta-poky
         # This marks the start of separate version numbers but code is needed in OE-Core

