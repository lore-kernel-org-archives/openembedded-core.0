Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A533C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:02:27 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.12439.1641927746554562724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z0p1h6iz;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so7022860pjf.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eY0RdZ85gjVqVds6qANM2auPmtvj7KmBPFodhJmllek=;
        b=Z0p1h6iz5u/xzzfq92mvYL1KaFgpoLMPJ9TdTmbEcKjKqsh9ZEp5Pk2ZsjIVLlPh3c
         fS5FPzQfp6bvN014q2sHjMlLJJQwSUWZQoFyGZNV7RxOk4917dW64uTeqymYB20m7fbD
         83lYBLyUwYdfsy+AYiP588TcP52Gw8xdprS1e6LUNqMOIyvxkHzroK6DCo0M+9oWbTfP
         Tky4xj5zXevXnZuTBH5Tyq0gm/jN+k5rzpUHV6KWYa7c7L/skKcxRf6ae3XGDmbA9Yoq
         zD0AP/vOQ+deDwS1o56NHEYvP783fJNUjKVbSDXgXBuBXHrY78mNTOWFNhHUxRIwBD6+
         YmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eY0RdZ85gjVqVds6qANM2auPmtvj7KmBPFodhJmllek=;
        b=UlugZrEBue6nK8jt/kG8vLncxpwRPXneHUe/VGK5WY+JHFpF2F3sTm+kzGpo2MDQc9
         RY2jo7IkKil8pbUiUL44JjFUrmM1NIB3ul+V1+9dzyeTyuyA0ItswH/mg30G2zocKP5o
         af+3itio9t8WohmZvigi8U/d72fKUF2TNAbuCDC6I016Ll0nXvbEx5vQOD3FgiCBvXQd
         utDFpYtCzhMLJW7KaGCIs3a9maZAHmIoHorU/GUnWdAM7oC1o9SQnU38xjUOVb+1IWVh
         ppJvubdgoi7UvZBekCHQyvTbp+kme0lZ02HYFe4IqM4jdRKIz0jxfk/Tif81kSSW9sgQ
         rRag==
X-Gm-Message-State: AOAM533WCSIqV7CRdzSfRLXCqDVdZUh68cBh9vISpLcXAbgdOKtc3Fwz
	Ebrg4PBQ3+yH/fqOXreocnivikAcZ0s=
X-Google-Smtp-Source: 
 ABdhPJxjPLEdQdS0AfZHX+PQbx3jyNE8r5MV8y9q9nKNsIprmoP1Nz0J52f/VZ5QsA5cahymi22VhA==
X-Received: by 2002:a17:90a:1108:: with SMTP id
 d8mr4522693pja.175.1641927745344;
        Tue, 11 Jan 2022 11:02:25 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.02.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:02:25 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 09/22] systemtap: use setuptools-base not distutils
Date: Tue, 11 Jan 2022 11:01:18 -0800
Message-Id: 
 <95b25ad1b79b7562ca90db358d2dab9a45f04417.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:02:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160445

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index d11d9b93a2d..04f7e03ab50 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor,ncurses json-c"
 PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,python3-setuptools-native"
 
 inherit autotools gettext pkgconfig systemd
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'distutils3-base', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'setuptools3-base', '', d)}
 
 # exporter comes with python3-probes
 PACKAGES =+ "${PN}-exporter"
-- 
2.30.2


