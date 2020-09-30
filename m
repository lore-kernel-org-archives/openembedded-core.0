Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.6565.1601504068188400983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DEB+dmpW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id o20so2324712pfp.11
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KEPdoekR8ceffGxnHwyOph9A3hWzYByL+wy63UTqSPE=;
        b=DEB+dmpWBp0Dnh1bmeMTVF2Q74xJyagfMNWAJNAvaBHrGNR4KLYcq5JlrNuiDy8hv1
         a9yGTkdqLM5/wr61j+hCJBALWv95ldyO5uHeFheNV0rW2lODliYaJNxGvUldKjmg73CU
         b1NkskXSH7LnfKF8XZNF0LbFv0G6X4q68Ixy/TzmgUhzQwbHLS1eOifPf5smM3Tfn37B
         IejPBT/+hadm+ZWYKUXdUfFx7gKgpiOhfM09z4ax1jdxYJVV54SUAndQIP6Ynhz+uoVJ
         6RIzD6UHo42BS982XUaAJuKK3caUmvWjAhZA2onY9Z1EnQDygVBT9WAjkp5FZv06enTP
         BqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KEPdoekR8ceffGxnHwyOph9A3hWzYByL+wy63UTqSPE=;
        b=L6j0MeSUltngLNHawJei7wXTGLO4Sft5n+cuRLkKS1nqNtcyE6dolnEN8yeKbGdAqL
         /66AwndLzT7LhL5CGqbIyBj8i/4gdt51BsRtVcruhhLfq8Wu0UfiGh7zRFvGKMzIYPH3
         wUo1r+rYDQKpOJfNvr6HyIb6qoe/dxpDs3e4axhcwHd5G4XICtoy2mhSuqd4AyEoBgGB
         bQM/zZtx5zQzXCrk3MCAh+qWs9fapuPRZmU4xfsF47SPKbcs7sxA2hdW65DTR27960t1
         KrkMbFtRfLy6lWX89wmo7lwmoTqrj3VrBn7u52/tkfavhPdnxF50R9+ggZ/UgfxMOM0q
         RNiA==
X-Gm-Message-State: AOAM530XG1NuWHUN6zwBELG70cM8Qe5wSeWzjWmocR6djJelU0H+sFod
	uHJyCykcJDQ2/qKpHripgKkPHgcfRqvI9wZNsfo=
X-Google-Smtp-Source: ABdhPJw2Jp/CNzSBQzi4WQ8/VcR7oNOiuXdkNgBaIM1kkpyr8sShR5tlczcnA/NGlxVViuKocpZFvA==
X-Received: by 2002:a63:c153:: with SMTP id p19mr3567349pgi.55.1601504066577;
        Wed, 30 Sep 2020 15:14:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.14.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:14:25 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/41] buildtools-tarball: Fix conflicts with oe-selftest and other tooling
Date: Wed, 30 Sep 2020 12:11:25 -1000
Message-Id: <d00bab16aefb3f200b01ad6baee15bc9cca7b6ce.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

OECORE_NATIVE_SYSROOT is used by tools like oe-run-native and hence
we were seeing selftest failures when newer buildtools-tarballs that
use this were run on the autobuilder.

Unset the variable after use to avoid these issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ea5128fde10eb9be7fefbbb87ae6181edd2bcdff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 44d658687d..434ffdc334 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -79,6 +79,9 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 		. \$envfile
 	done
 fi
+# We have to unset this else it can confuse oe-selftest and other tools
+# which may also use the overlapping namespace.
+unset OECORE_NATIVE_SYSROOT
 EOF
 
 	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
-- 
2.17.1

