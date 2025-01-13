Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C237C02184
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:47:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.28637.1736801262433480209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JFgBqERL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2162c0f6a39so102766355ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736801262; x=1737406062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baT7Vctuoic3QsoSIbru6HhZAjNwsMBmDNh1Ebx4r40=;
        b=JFgBqERLL8KXmAwLfABWQ/mv9ti5qhv2YKBeIewBYNgc8woA8OMPbFOZ0Wz1OVzcSe
         bZBalY3OkYN+9Si71pcp05gNovqart1xLU79jzrUFDjr2LEb2Gv6rXF7RNbU1qVqWkcP
         xaG0HdBPvCk4/eLTODQuS7uIXLqySYprgqzKngQimMNFQXEvltkFaRFOJverqnzwL5KB
         s5eHTqJKC9QPBFsX//noAf5cgP9Y3MVSpLN4uqSh9D9/9KKwVXNJ2zGoPGTWMXJmzb0j
         glh4WOFWIgQ4r60RcyhGdJoPk/xv+nPxAQQari7OVoV1jtd3nuqKlPx+4T1T3K54fzZf
         73rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801262; x=1737406062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baT7Vctuoic3QsoSIbru6HhZAjNwsMBmDNh1Ebx4r40=;
        b=fwkc0LMiMpe4jFNZCE9vTpbBayCG00PDEt0hUkJb0Q+j8KDUUYGNKyRPapHPRPl7CJ
         fmfb+NUxIvznv7w5iD4bZHEG8wrE7WlwvEnJWSHkVpL5XvSG8kSJwFBE7Mn3J02a6cXl
         DDvzphrOWA+9hEi9/V4QHkaAut6wjUkS7qMCySp4ITJ5nxSdT98GBlfvlGO5xUI70AlM
         qSfsEcfSK2mS+SJOSjKrwdAe2rS9Tx875zDiN3RdwxGWvKCL9r4b+l8xIHugPbLYXcZ/
         qV8AlDjZijRW3SKntFiPb5QDHHTHBLOKKkqTTatSVdJ6DS9BYuLg+BRP4hjLWSGVzUwC
         8QhQ==
X-Gm-Message-State: AOJu0Yzxu8xuOZ59Pgk37UZ5B2nkz6sidsZ3Djl2kzXKt1Nb/uovoxWe
	r0yanLXFVpJ1UDgPaEUIryiyVQCBFlqYCH94tjkh/lLmDhml9ekiTirYN43NbMjuHrEq7Z+sv1Z
	1Gyo=
X-Gm-Gg: ASbGncutzsygQ/O7/xbLK3R/tSM5XmWtdH6npAl1oNmSBS3cisNTMNh4gE5mo8Kc50v
	/taE86ZQ3gEr+on1paiuRE6+2oobtFm1taf7ZpRibfNkZXH0Oul8PWhDDG7fnkPGo+aQdlDOt8a
	refP93N90rBYfuJ4bJg+c1FXC3emPhUiLh1H0dqVROXfWNK5hOSj7H2+9Db/M9q0l7rbFK0sqYf
	uL90U2/dbrAiltHAlq6sh7EiQUoJGoC7P7T4eSKvgcd2g==
X-Google-Smtp-Source: AGHT+IEnTyNx0WZwKStgMaaMaZCHSQccF698w/14Hn0X55RYJMvXDF3LHSDS9lgXPogXPA/ogGaVxw==
X-Received: by 2002:a05:6a21:350d:b0:1e1:a920:225d with SMTP id adf61e73a8af0-1e8b1637ef9mr23579495637.19.1736801261664;
        Mon, 13 Jan 2025 12:47:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm6449435b3a.12.2025.01.13.12.47.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:47:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/15] systemd: enable create-log-dirs
Date: Mon, 13 Jan 2025 12:47:07 -0800
Message-ID: <92eea72a25e553c698bee9e3f551a5880bd4631c.1736801113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736801113.git.steve@sakoman.com>
References: <cover.1736801113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209759

From: Changqing Li <changqing.li@windriver.com>

By default, create-log-dirs  is enabled in systemd, and a link
/var/log/README will be created, point to {{DOC_DIR}}/README.logs, but,
for oe, there are two problems here, firstly, DOC_DIR is packaged in
another package systemd-doc, so /var/log/README is a dead link when
systemd-doc is not installed, secondly, even systemd-doc is installed,
when volatile log is used, DOC_DIR is a wrong relateive path, Refer [1].

So in commit [2], we disable create-log-dirs for above issue. with this
change, /var/log/journal is not created, and /run/log is used, this
makes systemd log always non persistent, refer [3][4]. if user need
persistent log, they need to disable volatile log, and also  change
journald.conf, make "Storage" to "persistent". This is a behavoir change.
Previously, to make systemd log persistent, user only need to disable
volatile log.

This commit reenable create-log-dirs to revert the behavior change, and
since README is not very userful, just remove it.

[ YOCTO #15678 ]

[1] https://github.com/systemd/systemd/blob/main/tmpfiles.d/legacy.conf.in#L16
[2] https://git.openembedded.org/openembedded-core/commit/?id=18d46e11d85da1f6feaba5a135931e43060024d6
[3] https://github.com/systemd/systemd/blob/main/src/journal/meson.build#L189
[4] https://www.freedesktop.org/software/systemd/man/journald.conf.html
[5] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15678

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f82d9c997ba8cc23b472d44a43489c597bf452af)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_255.13.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.13.bb b/meta/recipes-core/systemd/systemd_255.13.bb
index fa3ad1d2cd..8f5170929f 100644
--- a/meta/recipes-core/systemd/systemd_255.13.bb
+++ b/meta/recipes-core/systemd/systemd_255.13.bb
@@ -248,7 +248,6 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dsystem-uid-max=999 \
                   -Dsystem-alloc-gid-min=101 \
                   -Dsystem-gid-max=999 \
-                  -Dcreate-log-dirs=false \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-Ddefault-mdns=no -Ddefault-llmnr=no', '', d)} \
                   "
 
@@ -401,6 +400,10 @@ do_install() {
 			sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${rootlibexecdir}/systemd/network/99-default.link
 		fi
 	fi
+
+	if [ -e ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf ];then
+		sed -i -e '/^L \/var\/log\/README/d' ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf
+	fi
 }
 
 python populate_packages:prepend (){
-- 
2.43.0


