Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C698C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 15:33:24 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.10038.1705073594623797584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 07:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Y9B8W6R7;
 spf=pass (domain: snapchat.com, ip: 209.85.208.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-558b5f4cf2dso1457598a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 07:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1705073592; x=1705678392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2MAjksQ/5K6J7ofD5rIhlZbjSeGwewnHBIuXSvC56I0=;
        b=Y9B8W6R7plcorL385uAcv9BXrdVfCci47m2K2txrDZUbqx2GhWhz5k3CDw7xCfY16c
         +NS1eqxV4UsPofgwYv4IRmIs6bi8NtV1Y/POA4r4kDU5Faay+72klXEz3IYoZ00Kng9Z
         da0cFYvkX7LX0owR45aj97A0ukbWL9unY7QlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705073592; x=1705678392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MAjksQ/5K6J7ofD5rIhlZbjSeGwewnHBIuXSvC56I0=;
        b=V1wRF5K9TVxZvhu2CFJSgVJkOv3Jjeuo3756N4HaYSeoFZkXk/fT0G0s5RC5NEW0Jy
         Mm7/EvXXt/51TGtEiXMPLgD/GPX5tp726553qDZ7fhawG7vbxIXBvo3eiL2KEtOFanZd
         925g4ZL7TSKkr3Iv12WMnZQwIPlequ1+CX3mJ+L6B/6+XkLYN5SVXFFeUUbJ3YYIblF+
         LaiMYE6U5TQtbr/iQxCSHa2/P8cYHC/tRabO4qOgQaIxJH/iPY/B5fNKSsLhOajInCGq
         tczv2Asp6jgxgYpy6Tk+qKj0qBJpkh1eDH9F5U6MuwhNXMLT0PdRPcBvMEuVfYxA9hI4
         bBgg==
X-Gm-Message-State: AOJu0Yy9D8+biPnnQX8AFpf2Kl4d3xc7+ZJTdEC4eYvE1p+KYOtfd1Z/
	UJ0xLH096fyWJTeiKj+zD8YbAlS46PJUDFTeRC8d6QuU7d0G0B3S
X-Google-Smtp-Source: AGHT+IFGHGV2Z53D/qtu9pBE9JaoOmEH4BtmF8+tjB46E04Q4mfMy8oVCNRYme46/g17eJU3iSi6ew==
X-Received: by 2002:aa7:ca41:0:b0:557:c2b5:1e4f with SMTP id j1-20020aa7ca41000000b00557c2b51e4fmr808835edt.67.1705073592376;
        Fri, 12 Jan 2024 07:33:12 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id q9-20020aa7cc09000000b00558a3e892b3sm1751215edt.41.2024.01.12.07.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 07:33:12 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Dominik Schnitzer <dominik@snap.com>
Subject: [PATCH] chrpath.bbclass: fix Darwin support
Date: Fri, 12 Jan 2024 16:33:08 +0100
Message-Id: <20240112153308.2567611-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 15:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193595

From: Etienne Cordonnier <ecordonnier@snap.com>

Ported from the meta-darwin layer:
The call to out.split("\n") expects a string, thus the parameter text=True is
needed (otherwise Popen returns a bytes object).

Note that "text" is just a more readable alias for universal_newlines.

Signed-off-by: Dominik Schnitzer <dominik@snap.com>
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes/chrpath.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 1aecb4df66..16729dcf61 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -62,7 +62,7 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d, break_hardlin
 def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d, break_hardlinks = False):
     import subprocess as sub
 
-    p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
+    p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', fpath],stdout=sub.PIPE,stderr=sub.PIPE, text=True)
     out, err = p.communicate()
     # If returned successfully, process stdout for results
     if p.returncode != 0:
-- 
2.36.1.vfs.0.0


