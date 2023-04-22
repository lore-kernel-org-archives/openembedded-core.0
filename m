Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96441C6FD18
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:58:29 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.10399.1682179100104231235
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=R8zmvWWZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-63b73203e0aso19669916b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682179099; x=1684771099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBtsDSVnmXv87gFdARdgulBVNpnJN+Qn2irk3l+sBsU=;
        b=R8zmvWWZ+jNs/XONYSZ/vp0PCzFlLnczIRwT5PlOrR+erCBw8Xn+Tei2IQ+Ma1uDE1
         keJyT73yRrrEfmeJtiaNQ+AJq3yyRCsGcUWW3m+/yiec8SK//3ImqPHEuO7ij86REUpa
         JLQ5/szKkw4v6PCHAVKm8KfKLPY8e8PPbZHb82QmFDEPmiUazVd06GfNsYcdO6ufbBfZ
         76iX6P5iMMjVKakAuyTfP/i8xyUsbllRwvZTZZcdir/+TdsmOBwqrSnIorNsjFkPXAI4
         2MQQ6VSFWni7FmwxSiOb+rKBH+KvB7qQ6hlnmnUJDif6hsIbmAMK9fDbBYD5mxS/dWo3
         tV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179099; x=1684771099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBtsDSVnmXv87gFdARdgulBVNpnJN+Qn2irk3l+sBsU=;
        b=am+W1n9IPXDykvimaNvWoMcRi04bc8Q/5x9wALEMkj5Qip7GJTiw6Cgv3AcAqzk0mv
         OHSYpdcvujlwzcXDh1nafd1JnJ612VDfyyEqTuZ8i82gw2OWpeCAhvb9wuN+RON0HT3M
         FgxDpHtkCOiYxGsKTWA3mzOeoXZ/y+aNboKuWG8toi4zCAcKpNOft2kpy5WXz0FeicZd
         7ADBjYlV/IKZlqgGQF9eN6INOW2an/QZKrqygbQEYGrNhtShj/jCoilUb/oK3hfXQdb1
         oI2WqYzoNJfWyCDgszaEfRfBF8Qa6q99qxZPMTcDRgAgqvaff24rGaNqDpzMkSh8hPLy
         sokw==
X-Gm-Message-State: AAQBX9ejj+ezMFK6xcdxyCPKCG9OTAf/hkQXIvFciNQAakyGmHRcTwao
	DmFH5h7anThDQ+hU7mRoGfH/bjcKexJN9kFzmt8=
X-Google-Smtp-Source: AKy350ZZjlH2XnUEZvV3LQEJRorRbsBxrQ9zm4/ccKC97bc+WqLY9evC6yccBi3hzzSXJm88dF67xw==
X-Received: by 2002:a17:903:2451:b0:1a6:d295:ad5a with SMTP id l17-20020a170903245100b001a6d295ad5amr11067748pls.1.1682179099096;
        Sat, 22 Apr 2023 08:58:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709028c8d00b001a4fe00a8d4sm4189412plo.90.2023.04.22.08.58.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:58:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/7] screen: CVE-2023-24626 allows sending SIGHUP to arbitrary PIDs
Date: Sat, 22 Apr 2023 05:58:02 -1000
Message-Id: <d1f99b928b0a57bec879dde1b1b94c3c09286ea0.1682178944.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178944.git.steve@sakoman.com>
References: <cover.1682178944.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180316

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/screen.git/commit/?id=e9ad41bfedb4537a6f0de20f00b27c7739f168f7

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../screen/screen/CVE-2023-24626.patch        | 40 +++++++++++++++++++
 meta/recipes-extended/screen/screen_4.8.0.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2023-24626.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2023-24626.patch b/meta/recipes-extended/screen/screen/CVE-2023-24626.patch
new file mode 100644
index 0000000000..73caf9d81b
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/CVE-2023-24626.patch
@@ -0,0 +1,40 @@
+From e9ad41bfedb4537a6f0de20f00b27c7739f168f7 Mon Sep 17 00:00:00 2001
+From: Alexander Naumov <alexander_naumov@opensuse.org>
+Date: Mon, 30 Jan 2023 17:22:25 +0200
+Subject: fix: missing signal sending permission check on failed query messages
+
+Signed-off-by: Alexander Naumov <alexander_naumov@opensuse.org>
+
+CVE: CVE-2023-24626
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/screen.git/commit/?id=e9ad41bfedb4537a6f0de20f00b27c7739f168f7]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ socket.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/socket.c b/socket.c
+index bb68b35..9d87445 100644
+--- a/socket.c
++++ b/socket.c
+@@ -1285,11 +1285,16 @@ ReceiveMsg()
+           else
+             queryflag = -1;
+ 
+-          Kill(m.m.command.apid,
++          if (CheckPid(m.m.command.apid)) {
++            Msg(0, "Query attempt with bad pid(%d)!", m.m.command.apid);
++          }
++          else {
++            Kill(m.m.command.apid,
+                (queryflag >= 0)
+                    ? SIGCONT
+                    : SIG_BYE); /* Send SIG_BYE if an error happened */
+-          queryflag = -1;
++            queryflag = -1;
++          }
+         }
+         break;
+       case MSG_COMMAND:
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/screen/screen_4.8.0.bb b/meta/recipes-extended/screen/screen_4.8.0.bb
index fe640c262b..c4faa27023 100644
--- a/meta/recipes-extended/screen/screen_4.8.0.bb
+++ b/meta/recipes-extended/screen/screen_4.8.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
            file://CVE-2021-26937.patch \
+           file://CVE-2023-24626.patch \
           "
 
 SRC_URI[md5sum] = "d276213d3acd10339cd37848b8c4ab1e"
-- 
2.34.1


