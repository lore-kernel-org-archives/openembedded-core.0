Return-Path: <hadkeakash4@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579D5C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 15:06:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.8206.1666105587883072701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 08:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fp7BA73M;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: hadkeakash4@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id e18so10917527wmq.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSjUR29CK3inzae6FH6MRgOQmwGxYm58dVLL1WIDDUo=;
        b=Fp7BA73MY1NotIOp3j523zT1p3xgf3pPtly6nfzVKo+zuxrmnUcBnSFSz/R8yJIXQH
         nXiFQg7C2iEg+CWCdUiOOPGf/E5+EqxGLc1KJwLpIDFTtCtGN4BeqnZqgu5J4oiO4jLc
         J0UFvvrLYUsvYgEOLFDg0L9YSZqEwI9ibBEecKuOPLXsXMZ4E4WM+OSWaYjtFthvuiSe
         OiqJ08YGzaL85eO9ZnCLbWFtBkDjPJYja0zzNJCsrLxjpyiSML362FAoZTi9KfX41NRp
         hoBZX8ObRgl3c2X+PfMtdVQiHixSV7zewsiHilIOsbhvQT1pgR8rcVPrvEUhA84l+ACT
         lJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSjUR29CK3inzae6FH6MRgOQmwGxYm58dVLL1WIDDUo=;
        b=fTlAsOuqx3pIyViNvucvEpo0U7kacCrKpqURlv1BvMFkGmbOddItSQxDZ1bQWd43sN
         RWhcjJY+SvQUuxo742gHa758CMxkspDb4HMp8M9jcF1FwW/dMN6+a1LKaYDqOuQbrx6Z
         w2LcJZ8ueMJlRAaMHMpMnFAs3/IMKQ20gE4cTH+CqlXeMCT6lrAddIAuPayPRZSL61Xm
         J2Hq18tpYtKeBDExYJaIzua9HeeowIVvhqBazKp8EiaDl/Nz/qL7/yJ1OgPSe38E1t4X
         4KfE+YfTAihnUHfGuPGBP3tSlA49Ho3lHIggQu+q4yyWL8vHg1UaP2bGxFptdALlgBFS
         zaXw==
X-Gm-Message-State: ACrzQf0UkWoO8Me+5aW/bKD9GZ4j9jyNJq3ug+2CC5hhKNaRlBkPuoDL
	eFyA38ae3ITzwnrZSib+GRyouYSOFws=
X-Google-Smtp-Source: AMsMyM4Enn0UdCyF8hiMpjtl4Yg048yOGK8zlP1QEuBTkS8GtDzIfV9Iq+/v2VDPELKOPGrm5xdstg==
X-Received: by 2002:a05:600c:1e8b:b0:3c6:f6e5:c41d with SMTP id be11-20020a05600c1e8b00b003c6f6e5c41dmr7992257wmb.12.1666105585839;
        Tue, 18 Oct 2022 08:06:25 -0700 (PDT)
Received: from GL-449.bmw-carit.intra ([212.118.206.70])
        by smtp.gmail.com with ESMTPSA id q19-20020a05600c2ed300b003b3365b38f9sm13164770wmn.10.2022.10.18.08.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:06:25 -0700 (PDT)
From: Akash Hadke <hadkeakash4@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Akash Hadke <akash.hadke@kpit.com>,
	Akash Hadke <hadkeakash4@gmail.com>
Subject: [meta-selinux][dunfell][PATCH] audit: Add patch to fix ipx.h missing file bug for kernel 5.15
Date: Tue, 18 Oct 2022 17:06:21 +0200
Message-Id: <20221018150621.27217-1-hadkeakash4@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 15:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171944

From: Akash Hadke <akash.hadke@kpit.com>

ipx.h header file is removed in kernel 5.15
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/net?id=6c9b40844751ea30c72f7a2f92f4d704bc6b2927

which is causing below error for system with kernel equal and
higher than 5.15

| ../../git/auparse/interpret.c:48:10: fatal error: linux/ipx.h: No such file or directory
|    48 | #include <linux/ipx.h>
|       |          ^~~~~~~~~~~~~

