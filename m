Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F6CC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:48:58 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7617.1786690131130866471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Yxvk+u2f;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aea0fff535so646912e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 23:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786690129; x=1787294929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1RFU1RZ1gVl8dRRGmX1Vd63U6f6mIgrwz0AiI+XdzQ0=;
        b=Yxvk+u2fdDVUCJtaUaFpjWWDqxGCq9O5DVUtFVF2zUshNIum05GnacUdIJAkmHywMy
         4fWfRt80X9goW3lSSyaPPJwM8qGdacMRjRkPVTyOv9bNpvUdJK5BAwyLm3xWmsuaGtuZ
         iM7rBDefSg/h3nJ7irHr0csfkZ4XpdpWwRAhJJQXs8rvXnu7WEC05O2uT+ZBxDy2jGNi
         pfEqmGIkECr989MvUf+YIm+IIiK7ARtN/L1cMdcuTqRAObwPbh0WiHWXEpWli+g6KYh6
         AHRwrXOMPS0pZMdmfC4lDEjcfAlVXAROpKSVNxWF1dMbqqYpV/j8DujrCwsIpZPCwy9M
         Bgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786690129; x=1787294929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1RFU1RZ1gVl8dRRGmX1Vd63U6f6mIgrwz0AiI+XdzQ0=;
        b=a/U1vcqbQ6sX5Fe6hhu+v4nw7my25rmQfkGpIjDRCv8Pl2rumfPVjPnSD/apd3SvoS
         XsOHByzOtscpmhyj/4ad75JzFi0ZhacbGHEWf/cwjTP4Y1l2trI/GJbdYlYPFKYnDDmC
         DTXAG6Yz4p77XG/LnRv7DRl03o/YgLsQqI4VoW6OTniGSg4kGdBnkco6Qo3WjpH8T2bR
         Nk7EKX1ewjsxyYj8w0cMRNEA8M1W8aTWqu3AG7BFntidttkFI2VwzBsG8AtVBfKOBhud
         h8LdsMhhs9CzVJ8Soc/8NZ/Mg5JIvcI/V5OVQA0+LMGVjMW+wxzf/CfKY69CihN+VuNM
         EUJg==
X-Gm-Message-State: AOJu0YxhN6FMqzo+Fb3wjL7GA3NfSm/DeyBLEALgr7V14Mfa0gHO6HaY
	rXX+LxVZRcepR4yQp7ExkZeUT3yin4GqQ7ug3VvEmh+S+7xtBKmYjgDbA6Dg+k5H9D+/FrnM6EQ
	SxndW
X-Gm-Gg: AR+sD12SAmPWnGjFDzBxVqJin6wriBLJ981G+tHkO5SOZbzOw30a6jbmkMNm3PyrQNX
	3X5uo8T/djRLKpf4yaEeJ858M/RzRsJDjjrbYvjhnwJCQ6benYeu6UYmQryJCTcon+i6pZFsWlo
	YrB3FSGrMjeP4duacxVdu37uAZYYd5j1hD/jS23L5mLG65pk0qu6nq1O5fxDfxsdb3JT3L72T2s
	v6Gan2S9yZY7VvE25Kpcu0loZCaiF/vlcracRT1b9rC34tZOajnkltog9fVXZ7IFVoeHhpJ4ABj
	18Jrw01Np94K7hXonuWCRJgfG70oe2rAfFxOeZl+jewwTiHxK6gC98qQB/xs1sTXBvy1gfAzggh
	pLDHnn5a/WxB0yaoNVDgPr2RjPbrfpLHN1G4gaYwJycT3MfQIJn6QVeiVbIHbPHC7babHbti8Zl
	UPfy1z4uIaP2I4Ek06MsehQeJVdcVY1aSoa7eD3MXrXBJDPk619zy+ynsOmLzMvnnta2r3Be6SW
	dLnJY8XjqyodtY=
X-Received: by 2002:a05:6512:a351:b0:5ae:ba28:a56e with SMTP id 2adb3069b0e04-5b459182bc2mr280094e87.35.1786690129097;
        Thu, 13 Aug 2026 23:48:49 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458c0e9dasm349285e87.78.2026.08.13.23.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 23:48:48 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH 3/4] kernel-devsrc: copy gen-kernel-hwcaps.sh on arm64
Date: Fri, 14 Aug 2026 09:48:11 +0300
Message-ID: <20260814064812.1071873-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
References: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243421

New generator script is needed for arm64 kernel module builds after v7.0-rc4.
Fixes oeqa runtime kernelmodule.py failure on arm64 machines:

  GEN     arch/arm64/include/generated/asm/cpucap-defs.h
make[2]: *** No rule to make target 'arch/arm64/tools/gen-kernel-hwcaps.sh', needed by 'arch/arm64/include/generated/asm/kernel-hwcap.h'.  Stop.
make[1]: *** [arch/arm64/Makefile:199: archprepare] Error 2

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index ca1a08cba3..0b52f5d48c 100644
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


