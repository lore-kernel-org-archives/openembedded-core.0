Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4635C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 10:31:47 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web12.4250.1665052296059842615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 03:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dOJK/h6b;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id bn8so1712822ljb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+7wRI+kv6GscnPf/kdXjxY3IpvvjtALLZqNynVo/Rj8=;
        b=dOJK/h6bdaDOy6S7JowJpyTjwuchvjQnhQZbCksH0ATzCcn2EY0Q+jDP6beGOn0V89
         WS2eNppkMWdcyakRI0bAinyM8hE2abrWYKaMLAawviIx3+/hh6qqEnUqoV+GeDqh+iE7
         lTAmDQh9D53ucwJ/lTHC5NGFJPwRww/OAp6k7qqMQnDg9FyGQ7FsPJsembtBQEVy34oF
         ehJu1/aWlMtnnw2Ymj1JpCMlqGbqXnarNFSAeXEakIFN9cKO4NHre+0tWYTtIjncSh9P
         BPp3E0s7CUckkztzP33Fxo865yH8pBzcmY8WlBQCnmWYng0VBRp/+VhkErWtGvzsoNQT
         L/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+7wRI+kv6GscnPf/kdXjxY3IpvvjtALLZqNynVo/Rj8=;
        b=bZzx5kgn9LPSpcrjvozqIMTSTBW53BSowEIVsILqKSmIyKR71iAnpTN4Tsr9PPmV9t
         3bvilpEqyySJH6ASYCogCZrXz1GKYkCITgnBG9BJh9clIInNKhVGsVesD4XvsAp4dZUA
         fyMnSD5kZGok31ofXe5YHk1NuE1SHOw++v3pevacpwMpJ1LfL+SkfZA+oR4PPrdkBals
         b6S0CtKw4RtBFWPAAV35F/3ZkvuzO3GFtD/U4vtZh0L+/K/l1MgkaaZLyai5upGS0CaO
         WIVaTOspQjotiIoxYR2DiRqnMtcFcafvB0RnrgU+WzpWwQg1LLJa39KwJFp0r4w9JEKz
         OaIA==
X-Gm-Message-State: ACrzQf2ZFHxofUblPHWc23pzflVWYMb2GODOZp3PsE6gwBhw65xo6Fk+
	iL7DW4g7PJSOLlXnG4Oub5KnnybtSWw=
X-Google-Smtp-Source: 
 AMsMyM4DRzN49A51rh7zyx2GyQgHeITkWmm8vQH7onk6Ks7tlAFmEIFDeoW34JshLHzP+qyFS47xew==
X-Received: by 2002:a2e:be8d:0:b0:26c:f4b:47a0 with SMTP id
 a13-20020a2ebe8d000000b0026c0f4b47a0mr1412005ljr.92.1665052293980;
        Thu, 06 Oct 2022 03:31:33 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (m83-185-46-7.cust.tele2.se. [83.185.46.7])
        by smtp.gmail.com with ESMTPSA id
 bi18-20020a0565120e9200b00492c463526dsm2654653lfb.186.2022.10.06.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 03:31:33 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] dropbear: add pam to PACKAGECONFIG
Date: Thu,  6 Oct 2022 12:31:17 +0200
Message-Id: <20221006103117.4310-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 10:31:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171489

From: Ming Liu <liu.ming50@gmail.com>

Add pam to PACKAGECONFIG to make the code cleaner.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/dropbear/dropbear_2022.82.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2022.82.bb b/meta/recipes-core/dropbear/dropbear_2022.82.bb
index 41c14ff2f1..4ed4c65cc1 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.82.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.82.bb
@@ -12,8 +12,6 @@ DEPENDS = "zlib virtual/crypt"
 RPROVIDES:${PN} = "ssh sshd"
 RCONFLICTS:${PN} = "openssh-sshd openssh"
 
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-urandom-xauth-changes-to-options.h.patch \
            file://init \
@@ -36,8 +34,6 @@ PAM_PLUGINS = "libpam-runtime \
 	pam-plugin-permit \
 	pam-plugin-unix \
 	"
-RDEPENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-
 inherit autotools update-rc.d systemd
 
 CVE_PRODUCT = "dropbear_ssh"
@@ -51,14 +47,12 @@ SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 
-PACKAGECONFIG ?= "disable-weak-ciphers"
+PACKAGECONFIG ?= "disable-weak-ciphers ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom,libtommath libtomcrypt"
 PACKAGECONFIG[disable-weak-ciphers] = ""
 PACKAGECONFIG[enable-x11-forwarding] = ""
 
-EXTRA_OECONF += "\
- ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
-
 # This option appends to CFLAGS and LDFLAGS from OE
 # This is causing [textrel] QA warning
 EXTRA_OECONF += "--disable-harden"
-- 
2.25.1


