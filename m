Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A0AC54E72
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:13 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.34187.1710728527124842419
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JMoUKFq9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5dca1efad59so2376690a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728526; x=1711333326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzynBdyw6z26v0/iS4sGS/7xmWL7rEV96yDY4K+7IuA=;
        b=JMoUKFq9npkgwOiCxZ/4+xnuqYugcQXU+8sUIQ4E/OI64Vfy3sH/e2S0aSIWOAiq/L
         y55rj+IBx7C03FRrTfbsimWou6P/wpyBae+zFhxlZ/2uT25YkKzbOMvu1xAFs2PQXLo3
         hnDgcOrOhPHbd8ldQ26MgUeTmXTffY8NFIvKQYbln21B/4585iQWlBmBNoiX87+wtWjL
         9Z9NyEb95TOoHBX7DfqUeNESV9k56cq8X48SByT3TFh6uGyIQ073ljqxaracC7qXNZ3+
         nDkEuR16DLE3A4VItbfTIwmvw9Uy1Bl24kfFPfgqOVJnhprhMgLINxk2gl39tSTNGFCJ
         RKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728526; x=1711333326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzynBdyw6z26v0/iS4sGS/7xmWL7rEV96yDY4K+7IuA=;
        b=BqqPr/SW4mpiANzt9BbRIGbrlxQ0QVJz4vHRWZ/WWKaxAyy3bPgpQFGnwCeDO8+TrX
         U9EUse/ksCjSCeyc1KL5ioaQ91fqQo0N97pMhIf6E4bgNF7EES02P/rCPHmE97q0+fLj
         4BwVDFtE8jzeNaZa9BACl8F24CWF65BvG0VZ5rnHfvalEOXuviSQqK5hlqiqtmeEzNvw
         g5Y8db5Adbsa95YalTQ4PPahcQWcszFsxthLQ7lFvNyIfGyg0lF3zOs4LOPfMZP2TE2+
         /XPykefcDgwnaS1vE2EA3haN6G5gn6klkuIH5Jlgn4+WzEnYpIJisOYAPJVQkCD8ATTI
         qsJg==
X-Gm-Message-State: AOJu0YzSNLZBRxPRED9btgDGdHsFN20TNTktSRO05IdcJNXYjzSj6VI3
	WCv936nWFCU88ggQaUB/aFO6P31VMWsJCoCx+3fsf1HZq44dNqbVfmHh5eKCldh0+wpIw8qUqPe
	4dfRBsA==
X-Google-Smtp-Source: AGHT+IFYDfTBdWpRErJVVpoL7po4YrJ9/E0gFGJVa9krDEY8TUge56DF+phInJWXvPh28yHMpVtd0Q==
X-Received: by 2002:a05:6a20:d485:b0:1a1:87a9:5caa with SMTP id im5-20020a056a20d48500b001a187a95caamr11606475pzb.29.1710728526013;
        Sun, 17 Mar 2024 19:22:06 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 01/14] cve-check: Log if CVE_STATUS set but not reported for component
Date: Sun, 17 Mar 2024 16:21:45 -1000
Message-Id: <c1b3c3856c2bdf2d9d6dfbaccfce549396a8630a.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197276

From: Simone Weiß <simone.p.weiss@posteo.com>

Log if the CVE_STATUS is set for a CVE, but the cve is not reported for a
component. This should hopefully help to clean up not needed CVE_STATUS
settings.

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 013d531a84fa08b6ae8a47bdf3ba1fa8f18ba270)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 5191d04303..56ba8bceef 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -418,6 +418,9 @@ def check_cves(d, patched_cves):
             cves_status.append([product, False])
 
     conn.close()
+    diff_ignore = list(set(cve_ignore) - set(cves_ignored))
+    if diff_ignore:
+        oe.qa.handle_error("cve_status_not_in_db", "Found CVE (%s) with CVE_STATUS set that are not found in database for this component" % " ".join(diff_ignore), d)
 
     if not cves_in_recipe:
         bb.note("No CVE records for products in recipe %s" % (pn))
-- 
2.34.1


