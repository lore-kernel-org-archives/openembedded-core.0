Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BD9C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9363.1672830368120524387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HF/pzer7;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id z16so16085614wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7jmdqNaEEBdNkouUvxF+BpvTWidjzPHxoGG+i2RXKY=;
        b=HF/pzer7WfK5Sfha4p9UO0YCmwih1PorJjOV8Y3OOfeSCKfI6ApaL4C5k0ahu1tKdf
         EwfCt2ijm75qH3Un7iFZxGBC18QsuIst8AR8Gyv//hG2DOg+jdcNN3o1ElzTe8lufvvp
         jMb6aJlb5cIfIuu8wLdRD99e9TbbEMJHv559XF8y8llNskyvrD5n+ICUJW5003JL5FOH
         s0jVnLdJo6jh85kbAtAWrxt00qqkB6wHgj5AhwjE5hrdWl2MF4RlnYRgckhEmQyc5hGW
         RTuigOHLMcWRELL0idmQp9ZNLjgCCUBpY9eit0BEdESm0uiEx9Rvl8wpj88ZR/+ALZIJ
         a/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7jmdqNaEEBdNkouUvxF+BpvTWidjzPHxoGG+i2RXKY=;
        b=m0bOmLZxFD6qnedG0U8iIiua/kdI5Q2unxDYyPfxNURRTAogwmZzZQ8sji0Z8KW4sI
         58ErRMUbcBROsEruMI90xqJfXpIjXzOSerl2XlKbARfflW2bfa1X+eU82UJH9LUaUuAo
         9OQOVyQlvmFePVwIaD36XBBdSySVoHN9EW6WK7FQhDCWZ8ptDySavhyBS7Z7RgRlxour
         9AfXolMlSX93ChYgKlbjJJWu4bCtZBZ+tBtLqwU5ufHeF3G4ORXoKzhwrGBgTvjYD/bc
         EA8RG2gbbbTHcVu9c4JwdLqkHzRcd140Ya/TWsQfrQmLvbN4XKQDbZef9BVKzPvV3bOK
         t8dQ==
X-Gm-Message-State: AFqh2kqPyNwUzhKhaMmUYAe++mXjDZeeOsvq/mNxHYFoOii3RWF9pTY4
	8k9MxuDgsVV1uCrWWfiKs+ufOsG7rFQ=
X-Google-Smtp-Source: AMrXdXsdaWMsy+tcLNe/8VFnf+nEmwNLDXYACeICmvjSh2+LEjsc/eLL+hbxjgQRkJNeBxzeu7CUSQ==
X-Received: by 2002:adf:fa84:0:b0:28b:ca44:641f with SMTP id h4-20020adffa84000000b0028bca44641fmr12651798wrr.30.1672830392158;
        Wed, 04 Jan 2023 03:06:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 52/77] gtk4: upgrade 4.8.2 -> 4.8.3
Date: Wed,  4 Jan 2023 12:05:23 +0100
Message-Id: <20230104110548.2537259-52-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175437

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.8.2.bb => gtk4_4.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.8.2.bb => gtk4_4.8.3.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
index fe18fa2ffd..747529a6bd 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
@@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "85b7a160b6e02eafa4e7d38f046f8720fab537d3fe73c01c864333a983a692a9"
+SRC_URI[sha256sum] = "b362f968d085b4d3d9340d4d38c706377ded9d5374e694a2b6b7e6292e3cba74"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.30.2


