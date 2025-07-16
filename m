Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF284C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 23:30:09 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.36328.1752708602056879758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 16:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l7PJ/AxA;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: hiagofranco@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-41cfa50c73dso276070b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 16:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752708601; x=1753313401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGm33eBQahmzR+Hvyh5SMv8LRmM9+gExzIx/LcMV1j4=;
        b=l7PJ/AxALRl+ELsMCyZHqrDYgpsRApqB4KDYiqztMpRk6zp7O1MDk123lHRV8BKBpH
         wiMYJtzd8Bkr6l5QHUrf0ZbWtqF8crjWgk62JavLbjVkHPSEdrklCKKWtnG2mwfPIVN5
         OdV0I/CQ7hcHAIRebNIM8oC0JyOlsslgK8VofwfUFUjL+ZSsSX+mj6kdENf63ic7AFhb
         MM6nF8juazWuMagKcSRM3+gWPS04ip0C0Q+7CRbXWSrVWr9txkRyeKh+Ermpro6pZyCQ
         eRtOde0P1cddbC/Co3dvK2DeyFMQyLu/tUWZNuEJA0IRP0OuGqGzsh7hPxMd6MmtKNAS
         QdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752708601; x=1753313401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGm33eBQahmzR+Hvyh5SMv8LRmM9+gExzIx/LcMV1j4=;
        b=G4nqpzluk6iNLApV5H9X0Z4MNtcvYDULWHKnysvgSzFEyuqH8df5PIzSYAIJlYElJK
         AqlSfKlf3BLpLZ5Dc0o2YD2Al+jgVW58DkfpV0HZKMiWTbqgV8PSWl0kAj3IPmSDgOxc
         cH1poNIJdT3YZWfGcPvjBtze4Wx5dHtAUnO8Gp+jTyfWKjQSI2t/S6yU6yVeZyFXXtJn
         6odDNY1AXAv70mbYYN1mc/3OudFiNsBxQ/y0R+Y21hXW84dpZmxgD1oFYBwLFCjdq4Km
         +l38Zgr9waN6J+RMUUmLkwyNb8GHn8yfk5VHDML3Ud7BfY5MOTqYWay1hzgCpkCrsmvP
         Cp9g==
X-Gm-Message-State: AOJu0YxREXED8x9FpINp4dt1J9gMf4Ej9wHK+1ylFw49maXpK145zUcQ
	xEq8OHywgT94icuWgJdmHrGZF2kfzTNAO4gWc4lAKMxqm+q2zzSx2QhpLmJsDNEH
X-Gm-Gg: ASbGncvJJGQOY470eSJbDefUN0mkbhVllLId/gvnosIyAN68+Sh6FSnBo9qeArYkI3S
	MCpspEdwkOFqEHvaLTbr+zyxOLOiYUBBc9j6MzUPpPaPc6GQprbrdNO13WV4O0b+vzQxypkOcb+
	Qr9EBXJryvA7+bqr1isx5lVBMHYGZQegiJgvPC/TjkWaQW0lnPFaSbczZiDbroQIQULmq6Igk8t
	kqoalhTm1gXlAdVZAsgLLxKxc/it01Ir+WTjAhS24gnvT+/Dlbu486bMwpZDrrXV9R/xRpkSm6j
	lMGICDxhQVdmFVYrpK4hk3rY0vTvE2pfGhBVvSUvI7HbtCx2NzkFsonyi6czKPE9chQzgHXwiMN
	yYgwvQaDsPQsmy3VzbampqZtnnw0Vu/2i5rFhfg==
X-Google-Smtp-Source: AGHT+IHJS1X15vn2fQ7+Ag0LPuEeGg5BI5MfuTB7JZePoG3qWQwPAPIqAU8hkzh2Re/O7+8ZOVlAQw==
X-Received: by 2002:a05:6808:50a8:b0:406:39b4:2232 with SMTP id 5614622812f47-41e44a201c7mr546484b6e.3.1752708600685;
        Wed, 16 Jul 2025 16:30:00 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41bf05447fesm1441268b6e.36.2025.07.16.16.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 16:29:59 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH 2/2] systemd: add libblkid and libfdisk PACKAGECONFIG options
Date: Wed, 16 Jul 2025 20:29:31 -0300
Message-Id: <20250716232931.127811-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716232931.127811-1-hiagofranco@gmail.com>
References: <20250716232931.127811-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 23:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220477

From: Hiago De Franco <hiago.franco@toradex.com>

Introduce new PACKAGECONFIG options in systemd for both libblkid and
libfdisk to allow explicit control over these optional dependencies [1]
[2].

[1] https://github.com/systemd/systemd/blob/main/README#L219
[2] https://github.com/systemd/systemd/blob/main/README#L228

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta/recipes-core/systemd/systemd_257.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_257.6.bb b/meta/recipes-core/systemd/systemd_257.6.bb
index d73c0cfe0d8b..019f084b2e34 100644
--- a/meta/recipes-core/systemd/systemd_257.6.bb
+++ b/meta/recipes-core/systemd/systemd_257.6.bb
@@ -137,6 +137,7 @@ PACKAGECONFIG[audit] = "-Daudit=enabled,-Daudit=disabled,audit"
 PACKAGECONFIG[apparmor] = "-Dapparmor=enabled,-Dapparmor=disabled,apparmor"
 PACKAGECONFIG[backlight] = "-Dbacklight=true,-Dbacklight=false"
 PACKAGECONFIG[binfmt] = "-Dbinfmt=true,-Dbinfmt=false"
+PACKAGECONFIG[blkid] = "-Dblkid=enabled,-Dblkid=disabled,util-linux,util-linux-libblkid util-linux-blkid"
 PACKAGECONFIG[bpf-framework] = "-Dbpf-framework=enabled,-Dbpf-framework=disabled,clang-native bpftool-native libbpf,libbpf"
 PACKAGECONFIG[bzip2] = "-Dbzip2=enabled,-Dbzip2=disabled,bzip2"
 PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
@@ -152,6 +153,7 @@ PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zst
 PACKAGECONFIG[dbus] = "-Ddbus=enabled,-Ddbus=disabled,dbus"
 PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=enabled,-Defi=false -Dbootloader=disabled,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] = "-Delfutils=enabled,-Delfutils=disabled,elfutils,,libelf libdw"
+PACKAGECONFIG[fdisk] = "-Dfdisk=enabled,-Dfdisk=disabled,util-linux,util-linux-libfdisk util-linux-fdisk"
 PACKAGECONFIG[fido] = "-Dlibfido2=enabled,-Dlibfido2=disabled,libfido2"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 PACKAGECONFIG[repart] = "-Drepart=enabled,-Drepart=disabled"
-- 
2.39.5


