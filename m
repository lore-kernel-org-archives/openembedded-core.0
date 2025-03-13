Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1F7C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 17:22:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.20950.1741886553230701115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 10:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GSG6k8EV;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so796970f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 10:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741886552; x=1742491352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYrAWN3dyBYBrhnxyquO5mYFIRQ3E2Of4uh/dYr6TVE=;
        b=GSG6k8EVkd0fmrWpgUqsnZJlpN0oWdn4QLiiJCQJXZIbBNOPAjHHirOyY9K8/mgNTG
         /sA2m5IW/Y/Wcol2CE6G4PoqdVAsjuOxG9A44nRWIn794/e6Ol6sMYUJvR/kOPLp/0me
         /TKZ3+HdwIFYDqbjx+RVP43VaN9khJGlKofv2PkBFa74eHZO5aOoroAuPJc9+GrqxDQX
         afg1WH7Qgt58KIiByRwBoWtvyUejU1VcInRTEiT55wyRKZgMuY5PNFixrqSpKc0+QXpK
         aSK2Rcy+L41WmlXo7ze40kH81UCV6sfKugyCIIbBxVtzGzXqU04XEaip8bgFaqPp+jck
         Kvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741886552; x=1742491352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYrAWN3dyBYBrhnxyquO5mYFIRQ3E2Of4uh/dYr6TVE=;
        b=mACLm8XrdQzW2sOSqPWSsaKr+eYdUreHLuE0Xqjbb7hIJiGtgdmVyJZuKwVaFm/pvA
         AlEFWOzo4Yge+Xc8l9o8vZxVMHEP5oQb72rqpIfkromgcOwme+abLJPc84H2uNK80A8A
         +XvfBdhBZNI1EXjimiAVZCN2jbRbUMsPW2Cdhhwr4iB//2FxUPjfrprkcJmbOnH9FBLn
         nTQEgLsuCXqlGHirqi/ipMeoiByaxvXT8TFzj3dMvyUtvojjN4Djl3N6Kin9LH7ggzjR
         iVgnl4hnZhtAXDFoQn1wERx2HXxtCK3z7oyUPy6TTSW0x7aMOjRU7WeJPglB3Tcb6+9g
         F5RQ==
X-Gm-Message-State: AOJu0Yz19kgByJq2/ySIVHWY/EUOP85c49Onfid3S/p4xBGWVYGzpV5e
	Flfa74FEqoJR9yq2rghT1TCgVQUfI1GRUU/PxaU9diVXKP1lDS9afISRAQ==
X-Gm-Gg: ASbGncsWVhmG50BqtiBMaw+MxKt+2w7lg4+LjFgmVmTQqE5KT07ff/UB7dVjYKo/tDp
	y8oJC2AVerLFqo+uaf11vs/aNpxbtGyf+uhuum92gU8t9PJUd9EQET9A0asmn6DaDm4AP4fZRUO
	cd7YTMAoGjtFEQBoyXLL/D5+uQIJVtGSQUDOT9q27iYIu/yt9W3WHDqDUL6bJdYozYM/Cyrks45
	KpNgnJUit/75htoohz6r1ddKFPen2EydBHvWz+/tD4PQBG/QJ6IzX5oijGjjj7NaGaGSrkoanvf
	RQymjMwdiuQ2ZuGRVJk+OYtHMgzThiONt2FuuQU/p3QhJLof2ESeQ7S6AakMFTUElXfTKkviiTJ
	TO8m7VvyAPuyresPy
X-Google-Smtp-Source: AGHT+IE0A1avAdwrSupTHfJNazSm7P9/IrKHJBDUP+FGFG5xnr5d6a4mYp9jPR0NKtaWBJ68DkA03Q==
X-Received: by 2002:a05:6000:184d:b0:391:ffc:2413 with SMTP id ffacd0b85a97d-396c3174ff8mr365819f8f.40.1741886551271;
        Thu, 13 Mar 2025 10:22:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm2758445f8f.62.2025.03.13.10.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 10:22:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/2] scripts/install-buildtools: write download URLs to files for traceability
Date: Thu, 13 Mar 2025 18:22:23 +0100
Message-Id: <20250313172223.3407902-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313172223.3407902-1-alex.kanavin@gmail.com>
References: <20250313172223.3407902-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 17:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212796

From: Alexander Kanavin <alex@linutronix.de>

This extends the previous commit, so that download URLs are preserved
in addition to actual artefacts. By default it's all written to a temporary
directory and erased together with artefacts, but users can choose
to preserve both:

$ install-buildtools -D --keep-downloads-directory=.
...

$ ls -1
buildtools_url
checksum_url
x86_64-buildtools-extended-nativesdk-standalone-5.1.2.sh
x86_64-buildtools-extended-nativesdk-standalone-5.1.2.sh.sha256sum

Additionally, rename check_url variable into checksum_url as it's
a better name.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/install-buildtools | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 6287416c9a7..952da888bae 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -244,6 +244,8 @@ def main():
         # Fetch installer
         logger.info("Fetching buildtools installer")
         tmpbuildtools = os.path.join(sdk_dir, filename)
+        with open(os.path.join(sdk_dir, 'buildtools_url'), 'w') as f:
+            f.write(buildtools_url)
         ret = subprocess.call("wget -q -O %s %s" %
                               (tmpbuildtools, buildtools_url), shell=True)
         if ret != 0:
@@ -254,13 +256,15 @@ def main():
         if args.check:
             logger.info("Fetching buildtools installer checksum")
             checksum_type = "sha256sum"
-            check_url = "{}.{}".format(buildtools_url, checksum_type)
+            checksum_url = "{}.{}".format(buildtools_url, checksum_type)
             checksum_filename = "{}.{}".format(filename, checksum_type)
             tmpbuildtools_checksum = os.path.join(sdk_dir, checksum_filename)
+            with open(os.path.join(sdk_dir, 'checksum_url'), 'w') as f:
+                f.write(checksum_url)
             ret = subprocess.call("wget -q -O %s %s" %
-                                    (tmpbuildtools_checksum, check_url), shell=True)
+                                    (tmpbuildtools_checksum, checksum_url), shell=True)
             if ret != 0:
-                logger.error("Could not download file from %s" % check_url)
+                logger.error("Could not download file from %s" % checksum_url)
                 return ret
             regex = re.compile(r"^(?P<checksum>[0-9a-f]+)\s+(?P<path>.*/)?(?P<filename>.*)$")
             with open(tmpbuildtools_checksum, 'rb') as f:
-- 
2.39.5


