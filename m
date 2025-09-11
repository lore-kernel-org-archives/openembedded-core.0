Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D8FCAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 11:38:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.44265.1757590714999865040
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 04:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qr3Q9yFx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso7041425e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 04:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1757590712; x=1758195512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/83OVW7tnyAYVmhRkL5OyddvfQj3QXfRWkLOvg9uV40=;
        b=Qr3Q9yFxiPSPKVBC8IRAlJlFTmLo9e/DnjTWsEUpzyEAB8ubx+9OICk839CfNSIzMr
         gMc5W5uTmTMVOeGShIH1sJm2sAwdsTkvj2V2312eHBEdJKdHCAhph8XHFIagb/5RUUHZ
         NMx22Soim7nmAm+E4O1Sb2gxEfi6Pafxf2038=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757590712; x=1758195512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/83OVW7tnyAYVmhRkL5OyddvfQj3QXfRWkLOvg9uV40=;
        b=ujVEQFGsFpLmSAhFXeykX8zG61j7/u6n9XdSK9L/ZxAgCAVYAl0eexG9SERUakxwOC
         cyHp59uwkFbuVAH+9Z1czj4ANjXbFDf5U/h6F7b3i/0yMz/a/So9EFuuVvFFFlKhVQ0D
         4LaTv5FCiAUXKNT9rxbi/CQEYUV1/v/JHO2Xu8ULYhVxyTiXBKgxDXK9FHvN9Q+8XXFS
         /udW8JNK+w/tbD4q7hSR2loODDjaAUptClsyoHnJaGifQ5FJHZ9xgH98iO/9WUWnOyJL
         TnrNXNCXY9eAX1LoXQDWlDo/pRx7MReedh69EoW6fw8fPEGD7qqm+ciI2iFZKF7mqO1m
         eFaw==
X-Gm-Message-State: AOJu0YwHm+g6cU5sG2rs24dl988v9GSEQsBKjOGkZ18hyQ8MvlCCQW04
	hGr87ijtQ+R/fMcod2EECiKfathp8WZczMM9LbTNHwEcHmqbHdgeeMBSgkbtrWRlVZXO5nTOA/j
	ZgyeQ
X-Gm-Gg: ASbGncv8a0r6HT01r08XOKUiQ97eUgM1m8Dk3fx7nYdK1hjmUeH1/fMtacL7uU8cvzD
	DADV3RpJw7K/kvH2cP9SB9B3G7ah3Bx4jNvqCAFaUTjfiZPG3XNWUQDvtWMw8NalEP1okGDXOGv
	+GOUnqV/5l1rttBwj/lcyJHV0bg27Ff8tc0KsXJZlO0Y45vPnGyJ5SYHdHHNbUoMXMFkCdqBzfF
	dbHWu6qDLSeZXEadeKyNJvT2gF9cS9PQF8OHIWmudVancyCCEKYra8xTBIvUO9rwYyT3khhPlf6
	LfZlibuyUMX2W+T2IbOBzScOGi2bJFECpX1rsY4uXyPDkRWtj8sZihathBGGIzc2OrezfKFz1pZ
	LYcK5km16vDL9ymZU9Q0qFUWnQERdppAQNt7sHe2mLVfHGLaGCHo=
X-Google-Smtp-Source: AGHT+IHTrlG1phIC0/3sXzHri9cS5ANv13oOB1ByuUJruOdKjHntYfkbpHR5T1KjhaLoJTRlmRcoCA==
X-Received: by 2002:a05:600c:1d16:b0:45d:dd94:7c09 with SMTP id 5b1f17b1804b1-45ddde955c3mr176130735e9.1.1757590712396;
        Thu, 11 Sep 2025 04:38:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7316:f64c:1097:5ef5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0187f0a7sm12861935e9.3.2025.09.11.04.38.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:38:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: Fix reproducibility issue
Date: Thu, 11 Sep 2025 12:38:30 +0100
Message-ID: <20250911113830.1488467-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 11:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223269

Perf's build process generates two copies of its internal headers,
one at tools/lib/perf/include/internal and one at libperf/include/internal
with files like xyarray.h. Although the files are identical, the binaries including
them would see them at different paths and have different debuginfo data.

To avoid this, build libperf.a first, which will ensure the libperf
headers directory exists. This is used in preference to the other by
the build process and results in consistent binaries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index b142b090b55..e1915207eed 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -171,6 +171,10 @@ do_compile() {
             sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g' ${S}/tools/lib/traceevent/plugins/Makefile
 	test -e ${S}/tools/perf/Makefile.config && \
             sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g' ${S}/tools/perf/Makefile.config
+	# There are two copies of internal headers such as:
+	# libperf/include/internal/xyarray.h and tools/lib/perf/include/internal/xyarray.h
+	# For reproducibile binaries, we need to find one copy, hence force libperf to be created first
+	oe_runmake ${B}/libperf/libperf.a
 	oe_runmake all
 }
 

