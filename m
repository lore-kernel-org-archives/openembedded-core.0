Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD59EB64DC
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:37 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.346.1688831789974621005
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cqD4Cpbz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-55bac17b442so2333043a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831789; x=1691423789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqRx21G6Y4Ib/4LY/v2a43G4vueOTgqli+2JMKUdeyE=;
        b=cqD4CpbzKlHu9NCgkrl3fjaHaQOTlMGadgfU7CpCjaBX/rgDdMUpJJ8amaJjYjm2+q
         TlA0UnpQvuDU/B0mvkivzyEasjKU7UuHe5Bvj2uazjDOH2pUnPn8N5om6zkQ1NQtiYrk
         M2mHZMAO3acKAkZJTAx8Gly95z0Ymz5oNiNKEaJPtlVneoclIHl/5Q2aW8XdUJ+OwQ3m
         CjYCKVgh+mvcQKsJIO70lTsTey1kwZ/AP8kddfrAPBYYlItzMtHmEmDLvipT5N0Gxy2H
         I0ilPLbqEj00rMrNRZOvTNHqyWrsrNtd6IlP/MyFa4/ylXT9PBYQGR5mwSaZAjuJnwj/
         fxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831789; x=1691423789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqRx21G6Y4Ib/4LY/v2a43G4vueOTgqli+2JMKUdeyE=;
        b=gRPKe5mywnUAEby8s4bdZJl63x3b5JSgLVv/m7dIHeD1i/JhxpZn2czN4v4wIW55/s
         Zstvywaq86eTxkXRiJOBFzMdWUHM6juFIJ9lxDyCGiBQxvl7ESP+vLN+1ihaE5Ngp4Gr
         khcg/a0HtMUXQQS267PfLNHvjo8F6waHOw6jp6syeU1hAChiJEqq6MvWl+Xz+mexQpLu
         73TTFtghFWuCQIWWFp23pXFHjqwK4vxOe9CgOq7eQQ5YST3ogPdIWojUYAb5UkdsF8Vu
         1QmS3SK4NjQdeYv352bk//e36CjaugbHiBH49XKouvNYMEwnFbOAU9f7jMRVUC28lUv2
         7mWg==
X-Gm-Message-State: ABy/qLa7ilMg9S/VO6XvmFZvHV89RNWA/41emx0xeJqvkpswkbjXR4Is
	6iZKjLqILO7oDOpy/q5aZaOwZKhgz7nVm+TZDfs=
X-Google-Smtp-Source: APBJJlHe8XEKNWiG5BIfBlPXC8DcFn9MraWbqhsf82U46qBqIq2E4vouBkCtt+v4FZGoz0vHsclxgA==
X-Received: by 2002:a17:90b:23c7:b0:263:7d57:16e9 with SMTP id md7-20020a17090b23c700b002637d5716e9mr8443219pjb.21.1688831789067;
        Sat, 08 Jul 2023 08:56:29 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/17] useradd-staticids.bbclass: improve error message
Date: Sat,  8 Jul 2023 05:55:50 -1000
Message-Id: <ea997ec788a5397598e24301e40d1c30ffa68c04.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184036

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Current error message is difficult to read:

ERROR: Nothing PROVIDES 'image'
trs-image was skipped: image - image: normal username test does not have a static ID defined. Add test to one of these files

It's not clear that first "image" is recipe name, second "image" is
binary package name and that "test" is the user account which does not
have a static ID defined. Improve the error message so that these are
more explicit. Now the error message looks like:

image was skipped: Recipe image, package image: normal username "test" does not have a static ID defined.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 07898218f3908a83e07178b6530dfa48d55d4ec2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/useradd-staticids.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 3a1b5f1320..908b24969f 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -41,7 +41,7 @@ def update_useradd_static_config(d):
     def handle_missing_id(id, type, pkg, files, var, value):
         # For backwards compatibility we accept "1" in addition to "error"
         error_dynamic = d.getVar('USERADD_ERROR_DYNAMIC')
-        msg = "%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN'), pkg, type, id)
+        msg = 'Recipe %s, package %s: %sname "%s" does not have a static ID defined.' % (d.getVar('PN'), pkg, type, id)
         if files:
             msg += " Add %s to one of these files: %s" % (id, files)
         else:
-- 
2.34.1


