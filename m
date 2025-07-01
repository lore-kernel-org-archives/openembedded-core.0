Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514F8C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 07:52:01 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.4810.1751356313321365591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 00:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZWS5p03U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so3941196f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 00:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751356311; x=1751961111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fuFLyUQiTiqLp1LoESllz/iWL74GVngvoDF10QOiFtY=;
        b=ZWS5p03U3Np5U0jlvo01k2adY8dGOkflH49yLGBCuxXKPPgehAMi0FjuCuTD5qWlyj
         DeZIxwFAAci0podS/F4Y3jJOiHN/6ikbYSnb5X+rDU50kdebJYpHCGOp8CDnZelOeYl3
         CVuhytrjlqPX9+jDxTBj6v3jgxWLt5XbbXmTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356311; x=1751961111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuFLyUQiTiqLp1LoESllz/iWL74GVngvoDF10QOiFtY=;
        b=MRQPP2WGwX+BiIO0MwDArRuT6OgR3zsAy6swl4Vf4zWZXfS/Ao8PiNeRTpE6JGaOsO
         uSeS7KaAoB2i4gV3efcEkzzm1XWJWhjMnKqMsq5+SlnMczfmxfv8YDmj8/QHLZAWyJ9K
         e1JpbCgmOIQsBWrHlmIs3Krz3oe0ex6UA+ruPqXYrcB31YVtrZU1obBDTrSG5q0ctn8v
         FMODanKWbBl3GPuxQ1o96xBgtw2SK7OT6deF7W7kujNmkZQM9aISEGFm1ByadMRh7QG5
         HmbRLS1cUwGEKdVI4ByDbw93q4UJzq2KeHji2/FQOn87r2OVEbwacd9WGIyci0pESdDi
         pdNg==
X-Gm-Message-State: AOJu0YxBs0j2X0KapwJOtjyg4YWqoRIZjB9QsFOePw0UDWazjPiEMh7h
	mwntHrHcg07MVAMDUTfUNxZ88Ca1rtXO6zKgIcpOYRjK/hiz6/bPCjXQA1MkNIELE89AxRLpT5B
	1n8Cs
X-Gm-Gg: ASbGncvQwXbsvtsetQusBl++SHYe81MfxYpXBjxDnX1ihDrN6l3qo8cKdWtCyBO/wR1
	3DOr4lg4Z50/XeJugXqgz7ACBgtziKIaWLJRXqUn0spmyJu7WCPh9P0xUMupU2ijcvuAqiaF1xr
	tCj6g7CkTEdwgDKWkv4ALbS2kZ7LdxZO3Qc2v2HO+0oAoqJrvCxE57Y+INfpDE5XbrmOJUK3NG4
	BlCO55tXGhF1MRpk0rvIN0gKaRBkUziMHL0wtpWSwO/yfpuHX+R7ThMWzEqeHMTVpRbU4VaVvHN
	GtmhCES1lKgsoqLoiUZJXLJLXxA0/8e/BxvPaCRyxxZ95TtriRHvMKsaFJ/sIzB6wcAMlVdr+i5
	TPLGtTtoiIOztjac=
X-Google-Smtp-Source: AGHT+IHjBjLHMr6HrNy/maCCovtHAPXHDqaqdKLK+gh+SmhV7Hr4FKfSQ+2oowN0CldsxcaCoDgp1w==
X-Received: by 2002:a05:6000:2712:b0:3a9:16f4:7a38 with SMTP id ffacd0b85a97d-3af0e2ced06mr1331029f8f.2.1751356310139;
        Tue, 01 Jul 2025 00:51:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:62fa:d15d:397d:870e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3aba76e40c0sm8281825f8f.59.2025.07.01.00.51.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:51:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Require minimum of bitbake 2.15.1
Date: Tue,  1 Jul 2025 08:51:48 +0100
Message-ID: <20250701075148.3492302-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 07:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219553

This is needed for tinfoil and umask helper function changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 3692007e96d..474816797aa 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.15.0"
+BB_MIN_VERSION = "2.15.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 

