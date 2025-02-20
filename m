Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231ABC021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 08:41:41 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.45164.1740040898306998022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 00:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WYhTkQAd;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5452efeb87aso705095e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 00:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740040896; x=1740645696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmXzQS0Z0mQsbW57JZ8I3pnJJ8WuHj8J7Of1E4ev+rc=;
        b=WYhTkQAdKULnVKHcQT+upqbDmAe1Ei462QqeX1J4d0Tr7J+eitEWYITo7q3Kpy3mrB
         EjrumJBUyRHL8nMi3uBjRevSWniC+9R63C937vavT6xWny4WsUzDUNUpiL3r5m5buoJd
         Gxwo4umD6I6vzFpkmZXTLHPJ5TbcY65TOJgIgsJ9RQfH9nCyShrqm0IWYP+FAhlkDLni
         0gzEXuFCJSvoyk1syu04BwfLZ0RCh/vRYUHz+sVKrs3B7M2uyOJvo/v+eRnQauXf/TQ3
         VDgOSovJUk/7djDDRDlO0z/8kPPOHwoNkMyLoeVZpbwMCv9g8pAVnZY8+qnLrz9Wdh6J
         GKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740040896; x=1740645696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmXzQS0Z0mQsbW57JZ8I3pnJJ8WuHj8J7Of1E4ev+rc=;
        b=upG/q0LHNZRCMeMGBljHgEMrG8QWRR1ZHozZoSaaxZtLkqSqry6ECn4JITSYb7G1UC
         M8VZjodGew888KASHyqk0c0Kn+sNL8w0FqL71GjO4WY4rH6qwR5EhCnACQrLHyqmAqym
         49imP4ujukhhsevpz9LEkhYGk0ns5L3ox47YGmEL9Wc7loTXHjF+/qXQ57DhJyCB5omm
         ZAdA5x7TLnXHpEDxTaYXWxSe6WTyYPcuEBSQtuZR4g+o3w/wWOoyequT3aJ+EqWPm+nL
         sH0iWmbZhMhM/Bvwp7h9RcvdEV2XTXyADcU8hgxhX2Eu57gHevZyxIiM7n8lUWwzX5Re
         joHQ==
X-Gm-Message-State: AOJu0YzsIpF73VLted3b2aQFDSYnBku2c6VxN85EyXRxTYH0ymW+s5wD
	Bmuf+mOxn6gytoQDNYDvBlljMI2tOCtYVpnUU1DYoreq1fs565EGllnAJYAYJPoUp0KzsDeeoJl
	3
X-Gm-Gg: ASbGncvztinZVmvpBozfwfdPhbT6/mBWB8Ug4ECi1j+eqfYLp0BXQC5vDYQ+S+CSKtS
	OIpOd6T2wCdiSfsezLuM2tJAjH5ONnsma5rxfkqlCyoBT5gNJ6Vdiv89QpqCwFB74IyYUenuZSt
	0tBgBKXystJ82A7hK438OfoutYOsdm1bNQzyoKU2261HD0VPgwZ8Wo6uX0PzcsuXQUQKR//d+7B
	E5yYACSpb1LkkkKQa52n+Dhs9obRA9w0DQr/ABst61tPCB8c+SjAicuxe6a+PzLszK4HGGUlOFa
	ly07uyMAYO5jwboVQyTzcK14GWAK8EhYa6lXWMv8AXDNf7/T+HADZsVftSOE
X-Google-Smtp-Source: AGHT+IH38TYLGPxwGx4147oSFxt2n0F3x2ru2+8nGXnfdtFGTiacpbN5ZFXGmwyZRLGT2OxfAvxCvQ==
X-Received: by 2002:a05:6512:238a:b0:545:2b68:936a with SMTP id 2adb3069b0e04-5462eef51d3mr2356594e87.29.1740040896163;
        Thu, 20 Feb 2025 00:41:36 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452de0b2f7sm1897354e87.97.2025.02.20.00.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:41:34 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] systemd: depend on util-linux-mkswap
Date: Thu, 20 Feb 2025 10:41:09 +0200
Message-ID: <20250220084109.2067746-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 08:41:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211744

busybox mkswap doesn't support all needed options.
Fixes:

systemd[1]: Activating swap /dev/disk/by-uuid/38d0b388-9989-4744-8a0a-3e6be1135f5a...
swapon[210]: swapon: /dev/sda3: swap format pagesize does not match.
swapon[210]: swapon: /dev/sda3: reinitializing the swap.
swapon[212]: mkswap: invalid option -- 'U'
swapon[212]: BusyBox v1.37.0 () multi-call binary.
swapon[212]: Usage: mkswap [-L LBL] BLOCKDEV [KBYTES]
systemd[1]: dev-disk-by\x2duuid-38d0b388\x2d9989\x2d4744\x2d8a0a\x2d3e6be1135f5a.swap: Swap process exited, code=exited,

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd_257.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.1.bb b/meta/recipes-core/systemd/systemd_257.1.bb
index cdf72a5015..7d86250777 100644
--- a/meta/recipes-core/systemd/systemd_257.1.bb
+++ b/meta/recipes-core/systemd/systemd_257.1.bb
@@ -749,7 +749,7 @@ FILES:${PN} = " ${base_bindir}/* \
 
 FILES:${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS:${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck util-linux-swaponoff"
+RDEPENDS:${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck util-linux-swaponoff util-linux-mkswap"
 RDEPENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS:${PN} += "volatile-binds"
 
-- 
2.43.0


