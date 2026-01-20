Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A318D2ED1E
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:25 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5021.1768910956120578553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UIj53Ae1;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso31229135e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910954; x=1769515754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIu/n8fx0lwIdDWgzEq1QtXgVT5W2czTZz1M/FtQMMk=;
        b=UIj53Ae1wMUEIFlLzAVQigoghCXf87N6E+B3I4HIND2efDVuAj57V0uHtkQyJ0s0PP
         jDgG/+An2IHPIFNovJWirdBItFFjZy+omCKoQYHMB2jeW4JAko9rvov7QNMOVjKzV+dF
         tr1OEXhCFICF6wJK+W5E5kGI6Cvoq3Pnn5LR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910954; x=1769515754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OIu/n8fx0lwIdDWgzEq1QtXgVT5W2czTZz1M/FtQMMk=;
        b=I/RztXz25BGSPqoesRg6pAXDxzDUUqg4OnF6uR3MaVn8se1YDT0RGZfPQ6TobqaCmB
         K68lp34V17vWw0LnFfoxJrLbToZ7ZsAN3ZB1M/3UZp1nIRZnrky8lAdrFkTt6Nh+OQ50
         zLXiHavr4G6eCtlMr7F37Au+3Z1kOEqmqc9GsLWzCvNFIU67eB4x8mxxLW6XwVvybII8
         W78dxBe6V+D8mrrpl7lAthPCqIXB93OxdwbpOwkbo/PzRwzaAwvfDju/TaYEskYuvcRN
         9depo9JtijPIpYslrEuYvbxiryE8sWob1nK3yNCdJ/Lb1anjfwGFWpjBaPqeAiuwnDQ+
         A8eQ==
X-Gm-Message-State: AOJu0YyF6EpKxYCV8aNKJU6VMisCOJHY2+BQI0WlnBF88w7JY2ebZ35s
	IhOPE7oQ8spVpvN5O4aOQe2WeQ0qsNuanS5WUMSDWGkxxBB2QS0M4G9lLVgXPDDLBT9BinIVx4k
	s26+K
X-Gm-Gg: AY/fxX73bnm/7QL+a15lOLCvXwit+idsjNMZeGM/2ikmyqhrgfLGMRz/N097nOH6Rxu
	zEILS8Bz9qvujS/WAwfiTZ+8AgL78N3j1KCT8sp+kHhCpaL1+vaP8IL+pZHprp5PlpGrxBYNxbd
	MNqMFuOmBz34bxVNsuEWi3PEvs9sTEVBweuiYGZOuE3tohJ0TLKzdDjDhhLE2ZkT+gj6ArapQY4
	7tGFtQb+ngAEJkXYardEQhaGyeeLy+ZMhBK3doxV66ff7gbt358bZJCmHWv9ntuuP5vS1zzDuHS
	74hLHHZi2eZ9MdpKH057/rSzQcX/OhJ1iNbMRGrZjwhJMODOqA+sUQgJyF/2jDXgtwFi9gPdZ7Y
	M/3o3uxzAxceVMzzRQwGCla7nrccx7ScUWDfDo+Ko7ugwCj5bNVIlKpQsCO6qzvK9cck3zorufe
	5N90MKz/6ko2jqnjwKuW0ANK3glFRxkMlsoNJvy/Jj3KEkCyW7igs3O9qtfuDpjaQXTShU5pYOQ
	za1B+LKoQhJSElj+2dbvQ==
X-Received: by 2002:a05:600c:1991:b0:47e:e4ff:e2ac with SMTP id 5b1f17b1804b1-4801e356cebmr182060405e9.33.1768910954272;
        Tue, 20 Jan 2026 04:09:14 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:13 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/22] qemu: ignore CVE-2025-54566 and CVE-2025-54567
Date: Tue, 20 Jan 2026 13:08:18 +0100
Message-ID: <a2ca6a25e9af44824f1f3d766825356bbf094422.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229682

From: Peter Marko <peter.marko@siemens.com>

These CVEs are not applicable to version 8.2.x as the vulnerable code
was introduced inly in 10.0.0.

Debian made the analysis, reuse their work.
* https://security-tracker.debian.org/tracker/CVE-2025-54566
* https://security-tracker.debian.org/tracker/CVE-2025-54567

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dde3b0be13..748a32215e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -88,6 +88,9 @@ CVE_STATUS[CVE-2023-1386] = "disputed: not an issue as per https://bugzilla.redh
 
 CVE_STATUS[CVE-2024-7730] = "fixed-version: this is fixed in v8.2.7"
 
+CVE_STATUS[CVE-2025-54566] = "cpe-incorrect: This issue was introduced in v10.0.0-rc0"
+CVE_STATUS[CVE-2025-54567] = "cpe-incorrect: This issue was introduced in v10.0.0-rc0"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"

