Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B49CA0EE7
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 20:49:33 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.7051.1755118172622091004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 13:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F7eFCInf;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b1099126afso4420631cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 13:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755118172; x=1755722972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nM/hJtI0HX3X/2IvK/tuOTYMQXKdth0KmB7RXeg50c=;
        b=F7eFCInfn2Y54QdlFJTQtXnJ4HYOPL2TnRRFtHW1zSA5kQDgb4zohZSEPoGKhbScLy
         13S0DRJAlAEJmmXHkmsfn6nfQ64QeFinkeYKuwRBjBgU5rN62XIpWZ1tUWXyd9unoaoV
         d6YxGTbL8dsdkJ2g0ykoI0nEdMKSokmcmO8Ylnt8kRaIyBhlhM/iBSOOgmmDhW2SJ/YO
         0AlGPMcP07ZGsK0741nYVGPWUh8dfZmAU7gN3ttft6Tyq6cbgTQAhWgq8Mb16NpjCQn5
         Ufup0bpCp9EnoZwyR4L4P/ye5m0H0GiNYUMsOC2yNgPlh3NVDrMlaHAIpdeTINpOqMuP
         GnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755118172; x=1755722972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nM/hJtI0HX3X/2IvK/tuOTYMQXKdth0KmB7RXeg50c=;
        b=BtssA8jwYJfAde5Z0ZqW1Z73bYQMh0XkAG54nkID/XEz7HCosYhlrBNFEJykGlv+th
         fzSrYIAcx8Ot+TwsdHqXbo1xu0dLj7FVdA6TWXcfm+QNkLoqcK97yrYmYCZDJu8w6Xbu
         lttXzuXzTest/SZ3Wk9iqom+z/Z5U7nEu1hukMVCgmRJUX4ykD/0oUsUEaOp86q14JRa
         qXyhTCc/6v/xOGtjcRbDlCY3cCe+Pfgv8OGExJaqF5axwPDiPAbsKSRp5M78x+FxVJes
         LOvkT3LcY/lDvcbGtKzwAsS2biHH0S/CwIyE6+MtZhA7lgC8thrcE21Kh0qB7NjENSGF
         skwg==
X-Gm-Message-State: AOJu0Yx1h5VhO36lJfXyIbz45ShJFJxm4BSEWq2lAlo9ER2Uu2g9uygS
	rEAUnliQmFX59oBz1WR0tvTkIjjIk+FZUNh9aEdlMMFSiIoSMlIQeJ8aAF4N/1jG
X-Gm-Gg: ASbGncspnLupbxV3brgBSDATcSK6yGeF3TcuOZLX9RnONjG2ASFpX5TfSvGtvavufDu
	7fXtasdJpE3P6anMbrZ8efiJf9ybAOo7mtymNpgMcc9z0zrAr58WeQ0I7zI9egICiY0K5jk3pn0
	fbgvwhYdhFECYXZMcDym1ykChPAAl6i/dATRU56cASZr8+CKpUrQs2UsxEXZV6ki2nWzcv0N70u
	kfEpH8Sf++d6JxJGhyKnxeLM7HfC/Lh0SCSVl0zVRTLxDHmyKSOgSArcIgXlAR50quqt7zyeQIX
	AaT+vi3SliZArpq5b/3O/M8YVqQJKuEaTRxLLLRTiZKBnGeb3zM40F0kI/CmwpTOuWIkAKgCb3r
	dRCusr4DNArotN4AwymfM39j2A1jmsmL94nipOL1IAlx3kZLAYzeodQ9cHYbbiBrud/Y9ttV6XM
	AwylAApSi8SbrcdBU414Qn8XkzqlfM8Z2CQQ==
X-Google-Smtp-Source: AGHT+IFZuYIVvFIxce/mGVtdpfk4xzViJE5TtVajKGb2UK2rQq06hqmTUMKJtOh3wLMm9ITZjF1y4A==
X-Received: by 2002:ac8:590e:0:b0:4b0:7950:8cdb with SMTP id d75a77b69052e-4b10abcaa14mr9003191cf.31.1755118171465;
        Wed, 13 Aug 2025 13:49:31 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70af5b07658sm3326516d6.43.2025.08.13.13.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:49:30 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-libc-headers: update to v6.16
Date: Wed, 13 Aug 2025 16:49:19 -0400
Message-Id: <7e13ec7462482575bc4f2331e17c803c5f522b01.1755118020.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1755118020.git.bruce.ashfield@gmail.com>
References: <cover.1755118020.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 20:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221825

From: Bruce Ashfield <bruce.ashfield@gmail.com>

6.16 will be the reference kernel for the fall 2025 release, bumping
our libc-headers to match.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../{linux-libc-headers_6.15.bb => linux-libc-headers_6.16.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.15.bb => linux-libc-headers_6.16.bb} (80%)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb
similarity index 80%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb
index 70d2fd80ee..c3c77f8719 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb
@@ -8,5 +8,5 @@ SRC_URI:append:libc-musl = "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[sha256sum] = "7586962547803be7ecc4056efc927fb25214548722bd28171172f3599abb9764"
+SRC_URI[sha256sum] = "1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83"
 
-- 
2.39.2


