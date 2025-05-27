Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98914C54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 17:08:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.946.1748365681501409172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 10:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XKdgs0YM;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a37a243388so3672371f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 10:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748365680; x=1748970480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wpwzkXzBqltB5qvgHKAgpl2McKz07bzbNdlcSwTqTHk=;
        b=XKdgs0YMSIBQSx/JICrTe17OiL/RJ7+ex5CdQXjA6KLtTuCka++10y4AR+A/yfniNy
         AzXYPvxYTIlDgMpuMs/nE74NsvyFodfkLYuxlVdQ0h5MW7Nt9oqyy+rDxOdeZqVWdfOf
         yha7yn4A0I1nr0420WAIlOE7ea1DdDXALmZbmtN6tPhiqY7GMY1e8P3DoTfhHR9aU5YS
         uRzqbezkemwQoyuHrdQXrZY5T1KtFv4aMioVGWhwtbwjWtUUDbX76G7a6UhqxMYC6E8x
         Ml/WC3OCTo8bTZw9mLvZUkaHc6fWsMd+SEzy5w93BU9ZPGgQJrAlWEnUEM4gisjDljMu
         Tn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365680; x=1748970480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpwzkXzBqltB5qvgHKAgpl2McKz07bzbNdlcSwTqTHk=;
        b=EzdthZrrqDIMBKCxWkTM0glETdJj+dATsRs3gHxg3jCYLAJN2kJmFecAPS3qpZZvdH
         xy8LSqwz96dph/HqILi17v33++gL0nXq6td2E74gzJ+ZfWwU5xCFWT0FShhjJjyCdZUL
         Q/yB/XuAbIWJYKL/cvtoSAIPv3HVPvWd5WZXaVgIKiUjlt4q1PlSlsybdk1b0aXcCGEK
         0Rcc9voE12KuVc1Efa/rRM48WPQVbhNOHzCYiBFT73njxDLbU/hmh6rjmc3EYa+38bk1
         k60NqbwX+oa+NCTBYissTbr8cbcpd9s9R32EsLC2haNoJOErVvm9C/8cHIuK2JCaLKvS
         +gvA==
X-Gm-Message-State: AOJu0YxeNoFw8S5fvWf3YpyumbfJr1nuMz0JBKFK/ZwLqRR9WgrmwQXn
	2YLlfBLXX9jKrS9uoxfxCjsB2Gcp/Nf/irJGdOOVXLw6CkD5rNLEsS4QePpwgg==
X-Gm-Gg: ASbGncsUABVZFr9JfmLn6uA54nsKU3dj/78NdSQLiO1c6sUL6eeaj9P2lJ/wg9GwiCH
	rjlIo3KBTPP/ClEczAY6alqei6K13qspPHevXyqsp4ICarGgC8HYfdvTPbovmVzFp6hfhO/ZTEh
	AkeM6xl6a+wTv42C64fstXHuyMOBU/UF87CwI7sz5nq7LWCs1E0iy7bMB4+uOu1oCDohDGGQvcf
	DK5MdN5lXHYMWjJYtwsAHsb35prRWai/4N69ijA1g6UvPCHPEC8tP+09hvvoawJ2O5Cz/c/UT6r
	mOQ9RwIXmY85ZD5UiSWXqG/UJTDEvRyjO/8kvYPHnppG6kEJ3RXRP3ImJALuc5nI5mc=
X-Google-Smtp-Source: AGHT+IGFT6HFs4xU2g9D1r/5Eq+y0htvX3EsyWlx3NKq/IRKrNmqb42VK2/m6GY75wtteWDuDvSnBg==
X-Received: by 2002:a05:6000:26cc:b0:3a4:d653:8a40 with SMTP id ffacd0b85a97d-3a4d6538c18mr8772487f8f.5.1748365679691;
        Tue, 27 May 2025 10:07:59 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d8d945e0sm6808746f8f.94.2025.05.27.10.07.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 10:07:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] conf/bitbake.conf: use gnu mirror instead of main server
Date: Tue, 27 May 2025 19:07:58 +0200
Message-ID: <20250527170758.2040457-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 17:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217317

ftp.gnu.org is the main server of the GNU project, however download speed
can vary greatly based on one's location.

Using ftpmirror.gnu.org should redirect the request to the closest up-to-date mirror,
which should result sometimes in significantly faster download speed, depending
on one's location. This should also distribute the traffic more across the mirrors.

This information was sourced from https://www.gnu.org/prep/ftp.html .

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e5037c6277..13d55923b7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -699,7 +699,7 @@ DEBIAN_MIRROR = "http://deb.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://gitlab.gnome.org/GNOME"
 GNOME_MIRROR = "https://download.gnome.org/sources/"
-GNU_MIRROR = "https://ftp.gnu.org/gnu"
+GNU_MIRROR = "https://ftpmirror.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
 KERNELORG_MIRROR = "https://cdn.kernel.org/pub"

