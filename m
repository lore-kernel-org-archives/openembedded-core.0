Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0724C0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 17:05:56 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.46896.1738429554235851079
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 09:05:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QZpKP5ei;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38634c35129so2362602f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 09:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738429552; x=1739034352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/V2EmQAW7xYI2xnr6gwImRNmoFQQuBJ63UlKlfIJi0=;
        b=QZpKP5eivpguA0RX/cYKSFh7Sf+3WsPHzpkMdAQNr33rp0LZqmJ2MFfvHc3TQGINN5
         qjshe+Cu8tDxm6UH3wRq8TzbFPCQa3DewyX+itSHnPQLUG6LMbRVwcUTmgQci1XJD/y5
         73875di48sNz+83+ItTqOsf/cDegOLpYKokdYS+zsfz6rZgRFOqPbpTJ9oZZKpF0DFXW
         E6OFYdylxb4dr2a9to7/e6/1lKa96D69Xhh1bRw17MC1cggf2QCY8d8tVWzumMLqYHHT
         TMsOBceLh1QR/sEez/BLfNdduEhQx8dMuM77qAR9fzFjoNxXQ77AgFfzYzf7emqsDtW+
         KTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738429552; x=1739034352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/V2EmQAW7xYI2xnr6gwImRNmoFQQuBJ63UlKlfIJi0=;
        b=Y4IO34tu6tK5nfc0bRASJhFn6p28o7WV//AeCIh4itbQEskVU+b2R/UYLz4RHqm4GS
         nQhLnvS78mVjOFUYRA/FbKdbAddKgHNEI38PTTNZ/I8dA76CtOfxs3gVO3AemtBGHG+z
         yr14MIWh9TiTh+RZZ3+pmDqAb/9HglzuhaZtWoVhAqR9W558ay25+O8ZWrNLOWqKg26b
         281xY0FIWyVOgbZ2mhxnN4JjWtgrycuPMdwVEJnzlgFj04Jb8LD29QUoN6YSOu1JzRlT
         BcL4aRSwIvE0C/tqL5Aj055EYBevFMsWxNkI6QF0/LKDXplPmP3/9ytgaHVo0ibw9cpA
         gtYQ==
X-Gm-Message-State: AOJu0Yy5kRTf6t+AsphxNNZyp8cTg2gK3R7jDnAvhX7ZD6y3NAtuhStI
	+udhNfDzvGvJoi+koXQ1J8qeoKYDlEvyA0HWmHrmOAT5uSBmk5/0sXBeP2+s
X-Gm-Gg: ASbGncsuUVP2aFIq0ULKjUdzXO7GqgrVC2eH0CmJIKiYkMl81NDZEpVVZqWKsYtM7zI
	tSygj/aaFGNrAXgFSGdxTapakZg0tIHWZwKFvh0N5fgmuoGTjoQLfuDoSvkEq4uj55FDY3L8uyp
	1+M9xGuixABC2m2m9QmZdvvD36uhbRQrA1OLi/+LOPBfdIpex4Euudt3AJ0mzP2Z03K8VBelbtj
	vLVnYTS+Ep/EMr4fX2XknBTi/UMPxUlf/z8sUYoEEqDXTfAddO6FJ2kJ89CfJNISCA9mxkwC0uh
	vVocMNFvP7y0c3xi5jFULw4Zj8If9YI/7PgZ6EcmJoWS8jWZ0RK7qdSJLw==
X-Google-Smtp-Source: AGHT+IEmuYp16mI2bLycSJx3Flp8wqbeOaHOuMAmM+rT0saI87pzJRF1ogE5bfzj4roa0PJQ4FVHBw==
X-Received: by 2002:a5d:5f8f:0:b0:386:399a:7f17 with SMTP id ffacd0b85a97d-38c51b5eaebmr12526694f8f.24.1738429551943;
        Sat, 01 Feb 2025 09:05:51 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2e239sm127088755e9.18.2025.02.01.09.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:05:51 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core 2/2] avahi: Switch RRECOMMENDS to avahi-libnss-mdns
Date: Sat,  1 Feb 2025 17:05:11 +0000
Message-Id: <20250201170509.2974-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250201170509.2974-1-alex.kiernan@gmail.com>
References: <20250201170509.2974-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 17:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210610

Rather than using the RPROVIDES on libnss-mdns which comes from
avahi-libnss-mdns, RRECOMMENDS avahi-libnss-mdns directly to avoid
picking any other version.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index a78e776a1843..220160a7e169 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -85,7 +85,7 @@ do_compile:prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/avahi-gobject/.libs:${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
 }
 
-RRECOMMENDS:${PN}:append:libc-glibc = " libnss-mdns"
+RRECOMMENDS:${PN}:append:libc-glibc = " avahi-libnss-mdns"
 
 do_install() {
 	autotools_do_install
@@ -157,7 +157,7 @@ DEV_PKG_DEPENDENCY = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPK
 DEV_PKG_DEPENDENCY += "${@["", " libavahi-client (= ${EXTENDPKGV})"][bb.utils.contains('PACKAGECONFIG', 'dbus', 1, 0, d)]}"
 RDEPENDS:${PN}-dnsconfd = "${PN}-daemon"
 
-RRECOMMENDS:avahi-daemon:append:libc-glibc = " libnss-mdns"
+RRECOMMENDS:avahi-daemon:append:libc-glibc = " avahi-libnss-mdns"
 
 CONFFILES:avahi-daemon = "${sysconfdir}/avahi/avahi-daemon.conf"
 
-- 
2.25.1


