Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5456AC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 20:37:12 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.723.1717533422875412001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 13:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VqgvnhMc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-35dc04717a1so4524481f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 13:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717533421; x=1718138221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=r1+QtmbR/dNhVDn/nAYNQmsPJ18NrkR2Q/6uyAL/CgQ=;
        b=VqgvnhMc7BOoUCdxtPN5P4eNHeCpbRdWyQMPePVSPCmycFO6lC6FD9f+dPKwCHENCu
         aZMFErSGUOJ7JiZg5aJ3c+yZ8PxLnnqSPqHzBF5svWS2cWAqNqlwETOslkFR0fuCigRK
         Jx+IwYMXGb5w9C81aCXoMk2XFuCDiiAneEhwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717533421; x=1718138221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r1+QtmbR/dNhVDn/nAYNQmsPJ18NrkR2Q/6uyAL/CgQ=;
        b=cpS0NbP3lqIEgOZdrHp29tXbUtR3b3Ir/TvRzFmnlZDzB8l8DayLFkij4Ythwfc6+j
         6FsA8dqOGyzYJTT+SkMfUfHO30wfaVdN4LnX1SehxV8k/CW5tJHUnqJyDGYEz/VYc1Q5
         SU5E9vG7TILmGFbBNYEGafYTQDKp0kHEGdMwkV8Sf6vXPIEkW6e70aGLZqB8XPDLVIun
         9swmc/gnrTTRNvqKtHt9lcAv8/Z6wUYFNMIr//wMxJ0U08+pybC+WOyn80YO8FbqCHG5
         YnTP5HHwlae9HeDaMzu16KP56nSOBOaTUlHKCA1KT4JGJEdmPM9CI2YhUkopSS0qs60+
         wVNg==
X-Gm-Message-State: AOJu0Yxy2KBWdFOBTKzD1ali0F482QS7/ZUTdDRY46xNYXxcxLXjKEW/
	D3UTgMh5khyAGUi5Bquz7QzXwQNTR4xIbie6Hm/qo1dKtagW8K1DUy1dKLGkU8EHcFmYQGxVPze
	a
X-Google-Smtp-Source: AGHT+IHbM6YNVL2w3lh4Tvquhe8rW+42jYD+ARi4fcNH8Az06ywTWkvsb1jfA7jfJofEtqaVUR/jog==
X-Received: by 2002:adf:e6d2:0:b0:35e:839a:b469 with SMTP id ffacd0b85a97d-35e929c7ff3mr386542f8f.60.1717533420864;
        Tue, 04 Jun 2024 13:37:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e518:8da0:d67c:ea72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35e836d0d33sm803196f8f.52.2024.06.04.13.37.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 13:37:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: Add passthrough variables to work with bitbake
Date: Tue,  4 Jun 2024 21:36:59 +0100
Message-Id: <20240604203659.3674323-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 20:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200346

Now that bitbake uses websockets over SSL as hashserv and is correctly
limiting hash equivalence only to things in the orginal SDK, bitbake builds
from buildtools can fail due to broken SSL from buildtools.

The issue is that the relocation variables are being removed from the
environment. This could be fixed within bitbake or it could be fixed
within the SDK environment. This patch does the latter for now. We
really need to improve openssl relocation within the SDK in general.

Fixing this has become more urgent to fix failing builds in automated
testing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/files/environment.d-openssl.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index 6f23490c872..f90088aab7f 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -3,3 +3,4 @@ export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
 export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
+export BB_ENV_PASSTHROUGH_ADDITIONS="$BB_ENV_PASSTHROUGH_ADDITIONS SSL_CERT_DIR SSL_CERT_FILE OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"

