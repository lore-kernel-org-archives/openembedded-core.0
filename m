Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7713DC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 13:40:21 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.12031.1633614020562745288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 06:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hDTyg9aS;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id c29so5411031pfp.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 06:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G3f+prp7zM98+GR3YdQGCn7gKs1NSmcuZjiMudjDuD0=;
        b=hDTyg9aS9fPEtkMcINgdqh2fh3NGp6rcQjNgu+VVkrr874pTQ3Jj8JB0OuUG19So+e
         J5I7/krc0QapD2AybuSw2/Jbyl9KU1aM4DHbV6VNpyLLMkwLTUncBZ+q0oS4+VAEtfEY
         FzDADMQeYXxMQDxO0uA7ze8r8twUr2+4fU/bCI/TL179fLgXdOoDlNPGzRGc6TY/ycg9
         398CEeL5bpu9mKjtk85UDBCwvAdJFnDchjaY7vYN29SNl+m7AP2qtuerJC/z1sLab51t
         6JDjxhNcDrL4eK9pDjTw3p1haKDWojyInDkFbuX0RqNKJFy56aD9Wm9vq+wDgzMqem/k
         PQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G3f+prp7zM98+GR3YdQGCn7gKs1NSmcuZjiMudjDuD0=;
        b=FPv30HHle99KoS2x+U/j3WhQgUdStTL3TeJLVrSq7uBfV3KUe/QzQB+7GVSX7tn1LP
         fAyhXCcNcD7DmGUSeeTZGwaeMavjjCB89MVXBH/p7b6h0zrIYgVlbYKNirpWOEbHGnJj
         wTI9mqhDrj9VNpzalR7vqX01hHmmxYgTsAumu6ONnALzDRhuH7Jal+ozIai2Smf5kJL4
         NNWPIJ+iXCKerHVjbiGKsdj/s1mMEcNBcHeD3tjc71Kxz6Nal5CbdrjP2mkW3wyf7Rtj
         m+045MNU8NjFTJoTstNFERqyuax95cZQh6f7tTzBFq5XPTBq2eBRJiuDcHHQrl9rP15l
         xq4g==
X-Gm-Message-State: AOAM531ypGGlkN9as2KK1E1SE5Ok3vRUEAogcTe2unBZhKk8DHu+kd7o
	vl2AV5uzGbtW/+mzrP7l+NAgMhXBK3M=
X-Google-Smtp-Source: 
 ABdhPJyDWmwc77E5zWYjrGikZIFN3GHc6H8wK27pADwx7hgS96fuAGd7KLAk8X3uWED273P2tSrBPA==
X-Received: by 2002:a62:1b92:0:b0:3eb:3f92:724 with SMTP id
 b140-20020a621b92000000b003eb3f920724mr4466483pfb.3.1633614019798;
        Thu, 07 Oct 2021 06:40:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:502d:3224:84af:26a8:4c79:8890])
        by smtp.gmail.com with ESMTPSA id
 r7sm24087062pff.112.2021.10.07.06.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 06:40:19 -0700 (PDT)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [meta-oe][dunfell][PATCH 3/3] dovecot: Fix CVE-2020-12674
Date: Thu,  7 Oct 2021 19:09:21 +0530
Message-Id: <20211007133921.3753-3-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211007133921.3753-1-sanakazisk19@gmail.com>
References: <20211007133921.3753-1-sanakazisk19@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 13:40:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156724

Added patch for CVE-2020-12674

Link: http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 ...uth-mech-rpa-Fail-on-zero-len-buffer.patch | 30 +++++++++++++++++++
 .../dovecot/dovecot_2.2.36.4.bb               |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-auth-mech-rpa-Fail-on-zero-len-buffer.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-auth-mech-rpa-Fail-on-zero-len-buffer.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-auth-mech-rpa-Fail-on-zero-len-buffer.patch
new file mode 100644
index 000000000..5580cd409
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-auth-mech-rpa-Fail-on-zero-len-buffer.patch
@@ -0,0 +1,30 @@
+From bd9d2fe7da833f0e4705a8280efc56930371806b Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Wed, 6 May 2020 13:40:36 +0300
+Subject: [PATCH 1/3] auth: mech-rpa - Fail on zero len buffer
+
+---
+ src/auth/mech-rpa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12674
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/auth/mech-rpa.c b/src/auth/mech-rpa.c
+index 08298ebdd6..2de8705b4f 100644
+--- a/src/auth/mech-rpa.c
++++ b/src/auth/mech-rpa.c
+@@ -224,7 +224,7 @@ rpa_read_buffer(pool_t pool, const unsigned char **data,
+ 		return 0;
+ 
+ 	len = *p++;
+-	if (p + len > end)
++	if (p + len > end || len == 0)
+ 		return 0;
+ 
+ 	*buffer = p_malloc(pool, len);
+-- 
+2.11.0
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
index e36e51c28..29905196b 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch \
            file://buffer_free_fix.patch \
            file://0002-lib-ntlm-Check-buffer-length-on-responses.patch \
+           file://0001-auth-mech-rpa-Fail-on-zero-len-buffer.patch \
            "
 
 SRC_URI[md5sum] = "66c4d71858b214afee5b390ee602dee2"
-- 
2.17.1


