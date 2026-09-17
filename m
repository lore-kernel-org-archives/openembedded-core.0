Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473A4C982D2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:04 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1576.1789682883881137942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fcXmtem7;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so584995e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682882; x=1790287682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IUtyKV6f29lo29VlsDpRewdngBnzoZNi97G/PcnO8bg=;
        b=fcXmtem7IR/hJ/hjHBh3QJir9OqmPvGRr/LK4bP/47gXp7B8mIPcSdOZuwvKjf9V50
         EuCbWd+SzV7CMKrsS4H2QXV2jculTaTXeaOztF2oBSKgp3hxD9lksy0PfR+eKlnPFRVO
         3+wTKk6ncSKklEkaxlaleV8Qu0m4BE4rVQr5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682882; x=1790287682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IUtyKV6f29lo29VlsDpRewdngBnzoZNi97G/PcnO8bg=;
        b=u2i0cAS9+n8xUSYTqi1I5ZqZnvIr2T5JZyULgf4/05CV3siPV8iqJSq9Pj8mNUOdjz
         3LJ4TNlr+dAQkwEWP3zjCz3CG4Yt0L+LWxkX2SBQCxzOygtxdUtsL2OBm3a7YSlxmZq6
         rerVP4HCFwJbqReITSKDDA0/kqWD4d6D1qiWVO1TnSk1kZHoTed3LU3audMO5rzyFbOc
         relgto3PPJ+SeiElyb/AyCoz0rhk/iz4NH0ojlkrEPmnRU63OI9YH4ykpl/1kU7e64HC
         135AtiVUjjDLcJIfbznIaY5Nbt0f100cHh2kjtYNkTdE1FyZtw0jFeG3K3V3G0mZ/bQ7
         UUVg==
X-Gm-Message-State: AFuF++mbb/kHwMJ65hkioldJbD97B0Hb5Ls+aypUjy1V8nACGjwvwObg
	dKXkoKF07XCtUFvQ6f/6p8ukgn7Ol+xEkI6yLyOUxTbllx2q+YMGDg7mH7C9jfG1p6H9TPYzLlg
	WpBQhF5c=
X-Gm-Gg: AYBFou0Bz0o6r4S7dRqi5F12fhqB3YXOQY9B9KNESr58Ya0QAiJavzaGl8nkVotNMzI
	l/7IKHrnGBuetPub01yOd5pwdUrMyYnxTFofH/OPgIxFRpRAcWF99pTSpgFujBbR9Qh4XIVxsLw
	ysyc9uqxqbSjhMD1w76nrcFdP02E6VUTWjr8nOpf2q+D1XcXf30ubYuPaYGxZ9iPxzexYpf3hHv
	2oMrtL+hIKajacsW0zYZrvteKsE7/gYopznG8QAKNTCbSBlRNVZLh8fAsgqO8rl052KQaN/G/AL
	HZRBJ+Mq0eES9q25IjGtP0I5354rynPbugFXFO7XO5eZQuFZVSr7LnP1zuGY2IMGcMU/57BeykJ
	HNCkLMHaEZlBlhTN3Ci5sAPWilzMeMH38ZMI6jtzkTre3AqZsCrZzCgkE+r0CqQvsdmmIaa+Ufo
	9bDqK5Na8JA0iha4J744lt8Z1SRFzSWd1bmQhbheVKC6idG5UgnrMqixUEBu5Z9Rqwf3lptuNet
	sD2CTN63pymCGLWT06t4ij88AneczrbrKw6dwKJGlcPcwPilGD2FbBSy9KMVBdshfdC1AkDs7DK
	pnTrCQ82xQ==
X-Received: by 2002:a05:600c:4e48:b0:49e:6bce:b0f9 with SMTP id 5b1f17b1804b1-49fc574f4d7mr3110725e9.16.1789682882173;
        Thu, 17 Sep 2026 15:08:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/79] python3-mako: correct CVE_PRODUCT mapping
Date: Fri, 18 Sep 2026 00:06:10 +0200
Message-ID: <a754d6397e13f88726154dd42e1bc2988d2ccd2f.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246120

From: Devansh Patel <devanshp@cisco.com>

The inherited "python:mako" mapping is not used for the packaged Mako
source and causes its vulnerability records to be missed.

Use "makotemplates:mako" for its historical NVD configuration identity
and "sqlalchemy:mako" for the current NVD dictionary CPE, NVD
configuration, and CNA affected-data identity.

Backport note: this applies the metadata to Wrynose Mako 1.3.10 rather
than master 1.4.1; the older release exposes applicable unpatched records.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 76fc2046d3f251af34dd04f8fdcfc0c1d6016380)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-mako_1.3.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.12.bb b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
index b2c1a8dad8d..48f660870e7 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.12.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
@@ -10,6 +10,8 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI[sha256sum] = "9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942088b7fd7af550a"
 
+CVE_PRODUCT = "makotemplates:mako sqlalchemy:mako"
+
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
                   python3-misc \

