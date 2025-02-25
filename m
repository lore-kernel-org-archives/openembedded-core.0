Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDE9C021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 15:56:53 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.11795.1740499011466069939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 07:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=niyHtKGm;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e65a00556aso46079456d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 07:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740499010; x=1741103810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hG6MN6D8O1IYrarXppevAzbB5dSn26XEsvq7x/5MJE=;
        b=niyHtKGmkdWdbuRN5JpbDZJKFGfLTDISMqvsUDprfXS86rYbt+nwpw2wXSWLjey4Ry
         scl9fEB/AprzlO1ONzyQkyW6/GZwOVzRfamFpmxud4cWryH+4SbSe0buf6Aw2/rCGMDU
         w8Mowa2GHg6hEIQgwi+r2aLtWkSAHQ9mCn45r0PLNWzZhTljjYbyDy0GNXt+QyRmSjDP
         z9W7YDFDDLJqzQ/ixmfpc7942JwSmYsiOAioeuPFhBGnfAwz5g1It6yGS8qrbZqI3pbW
         8IiuicxoUbQmMOtl16YdmT5iLAmhhDrmdbCVcEgQ7yuglree+pnO3QceWBIZ50UXGnSH
         QuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499010; x=1741103810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hG6MN6D8O1IYrarXppevAzbB5dSn26XEsvq7x/5MJE=;
        b=EZYExWYYBmbiCcDlVoSYFCg2Oh9sFTKOh1KlcaAjpEuWpYAywXZgBa/+iVRdlJzy69
         ZUmN8pca2XuNPQcVotaAWeV9qs93w6jS0HKMCi+MbZw+TUGpMRQvRGHZRj2xHkjDZR7y
         Zy2X02wRGO0RCvv4V0SLnB+iORPlTaXjH+XmzRU8dcatKKdIGrL2VrcIkDsXDyJWUGeb
         FacUYbWK4JIti1GFAJ5kWyg5MlQLhusDM5cCWS5Dd6OFpkVa1kDNc09QFgLk6nlezzlW
         WHIcfOKNz1aiI9e/EhzzUoQK3JUoifKbfdFNvlxlXXiZhhvARVDH+BzrB/W9PbJ2VvFE
         FXRQ==
X-Gm-Message-State: AOJu0YxLBTVS9ggcQRb5H8bM64BP9CteJ6Y10lyohuKrl0fQ+wwbwcRa
	i7ho4y5IXcPMSxlgu0fc9GVJM/Uo2Z6QtN9DjYLlLXeb7m5zlm5+
X-Gm-Gg: ASbGnctTCnzxpo4kpJOPfD8cVBuRKiZuLm1z4tgBtmNSce9Wvkig00JpH0349wK9Drj
	9uM9/NSRRshR663qKQFELdsvuA1krr/BaUPvrpP04n8r5yFuh4Xs7X+yODBMZWDDQNyPn25t7kq
	OK1b56vUXu7590QuORe5IXXXT7bwAYYz3gMZt9fS3Fyvhql+rQscjHdVXdjszAuNIuatgphjLc/
	BLMGLy9vVPEmySP8qqK4WdYCphc06oPjKszMVSH04zkBym+9XraZGN7hI3vk0Xn67Pvg0gE4REm
	UrGyOiVvBWq9hNBpMUTN25LnO0Vk0GIm1ERtPCq6ZEVlTLDcFH6QgpNeUUrMpBAtUwOsrMW3lv2
	X9f8DYiSbTTidfEIN+2ltCsps1DE=
X-Google-Smtp-Source: AGHT+IEDRACoxzHOVMmpCiCJpJQZq13EOqew3asD/UyTtt1QzzwJSCCTfLRD1gG+rDZlEWR9JlR5WQ==
X-Received: by 2002:ad4:5ca6:0:b0:6d8:9abb:3c28 with SMTP id 6a1803df08f44-6e87abaddabmr44212126d6.29.1740499010479;
        Tue, 25 Feb 2025 07:56:50 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e87b087221sm10749476d6.26.2025.02.25.07.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 07:56:49 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] perf: enable zstd in default PACKAGECONFIG
Date: Tue, 25 Feb 2025 10:56:47 -0500
Message-Id: <20250225155647.3295109-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250225155647.3295109-1-bruce.ashfield@gmail.com>
References: <20250225155647.3295109-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 15:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211915

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The following upstream commit:

  commit 44b44ffd5dcef03d273ad070d0b02a65a323f5f6
  Author: Leo Yan <leo.yan@arm.com>
  Date:   Sun Dec 15 22:12:22 2024 +0000

      perf build: Minor improvement for linking libzstd

      The zstd library will be automatically linked by detecting the feature
      libzstd.  It is no need to explicitly link it for static builds, so
      remove the redundant linkage.

      It is contradictory to detect the feature libelf-zstd while the build
      configuration NO_LIBZSTD is set.  Report an error for reminding users
      not to set NO_LIBZSTD.

      Signed-off-by: Leo Yan <leo.yan@arm.com>
      Tested-by: Namhyung Kim <namhyung@kernel.org>
      Acked-by: Andrii Nakryiko <andrii@kernel.org>
      Cc: Adrian Hunter <adrian.hunter@intel.com>
      Cc: Alexei Starovoitov <ast@kernel.org>
      Cc: Daniel Borkmann <daniel@iogearbox.net>
      Cc: Eduard Zingerman <eddyz87@gmail.com>
      Cc: Guilherme Amadio <amadio@gentoo.org>
      Cc: Hao Luo <haoluo@google.com>
      Cc: Ian Rogers <irogers@google.com>
      Cc: James Clark <james.clark@linaro.org>
      Cc: Jiri Olsa <jolsa@kernel.org>
      Cc: John Fastabend <john.fastabend@gmail.com>
      Cc: KP Singh <kpsingh@kernel.org>
      Cc: Kan Liang <kan.liang@linux.intel.com>
      Cc: Martin KaFai Lau <martin.lau@linux.dev>
      Cc: Nick Terrell <terrelln@fb.com>
      Cc: Quentin Monnet <qmo@kernel.org>
      Cc: Song Liu <song@kernel.org>
      Cc: Stanislav Fomichev <sdf@google.com>
      Cc: Yonghong Song <yonghong.song@linux.dev>
      Link: https://lore.kernel.org/r/20241215221223.293205-3-leo.yan@arm.com
      Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Enforces that zstd must be enabled if libelfstd is detected.

Our build of perf and the other default features lead to libelf-zstd
being detected, and hence the build aborts when the features are
checked.

We can't condionally enable this for 6.14+ kernels due to the way that
the perf recipe works. The feature is minor and probably should have
already been in the defaults. To keep things simple, we just enable it
and will watch for any fallout.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 18e2454f9a..d06dd2fa5a 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -9,8 +9,8 @@ HOMEPAGE = "https://perf.wiki.kernel.org/index.php/Main_Page"
 
 LICENSE = "GPL-2.0-only"
 
-
-PACKAGECONFIG ??= "python tui libunwind libtraceevent"
+# zstd is required for kernels 6.14+ when libelf-zstd is detected
+PACKAGECONFIG ??= "python tui libunwind libtraceevent zstd"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
 PACKAGECONFIG[perl] = ",NO_LIBPERL=1,perl"
 PACKAGECONFIG[python] = ",NO_LIBPYTHON=1,python3 python3-setuptools-native"
-- 
2.39.2


