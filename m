Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B70BC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 03:05:28 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11347.1786590321243394629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 20:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sbGP78ND;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52cd38ddcdfso10267771cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 20:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786590320; x=1787195120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l4VbPHgQWMbiXCuCwENlfKXJCuheAQlsZNAD2LKk5IM=;
        b=sbGP78NDEIOb/EWP4mn3oApJtenLv70F0qSRjA7el8I+Ike+E0FiIrt2qZO/hSm/UG
         a1pk21KYIbhTWLs14WpCaNEGuuV2HlcJgMKPh0Xv6J0dVV4rVnNgbA7NDAl9+SUV1lPn
         MZ8MF0ldumYktoT3ydgEI+2EpZL9Sn9ERTJDYYHEQlH0f9NerO1dM2HIAjtvxYhGHhmQ
         zjYDG0BuzR2Kqe3h4ip6zLqAn5NRDzjPjOncTAAZAnWMZNAkcb7HsS1E1/o2B3jeYcbq
         OeOjyq490//fHPZ0NDChBWXBZw5+jnXY2MDAVLf8voREOQtK6K6rcBlZ0aPWn6mt1Cph
         g84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786590320; x=1787195120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l4VbPHgQWMbiXCuCwENlfKXJCuheAQlsZNAD2LKk5IM=;
        b=pyVKufO3Qq3KZeb7FtmVKkfk3aZAyzdNAk1liLntl2x8CsV/xqJBo5eEte/iUiBjBG
         cptTQi688EDchPkwN85Ge4Rt9r2vHRRzhvsMzNo90HYoBxuJAFS4dPhLj3PkIvYKK3oY
         a+Gef1GMNYd8sx3JwfblILwyi7B5Z195HG28+6KGAk4LFk3YLOr+QjlPHvchxQefNSjy
         eV4KXWSG3+Ive/xuOQpdVXZrvrzII4L9WaezMkksJ2O+4byy1VFmgv3A0U1Mj0PnGL0e
         uNx01TzfVsR+mQxCS7Bo16NxfUvSQmvH0ybkyMGXNzlEz/IHneBNhsPFBkQ1QirBtAOb
         Iyhw==
X-Gm-Message-State: AOJu0YyLL/BKItNrchdBcZ1GL9VGbZQWFOAApC7ioEP6hE2+jPCXJYya
	WIWEMGf8RIp/xC6fU4kU8EzdlCtxhq8vZWh2VFc7SMWZgK1imcYQvkH3PcB8c0ZK
X-Gm-Gg: AR+sD13oos9wIf2BtaU6VC0PEzkSOW9ARPz/J2XP0vNaYkqgRfhdXh7A9rnP9dP4764
	mg0yqIxZiVkiWe3WHcaw6AbvQQhIYCFXeuJFXi+H8S4VSX3WyebwYYkhcIVO8L58Hn5vWBpd/XG
	huRm1MuQahJmDHLtv3DjxhHSaHxhRrdj7q1BwtJRn+SBnNweC+DwdGHH2mVZTxuQ4EpIoEi5K8v
	pWZcox4oatAQZgxzUVGheWqjB1FHAqYqN8HXU0g4MbG7JCWPaNE12/Yq2FIgwVem8Z9U1ZjjGYG
	3PUjFlo3iLwMjYw1nLHQBlpMmnm9PIpxVsS9VP089N4cLMOYcUo/DrmzBRJN8e1h6az1KXvT2dh
	fOwaFHu0qwRWCx43AiNy6ne32P0+rWooGr8rlPwrWOUpVnScidS5C6ZnqwJIDeWwxtzeZI5QkAv
	DXfpA7mV/6ECdrHvszJK3NsAsiEN5AjHnicpGbnFJldGTnc8ortbqIMkaN+xH2nDbYkNPxOmQ4B
	r+2eTfhMK/qWO03Bn4jh2t9WG29uCI0qfXv3ohXYg==
X-Received: by 2002:a05:622a:2507:b0:527:9603:8123 with SMTP id d75a77b69052e-52d73c37b2amr27710741cf.2.1786590320184;
        Wed, 12 Aug 2026 20:05:20 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d73e2e596sm8013921cf.9.2026.08.12.20.05.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 20:05:19 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] oeqa/sdk: update cryptodev to a revision that builds on kernel 6.18
Date: Wed, 12 Aug 2026 23:05:14 -0400
Message-ID: <20260813030515.1028627-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260813030515.1028627-1-twoerner@gmail.com>
References: <20260813030515.1028627-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 03:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243322

The out-of-tree kernel module test pins a cryptodev-linux revision from
before the 1.14 release, which predates the removal of
crypto_ahash_alignmask() from the kernel and so no longer compiles:

  cryptlib.c:384:28: error: implicit declaration of function
  'crypto_ahash_alignmask' [-Wimplicit-function-declaration]

Move to upstream's "Fix build for Linux 6.18-rc1", which is the revision
that restores compatibility.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- none
---
 meta/lib/oeqa/sdk/cases/kmod.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/kmod.py
index 0c4d8ddb543f..1be23e994fd2 100644
--- a/meta/lib/oeqa/sdk/cases/kmod.py
+++ b/meta/lib/oeqa/sdk/cases/kmod.py
@@ -31,8 +31,8 @@ class KernelModuleTest(OESDKTestCase):
 
         with tempfile.TemporaryDirectory(prefix="cryptodev", dir=self.tc.sdk_dir) as testdir:
             git_url = "https://github.com/cryptodev-linux/cryptodev-linux"
-            # This is a knnown-good commit post-1.13 that builds with kernel 6.7+
-            git_sha = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
+            # This is a known-good commit post-1.14 that builds with kernel 6.18+
+            git_sha = "08644db02d43478f802755903212f5ee506af73b"
 
             sourcedir = os.path.join(testdir, "cryptodev-linux")
             subprocess.check_output(["git", "clone", git_url, sourcedir], stderr=subprocess.STDOUT)
-- 
2.50.0.173.g8b6f19ccfc3a


