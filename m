Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB827C48BE6
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:42 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.8960.1649758964632793839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 03:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V9eTp0Fu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id b19so26967046wrh.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WoZvrAj4/zR8iFYMXHyuQlmwpEjrJkILGwX3yTj3mOs=;
        b=V9eTp0FupsDXp9v6qbDEve53O7N4m1CywmwFxM1/h3COuk+uANY5mMImUFi/csyGJK
         qXd9A4Z8/5WBA09oibYV//xEWJ0ZhtqK0SmwIq6wYUCS4Yqh3bzJv44v4ynin7Srk5qt
         ajMTrda9URgxc0l9KjMnxLX200ATXppwHNuR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WoZvrAj4/zR8iFYMXHyuQlmwpEjrJkILGwX3yTj3mOs=;
        b=jO36HKIBnW22KpGnDb9RYIboyM2Rz0z2MiS9sOozAVvDFS1j/9ptiwnju8r2zY0GJ0
         L6qcyGNJSZO+27X8wfCuEGq+rNjRENkT74scRmQCFMm/FjJWbK7OZb89alztRmMKXtDZ
         tHMSo1SGMMXNeq9uklBnz3nQ1IuCNUoeQHyhDZ4ZRCKQ3MLhND7d2ezoo6RS7sMgkxPB
         bJ9XDCmew6u0o7ryLCcTxT2JcDAS2L9oLBzTpvOOSY3Dtw4uJ2NZiQWhoYMK+9j1RfD9
         d+WH3o+DRZBZbaHiNnWpN8XQnNgbDE8OPj+XmATzHMxDasrV/Jt8fgliDp9Ap1tETdP2
         RB+A==
X-Gm-Message-State: AOAM532K987zE/ghWQZxCBMrkuuqGvW1FAkR9e7wO6rsc1/NhrATAYM2
	KYYK+//Ue2MGBoHGKKgTSd3006JHgn37uw==
X-Google-Smtp-Source: 
 ABdhPJz3DAb2rE/oMOjmlSsRux7b30J+nu+wLGFZtcBjiBl+31jrvFjw2oFrFQrce4a6Z6hvzYN63Q==
X-Received: by 2002:a5d:458c:0:b0:207:a24a:cdaa with SMTP id
 p12-20020a5d458c000000b00207a24acdaamr10549986wrq.112.1649758962402;
        Tue, 12 Apr 2022 03:22:42 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b168:4a11:27d6:cd01])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038c9249ffdesm2274917wmq.9.2022.04.12.03.22.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 03:22:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] git: Ignore CVE-2022-24975
Date: Tue, 12 Apr 2022 11:22:41 +0100
Message-Id: <20220412102241.2122484-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164262

Everyone I've talked to doesn't see this as a major issue. The CVE
asks for a documentation improvement on the --mirror option to
git clone as deleted content could be leaked into a mirror. For OE's
general users/use cases, we wouldn't build or ship docs so this wouldn't
affect us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/git/git_2.35.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.35.1.bb b/meta/recipes-devtools/git/git_2.35.1.bb
index 47c22118640..e39142128b3 100644
--- a/meta/recipes-devtools/git/git_2.35.1.bb
+++ b/meta/recipes-devtools/git/git_2.35.1.bb
@@ -18,6 +18,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
 
 CVE_PRODUCT = "git-scm:git"
 
+# This is about a manpage not mentioning --mirror may "leak" information
+# in mirrored git repos. Most OE users wouldn't build the docs and
+# we don't see this as a major issue for our general users/usecases.
+CVE_CHECK_IGNORE += "CVE-2022-24975"
+
 PACKAGECONFIG ??= "expat curl"
 PACKAGECONFIG[cvsserver] = ""
 PACKAGECONFIG[svn] = ""
-- 
2.32.0


