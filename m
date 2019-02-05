Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7425F6006E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 00:36:33 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u6so705935pfh.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 16:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=95gcHwX4FSE/IhHUyRBBFpOYn/b4BfKhB2f1wwzl82g=;
	b=du89qoWBeLJdnr/n+xyEprN+luXWV0G4iQmFVNlpO2veery3lJjHmrohL8QERCT/a1
	R8603LXbJ7VmBzPY1ij+of30YNbR9ZwY0iYpqtkf/HtvcZ1AiLUJUl27/Zr69qGbIKiL
	0bxgRXZ5fvgtlssEIDwpR+OUPyFSF0hrFPea28NN7rtIp1fFwKKNn492bT4uQGXLI2Bn
	bxRUViSwixjtvuDy1i+wgXzklbZbIUwKNnIZfRfU0PTQlQCT9qZRm7YHMGNXiHiYiWE7
	zabU1T7m6G8Z8lV2MGXGhn0/3S3eyLbbXstD9mjgwj08FDk9nDD572GUMYfx65Z1PaDn
	gE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=95gcHwX4FSE/IhHUyRBBFpOYn/b4BfKhB2f1wwzl82g=;
	b=OYGs1EobbYrVf0arXuLQ93Tpy6jyjxMFykx/hSjUi6zyVv6yhl7FQVgasqY6W5vsxw
	c0G59czasbp7ol5U+PW2LBMe6DXLtsB5hy2FyBhCMeiYw2+p9UATSVQdKvzdwNi2iiIa
	JYSSFwofbD21HlNZo43E7EiPMRDsDRvUa8buWhnd38y1bHjRHNV0hIWt8llqoAK1/bEV
	tPF0HCwsoD1x3C62KzxYbCeLDGRujP1sTPfLCILUBLIZuIKqxVbrPfN4adFlN1GflOlw
	rII6sVvUwnQnasncWHasyNXk4HIhIAMAl++ObrNSkFalhG4qTUuI6O1Or0l6Kg3Sm8U9
	PcWw==
X-Gm-Message-State: AHQUAuZ4VkgPLoKICQiaCpLnu+Zug04fHGHR4XZkdt+ho8LqN4Oz/KtE
	+mQ030TR3839kcns5m4gDD5t2BSH
X-Google-Smtp-Source: AHgI3IbX0qfnkYinGhuax/wiCxTh7DfQkgl76Epp/oKSZ2Vt0WKyxfoUlSRwu34p8YG76DASJTrJEw==
X-Received: by 2002:a62:1c7:: with SMTP id 190mr2187689pfb.46.1549326994143;
	Mon, 04 Feb 2019 16:36:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id
	j6sm1641821pfg.126.2019.02.04.16.36.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 16:36:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 16:36:26 -0800
Message-Id: <20190205003627.4454-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V3 1/2] multilib_header_wrapper.h: Use #pragma once
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2019 00:36:33 -0000
Content-Transfer-Encoding: 8bit

Avoid infinite include loops, especially with bits/wordsize.h which is
now possible with the synthesized headers since we now also synthesize
bits/wordsize.h itelf for some arches e.g. arm/aarch64

In cases where extra preprocessing tools are used such as clang-tidy
e.g. and these tools are not passed the knowledge about architecture
then case comes where we enter into header include loop for
bits/wordsize.h, since this template does explicitly include
bits/wordsize.h

To fix this emits the pragma once at beginning of file, this is better
solution than include guards, and pragma once is practically supported
on all compilers except few e.g. cray c/c++ compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2:
 - No Changes, just rebased
V3:
 - Do it using pragma once instead

 scripts/multilib_header_wrapper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index 9660225fdd..4824790783 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -21,6 +21,7 @@
  * 
  */
 
+#pragma once
 
 #if defined (__bpf__)
 #define __MHWORDSIZE			64
-- 
2.20.1


