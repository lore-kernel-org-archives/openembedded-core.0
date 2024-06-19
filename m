Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C5FC3064D
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.16255.1718787606674900752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SbVoTlpE;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso81496181fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787604; x=1719392404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RK1vfaB2ZWRRqMPbLVtrpD1GJGLud8Yq3QVXFJWCSmI=;
        b=SbVoTlpEjHQcx8w0T6+BJ94hiK7c4gjShJhR1P5K3M/+i4A7AYswPfNse65OFwMjSF
         xsgyYZid1xHcHjQa4/nokUYs9HxZtwUHCAQb+KXJ06IQjQOf6rtePYOUg/l7aOBejb9H
         t/ND12aeta364TRzp45EdE6zdC3a0azeZ44fXeRUkFAzKH5/Zmkn22jPZ/r/bKurCQS0
         VAmCGhAoPYRv4Vzrp33Xz5Sq6TI9wVTu37BZrfnXhPbdWzYjCXzosbv5SCj+yuEZqwa1
         QIKHAypJP/5iGpC+DvqAbBd8m0YljwHK20oCISQfIxXk9ZbQRCRzu8Wz5Vy1lh2JIDZX
         mRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787604; x=1719392404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RK1vfaB2ZWRRqMPbLVtrpD1GJGLud8Yq3QVXFJWCSmI=;
        b=W/KqyEmUUCNQkHIOyYB3hWi3Cc8HwlKY75k3nMeLzv0mQDg5ogLblIo7tcak33vByl
         Xz4I4kvBtiP6w++EgcC5MUrHXFn1qFf8V0iqZ3O8VcMPNebddZtxxNAwA0qGOqw0u7nV
         CYVfT/9wu+B3LCVovc8TWjxlhdaQOjCDSHWLEfJ6ngSvvNvBdpMTe5d4HJdilmglp+2b
         xOsDZNBDms0g+y20gIkfB74fW1AuONUvLjBpN+SgpoR+oYu3HbHmHuR0kjvNI9SzLl19
         0C5WDYeXYDBfindvw8prawMj1mJBo6SIQgYU6npUprsdigWZFzlnsMYaIWxOSCIA0k/+
         BeMw==
X-Gm-Message-State: AOJu0Yw1ZDhtuI1iLQ7s4w+jcDtwJYPN9tOftkrqLyiGsTWONV6NUPbo
	lNH+mkKTmLyBbofUcxUgFb2auApEkizqSOOH2qbrsF1nEp71+tnlenK4+w==
X-Google-Smtp-Source: AGHT+IGy3If/nyY2Y05Mt69ojOs+ACUwJ7BkxdKHbUVC5MJCyo0AUOuQyjHbOkwWMocmKF/yIfHGwg==
X-Received: by 2002:a2e:a163:0:b0:2ec:40ab:694f with SMTP id 38308e7fff4ca-2ec40ab6a32mr5687301fa.3.1718787604352;
        Wed, 19 Jun 2024 02:00:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/15] psmisc: drop duplicate entries
Date: Wed, 19 Jun 2024 10:59:48 +0200
Message-Id: <20240619085957.2787700-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200893

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/psmisc/psmisc_23.7.bb | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-extended/psmisc/psmisc_23.7.bb
index e1dde7dafb4..d96eaf5fe8a 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -8,11 +8,15 @@ processes identified by name.  The fuser command identifies the PIDs \
 of processes that are using specified files or filesystems."
 SECTION = "base"
 DEPENDS = "ncurses virtual/libintl"
-LICENSE = "GPL-2.0-only"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-S = "${WORKDIR}/psmisc-${PV}"
+SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
+           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
+           "
+SRCREV = "9091d6dbcce3d8fb87adf9249a2eb346d25a562c"
+S = "${WORKDIR}/git"
 
 inherit autotools gettext
 
@@ -57,11 +61,3 @@ ALTERNATIVE:killall = "killall"
 ALTERNATIVE:fuser = "fuser"
 
 ALTERNATIVE:pstree = "pstree"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
-           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
-           "
-SRCREV = "9091d6dbcce3d8fb87adf9249a2eb346d25a562c"
-S = "${WORKDIR}/git"
-- 
2.39.2


