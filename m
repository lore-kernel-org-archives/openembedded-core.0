Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64505CD98DD
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:27 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.5132.1696982538679369946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pJV33uBM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-690fa0eea3cso5612840b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982538; x=1697587338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iH0dog1SzlDF8H1IUqNSBMKGDQMdim8qfQjv1HWmBOI=;
        b=pJV33uBMBW4BN7L5Gd9KSf4DdH9TwoYSuJYnWcyQeui2s0AIckPXZJrK1K7noYg3P2
         alc8VQOWXweAE8ltLOaZf6Z32fS8VQXGDXUQRWvTY7MM9o3lD59IRF6NobZ+J8haJJk1
         iiAU3Y7LnLLuFc6Sb6ybF65Orp3jnTzBz6+snFSZ6DqSoONSFcVztb2SbuSdwpBU7Oxk
         k0ApbFsNvtfefEtB93IQ0SPYc/IKOe2A3Nzp5N/aLyfBEWGRMw8P8f9kzr2tf9t6MIaO
         rTM7sW7oYCb2V62hsE4cSGIpJvxsaVhPecS/7/MmPBjULGk6BByQZ9pCuMRCWJuyVV0b
         LKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982538; x=1697587338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iH0dog1SzlDF8H1IUqNSBMKGDQMdim8qfQjv1HWmBOI=;
        b=OWjejUIc7TLcw16gV5GzBzdcObbnjrW4+HR0mJylgag0c+bOoTym9CHjEZf50v0/rH
         S2Eu8/YzrYUEYMkX9nq9K+yAJrOkCpTduJ3a1txtqJ1l7JBlI4WsfRixzgoBZ2L42YqX
         ntj2JOq5chxml7LzlINgkhENrb2qkrIpZzS0IZqjIYvUvguyF1/5VdUVnY7gMQAxMygu
         sK7Z0/5igNcbWGyDoqs69x1NodnUhAIj7ol4OANIq/le5x+24e8qV0T4gAIKs+ngLvPM
         g1Y5MMdSDcU37pfkiS9NHFObNiFOAYf9nhs0EJAptcHfBUHYMTEXnuhYGhU4FhcJO4ib
         C13w==
X-Gm-Message-State: AOJu0YyYoQmDrTZTqNkQtN9cRx26gmqI1Y7+OY8/HpCPnqk07YUxZ7fl
	WTyLMsBRpmxzo7Rxz5HlHDzN9HLjuDA3SkRKlTk=
X-Google-Smtp-Source: AGHT+IH/73wEg2gXUxiGSn7C6IsqF3Gn6A32l4peL/TTpui9GmW+VJiq7RwqcOxsVvMr58oJHvIyYw==
X-Received: by 2002:a05:6a00:1506:b0:693:3fa0:5ffb with SMTP id q6-20020a056a00150600b006933fa05ffbmr23763884pfu.21.1696982537684;
        Tue, 10 Oct 2023 17:02:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/20] oeqa selftest context.py: fix git commands and set branch name
Date: Tue, 10 Oct 2023 14:01:31 -1000
Message-Id: <6461d37260ced7fd26a986878cc641f3d3937cff.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188936

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Check return values of each git command and set initial branch name
to avoid this warning on every test run:

NOTE: Starting bitbake server...
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint:
hint:   git config --global init.defaultBranch <name>
hint:
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint:
hint:   git branch -m <name>

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
(cherry picked from commit 5ec557467dda29309e25102b507bb919275bedbb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c98763735f..8d864a0368 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -97,7 +97,7 @@ class OESelftestTestContext(OETestContext):
         oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
         oe.path.copytree(selftestdir, newselftestdir)
 
-        subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
+        subprocess.check_output("git init -b main && git add * && git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
 
         # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
         subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=newbuilddir, shell=True)
-- 
2.34.1


