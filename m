Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB23C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 14:11:32 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.8748.1634134290710665278
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 07:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P/iYmxP0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id e12so8917198wra.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kcsTWZS+ORgHrALn0cF4jDiT5l+ncOPMIvZn3Pn/IMo=;
        b=P/iYmxP0dM0+hQFt9MdazGaRGIOikgzBdsdX7LklOGKqDqzdLSbB8SVhPb8A06tcuh
         9QuW6Uofzgg35nzHwDoGfFuCRii5YzwG8NXk0itgP3zik7xkrfP78xMzfaHhnEpiVvUj
         lH6sMmt1fW6zy9wkIaRIQo0y8NAKLKaaRNwT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kcsTWZS+ORgHrALn0cF4jDiT5l+ncOPMIvZn3Pn/IMo=;
        b=q1ML3t1KO5qrT1FMsTRtIXYlAYkVifbieRj/e8rFMHsGaDNsicnq+l3Blfda+Vh6wr
         +aGB+CeBIYaqsMpQyezUmpsqRyElgjtw/WTrcGy0kgCISGuHh0jIGiJmC2glxCYRcV71
         7OfEmhL7Msg7wdubPUp+QB/KleLjudQcTyJcMKXkEYOuGgvPNihdwKgPIqirOZwDv851
         7gIsklbMlytNyiTeHXn8ToeW75IBHU62QeJX6knjcMtzTvlSbctMq2NXbOT8m43XMQbx
         GgccK0q8jWVEZ9a8ZQ2hFTqVlsxNbbi9fYr/CBF2nkYgCmETiCjMZZe5p5TvlBRCobGq
         l5gA==
X-Gm-Message-State: AOAM531vhJtDxEwVjdoHiiVmzoGzcK0a1waup4OMpuoJY8wleGO4eFfw
	npJKbu0ZjIObcm+Z5r525TTaMhZ0KrSRLA==
X-Google-Smtp-Source: 
 ABdhPJzEHEyN7Sw0e1l8rAfAFNPqe4x0tGr+vhigZF+vw5pfVE0P3cMX9x4BDd+lwzezTAGgJiG0NQ==
X-Received: by 2002:adf:bb0a:: with SMTP id r10mr39012461wrg.23.1634134288432;
        Wed, 13 Oct 2021 07:11:28 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:65b2:89df:e6ae:44c4])
        by smtp.gmail.com with ESMTPSA id
 l6sm5912830wmg.10.2021.10.13.07.11.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 07:11:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] base: Use repr() for printing exceptions
Date: Wed, 13 Oct 2021 15:11:26 +0100
Message-Id: <20211013141127.2870066-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211013141127.2870066-1-richard.purdie@linuxfoundation.org>
References: <20211013141127.2870066-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 14:11:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156910

Exceptions print more clearly using repr() instead of str(), fix
in fetch and unpack tasks.

Drop part of the test which no longer makes sense after this change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass               | 4 ++--
 meta/lib/oeqa/selftest/cases/bbtests.py | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 35a5e683033..3a94323e403 100644
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
index 65623640746..6779e621034 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -151,9 +151,6 @@ INHERIT:remove = \"report-error\"
         self.delete_recipeinc('man-db')
         self.assertEqual(result.status, 1, msg="Command succeded when it should have failed. bitbake output: %s" % result.output)
         self.assertIn('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:', result.output)
-        line = self.getline(result, 'Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.')
-        self.assertTrue(line and line.startswith("ERROR:"), msg = "\"invalid\" file \
-doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result.output)
 
     def test_rename_downloaded_file(self):
         # TODO unique dldir instead of using cleanall
-- 
2.32.0


