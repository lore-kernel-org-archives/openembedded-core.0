Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F362C0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 17:30:17 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.47525.1738431016551442958
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 09:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VpYJAu2U;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so6231617a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 09:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738431015; x=1739035815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/V2EmQAW7xYI2xnr6gwImRNmoFQQuBJ63UlKlfIJi0=;
        b=VpYJAu2Ua8WAh0Y7AUvbGkN9M2SReacVI+ZKV2v8gQ8K7kfWjn/LeKYff3ldj/DGcA
         elisYvpsJnTHtSgc+/pMj/OWNV+drFbMzyMMBmsRv5w6KKNmjXaJ6/LTOgDJX8KNr3j5
         nTMSa4vVLtI6+R0Vxa9L+5gcuRaycnpbClpLC5FxZ3IldJK7TKIivU6rkXgfma3B3MDD
         iCgqIzU7zLg+KM8tOdbkMkH+/UleMuaIHNjDdSGInJP/jkC+OyVksUM/Sj3O5u/NhdCT
         rozoy7JLi8gWT1WLZKVRf1G+b8uTS4wqJR1gajx7AnWfNthBWsktD1aVu5D0lWGJrlaW
         lKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738431015; x=1739035815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/V2EmQAW7xYI2xnr6gwImRNmoFQQuBJ63UlKlfIJi0=;
        b=RvEXZxcr+Rl2EvqJ+3UAVWjPq7N+G2xG/0+MAOcJMbexwzCLlECqZ6ZtycdVgfQRPe
         G2U2P/5kS6MFs+c7EXqev5VLlikWNAXYptpzxh94APakJIOLIWk8qnjqJ/niEtFd8B5T
         yY5O8tIAtoE89frJxluE8r4OX6YZJcvrk26WmBN2Ka942sFXnl3wl/3H9LhAALB0wvWz
         QKmQx0uG7z0goQ0SGgBlENI8TDFO2wqdVFX6953gwM/9hpuoj1p1/dYbFl3FG1k/HCo9
         vK/S5BwriCw0JPFBYWIhAhVsniklz78gJTLJ/mWHPgcDRbRdkkVzNPV8rXhjXwfSEg8w
         6sZQ==
X-Gm-Message-State: AOJu0Yy4zZG5GZ5AajflJQg5u1KRFwIOAONen3XyO53pKQ1qVmZz6lF0
	A0Kkq0HZp90dq/6IYCGCmiAVnv0ASxu9KAzNUVJGz+XrE0HF83bQgBC5tgIK
X-Gm-Gg: ASbGnct+2DWlKu4cBfYXf/OvVmuv9Qie+f8vunRE7+BSm19XVTIjnTKidPc5HIKhOId
	QqO59UakCjNZZu8RU7N8yyE9rxCjlQOmtIVNfNSfNp9ZHh1ATMvnuIAxk5fEXfogCCIzi2xNsT3
	0axybuoLDEhGC110hTIpK6R/dQW5SbgQ7I8P5PeohgoewW3E3qiYrfd0M7Ua4o84PnJUDoOuP4V
	mqhLZTi3KaaqoMcisHFxNtLyxnHEmCehgC596TJ0+m7GKeuZfiMZzxrGBh76wFmtWVbBLXSHddv
	k45uj7vfrZGRt0KSSCtMuZf+ipNBHIEftyBvWyI7eznfEEFCXXPojpam9w==
X-Google-Smtp-Source: AGHT+IH+oG3Sdc/GyI1SSui1m8ug79eMzMbAL9ZP3QDWfhO/xZ8i/jO0Jo9V6IDxJ7BoNg+V3RWXqw==
X-Received: by 2002:a05:6402:1d4a:b0:5dc:1239:1e5b with SMTP id 4fb4d7f45d1cf-5dc5efe746cmr15453846a12.23.1738431014448;
        Sat, 01 Feb 2025 09:30:14 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c9da7sm4669984a12.79.2025.02.01.09.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:30:14 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH v2 2/2] avahi: Switch RRECOMMENDS to avahi-libnss-mdns
Date: Sat,  1 Feb 2025 17:28:45 +0000
Message-Id: <20250201172843.1490-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250201172843.1490-1-alex.kiernan@gmail.com>
References: <20250201172843.1490-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 17:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210613

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


