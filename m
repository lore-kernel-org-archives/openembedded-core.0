Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877C3C3DA4A
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:22 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.31705.1742141541943072711
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YdfDmvwx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913b539aabso2317397f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141540; x=1742746340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5rH1FtDIBFJouPcmi4sHFNzf977JxfPVFt/LR9QkLM=;
        b=YdfDmvwxYjIYG4/Pq+P2ulga3OJ7frXRvS8Xkr7+3jp+v7xjuLAoB6vYu1peKO3Axv
         bBFK+fdOQ6GPVlw6ICniVN0OfNENFgu6cBwDNeuhKLuSnoheSC3Fx4gmw8Ni+5AAg4it
         8rwu+mwPe7UA/YyColeEHYj9DOFBGB1W4E9yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141540; x=1742746340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5rH1FtDIBFJouPcmi4sHFNzf977JxfPVFt/LR9QkLM=;
        b=RA/jDT03/6REgR18XSS67AnMGaV51Fnal90ENKWxtwffpBiqDO1O4AxHTE8WI8k51b
         Z2yrNHtfjEGTyshkDcSBURnT8kDWuKLsTa+x6o/rb0g4HSYJShBm2URwxx0zrWQcA22Q
         G3BagLChM5uCz2qfv9AlzY+5Jf83fce0hGphvATk129xmsUPgIfWytWCr319JH45nxXP
         o4D79wWYeRLvxXpEds+N9dU459fPXRM1J7Msr4tVoV/WZfMqljHH8Ys7uiHcD0VKDeqQ
         2guBFXK9umvXXgtwSULKPW2Dfkson2aeYIGc+AplCnV25Yf2rCfp6R575XqUD3uVd+P1
         olNQ==
X-Gm-Message-State: AOJu0YxGtq9SKa/AvAzVgk/4H72qeOOoKTnzHHAlfjyqjNfc0VtxUWZ5
	nG/8DrBb/MtFKHfi+4bcV/SnAHtI87WQ2SWcqHX7/JiilgpxbAjcT/ViqUzfgLuGSvo32SSe39q
	+
X-Gm-Gg: ASbGnctA+BgrE+y4qvlHG76xkzOyfDdKGgeh/ieaVVghzIKnb2Bb80GHbv2MEyXmDcU
	77Ujhfg279GV1goKYV2qMQZaOP0V1hkdmw3tF3j72Ze+I0RWMyZQmOxAY37xtJfNoRwo7nlulUR
	+h5xmA+Gu2cM7AzgjFaK4Bs1YvmIwxPWh3R+ZYYTi+0WC0HAqKzVsTkWA1/UMS9iRziJU4vmV34
	UPeca8ix77mJ0TUw+IwfX6FzjQK4MMnvVR/xsyIEcBCv6yp38z4BqHeZ4nQ9X7BS8NCM9uKuG1L
	Y6uvPqORyVHaWHXIB/jIiFYBwW3BMmOq0Pr8h+RH2XdYEL2lcqEvUDFMA3FGbjLRYi9b2BQOyQ=
	=
X-Google-Smtp-Source: AGHT+IHNYQwKUbbmvD0KSTJkkXyFnNIhJJzAXcv3PZAi/DWy8fZEyQRITfkYONT6O91YK/Gc0lI+oA==
X-Received: by 2002:a05:6000:144a:b0:391:30f0:1704 with SMTP id ffacd0b85a97d-3971ddd89eamr9589124f8f.4.1742141539679;
        Sun, 16 Mar 2025 09:12:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/43] ghostscript: upgrade 10.04.0 -> 10.05.0
Date: Sun, 16 Mar 2025 16:11:34 +0000
Message-ID: <20250316161209.3629986-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213011

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ghostscript/avoid-host-contamination.patch           | 2 +-
 .../ghostscript-9.16-Werror-return-type.patch            | 9 +++------
 .../{ghostscript_10.04.0.bb => ghostscript_10.05.0.bb}   | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.04.0.bb => ghostscript_10.05.0.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
index 0546fdf8f0b..d191231c7b3 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -1,4 +1,4 @@
-From 095bb1db8b2e68cac40e985f347a7039573e1e80 Mon Sep 17 00:00:00 2001
+From 85905ce3b1bc63f0be9eda9888e40d8e7a803d21 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Thu, 29 Mar 2018 16:02:05 +0800
 Subject: [PATCH] avoid host contamination
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
index 8c4a5d44e39..0598c3dcd2b 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
@@ -1,7 +1,7 @@
-From c481b055cd464734a3c2d80719ead4c1c92a40c9 Mon Sep 17 00:00:00 2001
+From c23b787f9a38be2cdc57133915c402b69acedd1a Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Mon, 4 May 2015 22:31:48 -0700
-Subject: [PATCH 02/10] base/gendev.c: fix for -Werror=return-type
+Subject: [PATCH] base/gendev.c: fix for -Werror=return-type
 
 Fixed:
 base/gendev.c:80:1: error: return type defaults to 'int' [-Werror=return-type]
@@ -14,7 +14,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/base/gendev.c b/base/gendev.c
-index 59d5999..7766b08 100644
+index f36cfe2..031f30b 100644
 --- a/base/gendev.c
 +++ b/base/gendev.c
 @@ -77,6 +77,7 @@ static const char *indent_item = "";
@@ -25,6 +25,3 @@ index 59d5999..7766b08 100644
  main(int argc, char *argv[])
  {
      config conf;
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
index 546d7343338..1d05945c30d 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            "
 
-SRC_URI[sha256sum] = "c764dfbb7b13fc71a7a05c634e014f9bb1fb83b899fe39efc0b6c3522a9998b1"
+SRC_URI[sha256sum] = "56e77833de683825c420d0af8cb90aa8ba7da71ea6fb5624290cbc1b53fe7942"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"

