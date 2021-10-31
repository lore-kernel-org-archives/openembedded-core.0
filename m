Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429F1C433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:17 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.32823.1635699496363264958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=efJblzyF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso10845963pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iX5sAgYDvIQ1hKAg2zE+0/ufBAt72inlrEX7PUTkea8=;
        b=efJblzyFWUcwJ0mT4Fiu3Go94yHe3pL2+wvF4za0bY7Na9wSeoDKUxjpO9sCuPGvOy
         KtMo4cg73pMdJct4SH2TUkR7SucE03075rFc1szvTvzi4M/uhr/hs3V99YRpMRYQ+QD+
         VTkCP30v7/NomaEIJZjoYAbRga2O+qU2OSTQKJSwTbl1+RkGWErQPw/q5YB81zOESzT8
         IKUim6NHCE2Q/8MuD/wE3/N/AhEbfMAXZ0uYd4WXH0Gg1qJAF1BbCcOUHnZuQC5B6u32
         bDwIaMYwUd8uCk3cIIBEDP42Pi7M7TnBROnznmftI6Um5YIqHT3Ko7cBYndi6YU6LXmG
         NzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iX5sAgYDvIQ1hKAg2zE+0/ufBAt72inlrEX7PUTkea8=;
        b=MFLsLgGSgvIFNF0QCvWj9ngbuwP8tGh64k5WYttqqCY54QqgkNZobU5sbqQoAggWOP
         v3WEGFYVF+FQzuqx2tNRwy7hbcnOv9//HzA6YGNVAm8DBKEp5w/pqFpMv4eR/WSdL0sk
         JI6hXp7bFn8LtnSUl/wATw2Xb17ny7C/X7I09ZpU72qmH9GSHjwwxhgD8c4VoPaxKJkL
         L7MQHAbyBEOqzhJPTl0a18AB9BOJADETNH32yr3XCeYKEEmGJjEKdzFILff4qWvStM/r
         5OgVfTT6d2jI4pTZZDG9kpoeafAjjtnwhorgXFyzBfqLme7ADahu8njN6EAygEHkFz7H
         kglA==
X-Gm-Message-State: AOAM530QCm03DncTnG9iyXsJTHY2cyj+fpqbfHcpvNSAKJ0yfUramEOo
	SjudVs46slNZ+q+CkJ6IhpP0Lzo7u5AZgAHboSo=
X-Google-Smtp-Source: 
 ABdhPJxl0anpQqzmEBPhIOUJJ7EJxvnzy3z1x7n/atrUybEs0HLqKrCVCOlW4PfBqpdGQE/yCmXYzw==
X-Received: by 2002:a17:902:ec92:b0:141:b7e6:997b with SMTP id
 x18-20020a170902ec9200b00141b7e6997bmr12488093plg.81.1635699495493;
        Sun, 31 Oct 2021 09:58:15 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/29] base: Use repr() for printing exceptions
Date: Sun, 31 Oct 2021 06:57:26 -1000
Message-Id: 
 <045124ce7ef7c53a1932848835f93abbe535f157.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157665

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Exceptions print more clearly using repr() instead of str(), fix
in fetch and unpack tasks.

Drop part of the test which no longer makes sense after this change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c94816259cc1c09746353ad26ca0c811e0c962c2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass               | 4 ++--
 meta/lib/oeqa/selftest/cases/bbtests.py | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a3e98d1b50..9ed736b0e1 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -160,7 +160,7 @@ python base_do_fetch() {
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.download()
     except bb.fetch2.BBFetchException as e:
-        bb.fatal(str(e))
+        bb.fatal("Bitbake Fetcher Error: " + repr(e))
 }
 
 addtask unpack after do_fetch
@@ -177,7 +177,7 @@ python base_do_unpack() {
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.unpack(d.getVar('WORKDIR'))
     except bb.fetch2.BBFetchException as e:
-        bb.fatal(str(e))
+        bb.fatal("Bitbake Fetcher Error: " + repr(e))
 }
 
 def get_layers_branch_rev(d):
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index dc423ec439..d4f6a08991 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -148,9 +148,6 @@ INHERIT_remove = \"report-error\"
         self.delete_recipeinc('man-db')
         self.assertEqual(result.status, 1, msg="Command succeded when it should have failed. bitbake output: %s" % result.output)
         self.assertIn('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:', result.output)
-        line = self.getline(result, 'Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.')
-        self.assertTrue(line and line.startswith("ERROR:"), msg = "\"invalid\" file \
-doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result.output)
 
     def test_rename_downloaded_file(self):
         # TODO unique dldir instead of using cleanall
-- 
2.25.1


