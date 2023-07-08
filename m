Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7EDEB64DC
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:07 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.329.1688831762414942146
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=GMXn4coZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-55ba5fae2e6so2259251a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831761; x=1691423761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0JnnhXurP0cB/U1w9QfhV/tQrjxrX5QSgyFQUvK3Ag=;
        b=GMXn4coZuy8LROYQ2fJZaoCgfPDf+PMD81aK/bXU2GVjQaJp1orQqDHTMmaVu0ymCz
         i7DwvbFPTliaxdOVow+iBmaLU3lVvY8Fwx/ohFgHF7xSRrWwqGWxOZmP1QbiiJhg6nFr
         5TGJvQVFNUB3oGjWRebxYN41SiMVR+P9p4BdEbPW1WBqlTrzloPMatY6VTIuaZBDHj7C
         o6e3TDk4qVegAh/3c8ZvRZpA5euBaZ4z0nuqmXkKxPLV+hHZIfBivVF36MKhgdv4XPRy
         6FXB6OsFbtxY8kfRLfEjmOs+lH6Uqvpnn6COeY/Eg53MW7vlWy2yNKWotGbeNLGsovGN
         YSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831761; x=1691423761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0JnnhXurP0cB/U1w9QfhV/tQrjxrX5QSgyFQUvK3Ag=;
        b=Ea54bVEHclQ4Qc0SqX1w98Iere0U86liWumQpC1OUAHmO6aGPTgzVcsROXccFg9ye7
         GnI8mEgb0tQIbNDJ8Bo8V2HZw8PIdWn8XjHhad6jE0L/UwcFw92j4f4DFdW2uQ2P6Jff
         Drus8qxvsdAZrIFjrK5hZOGpigV40i8QKTk/PynmZUASrjOMQPjRJ+cXEwhIOoJ8g5ai
         SfZ7UUu3BEUjpJVLkoRnGpKbzl8GFAHba8eiCHpuggc2YJ171Z9mRxXto+JCTZJZhEpc
         llkXyOqNsbMo34PKhywRRxNUIIYZOlWKSNkaxgn6BEAhrTtk4LiOZcWeEaY8kKxvMMOT
         S0ag==
X-Gm-Message-State: ABy/qLaqNgWEBwl+ixU4n+fNgz051PBnQCTG+MVknxoT8JS8CqMqBI/I
	JfNvOduDWoCoEigI5t6Uhvb7tsrSoDk0eI8ebEA=
X-Google-Smtp-Source: APBJJlHVbUvaiLomi5e34Le70/+UL2o2Bd25Bwb/EQ4HEsKm7bUeG/4nnjDiCSqSk16tgqDxg4XHSw==
X-Received: by 2002:a17:90a:404f:b0:263:f72f:491 with SMTP id k15-20020a17090a404f00b00263f72f0491mr8513852pjg.43.1688831760867;
        Sat, 08 Jul 2023 08:56:00 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.55.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/17] cups: Fix CVE-2023-34241
Date: Sat,  8 Jul 2023 05:55:35 -1000
Message-Id: <28b25ba7a8c6aa5c5744ca17e8686f2762791c72.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184021

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


