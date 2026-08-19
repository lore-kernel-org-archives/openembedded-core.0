Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4574BC5DF93
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10333.1787155075395690789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DfU3uw+f;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so775676f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155074; x=1787759874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SUsXieTz5SoVoPyY7e0F6nNiAjeTALF89ilokDTn9n0=;
        b=DfU3uw+fqJgFT4RYI+FQ0PEiPGiKk1RrId8/Y2qw9oICpH+/AdMj8HKtIs673ca/cs
         CoJAZaWKPTJvPNA8UuWv5+S+6Wijg0VvgYslUJrKg3bZ5gGGiYziRI37rw29CFD2z8AW
         81dCI1EhyUxPZhbSguP2n/kE2TKVwGd8OZU7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155074; x=1787759874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SUsXieTz5SoVoPyY7e0F6nNiAjeTALF89ilokDTn9n0=;
        b=WYaEGC1PojFL++IneWJacRdTXwLGx8iwG2Htj1QBDTMOYGEr778HaE4+S3tN6oXv29
         XnnN6YTDi4BNYc/vT1i2eNS6Wa30g5Uiw8dTZc2WGi+imMJlUBGhHYWJeUigfAZc5s32
         nOX0SBS+nhA3GSyzbzXD11qwj84SCkqQJmyBbZ6VcFD6qwci1nCTF0V4jSVhojCL1FYc
         lZPDn9sGERvlHNs92UUkPlTIO6bAKvI1MvGhMQgV/+3go/5QyjZKbtZoSTYhqoX9H5U7
         Exig6TrMMETBOEFxKOGVTRcwzjtXQLMMVBcILGsoR70+eTt/yDjle0cdnjvkZzy58c0n
         dH1Q==
X-Gm-Message-State: AFuF++l1RUs6bV4/7JZaDc4En/pAMagn0CX4vHnlRRSQz0wqvnUA7z1t
	VCGZXOmgggJ9zQtw31MqU/guHtaQyS30fnMFsjJ2rnHHVRN8Ssh5eIKNviPyMu5RbzryteVg8Tq
	TTxomUgk=
X-Gm-Gg: AR+sD104TTscpzQuABvn89+UQINjBMqDZLUYJu6cfSAKiQ3A0q++xWi1zfbzGUfE1WI
	35Zg+mYouIKvxIS51BwhAJWrOXVtd5rpXAGw6Y/HGvzzmj6kxdUnSv3HZI1ykREWl/PMUZCfuUw
	3GrvVmQobFjdqmfJByOS6LNwUH3H04F6ha0p1vRBl2WcAYzkxRiPwvfz3fr1Ip6AqGmixS196GO
	nVogfS8TiZirMtzmU7A74tugIi4sxWAxcSIM5SwVUtVmZFztbaagM8E7FpeSG+vsr8afZL9Szin
	A55Bc6by5+yzePrk/D87Ftx6ts3Jzl6Iq6SB8446feJytw1dASgyvf2RVsFbJyDVRIoZfjK6qQf
	jdnDnFDh8cbjWNfObWGzN6N18aS+cVzsXWmYGISXIpiBJiLQ8/TXh9R844otEbWYcDZBzV2gd6C
	7aDl600jX/uaNh0E28mpgmeaDy1hbjtgrpu8tbQgAySHDNA8W7SBhzjYc1LXsZ7KtxO9wHtuOmM
	BVYTAjz/YmQCIs0fnmDpr3ta+46d67fAT8M2RUGzQAtiBLVGbU9DILu12FtIowVL7l4B5c3D9wu
	D+SJSUpp2mMfq38TB4LQDQxemOENpWsHc8Jl9LEC
X-Received: by 2002:a05:6000:2311:b0:47f:ddc0:602a with SMTP id ffacd0b85a97d-482b1fde11bmr9727079f8f.18.1787155073573;
        Wed, 19 Aug 2026 08:57:53 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:53 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/37] shadow: set CVE_PRODUCT
Date: Wed, 19 Aug 2026 17:56:57 +0200
Message-ID: <db3280fab3312535a8434385f8744e8ecda8a3b4.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243762

From: Peter Marko <peter.marko@siemens.com>

This will remove CVE-2016-15024 from open cve reports.
This CVE for is for "doomsider:shadow" [1].

It will also remove
* CVE-2018-16588 (suse:shadow, [2])
* CVE-2019-16110 (blade-group:shadow [3])
which can be verified that they don't affect Yocto shadow.

[1] https://security-tracker.debian.org/tracker/CVE-2016-15024
[2] https://security-tracker.debian.org/tracker/CVE-2018-16588
[3] https://security-tracker.debian.org/tracker/CVE-2019-16110

(From OE-Core rev: 2a4ade3b03b92e4dd1d57ac4074a9147b2fbb220)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2946e238d2a3947c1a51c4ac1c86c8284f68e4cf)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-extended/shadow/shadow.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 40e6ab0b30e..a308ea00d24 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -36,6 +36,8 @@ PAM_SRC_URI = "file://pam.d/chfn \
                file://pam.d/passwd \
                file://pam.d/su"
 
+CVE_PRODUCT = "debian:shadow shadow_project:shadow"
+
 inherit autotools gettext github-releases pkgconfig
 
 export CONFIG_SHELL="/bin/sh"

