Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314E7FF8852
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:03 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31970.1777064211389741649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UfXN/1xy;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so42145115e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064209; x=1777669009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoMcgzoLpXpqYvQc7ydpHkfpgJk63v4iY1o3AgO5UVw=;
        b=UfXN/1xypiigDcS3mZaoO40DXOXM38dTW8DnVm059/GsGEhs0s3+9VWTLYIMM6z49G
         aHOyRum5W0xOZC7SXCnaMMHE0ze9jPej1SVQiTqrToCTCUoWSBsjfwGQXDdhYuuKp0tX
         mN68XLQLTGLVm8++dJ5DIz9RV9nII3DZOLKcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064209; x=1777669009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MoMcgzoLpXpqYvQc7ydpHkfpgJk63v4iY1o3AgO5UVw=;
        b=qPjJX0fpxrAvLfH1T7S3y+9AN+f56CKzltkl/C7PVUkgqseF64Zie1rYiVQoB0C5MI
         j7W65A1Z4qvA9HDiLBdsYnEll1spUP6wDKgSqy0ML7znhK4WhV4WKppyugmr+OV9WNwk
         4l35M2v8RFeNuMjWNhDCqgdmncWdTmBjG90eC1MeqcELGATMwJ7612MzUyDBw26T/GpI
         xBkJxmXNzuL9Fkx54ftXoEQS7e0hLrLVIUD+nRX0iytCXtc8qNcfMHp8fDnRmYKCcjLI
         b/dMQOUfZ0w3FNpQ3i8S3bQL4rRkP3CzwcQqxE/q+Hd2GxG4VxMuZu8TvkFecH7BkGZ3
         BT2w==
X-Gm-Message-State: AOJu0YxW1VRnYt0iL/DvqgEQhO+hg5p7e8VXEYi3NmF66nluN/i+XjX+
	UHncyFgsRrgb1D/2ZNHV6T5+2U/+9bsBK0CmL1QDRHb1MhcuZIfAHJh14AjM2p+swCf+jmtCCua
	JedlDPL/f/WF6
X-Gm-Gg: AeBDieu6RqDnfXuNUiJHURWqqPYvpYaV3PIzWntV/ehlMgrMFOjU2uVh5MuyEpW64rW
	R19Gt659nUA8iqt8K85twcYOwjKoCP4CP1urCyMk/XPqp/mpipzNU7K1kUmuE0nq9jYpjfMhnsi
	9Z0TWr0P1MZYVzJh0lrnd2yejpEoiJ6LO9zn62acfjfW3yUj7aOXkuAQHPaAahxKbr3MXfji/2e
	9tX99YZZ5RguoVmluGa5NfI0fcpNqtjqIKTnVObs2R0B6Pp0ZAD3Y9cESaoI65pFf3gIUXCnwns
	jtgv5Hei8qCnZpqEhvh85l0Tyh+rfTSSa4Jm8oxA7Fj0zkSKEuw7TYN/yGOaBt0VfpWhQk1a4CP
	vIlnnmgLtfclcqw8bavxxmA64NB+VkiIwnKaHriCHcua9kcw6zDLscm6ArE1l4fIocdzyK+55Vc
	tJCoGmp5hpblA7BoO2Qv7cCcubmcOFRYfRDt/6sfdZx0hhaUKLTStytJAfwCwS30RUHbpbH+UT/
	bWHu5bRTt2kZRwzqX+7+BHYjF04Xa9v1f73+Q==
X-Received: by 2002:a05:600d:8447:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-488fb8b18d1mr332468165e9.10.1777064209541;
        Fri, 24 Apr 2026 13:56:49 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/66] openssl: upgrade 3.5.5 -> 3.5.6
Date: Fri, 24 Apr 2026 22:55:20 +0200
Message-ID: <a8cf6e078aa7967dde5f950e3e6f9b212b748dcf.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235894

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
index 1321adda92a..3bf78eff5c2 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
+SRC_URI[sha256sum] = "deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

