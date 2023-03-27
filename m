Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895E0C761A6
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 16:00:20 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.39629.1679932818812677002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 09:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eOuWbLKs;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so5661260wmq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 09:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679932817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuFhfOa812HKvAKMsnohKt75GGL7AHrrzM7RN1x0Q0g=;
        b=eOuWbLKsoVRTOFujdzW1gupnpRnuOQMtApgOZNeOL+WQf700TSMMPrjEmICkNiB1+L
         DV+KlpDrzw/SmGDhccJTEJrDURZOnLSHmdRuBnrb58Xf7ZdsD2Kdk4U0SagTwRUnVpCY
         EfINC2lJ+8kXDCSSRJ7UORj3zVQ5gpVDqtaeFqDaeRjMwq0o322cWFXUnGe4aLnqW9aM
         XqJKm3kfedDo67RjTghjr7Va2impT7T16oKCO46lKTGp8cnXz56CioZqHyeXyWVRvTmK
         ZdTIYQ6T3537Y6HceSLXxudToLH/Jmb9PFRJPE458+sCDWL1r4MK8P9xxquCUZKhBmWp
         s7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679932817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuFhfOa812HKvAKMsnohKt75GGL7AHrrzM7RN1x0Q0g=;
        b=qhoP3qsamtThY73XsA86xtFVZpbVSr7Jlb7eEZ/Y1aEl7ZNhCK8J2nXe0w29ESeOqo
         zjg3HbnKBrs92zp89zQgRdQyxVLnpC0WCUIJHT3+PkXnWefqOj28Jj/FLJMqMSG+UqF4
         uAHbUMbHFDawpF3TABhsHnyWRviGfUNdCZO20FHK6WYt9dwJDFWYTBtawbnuQAmqoy4M
         d03sjqj+KTiEmymj7GJCK1RtLLcI4YCv78/f1grM5SQtCYhDLBTgolg2WH87i5tw2GvD
         fxkBfv9FVx+Kc2b28toYJzo9CZr44O5sSrWz04LLvwyD5Co+3xWa8GX4SnlMTKdlUL9P
         fLoA==
X-Gm-Message-State: AO0yUKVS7rDeFGq9vojzJbPClZfxTW8iQ7iSFF3VFT02RygxbpNDKKF4
	qw/V86g+Dr3q4twLdLwFR+CT4CNZZHeIAQ==
X-Google-Smtp-Source: AK7set/O1m2/Il9vihtK3aVvlchPzVLTGD8J97+LLZGetNI5gCj/DcF4W3Z4tL/jei3KnAeCdboxUQ==
X-Received: by 2002:a1c:4b07:0:b0:3eb:2b88:a69a with SMTP id y7-20020a1c4b07000000b003eb2b88a69amr9714133wma.14.1679932816994;
        Mon, 27 Mar 2023 09:00:16 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id e8-20020a05600c218800b003ede06f3178sm14096726wme.31.2023.03.27.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:00:16 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 2/2] OESelftestTestContext: convert relative to full path when newbuilddir is provided
Date: Mon, 27 Mar 2023 15:59:37 +0000
Message-Id: <20230327155937.460133-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327155937.460133-1-jose.quaresma@foundries.io>
References: <20230327155937.460133-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179166

Relative paths in BBLAYERS only works when the new build dir are on the same
ascending directory node:
 .
 ├── build
 ├── build-st

It works because they share the same ascending relative directory node.

So use the full path when the argument newbuilddir is provided
to make the oe-selftest work everywere regardless of the location chosen.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oeqa/selftest/context.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index adfb1170db..0a7a9da72a 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -102,6 +102,16 @@ class OESelftestTestContext(OETestContext):
         # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
         subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=newbuilddir, shell=True)
 
+        # Relative paths in BBLAYERS only works when the new build dir share the same ascending node
+        if self.newbuilddir:
+            bblayers = subprocess.check_output("bitbake-getvar --value BBLAYERS | tail -1", cwd=builddir, shell=True, text=True)
+            if '..' in bblayers:
+                bblayers_abspath = [os.path.abspath(path) for path in bblayers.split()]
+                with open("%s/conf/bblayers.conf" % newbuilddir, "a") as f:
+                    newbblayers = "# new bblayers to be used by selftest in the new build dir '%s'\n" % newbuilddir
+                    newbblayers += 'BBLAYERS = "%s"\n' % ' '.join(bblayers_abspath)
+                    f.write(newbblayers)
+
         for e in os.environ:
             if builddir + "/" in os.environ[e]:
                 os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
-- 
2.34.1


