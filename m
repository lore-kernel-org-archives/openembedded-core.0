Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.12138.1620737503367762952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 05:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DE+gA4aj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id l2so20012035wrm.9
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OV0yRbjLD8+12Y/73lp2jjhkwHalJgZ0mSh4U8bmu4g=;
        b=DE+gA4ajvERBgPGKOC93/NPuhHs9kI9BEMoUJWZP56FfdV384DgipaVVq6fJD6Evdz
         o1OLZ4ywVrgfPf5qBxMR9KoCDYLqn+/tJqEZS1jJd5lAf5Zb6dZL7K0PQj8BY5iD3rpP
         RqxakLUfRgbIbZwLr9XQMUoar/wUswQDYQZXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OV0yRbjLD8+12Y/73lp2jjhkwHalJgZ0mSh4U8bmu4g=;
        b=X4CSNOxRwtw4e3KYKM1DEUO50MgsBzpk8OWDwawOEQtcqXO/09ZlDF2smJ66tpMDeA
         VYbA2Vt/3xaH55BbCN6tfShUp2zXW68/MOwHCkAlzQBvRo30RongsjCDB8tfFBTkxanl
         z3Fh874swcGgp9JrsSZgshKPpmdcykHlp3836a9t77+5idw60VW3cpG+8xfXbZrUK9ax
         hClhttYgDh4LM5VnkkFT1qKnNk9picPhKpFKmC2DZygT6HIOvNeSwt4SJ/sjdxNe3Ogb
         qDDHVYeYJodEvoxym2kIntPeA3cLb+t6GKw58o7gDlCu2T3uN2FFUWUGj3470ciB7R8u
         m4xA==
X-Gm-Message-State: AOAM532LtqBKW5Lq7pzpJ342jMx8wqWyMoE7yVkF96rINFClDrProh1e
	1FIpNK/uNBw8Ed/XqTwvF14Yn42SjUc1uA==
X-Google-Smtp-Source: ABdhPJz3bPYVW5Ij0YQ8xp7ZxAyikRvxpSjMO9lEmaMu/6VkOZt/qPcUigZXFp0jKCeWKr1TlYoQGw==
X-Received: by 2002:adf:ef90:: with SMTP id d16mr37658851wro.359.1620737501861;
        Tue, 11 May 2021 05:51:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id y14sm27119099wrs.64.2021.05.11.05.51.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:51:41 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] tar: Exclude CVE-2007-4476 from cve-check
Date: Tue, 11 May 2021 13:51:34 +0100
Message-Id: <20210511125138.2232637-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
References: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPE lists only SUSE for all versions of tar.

https://bugzilla.redhat.com/show_bug.cgi?id=280961 shows issue affects paxutils
included in tar or cpio
http://cvs.savannah.gnu.org/viewvc/paxutils/paxutils/paxlib/names.c?r1=1.2&r2=1.4 was the fix
which included in tar 1.19 and later.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/tar/tar_1.34.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index af04919c414..8dd0af2566f 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -10,6 +10,11 @@ SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
 
 SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
 
+# https://bugzilla.redhat.com/show_bug.cgi?id=280961 - issue affects paxutils included in tar
+# http://cvs.savannah.gnu.org/viewvc/paxutils/paxutils/paxlib/names.c?r1=1.2&r2=1.4 was the fix
+# included in tar 1.19 and later
+CVE_CHECK_WHITELIST += "CVE-2007-4476"
+
 inherit autotools gettext texinfo
 
 PACKAGECONFIG ??= ""
-- 
2.30.2

