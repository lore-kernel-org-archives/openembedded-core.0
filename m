Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946A6C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 17:08:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.12602.1745687323421581465
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 10:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ctbz39Lo;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso3701252f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 10:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745687322; x=1746292122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CWY0HnxmRF9tUt6q5MYUj6cZMSCLcOsL3nPcjN3+FA=;
        b=ctbz39LoHAZoNn/ijPkIyMVhyIdMH+S/slwy4ADyB0KFVSS/+ilXtBPnn50FP7bBH3
         YnC4du7Ma2LE/NcIydf64UZlPWePMLX8bpyc6XcOBLrGrFr5t8vy8Kv3ojMXgP+Ol08N
         l3MGOhutVah7qh71XaYo9vS86KSXpffJKeJLQPvQxWFTUK/FUu8TaB8sfnQN6/PN+dlZ
         +RX4CghxQErZkEYInt5pCL8GQoU/TLt5JRWN3EzSxF4Pn2JA/SuDxywAeczFEMBYPxg2
         QS3Aq6iBS2It4fDj+b5S+ZEF2HUQNGvhH4oXDus9TnwJFb0izjVD9+J0NB45sCiDd5Rt
         ofYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745687322; x=1746292122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CWY0HnxmRF9tUt6q5MYUj6cZMSCLcOsL3nPcjN3+FA=;
        b=ZXGP/0r69SO0F0ic5UEFELBa5dI5HqckwQQThc3f71ffRDv0T1gFv2OneLc5b8Myq/
         +iyU/k4RThPLbpNVGDz07FNrsgJR68+9lv+CTjjvYb17XNKTutrVj/BYA7RwsDSka2NS
         VOMJcJHpT0/TiklK0QyG79cmKPJPEd2FTbj49IrK9q3qRzza303QKbbyTixjh5muUbHX
         aGEl2vFzZdd+R2LgnSGmkxsvlRlwf3pQIqhqt/3WvjGxVbWLM2RfGbl92N9QaHbpsa7g
         WqsOl2y5IviNdTnDuMzgXCmvzLOjl8z5xCPwYwhWorMx7vEe/6BLIF3IHZQvLceue0fm
         uK+Q==
X-Gm-Message-State: AOJu0YzclM+mabXjAiX9QRzhb+nDPqyNC1PqrAyaCdEAkj8Zz3meMcjv
	7sH7a6aO5CtWBLu6nkM8qH6VtKJwDlhps/lO3KrrKz9LDD0IbgLOiz+5ex32
X-Gm-Gg: ASbGnctt3QsuVBaJO82xNnq0WqMrlibJ1gUamuzD2/8G1jHVDz4ymvDtNhX75thebeu
	GCOekZI4yylJy1XeUwTXoPG1EJ+hWjXqU1xpNfgooZKEi9PlDg7ieuKuLbuDoW1AqgEdtkbVFG/
	9LhIdIjNVWPSkZJqSTaNdeNmnPF88yv5jdWKSV3K1ZqPdbGunVpSO036+TjZJ0I6MeAgSq8HO53
	qrVLHr9e127TYf9cVerH44zByiTS7yfQ9i/rhOBV0i0V5eMkIBfNMFpqzwtoENiVoarG/SVYn7O
	Or/xxAlwJixej2oXy+pQnVY4Txpv63Ne4GAWRTC5eW5otv65C+i67WwrCx1siu44QpI93k8j3g=
	=
X-Google-Smtp-Source: AGHT+IHp+uB1SEvusM+wkcD/QRWoT73QJHPTd6SeFf2YykUEDsEGKjIS7SeFDgCSvHms0E9lA98/mg==
X-Received: by 2002:a05:6000:18ad:b0:39c:2688:612b with SMTP id ffacd0b85a97d-3a074e143e9mr4943390f8f.7.1745687321757;
        Sat, 26 Apr 2025 10:08:41 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e5da4dsm6181287f8f.99.2025.04.26.10.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 10:08:41 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 3/3] bash: use -std=gnu17 also for native CFLAGS
Date: Sat, 26 Apr 2025 19:08:23 +0200
Message-ID: <20250426170826.2580706-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426170826.2580706-1-martin.jansa@gmail.com>
References: <20250426170826.2580706-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 17:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215524

From: Martin Jansa <martin.jansa@gmail.com>

* fixes builds on host with gcc-15:
  http://errors.yoctoproject.org/Errors/Details/853016/

../../bash-5.2.37/builtins/mkbuiltins.c:268:29: error: too many arguments to function ‘xmalloc’; expected 0, have 1
  268 |           error_directory = xmalloc (2 + strlen (argv[arg_index]));
      |                             ^~~~~~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-extended/bash/bash_5.2.37.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.2.37.bb b/meta/recipes-extended/bash/bash_5.2.37.bb
index 9f02ea17b5..2c0645cbd9 100644
--- a/meta/recipes-extended/bash/bash_5.2.37.bb
+++ b/meta/recipes-extended/bash/bash_5.2.37.bb
@@ -21,5 +21,8 @@ DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
 CFLAGS += "-std=gnu17"
+# mkbuiltins.c is built with native toolchain and needs gnu17 as well:
+# http://errors.yoctoproject.org/Errors/Details/853016/
+BUILD_CFLAGS += "-std=gnu17"
 
 BBCLASSEXTEND = "nativesdk"

