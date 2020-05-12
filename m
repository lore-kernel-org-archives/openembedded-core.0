Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.7713.1589296330385301068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 08:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WnRxUqDc;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id z72so14176367wmc.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z6wzbHLl0guFStdLsKIR8zbzySuTcFVVggYNMzR176I=;
        b=WnRxUqDco3wQ7zukXx817/QiD3MC31YRUJbthhx967jSZe7Ls7AJtevTj2t3oK7d6D
         NL9ub9YWx4MQuI7D49Gq1babJp4fzWY1+1f4jjmPYKFsuXQPh5Ke4LAwnrp0n2uE41WC
         di1zTt3jlfpkw+AqywXMBBfaW7K4RK0sWIAd4QlDaCCCLZej08dDZ0GxSip1dMqglUd2
         +XOMwc8xqmZ3rusp7f0LzWkc/igezfEUYyXDMJerZMBbEf2fj/nwfpgiB3SHqgxgL1iZ
         J6z714D/P/TDoMrrzKooaYKWaWM3yIhtB3CLco/fF3ueMcfmwYlFnS9QQC7dIjb57JTo
         ouMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z6wzbHLl0guFStdLsKIR8zbzySuTcFVVggYNMzR176I=;
        b=s6KjX8ua8iPsk+/sQr3Ht+VdSGOCoeTqte3Q3mv4fOZ9u1f0Cj3hhUf0N3+ICaSIO7
         kH8bGmwqeFUFqZyD9s9Kfcc63evVxycxITladPhUzZt3CwXIVxMvy9GRxj3scFlFvWxT
         HZqmQzkiNipQZMcOCECZuVV4+GHzZybIsmaB/jz5IQmo1FgcXqsWu543QlD/18m99mPL
         +1tc6A6ambDZdFi4YKRMN7m8EfWTjpqCIqqUETjSpZOVdTX7YB5BvrhrP+oPFB9IGL8S
         Es/QkFmF4rD/Fap9Liue6Hg/1eyCMWXQOuMFCAJCwLWhQp1YWndksXsMDhKjbVyYd450
         K0tg==
X-Gm-Message-State: AGi0PuZZZIXM3qaBX7Fc26zHEqpxdL4phnyOlY+oUhVUNtkwpYBzCbti
	NqHU1fFWyulxeM8R4Ow0mb/loT7i
X-Google-Smtp-Source: APiQypIM9iM5g//wJuVZ7QVtWDWHLPCBv3+1M4xghFPGHtPRNy5LeIWZwNfDc6I5lFV1SRiv5sXS5Q==
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr35699234wmh.141.1589296328763;
        Tue, 12 May 2020 08:12:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id y10sm20520193wrd.95.2020.05.12.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 08:12:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/3] libsdl2: enable opengl option for native/nativesdk, subject to 'opengl' in DISTRO_FEATURES
Date: Tue, 12 May 2020 17:11:24 +0200
Message-Id: <20200512151125.30472-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200512151125.30472-1-alex.kanavin@gmail.com>
References: <20200512151125.30472-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows virgl support in qemu with the SDL frontend

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index c1c941e452..83dce86801 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -45,8 +45,8 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
 PACKAGECONFIG_GL ?= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
-PACKAGECONFIG_class-native = "x11"
-PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG_class-native = "x11 ${PACKAGECONFIG_GL}"
+PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${PACKAGECONFIG_GL}"
 PACKAGECONFIG ??= " \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
-- 
2.26.1

