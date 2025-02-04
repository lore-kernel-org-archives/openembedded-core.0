Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C5CC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:01:56 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.112963.1738663308619151877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=R4T9O8B3;
 spf=pass (domain: foundries.io, ip: 209.85.218.43, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab2c9b8aecaso914682666b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 02:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1738663306; x=1739268106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJzHPHPxTWLzAmYfo+C5ik1YweqZI7lmrvhSa+oj5tw=;
        b=R4T9O8B3E5ftwrV/C8KeR3KydA4uHBpI/CV4VpY6BdN8ElcSKWi0kPN+6k5y5+lKIb
         DJvKhaRzx6i5VdMfLq184MM6O5j6OSirQIVBONILwjO6CGpyWJUVFMDA3pjHmdhvUW6A
         AU1eVlmS7dFGMGiao5eVaLnk4ZbO7VUp+9b9PGLH061ikorar6i15ruWBSgEICEeQmuu
         1yLHFrplF8zTNw6GcLK6afLXVuIoU94x+6YdoPPKGvgWlZzj68UHL/mMs7HbuZHa4Pye
         d4OGsGhB0YaT0FeTBn/wnbZLQiS/IjGUe++ePT3idoxb7uxjbyvLDqM1HN/cZBzf4C3T
         feIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663306; x=1739268106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJzHPHPxTWLzAmYfo+C5ik1YweqZI7lmrvhSa+oj5tw=;
        b=wqAJJxkIucW0NtAscGtl2p4XtTQqLzm8pY2avxFhFMeG3b/u7MQiTazMowRaBrrb8f
         Wy6SQLT6AFvo9tLqtK8Z+xIgyeN5QWiHAZF12AuEMoD3TS6ciYCtB02Pk2W3tmtgQIW9
         nF5j2WjByFMxjnvGh1LU+fICUrLa8Lz/zfRktuI8/iCX19asDLE/X/welFqFPxchK10y
         fPsmjEaQLHd/zULRrrWv1n9aXrXSKIRMLYxXWb6BcvZxqs1+hur9J0z/P+MunjE6IUm+
         yW7VY/PEuPpAvvJQ6dM32JAyqMSlz6Lj2oA6eCylMpnPsz5V1dZmR8qTH5nhi9yohdk7
         URmA==
X-Gm-Message-State: AOJu0YzP3/NM7k08K5gyNfr3PrO+gHwJsGHv7kuxfwkmxG3oabOT9H3P
	03NDe/PmRbcWXCQ5oTMN7Uco0fgRmRjnza1t4pNBfxgIygbIRnPEIsKYEmqaTzvBB2qlnNj4c0T
	d8TjBEw==
X-Gm-Gg: ASbGncvg1lnnz/bcIkcedcZdL3smvxLZAIIpDRULEyqYsusMGHDouA8wotdzXtx0Yy6
	e0aMOzZs1fdAE284mAv0YojDpFxDDrZcEYltfcBHiFjQj7nSV14l1TCJTnFIBSmkD8Q0yUEa6lj
	8D0bjxGvJzPEl8j0mSsyhYr/pVQU2hsS/UtVhjaj6X8iZKJ5W0mzwG35Z77Ix0bXJicQCMXzQfd
	ht9smgBcqQX48GhZSzpoMatA72WJyk61dXJO0xxsaSkDLyCWQ2AlY3U+rr0088TG1gZph9nv1jY
	NuWpoSLteBjcOZcStlERq6k=
X-Google-Smtp-Source: AGHT+IH8P40mWiJvJ4CaFProsi8nljUsNGpQL6vik/uN7lOggui0Ft+iKF+zBi6dhW3DPaBvwOWtkQ==
X-Received: by 2002:a17:907:94c8:b0:aa6:b4b3:5925 with SMTP id a640c23a62f3a-ab6cfceaaf1mr2444714666b.14.1738663306238;
        Tue, 04 Feb 2025 02:01:46 -0800 (PST)
Received: from igor-t14.. ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff724sm899065966b.105.2025.02.04.02.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:01:45 -0800 (PST)
From: igor.opaniuk@foundries.io
To: openembedded-core@lists.openembedded.org
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH 5/6] patchtest/README.md: fix markdown style issues
Date: Tue,  4 Feb 2025 11:01:13 +0100
Message-ID: <20250204100114.3749576-6-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
References: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210760

From: Igor Opaniuk <igor.opaniuk@foundries.io>

Fix markdown style issues using markdownlint tool [1]:

$ cat ./meta/lib/patchtest/README.md | mdl
(stdin):4: MD034 Bare URL used
(stdin):8: MD034 Bare URL used
(stdin):9: MD034 Bare URL used
(stdin):20: MD034 Bare URL used

[1] https://github.com/markdownlint/markdownlint
Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 meta/lib/patchtest/README.md | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/patchtest/README.md b/meta/lib/patchtest/README.md
index f66613c0c1..27cc61c802 100644
--- a/meta/lib/patchtest/README.md
+++ b/meta/lib/patchtest/README.md
@@ -1,12 +1,12 @@
 # patchtest selftests for openembedded-core
 
 This directory provides a test suite and selftest script for use with the
-patchtest repository: https://git.yoctoproject.org/patchtest/
+patchtest repository: <https://git.yoctoproject.org/patchtest/>
 
 To setup for use:
 
-1. Clone https://git.openembedded.org/openembedded-core (this repo) and https://git.openembedded.org/bitbake/
-2. Clone https://git.yoctoproject.org/patchtest
+1. Clone <https://git.openembedded.org/openembedded-core> (this repo) and <https://git.openembedded.org/bitbake/>
+2. Clone <https://git.yoctoproject.org/patchtest>
 3. Install the necessary Python modules: in meta/lib/patchtest or the patchtest
    repo, do `pip install -r requirements.txt`
 4. Add patchtest to PATH: `export PATH=/path/to/patchtest/repo:$PATH`
@@ -17,4 +17,4 @@ To setup for use:
 7. Finally, run the selftest script: `./meta/lib/patchtest/selftest/selftest`
 
 For more information on using patchtest, see the patchtest repo at
-https://git.yoctoproject.org/patchtest/.
+<https://git.yoctoproject.org/patchtest/>.
-- 
2.43.0


