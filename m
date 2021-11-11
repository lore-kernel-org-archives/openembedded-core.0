Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7D7C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 15:25:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.966.1636644330406217941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 07:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WjgLfR8g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id w29so10378673wra.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 07:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tXKsafQNJsrQ201V84+AbGvwHZvgxbeoBXJKuy7zxd8=;
        b=WjgLfR8gOPsKWPRf0oinoJuCTh2FR8vZxaYQAd1zf4f/EMaMBioeWEr2qBLeeR8VJg
         UWrZJOw0cZEcUdXv61ZIueOmWwVyDCrR4E9ll/4ukGBEz8sWhj5GkpLk3Wy1CHUHOEqt
         LabK/iqJcRT/u225cQ4lTyrQ2oEr4ij6AgTe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tXKsafQNJsrQ201V84+AbGvwHZvgxbeoBXJKuy7zxd8=;
        b=tWupTTEO0PSDiOcRV5VG0gQ0ESIzzVgYJM1shOPgRPxs3n8LT2M5R7t8VYJn8jKYhr
         WH1xWbDapxLgKLbpvjMtxIkuGnyHYpdKYJv7zCn185Fwl5v55z03wwoHCYv2wTF7fGBG
         6Ja4u/F3G03Q3knxvJ9700FA+SGUM6ZABblgRj1YvZhOuUh93XoEQjon+1yDEOsmYkaa
         TYX7HutmTJylHyR5iVtFQ0IGPyvMoeybkxxVTFr5PViikE2bHsxS2eyzdkD0wivF7GMw
         tdNlm3/dzaxhpkzIzyNNtDKTWBUyMiwEFAMD7kjcsw69qNa7jY6fzfG5iVfy0M6cbP6X
         uaEQ==
X-Gm-Message-State: AOAM531a381N/+xiMiL4IwDSGtKjLsc5eZ1vfKtThB5GNkbdZM9FwBRk
	NmI+Kc7cxGNI4+VoYrny21upqMZLqUgKtQ==
X-Google-Smtp-Source: 
 ABdhPJw1nkeeQsiSbIC+1zF7or2CLm2dEucXhaRERCXNlJaPn9xAx7Y0BKLR6Y42hEiV6NYO3EA+nQ==
X-Received: by 2002:a5d:53cb:: with SMTP id a11mr9686854wrw.357.1636644328699;
        Thu, 11 Nov 2021 07:25:28 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc])
        by smtp.gmail.com with ESMTPSA id
 x13sm3374108wrr.47.2021.11.11.07.25.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 07:25:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] scripts/oe-package-browser: Fix after overrides change
Date: Thu, 11 Nov 2021 15:25:26 +0000
Message-Id: <20211111152527.3862621-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 15:25:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158188

After the overrides change, the format of pkgdata changed and this
usage of configparser no longer works. This change is a bandaid to make
things work but the pkgdata format isn't very similar to ini files
so this may need to be reimplmented in a better way in the long run.

[YOCTO #14619]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-pkgdata-browser | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index 8d223185a43..e07005b8070 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -49,11 +49,11 @@ def load(filename, suffix=None):
     from configparser import ConfigParser
     from itertools import chain
 
-    parser = ConfigParser()
+    parser = ConfigParser(delimiters=('='))
     if suffix:
-        parser.optionxform = lambda option: option.replace("_" + suffix, "")
+        parser.optionxform = lambda option: option.replace(":" + suffix, "")
     with open(filename) as lines:
-        lines = chain(("[fake]",), lines)
+        lines = chain(("[fake]",), (line.replace(": ", " = ", 1) for line in lines))
         parser.read_file(lines)
 
     # TODO extract the data and put it into a real dict so we can transform some
-- 
2.32.0


