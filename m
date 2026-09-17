Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6E3C982D9
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:16 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1588.1789682893976335834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Cw5N5F2f;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so931045e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682892; x=1790287692; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkWGrJH51sgMunY4tBW9cage/X0mtJi3Ixg97vlX/v8=;
        b=Cw5N5F2fmPzUCQji1NCmiFUACboPQXYtv88og+1jbnPsNHNaFVH/xS4Z4oa9UpyKOW
         Le6CThmCCnrw4y8bUt2POylnCQ5tt1QqecBpz3QlljYqm292I7pFzr+sjXCKekxFoqda
         RBRi/t/at9g6w40rBJCx85KfKEQ+jY3gDaO/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682892; x=1790287692;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkWGrJH51sgMunY4tBW9cage/X0mtJi3Ixg97vlX/v8=;
        b=DAmUXWBvC4jKsRmLMmFPShHQA6IYHqoZKXkGRszJdUJsQe+U/TEs29xDMxSmFOkWi+
         WxOkK33ugjDk0k138pj2eq7DMUfPRpldpD4qj0CxS31B9MzRwkkhb0vJDjC1By3C0qfB
         xDXGtU4arVSidy4ZLpf/pwIiGEY3zigQWnmLdcIqP/1x5yOCkKS3F9XBgjqkSxh1ENLl
         AaOhOXkDxmCXTZoQTqtcI/kjHK6ooh/FSHtyYcunQrwxYvQmz6b8NmNz4ZUhqIPzhopD
         MNA9Be40XOYu9T5tYhAp64tgsC2/NwahY32Ie8BzhkCsLWzfS/0KyxupEuiOTCnWgW0y
         BFvw==
X-Gm-Message-State: AFuF++mpHgnu9DO1POE/UIBb5tmG1tK5H21Fyi1YlwKtxILTiH1GPmG2
	By0TdSl5u259Ccn8QmSmxXVYQMPRVarCF32ADLEZ2qhxucuvxLBPgYc1C+6g+/QZAYt6D88ra0c
	ceEAFnvo=
X-Gm-Gg: AYBFou3RYstM77ERGa/AChlOFFK9oUVNhg8ioMSgN0Z1Eapc8ysl+8a/EdeOkVU6hHT
	ZKvipP7aSXdaZBRWce+DQVCdUVJTtaKLSqFhQYh3KaexuCJ+IjN0N7vdO0QyV8N4WmPwrqIngAS
	z2e4oMyxQ7eTBMd5t8Xx/Lyj223ovswbHuBaV6pvov34EVFvKC7xNHD0fS+iD4zEPh/QARzXT38
	8y1KCwTeGbFsMeYvsRgLrSGcmAI8qWXzLTDDH+gXK47Ouauo982/ImY58N9YKtSCYF4Hms0Zcfz
	TUvyLOrnwib7OvAW9CoBzPbJ4Bkv78Hm2OMMizMRkMHPKZKYSq2HPNQXd6eZRdCFOW+X9/3deB6
	csmjmv/O5J/6WP7tiPyVKVBjV6rlKHRhHDA284WWUpwhYb7sAyaNeBcwPraTERqwiGJW6ikTeQq
	dBqRIOU557agoET/WC+/SWMKQRCGNh6CsVwjHjsrZUdgc3f0hiYs+Jb4im5FVsrj9SybJyENYTj
	iCFvReKmrMWXo26g08A70zp1r7zX/V0UJo2oWecbJtNvWl7DtV15QRZfjThBrc/XStvhIM+tg4=
X-Received: by 2002:a05:600c:3b17:b0:49c:fc6e:8cae with SMTP id 5b1f17b1804b1-49fc5737b80mr2821275e9.18.1789682892211;
        Thu, 17 Sep 2026 15:08:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 43/79] util-linux: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:28 +0200
Message-ID: <9cf210b327f0e645757f7187efa6c74360218c21.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246138

From: Daniel Turull <daniel.turull@ericsson.com>

util-linux's README ("Stable Branches") documents stable/v<major>.<minor>
branches whose maintenance releases are bug fixes only, so upgrades
within a major.minor are stable point upgrades per the OE-Core stable
release policy (ref-manual, "Stable Point Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://github.com/util-linux/util-linux/blob/v2.42.2/README#L95

Checked the last point release for feature creep:

  2.42.2 (Jun 16 2026), against 2.42.1 (May 18 2026): 32 commits, all
  fixes or hardening -- memory safety (a libblkid use-after-free, two
  buffer overflows, a libfdisk GPT fix), privilege tightening
  (X-mount.subdir restricted for non-root), diagnostics (fanotify queue
  overflow detection) and documentation. No new options or behaviour.

These releases are not picked up on the OE stable branches: util-linux has
had zero point-release bumps on kirkstone, scarthgap or wrynose since each
branch forked from master, leaving them at 2.37.4, 2.39.3 and 2.41.3
respectively. This addresses that gap going forward.

Scarthgap already has v2.39.3, and the 2.39.x stable branch history (mount
API regression fix in 2.39.1, new CPU model support, and libblkid’s bcachefs
handling) demonstrates that util-linux exercises good judgement in managing
stable branches, so we can safely track their stable series there as well.
For the avoidance of doubt it is not a development-series effect either:
util-linux has no development/stable version split, and pre-release work
goes to -rc tags.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit d51c6e87a10c7c75a692ca86b71af9a818026ecb)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 09916594b0a..be49160eac9 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -28,3 +28,7 @@ SRC_URI[sha256sum] = "f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8a
 CVE_PRODUCT = "util-linux"
 
 CVE_STATUS[CVE-2026-13595] = "cpe-stable-backport: Fixed from version >=2.41.5"
+
+# util-linux publishes bugfix/security-only point releases on its
+# stable/v<major.minor> branches.
+inherit upstream-stable-release-point

