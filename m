Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6503BC44509
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:38 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9500.1783835494586358640
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=bRzg/GYZ;
 spf=pass (domain: underview.tech, ip: 74.125.224.50, mailfrom: vince@underview.tech)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664b3831a20so4194310d50.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835494; x=1784440294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUNYA/hFmr53NcH0LlWOULNRRXKWmYCC1OPxJM2/ppw=;
        b=bRzg/GYZah4+88rOWTvn84CKU/kBv2P77FUMf45NhZFDKv8Q0Poj3zYf8e6VJQ0V9Y
         LrK0Jm1Y3RRhp+kWVOP14KHsxUhjteZpg0G0mXFWXQ8fJ8G7ASpexWa7re65d9eMBt6r
         WbLgVCpd67kkCtPNYeQ20XLyT1KuPLb5vH+neBH3qyJnIxtrrkiMAhrLEmiJqvWIPZS1
         tzOupO+b9am77OaUyadW28KzZpfSGRLWA2Yd45TWFM/fQvfK2H4cZWryKIdWfzdp5uCn
         a/sgyhuDAfp07+5ZOSmxJg5yzkQI9sJhjRXbR6dLshJJ1lFbzs5cBzT66gB/6lLsl16a
         6rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835494; x=1784440294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUNYA/hFmr53NcH0LlWOULNRRXKWmYCC1OPxJM2/ppw=;
        b=qeJTrSUeT6kEzSyqag9fsnbGNKX0FScJejL7YHQIQ+ZJzH0ypCNC4MBHhPYVeFYq1f
         JBRaOFRaItgj7bbkV/PrcZU10QeS2f91rr6W1fU7b/vGTAR0OAyLUCrSYlpxabsYvHVa
         SDus5kcdlgJUMNzOi4FJaXMALHNfSciDAB/wHybrwLb5yG8sYv7G17imbNmrsznIJY30
         Toi15hMRTTpiJxqUHN/ruTVe4a+zkNbbtR15LgfL1MDFLtw9U0v+G/ovzIjhUje+UNKA
         /fbePrlLrUZq0Gtl3volYs7m7tRnRoQgvRXC0TpPs0n5Mv4h0zwQJXe++gA5QFRZARiW
         uHgA==
X-Gm-Message-State: AOJu0YzayTzX7iVtKTIGCODl65TKa0SopsED+ZP3SSx8pfc6t35TRbf3
	wnyHe0YyfTE8VFCh1hS4KfEBXMkpH/Ykb3l0Vmn3DPnTniwl2lzGkSQHRIalJlJMHcIFpCJql7N
	x2BYkMnY=
X-Gm-Gg: AfdE7cl9buyoWLR6T+t/UwAtsdBw5H1ufPKVJifl4Kb2o819YVNX6zuKsxlvZ/u3Cnu
	rJHXDPpnSjBQhByv/iwxvqAC+iv4PZC1BwxqNW+WvRamSU/fck+bggHFyH6lWOVWWiskp1vaQtO
	M3IEz0OM4snSubidhYLpZb0dWzrgI4yfHgl21cnLwar4Wa5AaV0iD7KTbmlVdOV4YzIm42SuNbN
	opx23ZoPal8l8ffaZa5zWU7ASmqoymNpZU/1pCD7G/cpNfoGZZ01GSmNy7i5+zl9DkKIQBkMh/S
	EQZFlEPPr6iXXTrhWZ3ZektDBMxlpRH5ZoIy5suVsL1T3c1npZcH6iu+Jt1KQjs0le4bt+JDZDU
	rTdpMPqHMpuiTAkw9kLDHJmueuNe67T7dTQMnWXbtCuCJxrWQPxu3OqrbBtNX6Mn3hlpgJ2mPg2
	pZvCnYu8u9VSUv00wQnvl0NGDC
X-Received: by 2002:a53:b64a:0:b0:667:8b90:2ee8 with SMTP id 956f58d0204a3-667d7f143ecmr2686254d50.99.1783835493546;
        Sat, 11 Jul 2026 22:51:33 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:32 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 07/26] packegroup-core-boot: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:35 -0400
Message-ID: <20260712054954.4063745-7-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240732

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 5cdd161811..96c07aff52 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} = "\
     ${VIRTUAL-RUNTIME_base-utils} \
     ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
     ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
-    ${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER} kernel", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER} ${KERNEL_PACKAGE_NAME}", "", d)} \
     netbase \
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
-- 
2.43.0


