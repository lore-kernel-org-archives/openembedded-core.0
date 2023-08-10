Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DCCC04FDF
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:47 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.21310.1691683542973510519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=lmm0JFN9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6873a30d02eso790300b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683542; x=1692288342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8477oqVbmJcdvInggyKZrTbd3Xm6WQBal7saysygj8=;
        b=lmm0JFN9N9S7WCuQ1Ow8Oyco3bP2M3VovJLJqKBJKw99/PM4q4U4wOCgKgQhnIxCK/
         Lpre2kAOjC+CjwyeVfiQmtUMOXcGdxAj+8hjz+EdA4FZ8/OKPwJyD6b6kpUzPTyMZ+4c
         w+RlhKJ4OFNVp50t6EoTJOvCy3L6lC9Y9uq1LqKcMgfFNpr4BTgvcZJYeXvtsnCFdmsb
         p1yXKBXyitiJU3PFPKnoqpxZELHrNII+JyZ7fku/4WPwdA0URkzExASXZ/PiBJkblM3K
         4RGPPS7gUe7F0G5tw0argUryu/wQjz7Ig64EUvtR0dHTcu7Dm6c0qBpYj5MOnxUSwwbb
         F3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683542; x=1692288342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8477oqVbmJcdvInggyKZrTbd3Xm6WQBal7saysygj8=;
        b=YF+p4y/eTpjxarlXG/dCUNmR/leOIlLgms5Jq/FbKzfqh6DSvJELYAARA8vvpPxhqu
         bwnMXjnzdmBWCzYtK3NMqCW2sx/vOXNcZFZwThvVjYeQJ2vcadc6r3wYKGkbKB3a0TEc
         bSztnNyVTu4bPAjLtF0jw2QpOoPZwmVhx276mRZfu294sLSkWSoRjkh8ySdr/16u/ofi
         HJmuPYTg6MGkr7Yy8TFm8s9miNyFhN5ZjHDMpThsAyyns9TV0wbhe4FLxjPJ1yUIjlNE
         wtnpNl2inPca6qBBIwxb4okfXshcge65ffwPVJV0L8B4NI93fdaFPN31Ee8r2vUDaxoe
         SsKg==
X-Gm-Message-State: AOJu0Ywwi9GhR/8fykcEICV7mcsi7AbztTSBTmmTs0OGWYrjTAunXNgM
	J/MY7yJ2OldFy+jGWHcH32/DBo/WGGA4KwWsRfg=
X-Google-Smtp-Source: AGHT+IFlCqQqJEssuvVeOc1U7Ypa0W6Qp5Xf5DsqxsI4/tPBUqoPOOUnQmTVE/ZABhxo7Lh5hIKf0Q==
X-Received: by 2002:a05:6a00:2386:b0:686:bd88:6062 with SMTP id f6-20020a056a00238600b00686bd886062mr3190265pfc.24.1691683541880;
        Thu, 10 Aug 2023 09:05:41 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 26/37] file: return wrapper to fix builds when file is in buildtools-tarball
Date: Thu, 10 Aug 2023 06:04:25 -1000
Message-Id: <4a9832c55044b894e933179e5c1b6a96634809c0.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185788

From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>

Wrapper that adds proper path to magic file was removed in
47db876d09d9a4394048579c21d0b394450ce681 in favor of
environment-setup.d/file.sh which now contains `MAGIC` environment variable.
This breaks builds that rely on external buildtools with `file` included in
buildtools-tarball (e.g. via TOOLCHAIN_HOST_TASK) because do_populate_sysroot
task invokes `file` via `subprocess.check_output` (in is_elf function) and
doesn't use variables from files in environment-setup.d. To address this use
case, we need to preserve the wrapper, but also have
environment-setup.d/file.sh for the purposes described in
47db876d09d9a4394048579c21d0b394450ce681.

Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e76b059cf4ba9a79150032d68d012b233dd79a65)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/file/file_5.44.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/file/file_5.44.bb b/meta/recipes-devtools/file/file_5.44.bb
index 3090d346ed..0834384230 100644
--- a/meta/recipes-devtools/file/file_5.44.bb
+++ b/meta/recipes-devtools/file/file_5.44.bb
@@ -45,6 +45,7 @@ do_install:append:class-native() {
 }
 
 do_install:append:class-nativesdk() {
+	create_wrapper ${D}/${bindir}/file MAGIC=${datadir}/misc/magic.mgc
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
 	cat <<- EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/file.sh
 		export MAGIC="$OECORE_NATIVE_SYSROOT${datadir}/misc/magic.mgc"
-- 
2.34.1


