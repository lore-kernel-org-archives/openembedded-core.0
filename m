Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496B3CD98D2
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105037.1781424216033646967
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G2IXsL23;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b7866869so23584705e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424214; x=1782029014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYrivPrWrrkTzgL3Phgr4P+LEv6up3m0JErw/Oc7d7M=;
        b=G2IXsL23jHvY6LTAXRmt3/hxpYst9uH0bDaJpyJT8H3H1OtptFmV/VX+0yPVWBQyPq
         wvkBTVr0b07mA8dPxVaJEyT6aYfq7jV8QTJlIqZRj4h2nhTklEVX8osVQ3eIrQ8EljcJ
         f2ZbJkG11QWwUBr+er0UF0bhejPDq7aaOeJso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424214; x=1782029014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OYrivPrWrrkTzgL3Phgr4P+LEv6up3m0JErw/Oc7d7M=;
        b=F0CkoG6dUo5WFqzgMX4luwaMpZi5cUYT60ZxV4iD1QkUKLc19Hhmi63UGqsRX7AiRe
         nE/V2M7x9WU2u0oDeRLJCk+ot5xE2Tb/D+UUu0PeCLbGkuKX4qdT11NyPJ7lrbkDpLS9
         mAKFKbztJs++pllsgvvWDO5003CBYWlFW2flF1aUesqVzo9RrqT7vCOOK7A81BHuKGnS
         CrtArJRjY7vCim6TuQ+wf4tazqCr+lsEGrvrdF74u5pvR0evIxJOPdyLV3Ls4zVFkRXR
         L5kxMiH1OwuXGzdhVHJFm6h/uJHB0Qu04oZc2ShPA3gMi7DVobLTWYO49ESD73Jqcs25
         lXsQ==
X-Gm-Message-State: AOJu0YxSjxDD2+yRzmzcngpHFLAD7cFIp8DUK/oKSiucIMV0KGhIlK3f
	J/kMojXyaZonc91tr8kwEjuYw76ooSavpSAtuGd4AK3VR++SCUt14kNwuumybtl+9wOFapBEM2e
	JdH4r
X-Gm-Gg: Acq92OEnaKdKtjwDOicAV8vYvtqxVqz7KzIuSgJ1p9YhN5w2mNjQ2kcAju8LGarQFWC
	a/OPLyqoGOonumPcROa8TB5U/sCwaSQHzy4IZhI6Db+8mdZQPlMVET3AcKLDvCnTYI478c4D6mP
	rPE8PS01JRpuqevS8SRn6dWMQCjZA4xyvcItsnNhVzBp8cqeyxuT/80RAAA1D3vGxFhVSlANam4
	wvb6TD7Yk4eOGeyp95F1YR3CswpIjW82yp4vTsa8JNTzhEVtBtLNpiT+olruZeTi7W2zB6yTkak
	S7pJIQt9OPxTC44Fpq4hzL8g/twePgUoU9mFPysVgBS5Pa87NQTkm1oQklK3W/6wU6V+HEZi/9V
	UPv6thmsNGzHbN4HGmHjOCpsZ+vZV8QDwyiDIGrNII85mcL0jEL8VG6TuaQNlhaokUPEo/9K3Vw
	DhVIWJvpplCqdoeu3uA7Rwx/U6m7V3Io7TAkF9ghgSS+qk1sXd5qlcoI0EHeE3fHA=
X-Received: by 2002:a05:600c:4693:b0:490:cdb2:fb5e with SMTP id 5b1f17b1804b1-490ec504d88mr139305975e9.22.1781424214270;
        Sun, 14 Jun 2026 01:03:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/56] libadwaita: upgrade 1.9.0 -> 1.9.1
Date: Sun, 14 Jun 2026 09:02:27 +0100
Message-ID: <20260614080307.4017177-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238700

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libadwaita/{libadwaita_1.9.0.bb => libadwaita_1.9.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.9.0.bb => libadwaita_1.9.1.bb} (89%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb
similarity index 89%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb
index 6236d075fec..cf4fe6b45fc 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "817837bf06363db5bbfce66085136eff1436af6625dfabff3ca08b87bfca1b6b"
+SRC_URI[archive.sha256sum] = "2ae34dbb3ea56d270925707cefa36050482ec88a741f1810b7619a5377c41a66"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"

