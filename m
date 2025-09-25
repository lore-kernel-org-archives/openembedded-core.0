Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977DBCAC5BA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:41:20 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.11872.1758807679544110371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HBn2aVXF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3327f8ed081so1312778a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758807679; x=1759412479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgwdJh7vSCk5WKuAXebNyzWG3wf1AhKcsFd32Hc2j74=;
        b=HBn2aVXF9/PKcaT0NzgYihbYSBX6y3Ysr9FcAfKVfdn/H3DMHVBtFeAO9fdSQ8JYpq
         E26/ahqqYhD6JtzQAPxeyOSNPz/SB6S+colY1LBjEnMF9f+UtrgGR0rFdYyEg+YiR8Dq
         IyUqtKmHxfF1srM8+uZnqsmHQ3kKzG0kx9Q/7Sp8BUYorX3PECWOTaSzYCkKUmXVSyU/
         vLFkCqArF77LwSaaOetOt6ErgKnh63k23QCLtYzQVTWukPImrETFL1eIsY7Pv/3TtVIi
         W5cmxyCRrKBoUujdFsIujqG6JRxj5JUXIiNb/y4IV8jgS6CQ3OxPzckI3Ozyhoa/Ct5Y
         +YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807679; x=1759412479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgwdJh7vSCk5WKuAXebNyzWG3wf1AhKcsFd32Hc2j74=;
        b=Y6UPq+oVhQJmLgD9CH3b7YcuZqEUYijfpR9X7WpZWT5K/CeBweYRzOQYwEJ9BSRL3e
         qMW8TQAiEc7MiVN5gBf7v0imh1Umk69uXHIb/VayYusmFPKlCI64z6PeG5NedMougnan
         iMhFiqh0+B31lONEF3Eh1ToltMEFsEAZIaZtDX2DZtRQxk6apmaOc81HKFHhS0YKFJXy
         2usS/W/Pdi/nd8H6r4F7E1lUmKDXouZsGniqIpRvR57vjJbJWJOo/lpK/nxK0YF/Yl5Q
         WLA5IUN6V6+NrnFcNA/8qMawaZNGBdfS4LaBz9thtm0OQcqywT8FgqVq5T2U0nIHXVvT
         5Iwg==
X-Gm-Message-State: AOJu0Yzbq0W3aVl7GBIx2eLs7H1Ii//Z8Zg6jB9lK4sfxowbpAkywMGi
	CWJ+KIH9Qczqoy/ClWBHuDPKnQ99HMp3B38WS0uIOex4FWCKTjfdCN+8g0ZLlogyDuv0pPosO64
	96q+U
X-Gm-Gg: ASbGncsRtOIU2zqrdQAZ/FAXN0cuZ0z1ha1Yvhc5yiHFjHo/rwURh4iuHdXl2tNr5+V
	0ZsiftIzTGeWz0qpVc2PQMZ5K/VqlzexzJgRIe47U4rKdMxr6wwfN8eY8jFqZ97kOmFKPoUu2Px
	xbPlOEvbhPbphuVlerbVFoOUHKCBA/P78QY+722JHzTsdcRPljTER53gk0qomudtS5yzkILWyIg
	c6EVe35KW0lxQcj5FZVI2ToePe7zUzMkbvs5JblLdMQmwEy/Udp9pGcD8auWTh3qbgcrS5Px0RJ
	SZW6QcVmB94XpHsokL+u4iNEJ52UNSfMN/XLLohYUlymPYEdCxElv6giXkjbab2nrIqupe2zX3d
	EIo7IUlAPyqusTP1PTt0nxQz/
X-Google-Smtp-Source: AGHT+IGOcLbhN48ku0ixQOl4+JhA9RcE2S55wHzVRznGLR09d0MLSt0bEqSXGt9Rtg9oFtHDq323Gg==
X-Received: by 2002:a17:90b:17ca:b0:332:906a:85cd with SMTP id 98e67ed59e1d1-3342a2d8f80mr4264073a91.19.1758807678623;
        Thu, 25 Sep 2025 06:41:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:127b:348d:dc99:9937])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3346e9eba87sm2430014a91.0.2025.09.25.06.41.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:41:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/11] examples: genl: fix wrong attribute size
