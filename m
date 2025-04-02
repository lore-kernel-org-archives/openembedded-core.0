Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032C5C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:48 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.2158.1743577903952988555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QuRaebcm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4585448f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577902; x=1744182702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eiuKPmgL5B+END8zpK/rrNovydkt+isaR00rAvkXyA=;
        b=QuRaebcmJSpQw3Wu0FzoMojbotRK8nzc8GFOjOHuHGCp+PtfuJCCCq0dSAH9BfBb9i
         KjqPRT5ls/uCiHOYn4/hN7PxS90cH4qjSFl5qKASbuBP3xCuJtwTOd7I0dNI5J329dVO
         dsrg/N1TWD1jLGHG6ZWOjHKNASC1VRUU2kkXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577902; x=1744182702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0eiuKPmgL5B+END8zpK/rrNovydkt+isaR00rAvkXyA=;
        b=FjT1XjcLY1ZLG6MY+v/EoSAMksxsLvMzdIiuiO5jWcZ1K3yqODx114aA0aAB+X7ga3
         kHdQQ2PtdQCUGRhSQl3NfzKf/BDyISezA8i/twHbIynFX8u6gJGMwIDqs+UT3fpHgdSM
         HsrMsttxZrIjKODf8EqEqWbLww2jFBOmxMLvWTu2/eXJHj0yyKL4ZLX91gwr2/Rjl/9w
         AN28ryPv9vyNp78jbBBo4VA8P0U+8VLE64nTayW1YqbWdngiT3S+WYj67EOeWZ7DhVFk
         Od93UlEzzPoKo46KlZWOykwPmilkmgUxgPF/zSmysHyqxoqgv0rrx4jg2gvs4Ur+tA0T
         SWUA==
X-Gm-Message-State: AOJu0YykH8cHW6UPRlry2d+PZyBEUPDKm8HMj+nz/VU4HcvgFQ5/rbZN
	K/Tcl+4tYsYHUlU4l1oLtZsumkr4yfhggNFWJizpe9319vc24artacWBJdKbZ8xJPyOXhXbhHBR
	t
X-Gm-Gg: ASbGncvAxpsykbRl3ZEr86aQJ2gZzruyyqYXryLw/lBIdBjIN0RPT6/mev9fe91BDt0
	bPKc5umKuJP5PrtCSy3v/dCMRtxn0g2Di/TAFNp1ApZVmJU5VHXUpznfj17idJgU1AMIMT73bio
	9unfomuD1fQIo6dKMxk4Q/XqhDALxjgCjixsALo2CNSih9kyoZqnv38HxE4XUTDr3jGNa4R3WNX
	4YJlicXsUXRA4TC2648cZT4HwT1zJxDwnkOg5vq4q6jFjLPMk0kbxuaDQquOAobJVgS76RCKVim
	lvins4FesqQYJd8/AttL+NpACphPA4ImNfUoZabicmN7TM1Cd/Z+E9Jd35XfFqBLpOyi/aZt/Q=
	=
X-Google-Smtp-Source: AGHT+IGAlm32eOu7UIMoekX28SlEPznpCC9IA+f+xgBd+NXOjkbzztmxTv+2b7ZCgqTUgDTHOegcTQ==
X-Received: by 2002:a05:6000:250f:b0:39c:1f10:c74c with SMTP id ffacd0b85a97d-39c1f10c777mr7038271f8f.35.1743577901701;
        Wed, 02 Apr 2025 00:11:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 32/48] python3-pygobject: upgrade 3.52.2 -> 3.52.3
Date: Wed,  2 Apr 2025 08:10:01 +0100
Message-ID: <20250402071017.2157620-32-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214205

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-pygobject_3.52.2.bb => python3-pygobject_3.52.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.52.2.bb => python3-pygobject_3.52.3.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.52.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-pygobject_3.52.2.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
index 08f7dc67b03..221de7783d2 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.52.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 SRCNAME = "pygobject"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "869f42ee70dcf6de50bce267072e2c35cee7fcd2e32ea1af3a3a99a88901850a"
+SRC_URI[sha256sum] = "00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf402f1eaeec086d82"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 

