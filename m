Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1C3EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 04:07:56 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.51458.1688443671381307023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jul 2023 21:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=OYu+ZF+r;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b852785a65so32581825ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 21:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688443670; x=1691035670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=96KE9nmG3QFE27F31pzx/eOIBpbsD6mISsRVVs97V74=;
        b=OYu+ZF+rVcLLrEAk6wo45zHEQoOgd/pkLO914RnghkNQnJeMUABno0IJkw54qR9Jc6
         e9MLY7uSrqJ8chGCcy2KbgRMEM4WUsTkenQHRA3O2vaEO82Wpb3mHpvIa/DVAEP0gwwD
         VYG+8c1cwzQHJgtlMiGjMStsrQsjH4bpQzt1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688443670; x=1691035670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96KE9nmG3QFE27F31pzx/eOIBpbsD6mISsRVVs97V74=;
        b=RkIE+OXwen7q6fvgVHZJNO7GtezFaPiySllZyeAq2D7TWuJPbXtQLqFIy/KWXqAdz9
         b8kPG5yd6zkSOg8pDWdxfib2UEA1XZA0LsGaK2LvkKi8+oCsvnBAC3qD4T2pRDDPzZhc
         HdkckQb5+/VExgsiRr/sZPbq0KxcYJcvffVYJRzqepTZVJICLeUuVw6hyK5vk8JrMVQl
         JlmoeP1B5qOOQtVdGR8yIK9WEyJ9W1Jhj+OpOmFwrPswngTNbpVIp4R6IOaFzqZmmYCY
         RPXuLrIpHolLCbcQFtt4tE8CX6EaNBwybiKIqXO7aJhlLISqx0YqfiiIzRYFNDfj1cC0
         0i8w==
X-Gm-Message-State: ABy/qLZnKc74LJdsvKB6Bc5ZwkeA8cjyg6HXE24ecP/vxfK0vDT7Nnnm
	/IXWYv2qzqeqdpdj6c5kAQaiOSlEStZHI93oqWE=
X-Google-Smtp-Source: APBJJlHL1z//4R+oSSZEpUnOHo5rupGE8YtVRmqhIdhudqMfah0/gO+K6gIjPhsMuYtvJxE/2pvhCA==
X-Received: by 2002:a17:903:11ce:b0:1b8:8702:1e7c with SMTP id q14-20020a17090311ce00b001b887021e7cmr11106625plh.33.1688443670149;
        Mon, 03 Jul 2023 21:07:50 -0700 (PDT)
Received: from MVIN00020.mvista.com ([122.162.27.100])
        by smtp.gmail.com with ESMTPSA id y17-20020a170902b49100b001b54dcd84e2sm15961405plr.240.2023.07.03.21.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 21:07:49 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] cups: Fix CVE-2023-34241
Date: Tue,  4 Jul 2023 09:35:39 +0530
Message-Id: <20230704040539.586316-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 04:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183811

From: Vijay Anusuri <vanusuri@mvista.com>

OpenPrinting CUPS is a standards-based, open source printing system for Lin=
ux and other Unix-like operating systems. Starting in version 2.0.0 and pri=
or to version 2.4.6, CUPS logs data of free memory to the logging service A=
FTER the connection has been closed, when it should have logged the data ri=
ght before. This is a use-after-free bug that impacts the entire cupsd proc=
ess. The exact cause of this issue is the function `httpClose(con->http)` b=
eing called in `scheduler/client.c`. The problem is that httpClose always, =
provided its argument is not null, frees the pointer at the end of the call=
, only for cupsdLogClient to pass the pointer to httpGetHostname. This issu=
e happens in function `cupsdAcceptClient` if LogLevel is warn or higher and=
 in two scenarios: there is a double-lookup for the IP Address (HostNameLoo=
kups Double is set in `cupsd.conf`) which fails to resolve, or if CUPS is c=
ompiled with TCP wrappers and the connection is refused by rules from `/etc=
/hosts.allow` and `/etc/hosts.deny`. Version 2.4.6 has a patch for this iss=
ue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-34241
https://github.com/OpenPrinting/cups/security/advisories/GHSA-qjgh-5hcq-5f25
https://security-tracker.debian.org/tracker/CVE-2023-34241

Upstream Patch:
https://github.com/OpenPrinting/cups/commit/9809947a959e18409dcf562a3466ef2=
46cb90cb2

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-34241.patch            | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-34241.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cu=
ps/cups.inc
index d6e7d95800..1d2377486a 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,7 @@ SRC_URI =3D "https://github.com/apple/cups/releases/downl=
oad/v${PV}/${BP}-source.t
            file://0004-cups-fix-multilib-install-file-conflicts.patch\
            file://CVE-2022-26691.patch \
            file://CVE-2023-32324.patch \
+           file://CVE-2023-34241.patch \
            "
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/apple/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-34241.patch b/meta/re=
cipes-extended/cups/cups/CVE-2023-34241.patch
new file mode 100644
index 0000000000..816efc2946
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-34241.patch
@@ -0,0 +1,65 @@
+From ffd290b4ab247f82722927ba9b21358daa16dbf1 Mon Sep 17 00:00:00 2001
+From: Rose <83477269+AtariDreams@users.noreply.github.com>
+Date: Thu, 1 Jun 2023 11:33:39 -0400
+Subject: [PATCH] Log result of httpGetHostname BEFORE closing the connecti=
on
+
+httpClose frees the memory of con->http. This is problematic because httpG=
etHostname then tries to access the memory it points to.
+
+We have to log the hostname first.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/980=
9947a959e18409dcf562a3466ef246cb90cb2]
+CVE: CVE-2023-34241
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ scheduler/client.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/scheduler/client.c b/scheduler/client.c
+index 91e441188c..327473a4d1 100644
+--- a/scheduler/client.c
++++ b/scheduler/client.c
+@@ -193,13 +193,11 @@ cupsdAcceptClient(cupsd_listener_t *lis)/* I - Liste=
ner socket */
+    /*
+     * Can't have an unresolved IP address with double-lookups enabled...
+     */
+-
+-    httpClose(con->http);
+-
+     cupsdLogClient(con, CUPSD_LOG_WARN,
+-                    "Name lookup failed - connection from %s closed!",
++                    "Name lookup failed - closing connection from %s!",
+                     httpGetHostname(con->http, NULL, 0));
+=20
++    httpClose(con->http);
+     free(con);
+     return;
+   }
+@@ -235,11 +233,11 @@ cupsdAcceptClient(cupsd_listener_t *lis)/* I - Liste=
ner socket */
+       * with double-lookups enabled...
+       */
+=20
+-      httpClose(con->http);
+-
+       cupsdLogClient(con, CUPSD_LOG_WARN,
+-                      "IP lookup failed - connection from %s closed!",
++                      "IP lookup failed - closing connection from %s!",
+                       httpGetHostname(con->http, NULL, 0));
++
++      httpClose(con->http);
+       free(con);
+       return;
+     }
+@@ -256,11 +254,11 @@ cupsdAcceptClient(cupsd_listener_t *lis)/* I - Liste=
ner socket */
+=20
+   if (!hosts_access(&wrap_req))
+   {
+-    httpClose(con->http);
+-
+     cupsdLogClient(con, CUPSD_LOG_WARN,
+                     "Connection from %s refused by /etc/hosts.allow and "
+ 		    "/etc/hosts.deny rules.", httpGetHostname(con->http, NULL, 0));
++
++    httpClose(con->http);
+     free(con);
+     return;
+   }
--=20
2.25.1


