Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.16070.1600873519677379735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 08:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OT6HNkRK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id l15so4737396wmh.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2020 08:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G1rjhN3jgs3we5W+/vmjsFnFQmRzpM4REBTx29MboxU=;
        b=OT6HNkRKQuRBFjUVUe1jJI/2AQSInB69JbsyNQ+hvtVaoTHjynKsPywbu+CmShuUWV
         HL4yyowrxTU3XcP3DkZV5IojXlqaLC/Dh7+iDqvPpKQngYPxseq1VxAEmUtApqWKIW2u
         fUmRESfFyY28Phu3DtXfezxsNz4MXcTT3ombE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G1rjhN3jgs3we5W+/vmjsFnFQmRzpM4REBTx29MboxU=;
        b=mpbjHZv1d6M5JmbtGC+HiLfFO1eoHzA5CL1jKocIvpfravsvzg92oWvsyWPqYm4wzp
         1l5yDz1c/YWLAh73DRdiYkCm4XW3wUVpw8UvRMGuQw7O4PCC7nuoCRySFfCKGIcrwuer
         B+APN3sPxbXDCFNMU5FXTyFlH3iDLkdlyCURQv2q3jZKNYqCptJcm5/Q3HlYgvuKp53A
         QEbFuZANWXtywGmIqS9l1JoWva/0E1dZMJhmqPzBjv8Qdr5w32z6DC2eKusnPICHTe33
         PSArUkBvZirs3HcUlBcWXzEd0qk5LFYUfyaDbxqH8T8517C8HS+GA/1YAWnTCd5lJnel
         Kxxg==
X-Gm-Message-State: AOAM530QA3zPKPpiKuoxobG+mEclwz5JwVewYCDQgoRRYSUOqyLsBThA
	FyVSC5HFfunn1ve8J5PZpYiv94yy1xhybw==
X-Google-Smtp-Source: ABdhPJw00T83HJkLBG7WR/wH1jze+IVXFm0JfnXAyNuYqhdF6XnVG9fnj56/tZ4Mg9Z8wAayFFmEgg==
X-Received: by 2002:a1c:e40b:: with SMTP id b11mr25373wmh.100.1600873517567;
        Wed, 23 Sep 2020 08:05:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (3.5.b.6.d.4.1.e.4.a.2.6.1.0.d.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:4d01:62a4:e14d:6b53])
        by smtp.gmail.com with ESMTPSA id 76sm59621wma.42.2020.09.23.08.05.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 08:05:16 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] buildtools-tarball: Fix conflicts with oe-selftest and other tooling
Date: Wed, 23 Sep 2020 16:05:14 +0100
Message-Id: <20200923150515.2548741-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OECORE_NATIVE_SYSROOT is used by tools like oe-run-native and hence
we were seeing selftest failures when newer buildtools-tarballs that
use this were run on the autobuilder.

Unset the variable after use to avoid these issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index ef56f76fa71..560b8d67b9b 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -80,6 +80,9 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 		. \$envfile
 	done
 fi
+# We have to unset this else it can confuse oe-selftest and other tools
+# which may also use the overlapping namespace.
+unset OECORE_NATIVE_SYSROOT
 EOF
 
 	if [ "${SDKMACHINE}" = "i686" ]; then
-- 
2.25.1

