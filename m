Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0019ACD98C7
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 02:48:48 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62491.1781232525569553918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 19:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: otavio.salvador@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-963849a4611so138546241.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 19:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781232524; x=1781837324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yg3i7sfWlLgjRC76SB5tdXHWJl7jdM6tyrZ4dfym/X4=;
        b=ot5hAlFr2BzOKE1K/YNY3J9+CYqs8fEdmCYQ5AjzwcVrGcwIFm5o54j9Mp05tDGVGN
         k6Y8hDU7KI+yIKGzTrJlBs0Ztq7T/A/qGOml0fLnXwAB2Kl2zmEa5wpiFnFYg1wqL1HQ
         sHD3EJlKl4V9CUSo68WHM03ExRbrluMrOWYIMv8YCv3UWujrVjWT15SH2uRDd3YBN7Dg
         gmEkxl0WVG01JKgyt+lW/Gsh16W24JT1PHjZ/gVY3TBhtz9EwTL5SKEze/rQk7jiKJRs
         yzu4MASRTUzK1irMw6KZEIpnzglzkx9H2zgNF+ZLI0BrO866ydE6hPxJhuzSRDRcZuKw
         1Ayg==
X-Gm-Message-State: AOJu0YxpBkweAAbuYKKhGHIpgUNMnAI99KF0+wvujkQCJTRqKbOaljSQ
	QbCVzixviSbkClWysGkb0aKdkP6Db3kovTD+Bojk9CrVRJcByyOWgy/YPgOOLURo
X-Gm-Gg: Acq92OFtEICjz/q56sav1qoI9tQmArmovTXl9exyVayyHylizMiA5VyDxa2x2WfLiGQ
	FD1d7X9phLpzvBJqD2qwm9JfhohpJacpRR6T3HQtwngofSEw3oa1RtRW2nsAJadAkshVqGMeCqN
	zPQZQ7H9qLNVrpdJOGxQp63S/atZY754B6yN9NLwlwgrQYCydZPgN2iLHS8civSUmEQ3cLqemIf
	6CX5olzyAtWbjM6WxKSQ7aNfeGCDweFMnvHkZa9xB53fOhD8u+UQTHLxQfV3diBX5KxkEcO98Qy
	+RVwHsTx7CxCqMvYpj6YU5I3gh6qNBp8mHfqCVmdOLcGIB6xaQ/gq1JyktlYBxDLziWHRojIyJP
	/301tXNW0vXYvLo0PL9Amg+Xy/e6ivqlYENU3Qv7Za2fiYeZXVZGEC5jUFM99GVwid0Lsc5ALBo
	1Twemn8fhICK6UEIb7GmHecpmCvvi3orlce0VcY4U8DGK+SDRaUXc3C8+Ii/9bDkoePxHYuEpmk
	eJvIYgZjZ6XkYjLZWlnZ9omPmfxnZ+xMDKK9uNiNfeWGQNaPLTMlVpX45ENL7Q7pA==
X-Received: by 2002:a05:6102:41a8:b0:6de:3c29:373b with SMTP id ada2fe7eead31-71e88c3d3a8mr358687137.15.1781232524456;
        Thu, 11 Jun 2026 19:48:44 -0700 (PDT)
Received: from localhost (201-35-188-177.user3p.v-tal.net.br. [201.35.188.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb69225d75sm1205796e0c.14.2026.06.11.19.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 19:48:43 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] quota: use native rpcgen and a single-word RPCGEN_CPP
Date: Thu, 11 Jun 2026 23:48:29 -0300
Message-ID: <20260612024829.4160586-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 02:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238589

The rpc PACKAGECONFIG regenerates rquota.{c,h} and rquota_clnt.c from
rquota.x with rpcgen at build time, as the tarball ships no
pre-generated copies. Two problems made this fail:

- rpcgen was picked up from the host via HOSTTOOLS rather than from the
  build, which is non-deterministic and breaks on hosts that have no
  rpcgen at all.

- rpcgen execs its C preprocessor as a single program name, but OE
  exports $CPP as a multi-word "gcc -E --sysroot=... <flags>" string,
  so rpcgen reports "cannot find C preprocessor" and aborts.

Depend on rpcsvc-proto-native so rpcgen comes from the build, and set
RPCGEN_CPP to the single-word cross cpp so the preprocessor can be
exec'd.

Tested with bitbake quota (configure/compile/install/package) on
qemuarm.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/quota/quota_4.11.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/quota/quota_4.11.bb b/meta/recipes-extended/quota/quota_4.11.bb
index b386071961..811056f1f7 100644
--- a/meta/recipes-extended/quota/quota_4.11.bb
+++ b/meta/recipes-extended/quota/quota_4.11.bb
@@ -26,6 +26,10 @@ ASNEEDED = ""
 PACKAGECONFIG ??= "rpc bsd"
 PACKAGECONFIG:libc-musl = "rpc"
 
-PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,libtirpc"
+# rpcgen execs its preprocessor as a single program; OE's multi-word $CPP fails,
+# so point it at the cross cpp instead.
+export RPCGEN_CPP = "${TARGET_PREFIX}cpp"
+
+PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,libtirpc rpcsvc-proto-native"
 PACKAGECONFIG[bsd] = "--enable-bsd_behaviour=yes,--enable-bsd_behaviour=no,"
 PACKAGECONFIG[ldapmail] = "--enable-ldapmail,--disable-ldapmail,openldap"
-- 
2.53.0


