Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A461C7EE31
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:06 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.69593.1677430981711859921
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:03:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uPFdllkB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id l1so3814472pjt.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zr2RDf6eBegaQnve+uHA/0F54eR6z7WAVuSvjIKSA8w=;
        b=uPFdllkB911kr3QJhX8uKQw8gfObqPSk8QfGPkgwealS8J7Io0BtoZzBWwSdAWKAwj
         R9CiY+kGKheJK5MZ/EWLYZZ1TNSJ/Wk2GkE/lBuWS1wKbMYFWbbe8FV6ev2QCcH3xyr6
         9WrhlVvQm+ylb0Aw7bK/G5zZ9vMt9bOxxV0ZAa7ZXMM6xDi+srd2V5YvGanqlLlbLXt3
         Jx0j0X2dQCjm7PbiNbKRmeOpB4f5/JJq9NC1tjinis+bJSfBiIavgiM2XvcyYTpPWnNa
         PUPtVRyJh9jKDwIsKrmO2AM3qZ46NdgI2jRpJYKDtvFGlMEGwZMXh01clY6qArMDM6X8
         IzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zr2RDf6eBegaQnve+uHA/0F54eR6z7WAVuSvjIKSA8w=;
        b=pgTvYK4j9Ar/nu7CitcdAmfjPqZ7uZpPWOMY85Un47H4d3vnYvfW0nPQuOTnTKmMcC
         pmZ7ukPqmszJDn4DsoQf6th/Hro0tpyrSXkACSs16NqazgAv5psBoCJVWMNqA/a69gvJ
         WohJqZkFC08RMxIPUiM6yT5iFZHCSCp6Zpk1vWFdQ640q6YsnZjf3wIcOof0nwUc1BYg
         46G+3OT/CjKp1773t1q6WtAr044QovHl0YsZ1qHWYglE0rOGqzHY84x64NZ7YbAPP25v
         VTvMsVQ2m34n25gtnP0Pr+KkchMsH+JYidHPdy3sUUkSNo49U1/htMYga6jmlJPHi6S5
         kChg==
X-Gm-Message-State: AO0yUKXDNfvICoSP4njaEFe09RFxp55yqrirN0xw4xzoTdvQO3GCxMGu
	s3RiN/DVkM/8tyBeEAp15+DjDfcLmwIiPU5l6mg=
X-Google-Smtp-Source: AK7set/y6C4FhnCzPdZTcf550AUj3Vl0G9OSv6+qHWU0l8ktwQYFh5ENzJQPRLAECrFS8ljYyg3Pkg==
X-Received: by 2002:a05:6a21:998a:b0:cc:c2a0:995a with SMTP id ve10-20020a056a21998a00b000ccc2a0995amr5828717pzb.2.1677430980635;
        Sun, 26 Feb 2023 09:03:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:03:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/28] busybox: Fix depmod patch
Date: Sun, 26 Feb 2023 07:02:13 -1000
Message-Id: <e8c4cf47ab7d7b7c7944908a4a2beae39b48eafe.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177755

From: Saul Wold <Saul.Wold@windriver.com>

The original patch was actually allowing .debug modules
though which was in-correct. This change blocks the
parsing of .debug modules (which is correct). As noted in
[YOCTO #15022] this should address the empty modules.dep
when using the BusyBox depmod.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 339c3c3abe8d405cfe7b3f34db9b3547bcaaf878)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/0001-depmod-Ignore-.debug-directories.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch b/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
index 354f83a4a5..d76118f85b 100644
--- a/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
+++ b/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
@@ -21,7 +21,7 @@ index bb42bbe..aa5a2de 100644
  	/* Arbitrary. Was sb->st_size, but that breaks .gz etc */
  	size_t len = (64*1024*1024 - 4096);
  
-+	if (strstr(fname, ".debug") == NULL)
++	if (strstr(fname, ".debug") != NULL)
 +		return TRUE;
 +
  	if (strrstr(fname, ".ko") == NULL)
-- 
2.34.1


