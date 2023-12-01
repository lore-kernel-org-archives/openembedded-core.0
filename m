Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41184C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 18:34:09 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.422.1701455642786062546
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 10:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=juYFVQAj;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6cdd405ca77so2411918b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 10:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701455642; x=1702060442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZKieG5nRBjqtgSF5qSWlNZhynaQkVr51NbwFHbaHdE=;
        b=juYFVQAjw3U/YZMz+tnUBwSn7hHrhHfW9VPsFa+ssA9a55o+gsUGzXizNT1zG9/nE1
         HVidCSpS0YktBBrx+A7zKIG6+uQxvMx+oIIp/W6Bu5YwEnR9JJztit7fL5F+J0D0N2Qs
         QtnSynSoVw1zgkvLA3laSMwaatVzbQnW4YF7oNJZpx6ufwEL0KAORkIBEQTcarzUGub5
         d3WsbgaavCAWLwLkksjLbajw/E1ytDFI4pqTrlu8bIgp1LNgYtVD6wbPn0OXXw6+JQPX
         P6fd/LD90RJIHd66AY+XEM7IDKgNB9zLaPOcvNZV04vvilt2vJfJstpd3a0D60KuN0ZE
         WshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701455642; x=1702060442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZKieG5nRBjqtgSF5qSWlNZhynaQkVr51NbwFHbaHdE=;
        b=Ntdgw8z1/kkISnuwvoUH1WrVM8zPaM0m5F2aujushfFGxJSXZ5MviGl6pmLYjBgiqD
         L/y4ixq5QU8XdfLmigk2h0XLEvxJnifTwBn+qK4zdASA6oQ5tUnQX2Rom/aGImMdIUUN
         SmtP+wgFp3E04qEdP5JkoMyAi4K8o7mM+k5dQLR9b3AN33QKuxi2fVD1cuZ63Plv/iuD
         9hRQuJx24Lk+wosJO1m6OtalOL5JjEC3jt/+QHMDkRIB5iRSW7aCN9Z/4v0E1ClvJnNe
         QFJHjpXWMHm5tFUHfNgFS0HSKqYOT4kMnxk11d/bz6okAJWpXhFwkuilK0dKCjMhyVqq
         qDyA==
X-Gm-Message-State: AOJu0YwJwV9JWkRo+23f+DvTuT1kKJkjP/yeX+JClJGQHxKuGmq6UBvF
	jSeiTcSQTZCgSNe1KzxzIdY5MrdwJ3U=
X-Google-Smtp-Source: AGHT+IGUAabClU1AY35VE9nt1dMEBScGsuw92zqmfJQ8ULXzzpB1byZTMdEfMPtY7FK0lRlXju8zYQ==
X-Received: by 2002:a05:6a20:158b:b0:18d:b43:78e8 with SMTP id h11-20020a056a20158b00b0018d0b4378e8mr10572280pzj.32.1701455641816;
        Fri, 01 Dec 2023 10:34:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id g24-20020a056a00079800b006cde7dd80cbsm3297126pfu.191.2023.12.01.10.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 10:34:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v12 2/6] vte: Upgrade to 0.74.1
Date: Fri,  1 Dec 2023 10:33:50 -0800
Message-ID: <20231201183356.311137-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201183356.311137-1-raj.khem@gmail.com>
References: <20231201183356.311137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 18:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191678

* Inherit systemd class
* Add packageconfig for fribidi support

(From OE-Core rev: 29c91d1572cddc861bc2caf725aeedc4276e6d0b)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-support/vte/{vte_0.74.0.bb => vte_0.74.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.74.0.bb => vte_0.74.1.bb} (89%)

diff --git a/meta/recipes-support/vte/vte_0.74.0.bb b/meta/recipes-support/vte/vte_0.74.1.bb
similarity index 89%
rename from meta/recipes-support/vte/vte_0.74.0.bb
rename to meta/recipes-support/vte/vte_0.74.1.bb
index 21203adcf79..8a7054a13cd 100644
--- a/meta/recipes-support/vte/vte_0.74.0.bb
+++ b/meta/recipes-support/vte/vte_0.74.1.bb
@@ -16,10 +16,10 @@ DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native i
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
 
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection vala
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "9ae08f777952ba793221152d360550451580f42d3b570e3341ebb6841984c76b"
+SRC_URI[archive.sha256sum] = "2328c3f1c998350a18e0e513348e9fc581d57ea4e7b89aedf11e0e3c65042b4f"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -31,6 +31,7 @@ PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)} \
 "
+PACKAGECONFIG[fribidi] = "-Dfribidi=true,-Dfribidi=false,fribidi"
 PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
 PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
-- 
2.43.0


