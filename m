Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EB4C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 15:31:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.12849.1743262266259622129
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 08:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PzwNQ7sy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3913d45a148so2698191f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 08:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743262264; x=1743867064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uYqi1HDSa/c33nUNM3zEqVfnpNu0Jy6W/N85BuyzLRg=;
        b=PzwNQ7syfHOpIUhmApTY02PKAEnuXqxKWo3dJ2IJih9drklk3dYGw44cEskL1/o8Mo
         pC6RcEuA8KPJM7K/VKwb1GQhw+Vz5P+z2ACCkvm0InzXOMHRRQ24VF/kYeOyaJrTCbRr
         DdWEhBVu/EBgIOfLQjg59PEIziogabBWZJg6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743262264; x=1743867064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYqi1HDSa/c33nUNM3zEqVfnpNu0Jy6W/N85BuyzLRg=;
        b=WQ95v9s3Iqwn13QqNVMXTLMn5hyS8R1aRMrNmR5rpfenYWX9eY+iwLbf5D2fdDiK30
         qdxAagePuywhVwktVrKXPyH+NfuV+GiWGMsHQH9u3+npY5vCejfci/NbZw8GYh6GTU60
         s6s+npmYa+2rQC5dnfrASi7SqZaHs9OVyt3WHim+I5lJWbjDKhuIG8RxIxZAI6f3PCBC
         Jqzg1PkYNAjZenxCVAD5Q2lsqqkZutap1DVMdtbVHnvk3AthQNtfMWKwVv8pKc3mHqbw
         M5/SqEhQhe1RCLx8ZefDmeSug6LmlfGcQEUyYSFxeglde4VwZGNmwgSw/c1V2gYLU9q6
         6E2g==
X-Gm-Message-State: AOJu0Yw9WAPSoUZuNBX1JMlZHf4TZYNh5LhQa4WbhDV6H0oy/AahvH2c
	Js73lTtVLzUCAMqTPlkiiolptxMkVF972u9x8kFBnob4BVHrk2k2dtoiqft4bO+eU9vzh/uisUX
	u
X-Gm-Gg: ASbGncsbXXH6nshz498MyBhB2qKHrqW7oSBNRod4Ap0KNzHHuNCoiHr947L448yQlzs
	q2XtT4PJv3abcZ8lXbXmoXTP99AsIdEwZygyUajtdNSEwuNfttm8NJioqskVhoVjDILdkWAHBQB
	GtaXpHC6J/awRlwtYkhqX1t0HuJYSqsNHFS8HJN32v6gTXM5N8fQmeknq7HdbsJTVNM2nAJpv0a
	WhrpVf0nagdyuto+PHu9L60WrAW5dUm7vLZlKw0B9hC6KGaSy6NSgL9TrouJpRGsDEIPK+29bPy
	NkZjUA5b1BCT+I7D/nqVHP/SMh+5gW5NOYFKBs1t3KViHUFvyoIALpuUEm59e6X41wbeeeA=
X-Google-Smtp-Source: AGHT+IFRfda95cPsI9juX4P7cjfDriPXm4j6XrtVudiKpOYV9jrKEym9kd2JwHm91jMKzWwn7zbHOg==
X-Received: by 2002:a05:6000:2484:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-39c13f5dd18mr1495359f8f.13.1743262264234;
        Sat, 29 Mar 2025 08:31:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aa52:226c:d1da:79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66ae8bsm6099263f8f.55.2025.03.29.08.31.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 08:31:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] sanity.conf: Update minimum bitbake version to 2.12.0
Date: Sat, 29 Mar 2025 15:31:01 +0000
Message-ID: <20250329153102.1612894-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 15:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213883

This should have been 2.11 previously but the numbers got confused.
Correct it for release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 5f8da8baac9..6d3911ff94e 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.9.2"
+BB_MIN_VERSION = "2.12.0"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 

