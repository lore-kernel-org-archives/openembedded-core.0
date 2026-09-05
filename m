Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C3EC624DB
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:25 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2584.1788641119450615543
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Rpg3+yg3;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4858595f997so1316220f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641118; x=1789245918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cihpcZCcpxBh3i0qK1Ewu84bv4i3hjMi8KksH7UkfBc=;
        b=Rpg3+yg3iR+Xmw1TnTs3MbpUNl18zrqQiEUzyMgl4a0zdhgbKCg84/Cc8TiB9uREyF
         f7Rl4Mknayh3atVsjJeEXDBLk2vMaroIYRd+sIWnDh6Zi7eqzu9GWoJdxrDypJHBNbMT
         dA2Euw2PaurpwjmHmWNomsrjJW5JnU1E+d/Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641118; x=1789245918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cihpcZCcpxBh3i0qK1Ewu84bv4i3hjMi8KksH7UkfBc=;
        b=oEkvbcdPqfV8/xGqXjo+BOriQeqWyFacpH6Qv3kX7SgiqiByMEb0ISWVf87opgoZ3M
         D0G9i6ypUid6U7Yhx1MPKtPv42IKQ8fSpSsMlhjn2nYLta2iEs3aDSx081XPuDvdErem
         6Xx6OnCmq9MKpoIUJsOycHNr+MKnBlzW0jGgNhAu7m3EFhoHYMWJc8mUcGpnpIhKeJ9j
         BF33SEr0FuECpU6bigyzhzTjJCsGV3hBLU9G9yk3aNF/XQSZbq5wKXIT4GBtiMXzGsjY
         f9iAUrYQ1xbpecUV3emzp9JaButVXHolFw4ZnpwpdEOD360HpkmtQLNyTCwiME1Ee817
         upKg==
X-Gm-Message-State: AFuF++kGXhEG2/EP8ecCRje7O6t+3rXlbnZ/rt9wjE9PC0J414IxfNgz
	9weWQdEWLcLDsWmOyjGE8PZQ1K0xxjygnpWctn8iZ5TLVSv0ErR+kDJRxwZYlhAmlHbCFOnfB2H
	Ozbr8DQY=
X-Gm-Gg: AYBFou38ZQL7l9O69HSj+3n2cMXPstslHXOX4Q2Ges4pjj9rhuNYoQEo8R9H0SKvC8a
	gQOGOE7BhP6MhE8dOde8U5UTvs59LZHolMtQZh8wAe6PABme+CcaVzkTeFnckT68b2EFYioaJHz
	pFdXu2Ze8L6ThReaDlKBaX6GfpWfNWIWTGR3pkD9MWJ2oD/mx0WsxA5bhIHNe/RWyo33G7QjqGq
	ZmRlZq3O8o/BBM7pKm2/UhTXAJ+lV0ks0ifMuCINMMKvp/iETC3ostAQIV3JbpAvWR2/0Ol5QdF
	thDH5BMtckJqU5ZvOOksuf95T9O8JGoXKBPrZlWmo5UaeMpKk3bI+amR3zXQxLMOiRwdUeKShka
	t6qwFCUqWW6dqixiTlGhoaBUeBiuKbzD9xE49HVnRJSGFPofm6Omyfga3t/4lUZFzieiPVnhg+I
	S/jpoXuZY47ipcdPIkx65Fp6yUPCG1nrfS8VblRmYs2X+GSBYLSQwkZthh2YYxJTgaBLeShhjdu
	jLqkJ8GwCGgKGkVG5kn+RTdKMMlN5hYycmFGYlb4tuz1kZ3IK7hEa4RsXYiO306/4elXm/NazD7
X-Received: by 2002:a05:6000:612:b0:485:8e19:1979 with SMTP id ffacd0b85a97d-4858e191d46mr19199921f8f.11.1788641117625;
        Sat, 05 Sep 2026 13:45:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/40] python3-numpy: fix CVE_PRODUCT
Date: Sat,  5 Sep 2026 22:44:14 +0200
Message-ID: <67ff6e69aa7ae4d83a636fd593a048fb2fb18536.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245165

From: Tim Orling <tim.orling@konsulko.com>

Without this change, 0 CVEs are reported.

With this change, 8 Patched CVEs are reported:
* CVE-2014-1858
* CVE-2014-1859
* CVE-2017-12852
* CVE-2019-6446
* CVE-2021-33430
* CVE-2021-34141
* CVE-2021-41495
* CVE-2021-41496

This can be verified with a query like:
$ cat .../core-image-ptest-python3-numpy-*.rootfs.sbom-cve-check.yocto.json \
  | jq '.package[] | select(.name == "python3-numpy") \
  | .issue[] | {id: .id, status: .status}'

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad623e71fadeddcb0b70bba8fbf28c75a976e596)
The current "python3-numpy" mapping has no matching NVD CPE or
configuration identity, so eight source-aligned CVE records are missed.
Use "numpy:numpy", the active NVD dictionary CPE and configuration
identity for the packaged NumPy source.

Note: The original commit targeted python3-numpy_2.5.2.bb. This is
adjusted for Wrynose, where the recipe version is 2.4.3.
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-numpy_2.4.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.3.bb b/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
index 7521a93f990..f34723b2c26 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "483a201202b73495f00dbc83796c6ae63137a9bdade074f7648b3e3261
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
+CVE_PRODUCT = "numpy:numpy"
+
 inherit pkgconfig ptest python_mesonpy github-releases cython
 
 S = "${UNPACKDIR}/numpy-${PV}"