Add below patch to fix this issue.
0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch
Link: https://github.com/linux-audit/audit-userspace/commit/6b09724c69d91668418ddb3af00da6db6755208c

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
---
 ...retation-dependent-on-the-ipx-header.patch | 66 +++++++++++++++++++
 recipes-security/audit/audit_2.8.5.bb         |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 recipes-security/audit/audit/0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch

diff --git a/recipes-security/audit/audit/0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch b/recipes-security/audit/audit/0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch
new file mode 100644
index 0000000..cab5c45
--- /dev/null
+++ b/recipes-security/audit/audit/0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch
@@ -0,0 +1,66 @@
+From 6b09724c69d91668418ddb3af00da6db6755208c Mon Sep 17 00:00:00 2001
+From: Steve Grubb <sgrubb@redhat.com>
+Date: Thu, 2 Sep 2021 15:01:12 -0400
+Subject: [PATCH] Make IPX packet interpretation dependent on the ipx header
+ file existing
+
+Upstream-Status: Backport [https://github.com/linux-audit/audit-userspace/commit/6b09724c69d91668418ddb3af00da6db6755208c.patch]
+Comment: Remove one hunk from changelog file and refresh rest hunks as per codebase of audit_2.8.5
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
+---
+ auparse/interpret.c | 8 ++++++--
+ configure.ac        | 6 ++++++
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/auparse/interpret.c b/auparse/interpret.c
+index 63829aa0e..6c316456d 100644
+--- a/auparse/interpret.c	2022-10-14 11:22:20.833880000 +0200
++++ b/auparse/interpret.c	2022-10-14 11:35:13.196455950 +0200
+@@ -44,8 +44,10 @@
+ #include <linux/ax25.h>
+ #include <linux/atm.h>
+ #include <linux/x25.h>
+-#include <linux/if.h>   // FIXME: remove when ipx.h is fixed
+-#include <linux/ipx.h>
++#ifdef HAVE_IPX_HEADERS
++  #include <linux/if.h>   // FIXME: remove when ipx.h is fixed
++  #include <linux/ipx.h>
++#endif
+ #include <linux/capability.h>
+ #include <sys/personality.h>
+ #include <sys/prctl.h>
+@@ -1158,6 +1160,7 @@
+ 					      x->sax25_call.ax25_call[6]);
+                         }
+                         break;
++#ifdef HAVE_IPX_HEADERS
+                 case AF_IPX:
+                         {
+                                 const struct sockaddr_ipx *ip =
+@@ -1167,6 +1170,7 @@
+ 					str, ip->sipx_port, ip->sipx_network);
+                         }
+                         break;
++#endif
+                 case AF_ATMPVC:
+                         {
+                                 const struct sockaddr_atmpvc* at =
+diff --git a/configure.ac b/configure.ac
+index 8f541e4c0..005eb0b5b 100644
+--- a/configure.ac	2022-10-14 11:22:20.833880000 +0200
++++ b/configure.ac	2022-10-14 11:36:32.391044084 +0200
+@@ -414,6 +414,12 @@
+ 	AC_DEFINE_UNQUOTED(HAVE_LIBWRAP, [], Define if tcp_wrappers support is enabled )
+ fi
+ 
++# linux/ipx.h - deprecated in 2018
++AC_CHECK_HEADER(linux/ipx.h, ipx_headers=yes, ipx_headers=no)
++if test $ipx_headers = yes ; then
++	AC_DEFINE(HAVE_IPX_HEADERS,1,[IPX packet interpretation])
++fi
++
+ # See if we want to support lower capabilities for plugins
+ LIBCAP_NG_PATH
+ 
+
diff --git a/recipes-security/audit/audit_2.8.5.bb b/recipes-security/audit/audit_2.8.5.bb
index af36ed5..7130364 100644
--- a/recipes-security/audit/audit_2.8.5.bb
+++ b/recipes-security/audit/audit_2.8.5.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=2.8_maintena
            file://auditd \
            file://auditd.service \
            file://audit-volatile.conf \
+           file://0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


