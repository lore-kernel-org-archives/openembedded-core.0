Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987C4C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 04:44:30 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.26450.1655700265985366259
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 21:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iXCZ4f1u;
 spf=pass (domain: mvista.com, ip: 209.85.215.172,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id f65so9246626pgc.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 21:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=af7tIwZ8YwQ7X8FmLGvf+1OWyvkjCzfrL6jxz/6kr+g=;
        b=iXCZ4f1uQYx00FQ9yFIyNcz01CE+VFI+Ii+XGrEiI1c9U5Qls4LIevqr4n6yCjuTl/
         fKOUyazNY+c+4LjTjrEVgBYkykqEWlWuvj6I5/jC8JuRCcDVBNTnqrgo2lLTvgLXmJ4R
         mz4eIzv5jU+YUB1AbLMwp/kl0tDpa+qRGrOxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=af7tIwZ8YwQ7X8FmLGvf+1OWyvkjCzfrL6jxz/6kr+g=;
        b=7KIeuOKTMa1uD0rgxmMbz/QljQPS1IIj1OXJZNffouFfoUAmhuivB5l7pGcyn9KAjj
         XWcabVgVzYko85vRP3K8Stt6COL2JLab50LBXsyFcBYngEehOr2qnnadyyM7gnI/bud7
         iKy6I0zPTuu3d4QYt6eIquL4RGNL4Cej2bhTBxZ2KyGI8WtjGX/L3Bd86K7M6kDusozB
         RcwoTjrCoi/R0ZOSQe2NTaYi5iR1blvs1lgWCvCxMvCcLWi1XuhvNZMJUR8tmtWP51zA
         dsNNi0fOnVyp0FH+U1uaf7MykjFYYVQ393E3mbIPnts3IZoDuQ9DmK47JwOESLoLweiB
         1E+g==
X-Gm-Message-State: AJIora+bfzLfYVoTF2bRUfQOjhNe+qN9EO0CF1pan1qHP/D59eF9lpaa
	iO+EIRipPckgk8/WY5n8/57CPqDHAN8GnP0x
X-Google-Smtp-Source: 
 AGRyM1sSQ+TzDg43dGayQD1HrnQufgroeT1BU3kXcMVigZEDhVBG1KXyKPoockhCazsrk3UI+fhP2g==
X-Received: by 2002:a05:6a00:1a91:b0:51c:2fab:7340 with SMTP id
 e17-20020a056a001a9100b0051c2fab7340mr22717701pfv.74.1655700265302;
        Sun, 19 Jun 2022 21:44:25 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.203])
        by smtp.gmail.com with ESMTPSA id
 x16-20020a17090a165000b001e667f932cdsm9317854pje.53.2022.06.19.21.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 21:44:24 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Mon, 20 Jun 2022 10:14:19 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: jpuhlman@mvista.com,
	Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] cyrus-sasl: CVE-2022-24407 failure to properly
 escape SQL input allows an attacker to execute arbitrary SQL commands
Date: Mon, 20 Jun 2022 10:14:11 +0530
Message-Id: <20220620044411.6397-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 04:44:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167080

Source: https://github.com/cyrusimap/cyrus-sasl
MR: 118501
Type: Security Fix
Disposition: Backport from https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc
ChangeID: 5e0fc4c28d97b498128e4aa5d3e7c012e914ef51
Description:
       CVE-2022-24407 cyrus-sasl: failure to properly escape SQL input allows an attacker to execute arbitrary SQL commands.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../cyrus-sasl/CVE-2022-24407.patch           | 83 +++++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.27.bb           |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
new file mode 100644
index 000000000..0ddea03c6
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2022-24407.patch
@@ -0,0 +1,83 @@
+From 906b863c5308567086c6437ce17335b1922a78d1 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 15 Jun 2022 10:44:50 +0530
+Subject: [PATCH] CVE-2022-24407
+
+Upstream-Status: Backport [https://github.com/cyrusimap/cyrus-sasl/commit/9eff746c9daecbcc0041b09a5a51ba30738cdcbc]
+CVE: CVE-2022-24407
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ plugins/sql.c | 26 +++++++++++++++++++++++---
+ 1 file changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/plugins/sql.c b/plugins/sql.c
+index 95f5f707..5d20759b 100644
+--- a/plugins/sql.c
++++ b/plugins/sql.c
+@@ -1150,6 +1150,7 @@ static int sql_auxprop_store(void *glob_context,
+     char *statement = NULL;
+     char *escap_userid = NULL;
+     char *escap_realm = NULL;
++    char *escap_passwd = NULL;
+     const char *cmd;
+     
+     sql_settings_t *settings;
+@@ -1221,6 +1222,11 @@ static int sql_auxprop_store(void *glob_context,
+ 			    "Unable to begin transaction\n");
+     }
+     for (cur = to_store; ret == SASL_OK && cur->name; cur++) {
++	/* Free the buffer, current content is from previous loop. */
++	if (escap_passwd) {
++	    sparams->utils->free(escap_passwd);
++	    escap_passwd = NULL;
++	}
+ 
+ 	if (cur->name[0] == '*') {
+ 	    continue;
+@@ -1242,19 +1248,32 @@ static int sql_auxprop_store(void *glob_context,
+ 	}
+ 	sparams->utils->free(statement);
+ 
++	if (cur->values[0]) {
++	    escap_passwd = (char *)sparams->utils->malloc(strlen(cur->values[0])*2+1);
++	    if (!escap_passwd) {
++		ret = SASL_NOMEM;
++		break;
++	    }
++	    settings->sql_engine->sql_escape_str(escap_passwd, cur->values[0]);
++	}
++
+ 	/* create a statement that we will use */
+ 	statement = sql_create_statement(cmd, cur->name, escap_userid,
+ 					 escap_realm,
+-					 cur->values && cur->values[0] ?
+-					 cur->values[0] : SQL_NULL_VALUE,
++					 escap_passwd ?
++					 escap_passwd : SQL_NULL_VALUE,
+ 					 sparams->utils);
++	if (!statement) {
++	    ret = SASL_NOMEM;
++	    break;
++	}
+ 	
+ 	{
+ 	    char *log_statement =
+ 		sql_create_statement(cmd, cur->name,
+ 				     escap_userid,
+ 				     escap_realm,
+-				     cur->values && cur->values[0] ?
++				     escap_passwd ?
+ 				     "<omitted>" : SQL_NULL_VALUE,
+ 				     sparams->utils);
+ 	    sparams->utils->log(sparams->utils->conn, SASL_LOG_DEBUG,
+@@ -1287,6 +1306,7 @@ static int sql_auxprop_store(void *glob_context,
+   done:
+     if (escap_userid) sparams->utils->free(escap_userid);
+     if (escap_realm) sparams->utils->free(escap_realm);
++    if (escap_passwd) sparams->utils->free(escap_passwd);
+     if (conn) settings->sql_engine->sql_close(conn);
+     if (userid) sparams->utils->free(userid);
+     if (realm) sparams->utils->free(realm);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index db5f94444..3e7056d67 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/cyrusimap/cyrus-sasl;protocol=https;branch=master \
            file://0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch \
            file://0001-makeinit.sh-fix-parallel-build-issue.patch \
            file://CVE-2019-19906.patch \
+           file://CVE-2022-24407.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
-- 
2.25.1


