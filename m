Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.16250.1599555864859983966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 02:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ceJuKjOr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id w2so16492873wmi.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xu9+2BRzzadRL9MUu6dAadaNJadkNnvfV2lojW9DsMs=;
        b=ceJuKjOrN09W+q8BAt1umHt8wB2bS2Kcn/wFUMiKjM+/+jfVqZ7RLEdSNbU4b0kNTN
         XQgTslKbylrOs8wOOIAKyhWSGAVs9MCzyyrRLp7JPmyxzEsUHUM5XhF9RrKKrCINoGt+
         VJZVVmd0DIdU3GTztmI5JdJDC/3/TedkFV594=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xu9+2BRzzadRL9MUu6dAadaNJadkNnvfV2lojW9DsMs=;
        b=HFVHdCniHYTFcIs4oq383z21h0s0kALWBrw8R/OU9GhqKTQDsfc3aQWuCXAmeM4fIK
         DDVhlqRiu0nOY88iW/H17ZIzNebgbRoBRPN2GvJKCSjHdJJbRIAHZ41lx8kMOf94CnU0
         3pc5/sT+bdqTFRYxB9nc4m7auwh+V7VRhTnQhPf+LAZQD4Ehk5gcqqsBbjMI4y6kh20c
         o7pRtx4/ZVLJPP3IN+8MTAZoFcqHafBgK09HkXUtGBbswZ1AqQRzHwA9nAC1FJVgty2I
         H4QF+h9zN9iq/AlweLHwN8KSyb/gSfGNSGW3Ax1oW3yq36mkAsVPLaH2p+a0ifzmPCjq
         urIQ==
X-Gm-Message-State: AOAM531X5pL4DqqZiEWLklQqyExlwAUPgkuAxIfArQwkXRhMQOZuKkNz
	aICYztE3EWCAQ0QkSVGPcMO3MjCSezmUeg==
X-Google-Smtp-Source: ABdhPJxQFzgQ4ZDPZYcCJce++wFdqZlt6IuiN88KVsdgNzHVqfNDlWYd/eoxOD3xcSskaOPQtPYJbA==
X-Received: by 2002:a05:600c:2257:: with SMTP id a23mr3504799wmm.102.1599555862769;
        Tue, 08 Sep 2020 02:04:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id o128sm29229030wmo.39.2020.09.08.02.04.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 02:04:22 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2 v2] selftest/signing: Ensure build path relocation is safe
Date: Tue,  8 Sep 2020 10:04:20 +0100
Message-Id: <20200908090421.1962198-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly to 04ee0e8b95cd8ed890374e0007f976684206b630, ensure only full
build paths are replaced in the environment to avoid breaking buildtools.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 202d54994b6..a28c7eb19a1 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -44,7 +44,9 @@ class Signing(OESelftestTestCase):
         origenv = os.environ.copy()
 
         for e in os.environ:
-            if builddir in os.environ[e]:
+            if builddir + "/" in os.environ[e]:
+                os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
+            if os.environ[e].endswith(builddir):
                 os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
 
         os.chdir(newbuilddir)
-- 
2.25.1

