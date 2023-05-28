Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782F1C7EE29
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:28 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.32996.1685293703143679576
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=fNxjACsZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64d2a613ec4so1840486b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293702; x=1687885702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1eRqoFnhOH+lnKgiPtRka0JRBhAFBBc3T9HrcjQyBM=;
        b=fNxjACsZ6SK6Vrwi7NY6KzPwnXCIfn9O4BEE3af9OVvkGg6g6j/V1JZBZXLgNiQ8xs
         JCbI38baUfzeWv1myNhpT5F/Q3gvj+6+LUcjh+6OwNcQgoP+58mFOTJUD3hGDzizTMFF
         GCe8TWmrYc0q+fhg+Fw7r03V0HSmyKiezGwu9tXM+1pl5OwzHEcaXltUTmQTkgvWUnug
         zRDhjxmPcbAhxWUppPXVOoGW2itsXE4+8OSNiPG31qdMgsQWKljNYgYqukPYopVh9+nt
         ipbgkOmsJJ7oQ4eTbs+mWQh0Bc4Vci1MOkVabwYUIuTOLUCsXbwivJB53epeTivnz3gJ
         eRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293702; x=1687885702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1eRqoFnhOH+lnKgiPtRka0JRBhAFBBc3T9HrcjQyBM=;
        b=GV36UTCSeEsxf5LusFJmJ6TKkxa1eMfjGrM3ovXUtclMkPM4WtfrU6S5x9CSdIhFCx
         a2OmPnVzrdoDJqvn2azAco1ueBkSQoPFSjGr5P51eE7VmbaXJNXG7LqGa74qJBr4W/oM
         wnhVO4OK9qSHk2sTqh3z+dI60gYnt8gqSteUCl7m/vYWnxr4XtFyD/al9omwiBrKOc8B
         EcNJVLK+6sK2VClpQLeGflbwXcJ/3iAos/roA5YS9Vlup8az+bCYxeWGe+sBl5DGEcRn
         sJ3pkdMJhltC04KvFmjLlCyMWxHoCuZtl17f6bdCf0J1T0BHTavhMui5M6qKZUrcwXUn
         yBkg==
X-Gm-Message-State: AC+VfDx0OJ/zcn+ywaslME0uX74qSfo2oE5At09Bfs0RkAEZjTxy77u+
	feQ/BjsnEbiHU2v3jmpR4vYM6J91QPDs1SsCWN8=
X-Google-Smtp-Source: ACHHUZ5wARgU5swkKQUQAni1hnCF58fLPWIzRHfL0B/bEh+Tu6M0sOUN7geBcCmAwvsHyVq9TPLtAw==
X-Received: by 2002:a05:6a00:b44:b0:643:aa8d:8cd7 with SMTP id p4-20020a056a000b4400b00643aa8d8cd7mr13425092pfo.32.1685293702187;
        Sun, 28 May 2023 10:08:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/12] Revert "ipk: Decode byte data to string in manifest handling"
Date: Sun, 28 May 2023 07:07:54 -1000
Message-Id: <29bd0b6272680769b438f39fa96b47d21c846f37.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685291299.git.steve@sakoman.com>
References: <cover.1685291299.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181846

From: Andrew Jeffery <andrew@aj.id.au>

cf9df9e8d89f ("ipk: Decode byte data to string in manifest handling")
did a bit of least-effort fix to a string vs byte sequence issue in the
manifest handling. The approach was chosen as it localised the fix,
rather than having to analyse further call sites.

However since then f2167ae80258 ("package_manager/ipk: do not pipe
stderr to stdout") was applied, reworking the output handling from the
subcommand. dummy_bytes() now returns a string, so stop trying to decode
it.

Fixes: f2167ae80258 ("package_manager/ipk: do not pipe stderr to stdout")
Cc: Curtis Meier <cmeier@us.ibm.com>
Cc: Pam Eggler <eggler@us.ibm.com>
(From OE-Core rev: b61739554780d70307d2b6b37d2b3b1c7df93c77)

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 07e5a6331be60d5e35d7336a6215a972ced6eb57)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/ipk/manifest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/ipk/manifest.py b/meta/lib/oe/package_manager/ipk/manifest.py
index 469e14c3c6..3549d7428d 100644
--- a/meta/lib/oe/package_manager/ipk/manifest.py
+++ b/meta/lib/oe/package_manager/ipk/manifest.py
@@ -64,7 +64,7 @@ class PkgManifest(Manifest):
         if len(pkgs_to_install) == 0:
             return
 
-        output = pm.dummy_install(pkgs_to_install).decode('utf-8')
+        output = pm.dummy_install(pkgs_to_install)
 
         with open(self.full_manifest, 'w+') as manifest:
             pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
-- 
2.34.1


