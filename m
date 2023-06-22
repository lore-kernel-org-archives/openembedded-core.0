Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529B6EB64D7
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:13 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.1231.1687401372603544371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=BJdRNTSR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b4f95833c7so35114535ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401372; x=1689993372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsFjWVS28WNXTJVVqw0nInjHPCf8cL86Sy4I8ueDM18=;
        b=BJdRNTSRmAAgcn1yowtbkV7h558I5s2vTvaSwnePAPoXAv73AtisG/GLViPW7H0geh
         i0oGQIryVDHMy8O4SJ3pL25GZ/f2q46XDHPQUiLo7AUMTR45Rkx628hkYXdVgvozP9Qt
         WIQTFIAxs1tW6ShhPXAp0SPvDfMBZWMVxvei+dd7OEVQVC2co3QTzbMMj/q/HOHf+Cpg
         yIdetAg+exNv7oW6g7i871KryWj7gm+qsTln+NJcP/HZCCoMM/MGsaJ6pW87fm94uzEY
         O2WZxhco6kMlIFA7QVB7F+uLyG0le8BnmPK5/kQluG7y1YIHnJ5BQHPUeCID3ma/TPvs
         /b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401372; x=1689993372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsFjWVS28WNXTJVVqw0nInjHPCf8cL86Sy4I8ueDM18=;
        b=g2jfWBDZBXamj7hnG+HwY8irncU2ttGQ22G0LKFrjy753ttjPNZ9Ly+dr4ewMGUQTz
         RyBwDoNCznaec3Ziz5wkRgXAXBxVq4Ap97TaFxwLTLI0Ryx9Gcd0CAkT7YI1tsdeZYMA
         1+zt0i3o0/+a7UgrlK1wLPs8394dqdvxO2ZOglsurqFy/0RW7t7ZFvG2DU2vk1El9GHE
         cdmK/5jr/E0XkXbdFHZp9jRKsPEUG66Weavy78cDSa7DtR0sCTMVqxSTzsZTXNSx3hXk
         g4zAjOaLQVbdrTUjjKpWitrrDRoElBmAxOyUhAvnDzgPqLqCzzAIkxpKQ46VvaXbuHnX
         u22w==
X-Gm-Message-State: AC+VfDz5Pg9Y4dLMkDZqdzQWrZe4+toLBch86nHFsrX4oUVEf37E9JXU
	/QiQ7yWjyduIsTzuVtXHvWsfm8Ovt4kdYXTxEnU=
X-Google-Smtp-Source: ACHHUZ6izwDIFktjdfWG6lxweZ52cO/Da1t2nEv6qDlj6G8IC0a3WJtSAlbiskajCnzxOjnUjLCQRQ==
X-Received: by 2002:a17:903:32c8:b0:1b3:d8ac:8db5 with SMTP id i8-20020a17090332c800b001b3d8ac8db5mr16464698plr.40.1687401371641;
        Wed, 21 Jun 2023 19:36:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/23] cups: Fix CVE-2023-32324
Date: Wed, 21 Jun 2023 16:35:34 -1000
Message-Id: <3e0e51c5dd435822ab29261a648e5e86b8ad9919.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183202

From: Sanjay Chitroda <schitrod@cisco.com>

OpenPrinting CUPS is an open source printing system. In versions 2.4.2
and prior, a heap buffer overflow vulnerability would allow a remote
attacker to launch a denial of service (DoS) attack. A buffer overflow
vulnerability in the function `format_log_line` could allow remote
attackers to cause a DoS on the affected system. Exploitation of the
vulnerability can be triggered when the configuration file `cupsd.conf`
sets the value of `loglevel `to `DEBUG`. No known patches or
workarounds exist at time of publication.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-32324
https://security-tracker.debian.org/tracker/CVE-2023-32324

Upstream Patch:
https://github.com/OpenPrinting/cups/commit/fd8bc2d32589

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-32324.patch            | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index da320b1085..d77758fd3f 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2023-32324.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32324.patch b/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
new file mode 100644
index 0000000000..40b89c9899
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
@@ -0,0 +1,36 @@
+From 07cbffd11107eed3aaf1c64e35552aec20f792da Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 1 Jun 2023 12:04:00 +0200
+Subject: [PATCH] cups/string.c: Return if `size` is 0 (fixes CVE-2023-32324)
+
+CVE: CVE-2023-32324
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/fd8bc2d32589]
+
+(cherry picked from commit fd8bc2d32589d1fd91fe1c0521be2a7c0462109e)
+Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
+---
+ cups/string.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/cups/string.c b/cups/string.c
+index 93cdad19..6ef58515 100644
+--- a/cups/string.c
++++ b/cups/string.c
+@@ -1,6 +1,7 @@
+ /*
+  * String functions for CUPS.
+  *
++ * Copyright © 2023 by OpenPrinting.
+  * Copyright © 2007-2019 by Apple Inc.
+  * Copyright © 1997-2007 by Easy Software Products.
+  *
+@@ -730,6 +731,9 @@ _cups_strlcpy(char       *dst,		/* O - Destination string */
+   size_t	srclen;			/* Length of source string */
+ 
+ 
++  if (size == 0)
++    return (0);
++
+  /*
+   * Figure out how much room is needed...
+   */
-- 
2.34.1


