Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFDEC55163
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 21:14:51 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21867.1785359684714230943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 14:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SjmAOGar;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f6609c657so741631f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 14:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785359683; x=1785964483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XYse5rKj4XylIwD/FJ33aZjrqEeyntIxBOb5USYVuiU=;
        b=SjmAOGarUnWSzLnkVeqVRsT6YvUKPeqt4/PyDYN2g/FG3dpAM1FULenVPtv2HvM0ki
         NnSo6zaLIaf0xnuPdLv+ktGSprZo7VxRi4XJ9NzhCt5DBNSU1YvEDkTK9CtJjDLOfBp4
         2vK8pnUSrQFvqoWvkoW3mrbuXRJemBljixX2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785359683; x=1785964483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XYse5rKj4XylIwD/FJ33aZjrqEeyntIxBOb5USYVuiU=;
        b=KrrlcjYzwBrfgxAgUlz4m6SfsqMZqZwK5L6pxE6hiLQFRq5EPmnZw05oCssLlNnhwH
         nGbGpHP8Rz7Vd9NDnNxQVs+ZY4vaRDujjIVYGHZtNSa6g3e1Zbie3Z3o7qtNUBOpCPDP
         2/QcaZYbGRs9v3GE3inLFoIl/AkQrIV84lPokH7Luz12dISAIMeaLI32STs+HXrOVPJo
         9qBi/TwVRRKSFqBGZEU4RzvexcAhWu7utJamBoih6F+bSxJkgAPkZvUNq92kHCcSRpi5
         cywHBN5lVclvoyR15xivoPyAn2SnL0v2B5Ci5dG0THmu5xI6hCI9zlGmroCS+pmQIDX1
         zPaA==
X-Gm-Message-State: AOJu0YziBYLWT1wwD+RRYOcqbC1DvfUVnXhVtXQpye8EhlxRAwvaG2uW
	G1uee7QoW5KpEyh7+qf0xHTSiDxj21ah/mP3zFArSuGcrX4J00mrE2CdemqHSF/oB1hEocpKu62
	WsdP0jNg=
X-Gm-Gg: AR+sD126PKwJ5tWHjBju61ZI1Y5TutyDqElf3GwGMCzNNmznPDvcOBRrEDgXVlIC65b
	/fgLXUUax/M3SMPJmV3Ofv2ILhLjJxvJ7zor5hN4KABcxy2pBSaz1UCAwkNZFP75Xnj/92M48mc
	zPZ2SvcplvyOjlZjjZOCgF5HFUppzfu2N28KtCMfFVHzkq9uVq89iCWp6CcpM/BL3cL7t2UX6Ee
	GjdzAUrtN7aMQ/edhWpnG8FXPnip1mHhnWVX2mFhx1fi/9LXjxFmuqD8X0TMp/bRDOLuIAoVLx5
	Oqr3k68WiIXCx5gGOo+V80Uh6S17zqnT1pRD2fO+mW1nWNi8gr0GYdl98a5AdiYOOkyAV2vhm83
	g3omxjk7uXxyqAkWutlLdwbM3JX91zgoJvAeFutuuUpJ9Pr8O5gGRenAfg/WlsYJdQZlP2cplTF
	2tZonEcNsWeIITGYxRcAnKt+mIc7+uNEvoIcf/XkHub2YTnGdkNx9d6+n4shsum54N7Qxcv9p70
	DedlPM14pNWPoYXkQ==
X-Received: by 2002:a05:6000:4301:b0:47f:71dc:d848 with SMTP id ffacd0b85a97d-47fc6547517mr523679f8f.12.1785359682935;
        Wed, 29 Jul 2026 14:14:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3647:86f2:68ea:efc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a94sm11277116f8f.8.2026.07.29.14.14.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:14:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] python3-vcs-versioning: upgrade 2.2.2 -> 2.2.3
Date: Wed, 29 Jul 2026 22:14:33 +0100
Message-ID: <20260729211437.3394641-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
References: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 21:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242289

Source: CHANGELOG.md

## 2.2.3 (2026-07-28)

### Fixed

- Fix `ValueError` when parsing `.git_archival.txt` of a tagged commit whose tag contains more than one dash (e.g. `llvmorg-23.1.0-rc2`) - the `git describe` suffix is now matched precisely instead of splitting on the last two dashes. ([#1481](https://github.com/pypa/setuptools-scm/issues/1481))

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-vcs-versioning_2.2.2.bb => python3-vcs-versioning_2.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.2.2.bb => python3-vcs-versioning_2.2.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.2.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.2.3.bb
index 300284e4c07..eb81e4d4d35 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.2.3.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "4ac4ded78720cdb4d0291ae58ace87e1e9201912e1023f3029c6cce5c9152cfb"
+SRC_URI[sha256sum] = "c21e284aa98c8269996791a19d6173baf953cf9996ef42ec3ebcbdc151e18b9b"
 
 SRC_URI += "\
     file://run-ptest \

