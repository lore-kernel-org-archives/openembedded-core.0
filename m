Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCB1CD6E61
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 08:09:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20086.1780387794033295339
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 01:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kxWtpLfC;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso3630165e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 01:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780387792; x=1780992592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBuxwFCQAHpuWLyyD7dke2CRXhfYjK6nCkS+qnN7Mis=;
        b=kxWtpLfCKXcDpkTh/vFVZlTKJ0tt+W5kmydN662yZ2n+EPEmj1gLvhLmkNxUFxRgZB
         0dnq5by3N00I1NrenBPvKtr6sNBoC62NITYR4RgS4pBmBF4nYOdF9vQu7ULfJaG1Y3XX
         jSbQzv2X3phddBmkqTf+4bKh8zAcWoif2GvBUmOlPGzVvMrlKlH+uJKR40TBsLzmFsQm
         7U2lEeu1hhkoMar2PXZJgrepBLjAS3g97aUmFo8fJGHOmLWNkmZ4bZ5jlCsLWnvRGIOq
         XwCL5kbmfWg1+Vn/8UAlKXfC4t6emv1GsoQ3vEU/G+F0r0xIiBV4Q7yI+8vkDQ2H/Iqi
         k9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387792; x=1780992592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WBuxwFCQAHpuWLyyD7dke2CRXhfYjK6nCkS+qnN7Mis=;
        b=sRBc5fbMJm3Zpf8GM/fpIshPIvtKbKGQDIZwePVLzT0qyB1mMl4bsmEixcO32fnlTl
         1jwjBeqk0LtuStBk/G9gm1bgPMH/2++IHkZXPFPHgku2TyagoprW7PnTZUSqgmQZ39S/
         PsQlF3UXj6QhQAOI+Kt5wT/B3M4EmIHatal1x0m5qa2a3oJjvHCCG42y4/gWo5Htrknx
         21zJs1jrfNFwDU5rUq7rW1hhhMSPh3naN6Bpu2ENBrcZQXSIBGIN4+YdxH3iWq9BpyE8
         EALu5BFjasrh6alFnVLvXWUrb5NxoDemoA9TxmxvMT8HwCW66ZhAzUOmmUAQVRVcnEyH
         Oa2w==
X-Gm-Message-State: AOJu0YyYW4IXxYHyc9x6cdprM6TPqoSH3sazydqodcT7I8I3iUefO07I
	3TJNFdfvmwq9QevM7E0krehxnUnNB4M8Ur5YuPh+PFJ7s2T0qyZpCSsc2ckFuA==
X-Gm-Gg: Acq92OHCEZEa3jOfT/nHsWwyL6BJkRaNb+XxeMyBLrAgLO7fWQJRX4GHrcMqnbU9+JQ
	bikZ9FjPRNBAsHePmYIa9qIx0/Vi1rqDUMBVlWoWxRXEpxcFXvjwJYRDn/VdEuKwXDEh5CX6pib
	32IFf2R06trk4evW8rOHDUkXn9UGf2wcbhucxWpIWDgLCeFw26f2jdx8sJ+ILODUNtwDES/rGZr
	RnyBkGpLZ4aVy/6U6tazOVtrb1ANxznoAwAbgJ29GA9OnxweubQ9LFERxDreX7qfG0j02pHSEWw
	4wbnvlxvzE1gRXlal3e1AUpyX28IExuijC1viz9G16njONq1g4u8GWBN+smfgPfZ6llUkjZIg2Y
	1ye3o70yZboO182YNgF97CUVN2V4NerHEtIZwRsAC9FWMQDbd3GeonnUlmeZhYoh6nyAqiO28d0
	coEgGvM23hi+tn3rLQRADVXOK2bd7jMNFxVFfyhZqMcTNP9EW+Rz68mUXy+4f1gFD48vVE2YQXs
	3vYlqPNlftynjldarzP
X-Received: by 2002:a05:600c:c3dc:10b0:490:44eb:c1e0 with SMTP id 5b1f17b1804b1-490a29438bfmr196223425e9.21.1780387792174;
        Tue, 02 Jun 2026 01:09:52 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490af60e03esm46545525e9.2.2026.06.02.01.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:09:51 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 2/3] setuptools3: clean the build directory in configure
Date: Tue,  2 Jun 2026 10:09:39 +0200
Message-ID: <20260602080940.1053865-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602080940.1053865-1-martin.jansa@gmail.com>
References: <20260602080940.1053865-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 08:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238015

From: Ross Burton <ross.burton@arm.com>

It's not currently possible to set the build tree to be somewhere we
control, but we know it will always be in the build directory alongside
the setup.py so we can [cleandirs] that.

MJ: helps with build/lib directory being added when a recipe is rebuilt
in the same WORKDIR multiple times, e.g.:

Just rebuilding python3-tqdm in the same TMPDIR after cherry-picking this:

$ buildhistory-diff -p buildhistory build-minus-1 | grep PKGSIZE
python3-google-auth/python3-google-auth: PKGSIZE changed from 11752510 to 1315694 (-89%)
python3-googleapis-common-protos/python3-googleapis-common-protos: PKGSIZE changed from 7108856 to 794024 (-89%)

$ wc -l python3-google-auth/2.29.0*/image/usr/lib/python3.12/site-packages/google_auth-2.29.0.dist-info/RECORD
  554 python3-google-auth/2.29.0-old/image/usr/lib/python3.12/site-packages/google_auth-2.29.0.dist-info/RECORD
   66 python3-google-auth/2.29.0/image/usr/lib/python3.12/site-packages/google_auth-2.29.0.dist-info/RECORD

$ wc -l python3-googleapis-common-protos/1.63.0*/image/usr/lib/python3.12/site-packages/googleapis_common_protos-1.63.0.dist-info/RECORD
  1166 python3-googleapis-common-protos/1.63.0-old/image/usr/lib/python3.12/site-packages/googleapis_common_protos-1.63.0.dist-info/RECORD
   134 python3-googleapis-common-protos/1.63.0/image/usr/lib/python3.12/site-packages/googleapis_common_protos-1.63.0.dist-info/RECORD

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/setuptools3.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recipe/setuptools3.bbclass
index d71a089539..c4fd30020a 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -15,6 +15,9 @@ SETUPTOOLS_SETUP_PATH ?= "${S}"
 setuptools3_do_configure() {
     :
 }
+# This isn't nice, but is the best solutions to ensure clean builds for now.
+# https://github.com/pypa/setuptools/issues/4732
+do_configure[cleandirs] = "${SETUPTOOLS_SETUP_PATH}/build"
 
 setuptools3_do_compile() {
         cd ${SETUPTOOLS_SETUP_PATH}

