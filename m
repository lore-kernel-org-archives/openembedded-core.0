Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE6DC5DF7A
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 11:21:55 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27891.1786965707383629112
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 04:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pM15P0OW;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aebd52488cso3466783e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 04:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786965705; x=1787570505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6fPdOyTqgYItK5nYojnF5K4yhcgY46eN1+7Sy1lDso=;
        b=pM15P0OW5+saABPNmIMXzgt/+lKB+L1z6yzFK2O6nLNINP9kIUaYaqLGILkQ1NKie9
         Z0h9JlJ0Qn0DC99Hke5WwdXS9wCg+IV8y7h45R7BT56STQvBwZLPmbshWnNZ/zpiij5/
         +zvnzyihZS6hSTg1HE5C9CRDJm4RtCr8paIf5i+DTPbvuqbYXR58VoIAMHxwk+wr3xOP
         9O1X0ffb0HJa0cw8R7FA2QV/O8ZanxhiYqVCQgtLSrKQteOhgGYwe30Pg3n1qpd3UhK2
         wQwYbJNlszBrGJoKxT+GTflxObYjpQhWDAeTWFV70tOptfVq5LavzHsIREoLC53jH9lV
         PohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965705; x=1787570505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R6fPdOyTqgYItK5nYojnF5K4yhcgY46eN1+7Sy1lDso=;
        b=F6CiQGXsNCfOyDS25oRG39yavtsEQbidy64Rca6klscuuRx1fuFL8sCIUCwIB8VyiN
         b47PjmyM8jC7zhCUbbzN92fm5DSahFQ8sC5kD3HFc11lvTT7tQy/YaBiaOMDSnVw3xOx
         VUCw4aTSpwK7/1lthV8jaNbHXVYWv6jtZjz0VGlLPqklo9Yqy1nDHa2fJfjHlRLrqKQA
         MwRixliTtZ6pR2P9yQ+pbySwGX78IEtEM8QwhXZbaaPdAYNOyu82wLknJm7Jot6ebJfk
         PPY4byy3ygjcaXohJJO/Ml60Mn1l+L+BOeLeR3DFCxlARjb32aKtX+5ifUgVuhZjg25U
         P1MA==
X-Gm-Message-State: AOJu0YxDox8JA+Br0yrSYBzWTjj0otqH5u7Yo4z8GN1Mjn4S9e8+mxP2
	mU2ciVJx8bsl+qvoBBFFYrj4bv9P9/GHzypZJ/VONEYFFZxDbFHwGBSOzY2YHWXBT4OjdyvnAEM
	Qnr7D
X-Gm-Gg: AR+sD12p9Z/YofR6HGlGOJxna93xsS0nUHG5DeqXfC4kWeHCiQLf2RyttTgdSW34FNM
	CF5w1Cw32zE4Jje7/zvT383sw9dDq5tMG6d35PEvNAtyLRvg27580TZaYOcyrwlcgyK1hYT9wO/
	l/bD5+UHB84J6LlnNgGLO2sgTc7nTyULyZB/BF8mPhOg1YzBiCNbSwO93nPP09NYe1uiLw72pFk
	PpnO0wafZLaSvCXn4uCdgYWmroLoF7uQw8LRHdyXFM5FzCeTZLlePBMqnjV2D7SKVZHjco9ws26
	i8x0AGseCBhPPhWmTNY2xkLfsbXGfYvwIQ6X7ZK0rucY4H4riykzh7CpBgrkrmkB6GHUqrOy6R/
	1VRUbptY/HppRV9IQuulUxCyapbyQaKQVnsqB88cfJ/zhEwK6R3WBhCGQ+6bLAMenmc2uNJgk2G
	OxsZO7RgCW2YJOeUC33DOjWVZ1LDYjCVuQ8nLUTZ7DV4nqxMbF0WO/xfrVGiAmoZRs3oFDfCvz6
	CI3Iu8qGmnPKMkZg3Ha
X-Received: by 2002:a05:6512:a34e:b0:5b1:54a3:d134 with SMTP id 2adb3069b0e04-5b459143cf0mr2437091e87.45.1786965705300;
        Mon, 17 Aug 2026 04:21:45 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa0e5esm318180e87.25.2026.08.17.04.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:21:45 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH v2 3/4] kernel-devsrc: copy gen-kernel-hwcaps.sh on arm64
Date: Mon, 17 Aug 2026 14:21:28 +0300
Message-ID: <20260817112129.1271154-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817112129.1271154-1-mikko.rapeli@linaro.org>
References: <20260817112129.1271154-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 11:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243616

New generator script is needed for arm64 kernel module builds after v7.0-rc4.
Fixes oeqa runtime kernelmodule.py failure on arm64 machines:

  GEN     arch/arm64/include/generated/asm/cpucap-defs.h
make[2]: *** No rule to make target 'arch/arm64/tools/gen-kernel-hwcaps.sh', needed by 'arch/arm64/include/generated/asm/kernel-hwcap.h'.  Stop.
make[1]: *** [arch/arm64/Makefile:199: archprepare] Error 2

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
 1 file changed, 3 insertions(+)

v2: no changes

v1: https://lists.openembedded.org/g/openembedded-core/message/243421

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index a684ee8648..a70399cc95 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -220,6 +220,9 @@ do_install() {
             cp -a --parents arch/arm64/tools/syscall_64.tbl $kerneldir/build/   2>/dev/null || :
             cp -a --parents arch/arm64/tools/syscall_32.tbl $kerneldir/build/   2>/dev/null || :
 
+            # 7.0+
+            cp -a --parents arch/arm64/tools/gen-kernel-hwcaps.sh $kerneldir/build/   2>/dev/null || :
+
             if [ -e $kerneldir/build/arch/arm64/tools/gen-cpucaps.awk ]; then
                  sed -i -e "s,#!.*awk.*,#!${USRBINPATH}/env awk," $kerneldir/build/arch/arm64/tools/gen-cpucaps.awk
             fi
-- 
2.55.0


