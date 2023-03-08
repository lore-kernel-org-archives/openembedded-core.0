Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41892C64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 16:44:12 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.12944.1678293845150647874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 08:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dQ05UVBl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id l25so16021648wrb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 08:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678293843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dh0QNIjXyqp4c6AZQRooR7sYbDDtNQhZj4J08QdhaZk=;
        b=dQ05UVBl6WdzVszJaTFYCCpXtGf77EdBku4TN1DSAFUCAOkJbrqx5Q/PI6/+Z+oslX
         M3t4IVEhUBv4jbO6YOuyGkBEikjLatZNhzZe4wfnKqg8/t6Ru0Zwy3Rq5T8WB7ovtTRN
         vvMtGSBcX0EJtFaADbpnZ3owW+U7dN28zqlPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678293843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dh0QNIjXyqp4c6AZQRooR7sYbDDtNQhZj4J08QdhaZk=;
        b=EdZPzzSzSaZ9mqG3VAq93rwYKQC0/fTp6bvHg5QJfqWTfPeZbvK1CfACUzR+3qjIPQ
         2zSiXct2x3H87vRzv5j6PV20J2Z+F02HWYCxeGvaDtu0tZbFViM2bWgjYyonoFtAfT0h
         UdwGlP/Z0gonzXHCKza7ujbDR3XpLUUVaL0cIaFp7WkyrwESY2Cw1hr7ahK39kTlMFEW
         q78+OjjLz3S8jgGTMpwHReqOlG3EbTXcItzy5hOQIJQA7jN9MDa8yyqIKJN+H72LXEkN
         wF49BDQvE65H+0AkSQ7NTnzkOfoHh0hu2dy/UTKv6flVW4ymSqgs/1UfE5zwm1nxIjx7
         uPPg==
X-Gm-Message-State: AO0yUKX72fAZF1HldLSLDBVh/8kfgIjzsxbboGQZhsHNG3iyH+tJd70K
	dSC5H3Cfy1uSdmOpvzmyN7ZHJ/8yB6SocBe4kwA=
X-Google-Smtp-Source: AK7set9lU1eqcADNgQvsducp50HTTQN3SNRKbT56p+lH8N8Mu0zGWkWl7f1z+ShnNx9FhPqNlr8dPw==
X-Received: by 2002:a05:6000:149:b0:2cb:3deb:c014 with SMTP id r9-20020a056000014900b002cb3debc014mr11755045wrx.28.1678293842882;
        Wed, 08 Mar 2023 08:44:02 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b])
        by smtp.gmail.com with ESMTPSA id i11-20020adffdcb000000b002c573cff730sm15759767wrs.68.2023.03.08.08.44.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 08:44:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] glibc: Add missing binutils dependency
Date: Wed,  8 Mar 2023 16:44:01 +0000
Message-Id: <20230308164401.2794135-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 16:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178178

glibc has it's dependencies handled more manually due to it's place
in the toolchain bootstrap. It depends upon the compiler and indirectly
through that to binutils. This did mean that if binutils changes and the
compiler does not, sstate and hash equivalence could mean that glibc
wouldn't rebuild.

Add a direct dependency on binutils that if it changes, it forces glibc
to rebuild, as it should.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index fdd241d973b..3b940b8ab29 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -1,7 +1,9 @@
 require glibc-common.inc
 require glibc-ld.inc
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}binutils${BUSUFFIX} libgcc-initial linux-libc-headers"
+BUSUFFIX= ""
+BUSUFFIX:class-nativesdk = "-crosssdk"
 
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
-- 
2.38.1


