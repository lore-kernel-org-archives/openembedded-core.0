Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CC2C61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:44:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.83228.1749548664235386060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 02:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HtKRV0fS;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so3496314f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548663; x=1750153463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er48Zjh34Tvx8FfQMP7Ep9h80YwoPoVH3285LEDu5EY=;
        b=HtKRV0fS9RmKOMNuZ3lQP19A3TsNF1EGZwsKuuwZryy24yCr0XH+hhw4F8pI5ML1x4
         UnCpGW1B+clmwh8JagEZfn1c0+N46C9B6EbD0Fw1A3R2BaUHy91qQK5vVlZjNZGE6KDz
         t8NZHPmNTYEf3/M0dke/5k/bXqxKSJPwHkqrmXNzNmFvXSr1So1gKH5u5Rmta79tuFyR
         /lg9DgRADd4xYh42123kcM8vcKjg9pOSikPVWIUw+Nx93M+pI3GJnHRI8RJEF5Dvzsea
         a8hFGCGuN/SC2wSBxtipQFudiKIyiRI4BquHnRk+hJbJGTKfZtPncbyBeCfZskKF3FKI
         HuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548663; x=1750153463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=er48Zjh34Tvx8FfQMP7Ep9h80YwoPoVH3285LEDu5EY=;
        b=FbK62K0Qiuw+HSwwjz9OAkqAtN6FWoQZhu/i1MoZit0Y9OMabMXNTbm66XzVibSPlj
         pujIjQ6xzeyMK9EfyDXMgk7Hui3IS9+6xsZ5B5x1Tde/84cDqCj0R0kDZ2N+WTkcMIEh
         qThz4iOSEvhPmFTNGWWtw5VttEXzrV/4RXvJL9zbfnnyGgISZfgQW+mUR33r/o7Ir2sM
         2Az/bOm5i9979cdW7DMF/RE2hn3D7HlN4wvQc/um1eOMQIqJZlQhnHnP/bfZ66Pwinpq
         mc4Lq9QjL+njJExTYvFYlh0k4IyzOYJ+VNOFK5706LfszKmOcTfN4aPZRma/VqYODIM2
         RD/Q==
X-Gm-Message-State: AOJu0YxvvOv9P8ntMLstFjo4IBky9mr8z3cHQhaAGmkEwcSbPyX4wCMX
	xUtR66ag63scKcpoQK12jXUnI50CAOOZo9SrryebEfNtVdObOeFxw81zNaHJtw==
X-Gm-Gg: ASbGncsNmFNRq7wfbF7IVWIojkRvNRjeKx+gui+sGpcy10yFqn/kn8mzHoS/BkGY/A4
	MsqEtMrskRLdlUoKXel8Hs3clIZGyG/kuB3U9p3BkA+hoZzEgUsDx1y0NwsLEp96w2R+e6qX4F0
	FRd86BwnkbNxOOdocFcVThBt4HsJLX7qce36GgN6FB38ICEdJsN56bDUAlXe0JhyHsl/bz4QU2T
	+29kwl9DoyLOBAVVlWbqltM57+kgpLNDqlc+mVH4r7UTyR+JoT46TUxe64P4RBAtXdR3UvUbxhK
	mkLSR6qouCSTCJk+o8Hg6xnEjG6k0YHuufVyf8BoOOX9Qjch0SM9fF6RoTStRfOpi0u4c2OepA2
	cV3MuSSZhBFJKPNU8AluTf6A=
X-Google-Smtp-Source: AGHT+IEM9fFAth2fV9ZilU1lDURxTMsNtkOs4V12kVonrDRw7Oy4xSWViJaWylKir5QJ/c1BX8WQuA==
X-Received: by 2002:a05:6000:2084:b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3a55142090cmr2741202f8f.23.1749548662390;
        Tue, 10 Jun 2025 02:44:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375bca3sm136569125e9.39.2025.06.10.02.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:44:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 8/9] insane/do_qa_unpack: add checks that ensure S is set correctly
Date: Tue, 10 Jun 2025 11:43:59 +0200
Message-Id: <20250610094400.1653931-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610094400.1653931-1-alex.kanavin@gmail.com>
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218333

From: Alexander Kanavin <alex@linutronix.de>

The checks are fatal, as this avoids rather more cryptic errors further
down the build. Example:

ERROR: gnu-config-native-20240823+git-r0 do_unpack: Recipes that set S = "${WORKDIR}/git" or S = "${UNPACKDIR}/git" should remove that assignment, as S set by bitbake.conf in oe-core now works.
ERROR: perlcross-native-1.6.2-r0 do_unpack: S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = ${WORKDIR}/perl-cross-${PV}"

Dropping the S = ${WORKDIR}/git assignment (addressing the first error) can be done
with a single sed command when there is a lot of recipes:

sed -i "/^S = \"\${WORKDIR}\/git\"/d" `find . -name *.bb`

Replacing WORKDIR with UNPACKDIR can be done similarly, but should be done after
the removals:

sed -i "s/^S = \"\${WORKDIR}\//S = \"\${UNPACKDIR}\//g" `find . -name *.bb`

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index eb8591f6242..0a0a38a3b43 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1431,6 +1431,14 @@ Rerun configure task after fixing this."""
 python do_qa_unpack() {
     src_uri = d.getVar('SRC_URI')
     s_dir = d.getVar('S')
+    s_dir_orig = d.getVar('S', False)
+
+    if s_dir_orig == '${WORKDIR}/git' or s_dir_orig == '${UNPACKDIR}/git':
+        bb.fatal('Recipes that set S = "${WORKDIR}/git" or S = "${UNPACKDIR}/git" should remove that assignment, as S set by bitbake.conf in oe-core now works.')
+
+    if '${WORKDIR}' in s_dir_orig:
+        bb.fatal('S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = {}"'.format(s_dir_orig))
+
     if src_uri and not os.path.exists(s_dir):
         bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))
 }
-- 
2.39.5


