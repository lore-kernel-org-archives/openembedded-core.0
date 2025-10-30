Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C8BCCF9FC
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 09:23:05 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.22494.1761816179507921779
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 02:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H6Yv4LQ4;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so188882066b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 02:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761816178; x=1762420978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4DCSc7wx3ABkgyouxtUsX+J54Tnf7ioI74SZVPxYrY=;
        b=H6Yv4LQ4HxoKG5fJQMu9FYwRpnHzrHp3FhyXhTaTJ+0mS27HJqndfzErNFU/gJkbcS
         aNMKBqw6Xo+wXYplKz1r6BfYPdK6G0XNabtxE9b2oNj7b+UL04WJZcom5qGIfDi5m8Px
         Np13N3utd5BUg+YJRBPSrbS06XkOUqTze/2pOC+RlQ24yM/1nK0+pTSBY1f6FDA8po9E
         cy5dVTe8gv/0KTDFLBR9nbBn6yexwkT94vWHhbMStAU71JmKJR5qJ+EPEwJJNyF0MXUN
         EttA54I/vMhTjO+aRl6I/kgWdpBqVcBh2FqqH45W5aV7oem26mZZN4m6OYVw8Jp74oQF
         4wcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816178; x=1762420978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4DCSc7wx3ABkgyouxtUsX+J54Tnf7ioI74SZVPxYrY=;
        b=rUc3sF+dEwDRvlqb9MSvNZSPu+NLdEYrJo8TY7OkvtZYSo+hZxbQWGBfeRz3YkPAC3
         s3DBM/IwoRNGSkp8zGEkzCG/f2JDT/TqJJwI6ovpg16GN87Tjn7lZdQzgCtLZTtaAzT1
         EyUch9c2SjNUQW1MPHeyPas9nElHgM/io47XIOvfmCfn4j5lm2+Jr9wxcuYf6F7PSBPB
         F6I5rWpsGdmTVRZsjLtGaoYA7z+Io4LG8Iz6M0fgudHFng4X9fgp0XuNKJRXks86LbWb
         Ypcw1CyHReLiWAcEHdvbhY+ytc77ecHvSVLPcJJwg0QERwGzqs6XWdAwYKbbFJvXAzmr
         pBZQ==
X-Gm-Message-State: AOJu0YxibW87j9NAUwvXpOf0rRTQigHdmRjZQJdMmAdC2Izp8G3Pac6N
	KXcdtHpA7eQVyZlgFrCDYmK+G/RATPU2o7wXiHoRLpqmNCvQQawxkYlie6vdrg==
X-Gm-Gg: ASbGncv5DwudceVCTSfLpbCXyl+rt8KPsd6WkjxvQqxeSw7t4UJ5DlyvUggTqfxVOmA
	vw09+xBHWYKPlmDMXP04oStUlISO0I8FZ7+O9qLVLuSaqmqr2VN1ECypslKnEWpH7Uba5DO+3QM
	zOhF/xfW3P3ILTdKPY/TwEwBnE/n2GfIO320NOuhRix38uxFu/fvvf7LGB6qsExUZt/eMIe3vsX
	SfUdVxleGqyuGtYNovSe3MbADQa7FtOAUbS8Oa7eQesmJ0G/e4cmtXF+TyxIBetJFAeTeqrlX6W
	ruu4QD/JpNoA2apncKGzf0uHlXDG8BJWPN86b+9cBptXeNlq04pcbEz2uEhA8kMxADTjuKnmTw9
	Ga0vR2pE//pwX9rDjmShqRNwvhYwLOHYaQ+ZCNbClP3R/+PNyjTnFN6ZLo77/2f9XXesZUFnBCw
	3XD0oQWiG0xcruhWHxo4qfPtnzCuhSHq6eYOJAsk/i/ipCDriqj3Wqfnr7Ebz6bDHxL0Htt5jJT
	TvkgBus31JW6xrOTyk0xxy1SjhZ8QZfyqIgdcg=
X-Google-Smtp-Source: AGHT+IHyYbDOZpzYQqb2C8xL+ILnMCBw6y+P1kKFEM5NxiwTbh9rkI+rldtMajDjeXhkTIPLNHvuGQ==
X-Received: by 2002:a17:907:971f:b0:b5b:2c82:7dc6 with SMTP id a640c23a62f3a-b703d4f7df3mr617343166b.40.1761816177792;
        Thu, 30 Oct 2025 02:22:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308c6csm1742469566b.1.2025.10.30.02.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:22:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 4/6] fragments: add a 'root-login-with-empty-password' fragment
Date: Thu, 30 Oct 2025 10:22:46 +0100
Message-Id: <20251030092248.723968-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251030092248.723968-1-alex.kanavin@gmail.com>
References: <20251030092248.723968-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 09:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225482

From: Alexander Kanavin <alex@linutronix.de>

Please see this for background/some discussion:
https://lists.openembedded.org/g/openembedded-architecture/topic/115913545

Care should be taken to not enable this by default, and especially not for
production images. Poky and oe-core default templates did it, and it was
not a good starting point. Hopefully the fragment name, and the description
that users will see when enabling the fragment will provide enough warning.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>

---
v2: renamed the fragment: root-login-without-password -> root-login-with-empty-password
fixed typo in description
---
 .../yocto/root-login-with-empty-password.conf          | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta/conf/fragments/yocto/root-login-with-empty-password.conf

diff --git a/meta/conf/fragments/yocto/root-login-with-empty-password.conf b/meta/conf/fragments/yocto/root-login-with-empty-password.conf
new file mode 100644
index 00000000000..86aec0e152b
--- /dev/null
+++ b/meta/conf/fragments/yocto/root-login-with-empty-password.conf
@@ -0,0 +1,10 @@
+BB_CONF_FRAGMENT_SUMMARY = "Log in as root without password on serial console and over ssh (use with caution)."
+BB_CONF_FRAGMENT_DESCRIPTION = "By default images are built such that root login is disabled \
+(which is the preferred, secure default). However, for testing and development purposes it can \
+be beneficial to be able to log in as root, both on serial console and over ssh connections, \
+which is what this fragment enables. Use with great caution, and ideally only in tightly \
+controlled local builds and CI testing environments, and never in artefacts that are deployed \
+into products. \
+"
+
+EXTRA_IMAGE_FEATURES += "allow-empty-password empty-root-password allow-root-login"
-- 
2.39.5


