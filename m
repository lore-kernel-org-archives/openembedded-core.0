Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE74C27C78
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:14 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.9993.1718288473792307959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SdSaIVjU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6bce380eb9bso673970a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288473; x=1718893273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+GYDOeM5l940vZhy7Ybh4aBEFLkgRCUMiTLHNRSyMY=;
        b=SdSaIVjUiEWf5XnemWTM7YlYhWaPNnBHj5BsUESjJWB15k1cOAFk7Zs1UOd/R9ZzoR
         3rsOQdtcVXdAGSNTrYKjfAYTofkgYP0bN1ld2B+B0MHZqGfpxZ6jT4md8kHDoyyA0LS1
         Onu4TMrIgs9e5uQb9yj+Os1+ZrjsqiFhetNpsLF47NuXix0lBZ2OUAoknH38wjwVIbq0
         gfqzJnN3UUhEceqAlhaMgdMV8mxQbzDgBVvsvIFoKNUbCI8EtZERU8cZAja/KE90Ufbd
         rrt77DqNL4kFp1h1PQyVKrG9ddcNnoMXZRjAM7PFGvPHjAj8qYJ7EekoAokQ7vSuxJIg
         M4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288473; x=1718893273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+GYDOeM5l940vZhy7Ybh4aBEFLkgRCUMiTLHNRSyMY=;
        b=bMTEJuqKhrowP5p87HCoWr9kAhJGbYmqi0EFjlocI3NlnQ7u7PHNr5SjdGbWyswpyN
         ruP2peYQU5mO5iX9TKn27Qer8y/Mgh2y/iI2qOmF7+ZlSuyPlE6Di/1J8wXjenOYBvq8
         o96HpsORU3CtPR01JxwT2b/CVQ45Q0+IEzqzF6d7NuO2Hldw1X31K/V2v5TT40aP6/Sw
         CD3xsIdg4wnCLUErIl81SOL5sjZ65nxQuyneK6DN0Zeh3SjivZ+xgvhrVUDA3p0te1jm
         SC6ANB90tVgMvAH/WQrOQ+L25lts9fAN68n7qotk1nesI3gfNbHrMDhyYTJ2pt3XVcDI
         vMVw==
X-Gm-Message-State: AOJu0Yy2TKrHQ1ewUa9U55inEFA52KvXJhgSkfF5eMluJ5bNuJP5nBka
	KeIp3c8MK7TeTAZfixlf9xWPqd0tnp2VOpL2J5krz1cM4Z9VgH6JqQstK3+oEZKDKwjC+az0gqg
	7
X-Google-Smtp-Source: AGHT+IHiHyjHdpuDHdC2m4E/H4RZdLhrGRgPitHHeQ/BgmDxcZQ7fJcklOjKnXPEX8h+n7G0C1KBrw==
X-Received: by 2002:a17:902:ec87:b0:1f7:1495:6ebd with SMTP id d9443c01a7336-1f83b5f06edmr61159025ad.18.1718288472995;
        Thu, 13 Jun 2024 07:21:12 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/29] iputils: splitting the ping6 as a package
Date: Thu, 13 Jun 2024 07:20:29 -0700
Message-Id: <964bdb0f8877a229ea34ab1d95dc5dabc564af51.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200627

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The iputils merged the ping4 and ping6 command into the ping since the
commit ebad35fe[1], currently, iputils ping support being called using
"ping -6" or "ping6" symlinks.

In oe-core, there are two packages provide ipv6 ping, inetutils and iputils,
the inetutils-ping6 doesn't support "-I" option to bind the interface, that
cause some of scripts(e.g. LTP test[2]) which was based on iputils-ping6 fails.

If someone or a package needs iputils-ping6, they can enable it in local.conf
or add it into rdepends directly.

Ref:
[1] https://github.com/iputils/iputils/commit/e3de851b809c7b72ccc654a72b6af61d
[2] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/ \
    containers/netns/netns_comm.sh#L25

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0b89bc2041f670af625829d061ce79e0840ac116)
Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/iputils/iputils_20240117.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_20240117.bb b/meta/recipes-extended/iputils/iputils_20240117.bb
index 5a5e15528e..3880689742 100644
--- a/meta/recipes-extended/iputils/iputils_20240117.bb
+++ b/meta/recipes-extended/iputils/iputils_20240117.bb
@@ -35,7 +35,11 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
-SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff"
+ALTERNATIVE:${PN}-ping6 = "ping6"
+ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
+
+SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff \
+             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ping6', '', d)}"
 PACKAGES += "${SPLITPKGS}"
 
 ALLOW_EMPTY:${PN} = "1"
@@ -43,6 +47,13 @@ RDEPENDS:${PN} += "${SPLITPKGS}"
 
 FILES:${PN} = ""
 FILES:${PN}-ping = "${base_bindir}/ping.${BPN}"
+FILES:${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
 FILES:${PN}-arping = "${base_bindir}/arping"
 FILES:${PN}-tracepath = "${base_bindir}/tracepath"
 FILES:${PN}-clockdiff = "${base_bindir}/clockdiff"
+
+do_install:append() {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false', d)}; then
+		ln -sf ping ${D}/${base_bindir}/ping6
+	fi
+}
-- 
2.34.1


