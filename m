Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.3475.1593715849574251653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 11:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=McitOK5O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id b6so29670065wrs.11
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 11:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DSWtl7F+3tRqsWEYuAHaECRCYwLrj6OVbDhXB97Ro6M=;
        b=McitOK5Owp+Mkcca7Vofhjf2Fa5w3xHfMDcS0fNmkOuGUhWwZdNtHKTDljzOMlJh6z
         359U6b63mdqT1PcKqAcScM+ZmRqHyMulisERtsyyL+rlywXXNsiHc5NaderWkLe1lw2d
         +2r67qocrJ1dsDSGF90FrXbqG/tJKa+BJCPYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DSWtl7F+3tRqsWEYuAHaECRCYwLrj6OVbDhXB97Ro6M=;
        b=fr1xpo4ePzEu/fjn17ZUcopaP1YLqYHcAvpJUBbDZ+US0ImQXwtjGudriE5b7vKg5Y
         NgVnDs4knX+xdUW1QZMb21F/aOxkLT+/NRWQFfaowDU2mIyEVEAen2MP3//obmdEJnPQ
         fxKRuXkRKqM/hAv1RC2FxtGZjNT1Gqli6CKng2BFQdTCsx5oSDFS0++vuUB0ZcxsmFut
         bzMfraVE83wMiZ0nnchezookh+wPaYInOH9n9cEACR/8gkGXpDwoJoWXbpQzHPgCNpL+
         JBFE42lLxOKZxASLrcR+YtSqnzstGxfsAyjIxRXrQ7+3z15808VkQktq0jW/SVZtvJAY
         qMjg==
X-Gm-Message-State: AOAM532qjux27mv+bPVgM7pdQEggfkJ4g70NgiK36B11qvN/MnGeWZq7
	HOvyihd2bqmn4jIi1dEVN3L7y59plGzV9g==
X-Google-Smtp-Source: ABdhPJwFFVZ3fambQ57ZesFi6dNmF9G8Zgj47Ryask1rRPWKs7eqyxo/6Y27W66Dsng/UDyv5d26RA==
X-Received: by 2002:adf:ff90:: with SMTP id j16mr14399258wrr.364.1593715847615;
        Thu, 02 Jul 2020 11:50:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y77sm1029273wmd.36.2020.07.02.11.50.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 11:50:46 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest: recipetool/devtool: Avoid load_plugin test race
Date: Thu,  2 Jul 2020 19:50:45 +0100
Message-Id: <20200702185045.179673-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This bug has plagued the autobuilder for a couple of years and we've
struggled to reproduce/debug it.

The problem is the "lib" directory in meta-poky used during the load_plugin
tests for recipetool and devtool can race and one can delete the files
from the other leading to test failures.

Deleting the lib directory only if empty will avoid this.

[YOCTO #13070]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/devtool.py    | 6 +++++-
 meta/lib/oeqa/selftest/cases/recipetool.py | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 7d8f8950459..b383ed9c50b 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1500,7 +1500,11 @@ class DevtoolUpgradeTests(DevtoolBase):
             dstdir = os.path.join(dstdir, p)
             if not os.path.exists(dstdir):
                 os.makedirs(dstdir)
-                self.track_for_cleanup(dstdir)
+                if p == "lib":
+                    # Can race with other tests
+                    self.add_command_to_tearDown('rmdir --ignore-fail-on-non-empty %s' % dstdir)
+                else:
+                    self.track_for_cleanup(dstdir)
         dstfile = os.path.join(dstdir, os.path.basename(srcfile))
         if srcfile != dstfile:
             shutil.copy(srcfile, dstfile)
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 6bfe8f177f2..c2ade2543a3 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -534,7 +534,11 @@ class RecipetoolTests(RecipetoolBase):
             dstdir = os.path.join(dstdir, p)
             if not os.path.exists(dstdir):
                 os.makedirs(dstdir)
-                self.track_for_cleanup(dstdir)
+                if p == "lib":
+                    # Can race with other tests
+                    self.add_command_to_tearDown('rmdir --ignore-fail-on-non-empty %s' % dstdir)
+                else:
+                    self.track_for_cleanup(dstdir)
         dstfile = os.path.join(dstdir, os.path.basename(srcfile))
         if srcfile != dstfile:
             shutil.copy(srcfile, dstfile)
-- 
2.25.1

