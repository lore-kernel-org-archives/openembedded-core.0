Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56664FF8870
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 06:46:16 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7087.1777358772590999743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 23:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=T/Y5UG7n;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e9653b580so122530311fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 23:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777358770; x=1777963570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlqzUZJ7Or5Lyj0U70aSerGe7SzPc0K4ChqVdZM1e10=;
        b=T/Y5UG7nP/KujZVNQhDT/V5LJ+HVThUdbQ9NsHwCa55RmwbEdAKrtjqNdUQTpC6ydg
         eysvfblDfetxA6oniMhB5un3vEaMTZC9RUvqcFsU0BptarSLafyAT/V0gubp4QHNuaL4
         Nv1VhqtF8SgQ7ylP9FFpEtfymOBj+JEn5VLafPPxbJ7gKrxre2MYB2qYggm3Pfdfabc2
         /Vk80mHLCiVmEb9zWUn1w8LJOc2/ddmMpZZwERhF0uzFntbNEYQqujatxFUFjnaqvcE6
         +v8H9kDALKyRYDqs+hAocfKHZw9PJEIIvOTRA/bzpolu8jznopPmYaJ/Cm+UukKKHlj4
         SaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777358770; x=1777963570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlqzUZJ7Or5Lyj0U70aSerGe7SzPc0K4ChqVdZM1e10=;
        b=GNlnI1wZNj+gPriWpJI05SgC1+xz67MrEMoZCrszdQjVj62VpsuFzS8fQaeRQIBTSp
         pcuQfb1D1gpORR7XtgFNv6M/9hQlhVwg3QoclJ/i3BS8RKBSLm9OkDeu0ZzphdhOfAil
         9LSx8st+wcPSCDfU50G0fi20Xzl/gS/drX8GJgXgypfNs6pdyeS01HVT6GnMrkdt67BJ
         PAV6JRdZRx+9fI92bbZA2ZUC4yV86EWfYbK/JVswqZlDiAPfnso4r07yp5eJ5UUSrhQq
         V0eO4rt6K6wYy77ik0hstxUHffAOb2LC+0iPQ/+9SX3XdKqClpRLbMmutGWyFcM8fX9Y
         Cc7Q==
X-Gm-Message-State: AOJu0Yyl5djatcDyZ6YiVoxvm1BIzsNgEz2PLlB/8Zf03vSOb8I0dFwM
	WywHPHnD1f0IjVWFuy4qkspBBPIBJAgG+scif5JX31jfTpKWYggwpYddmU9ezG6lFX/21j4f6oT
	DSca7
X-Gm-Gg: AeBDieutOkdd6Zz2g0y5tt+wo8q+z6reli8X4BPJLqXczChBYU2Fsmh4m4Wq354Ry81
	cjhpVl+T9dii5dcE81MQz8OzFEyL0BXpfw53g9VJu+2dzMiZo9xP6LzLeI2c/zuX70NwcbJ/Lyk
	giaQIQ5PT/OjPMOlLkMrjl0ml/VxGak6ba5OK+A87jjCPBAyXDTEk5q+yyzbCbBVjbOMBs/sLn+
	drei5HvCdwMcvOnzE1J61Y+10CTm3L+1axuJGNbHhzvjsP8VHVTmLgZTHW4YiChfo69MBlAl9oJ
	B1HqMdt4JZokNki0fjJ6qj8jYZfwK2N0dmLxqEvUWZyvcM2T8gltu0RcIh+a8EZNk9LAMRIwO8v
	1FYiswqoJ2uBS0wapD3b42vhlVwudxAtEHr0iGbgaFcTaqw7B9FCFtezGMhsG5qB1ndDU48bsOq
	W8ZpdKusvg0xf0JAQclzn/T82/b+fNfEudixVYftyWaarfb9nXPvULG2W3roZ0xw==
X-Received: by 2002:a05:651c:3243:b0:38d:eb82:d80f with SMTP id 38308e7fff4ca-39240b36f96mr5665451fa.0.1777358770297;
        Mon, 27 Apr 2026 23:46:10 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f34533esm4415911fa.16.2026.04.27.23.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 23:46:09 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [scarthgap][PATCH 1/2] ghostscript: Pin to C17 std
Date: Tue, 28 Apr 2026 09:43:19 +0300
Message-ID: <20260428064329.1591381-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 06:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236037

From: Khem Raj <raj.khem@gmail.com>

The code defines a custom 'bool' type (as an 'int'), which is incompatible
with C23 in which bool is a keyword, and trying to use <stdbool.h> fails
because 'int' and 'bool' are used interchangeably in the code.

Add the flag to CC variable, since CFLAGS is used by both c and c++ compilers
and clang++ is less forgiving when C compiler only option is used on its
cmdline so it complains about -std=gnu17 and bails out.

(From OE-Core rev: 49657089ef215824f8f79a81deb7baf4f27d0030)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index a48ad671c7..57a1098521 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -50,6 +50,8 @@ EXTRA_OECONF:append:mipsarcho32 = " --with-large_color_index=0"
 EXTRA_OECONF:append:armv7a = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 
+CC += "-std=gnu17"
+
 # Uses autoconf but not automake, can't do out-of-tree
 inherit autotools-brokensep pkgconfig
 
-- 
2.51.0


