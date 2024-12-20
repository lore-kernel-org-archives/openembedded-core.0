Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8760CE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 09:13:00 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.148625.1734685976592744359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 01:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fC1Itl1r;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3043e84c687so14809571fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734685975; x=1735290775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g2rGMQ/GX9M4HN4f1XRu8l/R+asz75/zgjiNm5z9Zk=;
        b=fC1Itl1rnW0N6c/bQpVKwVEqG4zmTVD/f4T7MEGe9cp+o6F9L04/IjpMMtxrudZ4x1
         rvYEtDKhh9c0hUDpqi3VADiroUYbGddg+Lz4oOgiw8SPs4co576c4y2wQy7MnQ4LCW2H
         lh8ugfZHoYq4kjm1BGsbvtadyXxpuVKJ18fuqMswti5tTZhCXJGE9l7OumVsXDDTECF9
         fg9dvI5sToLNaou8tcpRDZ/Q723/VQERAwWA7anYidBw88+A3Vzao00z9DzwPIIAksIb
         QfHe5iS38GeV8d3LQkedFEu2LGyADTtXVM3eYwkXeZCjW5aN/3t8CBgF655CQb3n4kbP
         NbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685975; x=1735290775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g2rGMQ/GX9M4HN4f1XRu8l/R+asz75/zgjiNm5z9Zk=;
        b=tXygnSzDhNh6zHdEg47ltbNWxT0NEkg7vjZZJ0v7I1+d5ijR7Jjyaj3HLYiAJ/zaTH
         ibluQ3jTlACcEJhDXlYQ7Hqjpfy4qTqNjJKoWxRJZjlk63Bo7ss/tUSZcqVrtg4cxIxX
         QNd2ZUrDdDCAOSnBD9zYYQpvvzljRsw7p2LUVOKJq+qKwPw6cnLc+d5vVUrzpIkIBPL8
         sUdSmKXk8n93RpnXPzd7K/8rFpj6v6DT7X3xGT9+SJE5agOgOiL5Yzof1i5z6qNSNNQs
         E+yNUg0qBGWs9KG3IzqnmiSK0g0WDksBI+FIAWyobvvBAcYfhOChu3juL8mRHxTcaDwa
         9cNg==
X-Gm-Message-State: AOJu0YzofIpfOmZ9n9onVA/T3jtYBv47it1EAfe/dUo5yr7Om9MYXJpd
	hkD3o6KCPHv3u7GKlX8KcN10w1HyPqeixBNnYPHgXFRoKfvOvBvYNrB8i6xmk8TEoTQ/w/dJHkY
	s21s=
X-Gm-Gg: ASbGncvTHbi2yc0khe8H4d1jqJi/7/Mixu0csY+ZcZk73/cgRDK3OktJcrjVRuxma9q
	t7ZX/rc+yqIjszMcX51urq//f2UTTLVEILvFq+bn3ZXL7kiMzNq7hgHILFcuqyFoyOXCrNSbnr/
	cDRMuk3kzn+s6UX/yQ4zCG+UHSGIH4oYLH/m3usfkmMNUCm8lJAjDIQjCjLr9yi1TTIeSVqa2SG
	SU63B+mYlrLhfk5A6+KqHYrfanHcKYDILTcJNdaxIprANrbuXn/C+2i06pChU1PkfHVKNfkTChA
	ZidhPIi2OVgzXL3t96pOsXJxYA==
X-Google-Smtp-Source: AGHT+IGEW7OjM2coTbcSCZEZlyevamy6PoCVWrR23ddg/gE8fLsIeGRmIsqMYD1y1FO6aNOy+pYjHQ==
X-Received: by 2002:a05:6512:2308:b0:540:3530:5a83 with SMTP id 2adb3069b0e04-54229561aa3mr668449e87.36.1734685974706;
        Fri, 20 Dec 2024 01:12:54 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235fed36sm429868e87.62.2024.12.20.01.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:12:52 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 2/2] systemd: add fido to PACKAGECONFIG options
Date: Fri, 20 Dec 2024 11:12:32 +0200
Message-ID: <20241220091232.230242-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241220091232.230242-1-mikko.rapeli@linaro.org>
References: <20241220091232.230242-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 09:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208973

To enable FIDO support.

meta-oe can provide libfido2 but it depends on udev
which creates a dependency loop between systemd (provider of udev)
and libfido2 which is currently unresolved. systemd recipe
could split udev to a separate recipe to solve this, or libfido2
could be compiled in systemd source tree after udev but before
rest of systemd.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd_256.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_256.9.bb b/meta/recipes-core/systemd/systemd_256.9.bb
index c047964953..b5e3e85a38 100644
--- a/meta/recipes-core/systemd/systemd_256.9.bb
+++ b/meta/recipes-core/systemd/systemd_256.9.bb
@@ -150,6 +150,7 @@ PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zst
 PACKAGECONFIG[dbus] = "-Ddbus=enabled,-Ddbus=disabled,dbus"
 PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=enabled,-Defi=false -Dbootloader=disabled,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] = "-Delfutils=enabled,-Delfutils=disabled,elfutils,,libelf libdw"
+PACKAGECONFIG[fido] = "-Dlibfido2=enabled,-Dlibfido2=disabled,libfido2"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 PACKAGECONFIG[repart] = "-Drepart=enabled,-Drepart=disabled"
 PACKAGECONFIG[homed] = "-Dhomed=enabled,-Dhomed=disabled"
-- 
2.43.0


