Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.22187.1622304396722802108
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 09:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ADeOQgz0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id h3so3714714wmq.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 09:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0DnzAlwHsGeb0IdzTZLQe8ojUajv2k4b5PonCaIvKQ=;
        b=ADeOQgz0YnUoMP2lY0YrY67V7btRWcHL4ok9Trxi5qiUgHJ/NhrBbePZG7N45dqyr/
         Wvvo8/kNLG0LviZWloPzASKhr8/JyZh4Mr22VIfP1LoNvEBJmSZ5zxqTQfOHcto2NUs1
         fioqfNH6tqdzHFrnSJTxz41eQn8CPyUp5aXy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0DnzAlwHsGeb0IdzTZLQe8ojUajv2k4b5PonCaIvKQ=;
        b=aJlpRh7qUIzBYVejotYmFbBGaZMsNZU8cFyquGXiTeiCTwLNjyL+Fx79B3fbQfz8Ek
         Wqd6RwxQreAlYiGcMmNUOtYGDKhBnt3WoQhRNgb1Xz9wwpv0AquB2+pHjJnYe+OrVt3j
         9cBFSxejXo6RrXf6wvyDYpy4A50VS+KAuSBE3sOKhDp++pWY/6EkwLXlupN6IkcGQhtP
         15xV4e+N5Aqpb1UixTduxCajbx3fDzibXmDtclu3N8gzrS54s5pf5JO/9P6dns1MRgSv
         3irS//jCY9BQSTG2Y0O2RPAtQZr0xO3Ah6McBN8OMHujCF/Kdfuy+udXNWT+saI0YnEM
         DQtQ==
X-Gm-Message-State: AOAM530q0GVGRA6mk0qZr4NjfahtxAd503Mw1IeFQnGi2XsfU8I72PSq
	pwzRmfHYzj197M47BscK9ykgfxumkARmUw==
X-Google-Smtp-Source: ABdhPJz1LK6AEivovz0AE8MvwxPhaxiz3n+6owxKTu+Wb8SLXMqr7Hdvagqa+H18JTKmsGkeUR4F1w==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr13543369wmq.138.1622304395299;
        Sat, 29 May 2021 09:06:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:314e:6a46:a163:7356])
        by smtp.gmail.com with ESMTPSA id q20sm20873615wmq.2.2021.05.29.09.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:06:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [hardknott] [PATCH 06/10] sstate: Ignore sstate signing key
Date: Sat, 29 May 2021 17:06:28 +0100
Message-Id: <20210529160632.2796977-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
References: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel McGregor <daniel.mcgregor@vecima.com>

What key is used to sign sstate artefacts should not affect the hash of
the object, otherwise everyone would need to use the same signing key.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 79588df2cdb..f376c1ed2d0 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -706,6 +706,8 @@ def sstate_package(ss, d):
 
     return
 
+sstate_package[vardepsexclude] += "SSTATE_SIG_KEY"
+
 def pstaging_fetch(sstatefetch, d):
     import bb.fetch2
 
-- 
2.30.2

