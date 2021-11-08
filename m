Return-Path: <leif.middelschulte@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA55C433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 14:04:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.45181.1636380273910901202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 06:04:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CWyUPJ0y;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: leif.middelschulte@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id b12so27092751wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 06:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7WIhC9EpR7LStGCpFWc4re6VR07om5BZ6WO/gXsw8d4=;
        b=CWyUPJ0ydFIUyoU12HhJlFBdmivcHYmT4TKUTm6+58ECU98uV8m7vsAzpRK5o3HU/8
         KMkSLlioneFxjcO80umuWSEspJwDHcCYEYLyi95bQV5SguJsvVakofmdgBBnnuapI5BM
         5ZpaI/5CiEyS6MCrDDCAI5KqL+Z3VNW8WwUsllyaTOAZbauD2SXXHXEVBMSNeRNh9csG
         dPnbs2LEwH4w6utVSjozJD7gaJuqqckPW/N8M4XTaMyyW6Wq0SjFfp3LVk5v/OnJX5Gu
         PprL+o+IhS7KnMnoTx5+WHQuVbA6HtBUkCkjh4pdtkirvEMPsD0fSsLDQGaN8Qb3zes5
         d+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7WIhC9EpR7LStGCpFWc4re6VR07om5BZ6WO/gXsw8d4=;
        b=JF8sPENRyqdwqQOUOPibf3C86FmyMyoFMZFvVuEZfUq8tdNNTSP12Kh4lkJxe1cZs1
         J9CEdGaQaPLlxoeLqiSqVZR1QTsmT8tp/ndewtFd0k2it+wM4DeVBNFcxEYuFZQ9d4J1
         H9v4ElbfYQpw/Iz0+w5LtnoZJFf/l7gexUTULk1U6PWivTgYG1R3vIFG5bmwZl6OGyZs
         cPyTgc4u2T8bA/WnoQ09YrIlxVOMTyUCqGwoIa6T9XAGfveAWBJJ2Qrb/MsA3yYjd4BH
         aG3lKCSPgh+VuVSNA5+M5SzxoPWBeH8fo9qQm50wzsAfmJ7WYb2TEAeqV8BC7Q+QVB0C
         6A8w==
X-Gm-Message-State: AOAM531CFfQmD3BQv31lJ4+ZxN1IJCw/lcutTMaVn5LG5niYaAXfX44N
	WAXlhCRjbXNiD9ljD9aYZrYqTEaAn7kf2A==
X-Google-Smtp-Source: 
 ABdhPJyGE86bvAU+uT2MnLDRfFR15doZLaLngSxQfZRj3swC/kDUEWoH5g8ydyZfs6FYVUZVy2swsA==
X-Received: by 2002:a5d:6152:: with SMTP id
 y18mr79745334wrt.271.1636380272507;
        Mon, 08 Nov 2021 06:04:32 -0800 (PST)
Received: from DE008-CL-00034.umk.kls.zentral (p5dda2738.dip0.t-ipconnect.de.
 [93.218.39.56])
        by smtp.gmail.com with ESMTPSA id
 r15sm17758799wru.9.2021.11.08.06.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 06:04:32 -0800 (PST)
From: Leif Middelschulte <leif.middelschulte@gmail.com>
X-Google-Original-From: Leif Middelschulte <Leif.Middelschulte@klsmartin.com>
To: openembedded-core@lists.openembedded.org
Cc: Leif Middelschulte <Leif.Middelschulte@klsmartin.com>
Subject: [PATCH] meson: improve SDK's wrapper to make Wraps work
Date: Mon,  8 Nov 2021 15:04:29 +0100
Message-Id: <20211108140429.25793-1-Leif.Middelschulte@klsmartin.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 14:04:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157983

Meson, as provided by the SDK, would fail to fetch Wraps' sources on bare
systems (i.e. systems, that only provide little more than the SDK).

This change modifies the wrapper script so that it sets an environment
variable (unless it is already set) that is used to determine valid
certificates for secured connections.

It does not affect bitbake's interaction with meson.

The SDK's SSL directory was not searched, so meson would fail when it tried
to fetch sources via https, that were specified in wrap files.
Specifically `urllib` would fail:
```
<urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1129)>
```

Caution: this patch depends on the underlying C library (i.e. openssl)
to consider this environment variable.

Signed-off-by: Leif Middelschulte <Leif.Middelschulte@klsmartin.com>
---
 meta/recipes-devtools/meson/meson/meson-wrapper | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
index d4b5187f8d..8fafaad975 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -4,6 +4,10 @@ if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
     echo "OECORE_NATIVE_SYSROOT not set; are you in a Yocto SDK environment?" >&2
 fi
 
+if [ -z "$SSL_CERT_DIR" ]; then
+    export SSL_CERT_DIR="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/"
+fi
+
 # If these are set to a cross-compile path, meson will get confused and try to
 # use them as native tools. Unset them to prevent this, as all the cross-compile
 # config is already in meson.cross.
-- 
2.33.0


