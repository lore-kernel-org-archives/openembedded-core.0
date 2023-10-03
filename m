Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CA8E8FDA6
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 19:37:00 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.131.1696361819854814796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 12:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XM77kzMu;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3af65455e7cso874550b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 12:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696361819; x=1696966619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KM3vxbpuiBpRCgRxmwG5/j21glFuMHtmwDxW6jE431c=;
        b=XM77kzMuKqO24zFOuj+IHdHLfjVT4KxrBqbKnAZ80svoAddRbu2bg3TmP9MT6J1Qxa
         vE5r/fjkT22d+1B59L3Oi4U6Kkokz8xAjWhf/8ZaRWYLMHwAee/sM7vEkvEsEKZmQZdb
         7LqRTbU96nXm0dNJIaqXxdhzRAQa0Y/9Scy7SkNtcwp+cO+H1p6nYJwDTIRA9lN63iIN
         gW3RpRrvhb+GsDmGkIKrtfraynXGfRLaKsRK5AImIqFmsTV5rw0MrDpZcnhZ2dKN/bly
         VAoYcmojSh9pICNAhHDmnDltOdq6wBhl+TEe7SRzDuY3B2q0B28N4wju3h226OudPJ3R
         LjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361819; x=1696966619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KM3vxbpuiBpRCgRxmwG5/j21glFuMHtmwDxW6jE431c=;
        b=jyxbIN0o1qHeJPAxLy0ouTEyG98nM0CT7DoC0HsoOG1i2yTa2arZUQaAEyYrGVVJaN
         FzGPSOFnIu7MeTalqNO3TSLiYeDsKbNngIEmV3T7EoZmyDaNY11a6DaA71tIILJDejxt
         4aL/0zwolALJrqgrEHsb1F/yJ9K7H2zP4vlsD1XLHn6FVNuoPw+eUT7pbTuPQEe/VEf+
         HbuKCjX8S7qw5yjBdX2mOU+TONLaqqV6LSxJEL+/1rCkS+BMORpXPzNXnBu4/8YM6YWt
         6SbPj29eDzYuYT7fkvC4rdAcOG0d6mnYVTZwcA+AjYxjCBGdP5K7sLU7ah2259akvQ7+
         0gFQ==
X-Gm-Message-State: AOJu0YxDZV3ZoGELKF8M/wzMgAhV+kxCjgXMH4suGc4/lsFQCbq2jjF1
	SWg671ebVD4pMM+amBzPKfx+rGlxme4LvsM0Enc=
X-Google-Smtp-Source: AGHT+IH+iJ0vgeRX61Un2YuwAaQ65e3M9oMXclW2ArehShTx0QE9mnl3iYOasvSOvbyCyG2CFT0nbw==
X-Received: by 2002:a05:6808:202a:b0:3af:9848:db19 with SMTP id q42-20020a056808202a00b003af9848db19mr694386oiw.10.1696361818730;
        Tue, 03 Oct 2023 12:36:58 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b0025dc5749b4csm9333642pje.21.2023.10.03.12.36.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:36:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/10] json-c: define CVE_VERSION
Date: Tue,  3 Oct 2023 09:36:41 -1000
Message-Id: <55e9ff0fe1de70f226557529f73c28f34f6956ed.1696361593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696361593.git.steve@sakoman.com>
References: <cover.1696361593.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 19:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188651

From: Peter Marko <peter.marko@siemens.com>

Recently NVD updated all CVEs for json-c and old fixed
CVE-2020-12762 is reported by cve_check now.
NVD match clause now includes full tag name including
date which is "greater" than tag without additional numbers.

Fix it by defining CVE_VERSION identical to full tag.
Put it close to hash so recipe update patch includes this line.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/json-c/json-c_0.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-devtools/json-c/json-c_0.15.bb
index 4da30bc50c..b3679e0135 100644
--- a/meta/recipes-devtools/json-c/json-c_0.15.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
@@ -12,6 +12,9 @@ SRC_URI = " \
 
 SRC_URI[sha256sum] = "b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6"
 
+# NVD uses full tag name including date
+CVE_VERSION = "0.15-20200726"
+
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
-- 
2.34.1


