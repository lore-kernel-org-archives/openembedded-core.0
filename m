Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81682C77B62
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 15:45:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.29126.1680191099474157319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 08:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WRTE1qB9;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id r29so19528333wra.13
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 08:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680191100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=WRTE1qB9zyA+IEa8BOL2SjA1Xm7jNt8hARgUV6I5pv4xqsa5NRiw3V4VsmVsmxtgMN
         GhhM/jkbiQzZKV4r2pQaPiVV6dTTqBCzBkrROa2cQydBmW6UuDzmXCh1bKy28kuTLZ4T
         jbpeocKVUls5ApvTRjUVJqqwjyJbwrvpkCQMl6HEHBzzPCVFtL6FNrP3kZhTg6R5cOYN
         +wymqmZKxlnLLe76R1wR1WXo/09+1s4C2MvZtGRrxT42W1a+ZNATX1j2EVoWeWDAhz/5
         ztKdAuopCV+c/qNesG7uUbgKUNlM3J1K67RKnKz2AZCe+TV3cr01QKtNdgiEPH/4nwif
         jjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680191100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=JkDcSG7AAab6EIiETbyW6EsW4z/wS9vi67GbShrWTxJtby5J0aUl3jHShRSm0Ex5v7
         obVa1UX1SgaS8qtuaW7x/wLLkZMxR7GZet2OgM1JW2MSWLEAtwkAX3m+MbUMswN7mZJg
         lHiIwF+NUl9c4PQfwYG3pcivJs+naxKtqE5CXbEOYFNg0JDqsOSJ8A1N7gGDqRncTSsI
         RsB2U3m3hno0+SjoYx3Icd0XOdYililRBpSjtyZkDePpKkcEK/gM2aKIetbzi5SLWXjO
         a4pwwFxlM2iXtgCIOSe9sl1iyhTocuTNkRVP45kATq1KNc+I6hUQjmfqdHheey11upF/
         d9ZA==
X-Gm-Message-State: AAQBX9duNBA/Hr5B0fezK1DGiFNbrZTxjMvoOKKb06Q3ptbtlZnWrxzx
	YEDSbsv6hBER79wPlUSgnC5Q0bYIFe0=
X-Google-Smtp-Source: AKy350YsoNlRWjs9rMfvzPKISdna6Nk9u2esh2Odis6s8SgotmsOwxXYJhISckK3Nl9U/Ky6xDM3cg==
X-Received: by 2002:adf:fd06:0:b0:2e5:6441:2d25 with SMTP id e6-20020adffd06000000b002e564412d25mr444931wrr.12.1680191100107;
        Thu, 30 Mar 2023 08:45:00 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:c898:b1f6:d5c7:39c5])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b002c5544b3a69sm33151056wru.89.2023.03.30.08.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:44:59 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V5 2/6] cargo_common.bbclass: add support of user in url for patch
Date: Thu, 30 Mar 2023 17:44:49 +0200
Message-Id: <ea7b3ac0931d61327a3e0cfc05f5f484c56251e1.1680190966.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680190966.git.frederic.martinsons@gmail.com>
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 15:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179339

From: Frederic Martinsons <frederic.martinsons@gmail.com>

To handle url like git://git@repo/project

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo_common.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 63b1382908..82ab25b59c 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -134,7 +134,10 @@ python cargo_common_do_patch_paths() {
             name = ud.parm.get('name')
             destsuffix = ud.parm.get('destsuffix')
             if name is not None and destsuffix is not None:
-                repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
+                if ud.user:
+                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
+                else:
+                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
                 path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
                 patches.setdefault(repo, []).append(path)
 
-- 
2.34.1


