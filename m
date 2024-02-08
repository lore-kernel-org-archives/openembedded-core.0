Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB48C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 19:32:37 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.5001.1707420749193227662
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 11:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O6AgD1UF;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: uvv.mail@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d09faadba5so3497961fa.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 11:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707420747; x=1708025547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UkIXFXhaWenXX3GckM1PWYLoNi6cGbN9LLi9ZGKHrpA=;
        b=O6AgD1UFDoRb4bgZ2FOffSqnQjLzGuhk1sMjGeQaKz6vJmLgrSV0xwvMXT4kIaBIL2
         cZB7hj/E6GWoyAhQa2OeH1G5DK9U1FgWQ4FetuCAF9ecQ+Z8JmZ6n2RzI/SrYcYbeMKa
         BNUcJGboSzdlU/wU7zvOdl/O5EX1cLW1XrJS44JA4DEH+tJWm2BDuj0UiU+h9qmTqs95
         2Ef6bw0dsSqxcleqNwKMZMD8l8KU6ag8l3JDvgKv80hkc9BQUAnVkMIK2KETPrW2KR2i
         QABFs9wAt03kPpeI35yGOIkbcsQPQ4TesuKaXsg0i8H0WPebq9CMHqSb6JJeYFulWwA9
         sJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707420747; x=1708025547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkIXFXhaWenXX3GckM1PWYLoNi6cGbN9LLi9ZGKHrpA=;
        b=cKbPs9oNyhS+7SBgV+3qnJ8cOkjeViGkyVvr3yWc5ja/D/SRNvOdLjEMaBof+NPVuf
         i3VNL9QnMxOktAah9Dpn2qCXXkxwNjp36W64a7dku63jlCelHnra2Ms7FbnCVNClOfHM
         Kbo3OLYAgvjfHyfG01U1xT0BEdypfFWRIIHdQvqFaxAjcUpIfcsSJ6yuQBxJUKl6kqgn
         8J4Vr6RDNUkOqpeNM5KyBiSfkOzkJDH8cLMqt7ZYbtBSDeFOK7jKT+PrGEHH73C/jsCj
         rKN0sy7ZRZnzVshISwiiaeH5Td2aCdM6k5nsI4EVb3TFHgioLefS6wCJaHalgtaFHeCT
         bnjQ==
X-Gm-Message-State: AOJu0YyUMp8nT0MkoI44Koq5oFLeIJGL91I0SiO59WxpBTvP0n077quL
	c8DQQdBxeSkOCuhwaRAW4xUCuiRVG4WMLdnhZ277DDfz7S04ondog+nLqG3zjuMtEg==
X-Google-Smtp-Source: AGHT+IE2Fq93kEYjB7rGvBg20GgzDiGU+zmiovinB2RwQ4wJ/MO+enqTdgOkBP58WFOZ3Zkv+1VoqA==
X-Received: by 2002:a2e:978c:0:b0:2d0:8f08:6a5f with SMTP id y12-20020a2e978c000000b002d08f086a5fmr229535lji.32.1707420746683;
        Thu, 08 Feb 2024 11:32:26 -0800 (PST)
Received: from localhost.localdomain (dslb-002-205-236-172.002.205.pools.vodafone-ip.de. [2.205.236.172])
        by smtp.gmail.com with ESMTPSA id k11-20020a056402340b00b00560ecb22d49sm37241edc.84.2024.02.08.11.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 11:32:26 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] shadow: Fix build failure on Ubuntu-20.04
Date: Thu,  8 Feb 2024 20:31:36 +0100
Message-Id: <20240208193136.2746829-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 19:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195175

Don't use systemd features for native build, otherwise it failes with
following error:

../../shadow-4.14.2/lib/logind.c: In function ‘active_sessions_count’:
../../shadow-4.14.2/lib/logind.c:38:55: error: parameter name omitted
   38 | unsigned long active_sessions_count(const char *name, unsigned long unused)

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/recipes-extended/shadow/shadow.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index b8e5e285c4..5029ac4ca4 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -43,6 +43,7 @@ EXTRA_OECONF += "--without-libcrack \
                  --with-group-name-max-length=24 \
                  --enable-subordinate-ids=yes \
                  --without-sssd \
+                 ${LOGINDOPT} \
                  ${NSCDOPT}"
 
 CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
@@ -52,6 +53,11 @@ NSCDOPT:class-native = "--without-nscd"
 NSCDOPT:class-nativesdk = "--without-nscd"
 NSCDOPT:libc-glibc = "--with-nscd"
 
+LOGINDOPT = ""
+LOGINDOPT:class-native = "--disable-logind"
+LOGINDOPT:class-nativesdk = "--disable-logind"
+LOGINDOPT:libc-glibc = "--enable-logind"
+
 PAM_PLUGINS = "libpam-runtime \
                pam-plugin-faildelay \
                pam-plugin-securetty \
-- 
2.25.1


