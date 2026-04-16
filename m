Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45016F8DFF3
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:16 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28569.1776378791108125358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BUDokd2H;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488b8efed61so688635e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378789; x=1776983589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0n9FjqaiKYxFXQPW+GkL0tGMIOvJf7FGucVcrl0XFDk=;
        b=BUDokd2H+R97eiKDbXiGVjztRxcLJcVyah8t2w+eZ38BibEIUwJa2L/cLyWrx9oq0F
         FxRiItWmHIX1Y8zzmoBiIcekF0Y7lLSx/o5hLHKk/MEG+hOVXHC+n6BGxG9TT6wIU8OC
         xj4FflqI9JcDqfBskJEoIdJtnwnTl4VIfQXHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378789; x=1776983589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0n9FjqaiKYxFXQPW+GkL0tGMIOvJf7FGucVcrl0XFDk=;
        b=Ie0m+ppWpdRlLlZn1D+UoTuM4zO6CAmQ0/6jSKZ5lwtWxIO0ECsqTNxKjvkcqjhziC
         4pjl96gMnp0VhxMx8/HRXxlB/tWjKPZxKWCiGQPSibOhLxWVxEH7SaJAdJd/ZYeFYaxX
         wGBojpilD1l9ycEYB2oCMtDfc1Tpdtx3O4Njm9778cHBf15/H5x9JURVdHGoTS5NZUZ9
         hX1guX8s1cjarmSqzlokQ+zi5KYptDYsdZ0WsqJA4/+m0tjGSJzDGih+kI4/027Y7CJ9
         Eu5S9YLymyo3R7gnB3jBeW9PEzYxKpJF7h/qapKsUvj0fvi8elcTrjVpz0XHNZ+yoxKo
         Y37g==
X-Gm-Message-State: AOJu0Yw19Nim1Tfh5fTMLHn3/HrBK0EWT75TyazZAoend4Cs0la7AkRY
	UbKkYBNI0fZ8qjq5bHfM6d2a7qfgs2QbLAEkIkiJfdBYOnIJQCOc8LhC13Dcs4HjOIn8NuB2tRA
	3vetVpFfc2jQD
X-Gm-Gg: AeBDies4KCcvYzblh86dewlGvDc6Ikbf5WDG99rF9TvSG7PsBjiRZ9WAd1kgv0FU6jd
	23qQ2v/sN+K5vag7VEQ7V31jqNcERKuMpDrg93MDT0Q1EAmuhtIwNTtDfXx5+dsd+gRYMHK0mv8
	K1ElXqkPrlt0RCtyaGqALcbzjyPWhM+9TECP4i5dA5qJgUnkRVKPXVSnnJ4bUROC9f/eBJR4oFl
	s7Aep62pm/oXOp7y2HoRazcxjbOJ/1IZBnOFEAsEV5Q7UheJLPYw1tN56g7G0esCqKX1TEltvCH
	FECfckWhKJDhmqwzBt6+LqMtKyjEx4c15ZRfxMisu5lB2Zq/kcEqPT3LbzN3t6fxGWbYaC2eHKq
	4a1QA9NmVFeFYJrwVhhtHRkZt3dlHrW7MSElaYbmLHIY4TS8od12wRUK4Xc6fZpmGu2uj/R22LL
	uFeu1efFhXL0WPaCHbaylSf9KrinCBt0F1lehrEfsmYS58lCmItjDqtTutNSzoZ73a/JGp7FXRz
	VYI9Mqwwmjt6Dm0DJbmYWNy7R1fgFuwwUtWRyT7hOJQvNPU
X-Received: by 2002:a05:600c:3150:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-488fb8b9deamr2690005e9.13.1776378789225;
        Thu, 16 Apr 2026 15:33:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 16/51] openssl: upgrade 3.5.5 -> 3.5.6
Date: Fri, 17 Apr 2026 00:29:59 +0200
Message-ID: <0f6e3b8446558a471e38d4e76b105014512853dc.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235445

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

OpenSSL 3.5.6 is a security patch release. The most severe CVE fixed in this release is Medium.
This release incorporates the following bug fixes and mitigations:
* Fixed incorrect failure handling in RSA KEM RSASVE encapsulation. (CVE-2026-31790)
* Fixed loss of key agreement group tuple structure when the DEFAULT keyword is used in
  the server-side configuration of the key-agreement group list. (CVE-2026-2673)
* Fixed potential use-after-free in DANE client code. (CVE-2026-28387)
* Fixed NULL pointer dereference when processing a delta CRL. (CVE-2026-28388)
* Fixed possible NULL dereference when processing CMS KeyAgreeRecipientInfo. (CVE-2026-28389)
* Fixed possible NULL dereference when processing CMS KeyTransportRecipientInfo. (CVE-2026-28390)
* Fixed heap buffer overflow in hexadecimal conversion. (CVE-2026-31789)

[1] https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-355-and-openssl-356-7-apr-2026

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fc25ce383ddcb1185c193ff2b10f9116741eb316)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...1-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch | 2 +-
 .../openssl/{openssl_3.5.5.bb => openssl_3.5.6.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb => openssl_3.5.6.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index dadc034c913..bfbfedbd67e 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -38,7 +38,7 @@ diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tm
 index 09303c4..011bda1 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -513,13 +513,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+@@ -514,13 +514,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.5.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.6.bb
index c0d02b617ba..cbe7ed144e0 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
+SRC_URI[sha256sum] = "deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

