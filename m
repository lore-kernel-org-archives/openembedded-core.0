Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88356CD37B8
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:29 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8165.1778224348890459769
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EnIgVxdE;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so1462471f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224347; x=1778829147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ypa7iWc2XxTgMme0FQcU7v06Fm+KDi+acHzfH8ysU4=;
        b=EnIgVxdE9q/E+PxcTfoos7e9RWy5lFfjF17PLWYzYHfJlhuysSTkajXHZ1MPWsXipp
         SBapFMW9n4WEYGHM7zgZuNyLnPvGrKEhq0PDfdLlm/kGlxsANwhnO7Fuk+W+E3RrPDxs
         Ghx5r3zqwIPUE6FidyaA1IIMWltJxjJANCGMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224347; x=1778829147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ypa7iWc2XxTgMme0FQcU7v06Fm+KDi+acHzfH8ysU4=;
        b=lgxOnVDh9o2HZvvTXOLoLwc9JAIHtgzmT2mktJDTYlHZMfFNQupur9H5vBDojgidxC
         by34Cos9U4+rtP8r7t106eu8X1ULgHa0G0Bxl50COZhfBtyAWMRWuvYJwaX1EmKI25/t
         D0wOnpKXoOowMyUR3E71HsqCF6QhqsvwpFJBOwjG1JbixhSjxszSzQZOagYIYm748TrR
         pUbPLB3yE0pO6I/Ju78HRSvVkUtMX2zVw69IPEXJsSf7kURjuDQTXZxe3rqGFIxQnwL5
         C9n3kxaX4VYx6YGsGjqY945fnVnoW7O+F3xtE1+iLWsYnuY4oSE42kBpFFqqPOYOlw8Q
         dmeA==
X-Gm-Message-State: AOJu0YzEs+FYugQalrhnUanVeTvrpYqJLTHr7ywDqWmLpjv+/KvuAkDt
	xwMNNwez5g04ulGKR2Hc8e0tRMeZh3SZsz6UG33m6UJmbUGLmlvZS5IJ6CBZ6zJ+u/TXGwzY8Cj
	5x6kIWeQ=
X-Gm-Gg: Acq92OEpUcrY9QCkDRXt5AcFCgsThP8zboufZr7qRFRE6q9IqVR1lVQqWrFjQiTuJ9M
	YApHo5PiGZV1ASkjY6qSHWM7lY+aCPlxBQKsCsUPNZ4Bp5PunNzNw7FAHwQXdrP21VCYhfdn4m5
	qWVbMPFMSqvOx8KRK/4OGXFRV1KJUrSdlV1zWJZ5B0qgk/IR0+Wkr23bNmaBZznj2HBN3xPeQmI
	etT3GpHY9LHVRVJ27jUmdJQ3d7OgSjLPDHc/ZLUdGqxpZtGDvIAkeGLKtdmHoULRK+k9MtTCSyR
	KlXegHbTQWRNTdEwhJFLswEHBaFGnRiJ2eitPy81ToJvlhig9oIUc6yi/fEIk9cjZYtyadqlfIC
	RLNYaLuE11pcanjjhZjgKCOlvdkSWdg4KGmvec6dQHwdOM+q2soodOOR46qKKXBGHfVqVEux/U/
	cQgxawPK1BKmbUM3v+wpDj57XAnIrYSHbFiqZJrtypwVgB3qOMXqsyl5eAlhsn11nazm0qn6tig
	WKTdZLCrybWA9b/47Vys87GWSt2FyNHWdX76fN/vbAKPLy/
X-Received: by 2002:a05:6000:2403:b0:452:f89e:9edb with SMTP id ffacd0b85a97d-452f89e9fabmr8810436f8f.0.1778224346847;
        Fri, 08 May 2026 00:12:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/52] gsettings-desktop-schemas: upgrade 50.0 -> 50.1
Date: Fri,  8 May 2026 09:11:16 +0200
Message-ID: <4cf21a256ab5b6efc04edf6e929df808238ee485.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236665

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog[0] 50.0 -> 50.1:
* Update Serbian translation
* Update French translation
* Update German translation
* Update Polish translation
* Update Polish translation
* Update French translation

[0]: https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/-/compare/50.0...50.1?from_project_id=1669

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit a63907b11bb23105ed2b5086489398ce65f41c46)
[YC: added changelog]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...esktop-schemas_50.0.bb => gsettings-desktop-schemas_50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_50.0.bb => gsettings-desktop-schemas_50.1.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
index 5fda20c6c37..1edb548ad6e 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
@@ -11,4 +11,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "358f07cb253727650e132805df3c69f7bf90448040bce171b6f6f2cb1b9c37ef"
+SRC_URI[archive.sha256sum] = "0a2aa25082672585d16fcdab61c7b0e33f035fb87476505c794f29565afa485b"