Date: Thu, 25 Sep 2025 06:40:54 -0700
Message-ID: <bae5ecea1c40847ffc3760173192f85e28ed9d7b.1758807463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758807463.git.steve@sakoman.com>
References: <cover.1758807463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 13:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224028

From: Nitin Wankhade <nitin.wankhade333@gmail.com>

This example no longer works on more recent kernels:

genl-family-get
error: Invalid argument

dmesg says:
netlink: 'genl-family-get': attribute type 1 has an invalid length.

Fix this and also zero out the reserved field in the genl header,
while not validated yet for dumps this could change.

Upstream-Status: Backport [https://git.netfilter.org/libmnl/patch/?id=54dea548d796653534645c6e3c8577eaf7d77411]

Reported-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
Signed-off-by: Florian Westphal <fw@strlen.de>
(cherry picked from commit 54dea548d796653534645c6e3c8577eaf7d77411)
Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...amples-genl-fix-wrong-attribute-size.patch | 44 +++++++++++++++++++
 meta/recipes-extended/libmnl/libmnl_1.0.5.bb  |  5 ++-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch

diff --git a/meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch b/meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch
new file mode 100644
index 0000000000..9e06abb9a4
--- /dev/null
+++ b/meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch
@@ -0,0 +1,44 @@
+From 67ad7abf1fe888c650f9e8ed326a499e1456285c Mon Sep 17 00:00:00 2001
+From: Florian Westphal <fw@strlen.de>
+Date: Mon, 15 Sep 2025 14:40:30 +0200
+Subject: [PATCH] examples: genl: fix wrong attribute size
+
+This example no longer works on more recent kernels:
+
+genl-family-get
+error: Invalid argument
+
+dmesg says:
+netlink: 'genl-family-get': attribute type 1 has an invalid length.
+
+Fix this and also zero out the reserved field in the genl header,
+while not validated yet for dumps this could change.
+
+Upstream-Status: Backport [https://git.netfilter.org/libmnl/patch/?id=54dea548d796653534645c6e3c8577eaf7d77411]
+
+Reported-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Signed-off-by: Florian Westphal <fw@strlen.de>
+(cherry picked from commit 54dea548d796653534645c6e3c8577eaf7d77411)
+Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+---
+ examples/genl/genl-family-get.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/examples/genl/genl-family-get.c b/examples/genl/genl-family-get.c
+index ba8de12..0c20067 100644
+--- a/examples/genl/genl-family-get.c
++++ b/examples/genl/genl-family-get.c
+@@ -199,8 +199,9 @@ int main(int argc, char *argv[])
+ 	genl = mnl_nlmsg_put_extra_header(nlh, sizeof(struct genlmsghdr));
+ 	genl->cmd = CTRL_CMD_GETFAMILY;
+ 	genl->version = 1;
++	genl->reserved = 0;
+ 
+-	mnl_attr_put_u32(nlh, CTRL_ATTR_FAMILY_ID, GENL_ID_CTRL);
++	mnl_attr_put_u16(nlh, CTRL_ATTR_FAMILY_ID, GENL_ID_CTRL);
+ 	if (argc >= 2)
+ 		mnl_attr_put_strz(nlh, CTRL_ATTR_FAMILY_NAME, argv[1]);
+ 	else
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
index 66b30d7f60..d0bf658eef 100644
--- a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
+++ b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
@@ -6,7 +6,10 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2"
+SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2 \
+           file://0001-examples-genl-fix-wrong-attribute-size.patch \
+"
+
 SRC_URI[sha256sum] = "274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525"
 
 inherit autotools pkgconfig
-- 
2.43.0


