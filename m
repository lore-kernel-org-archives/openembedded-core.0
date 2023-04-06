Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B573C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:36 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.162535.1680796950490326416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uRZtrKdU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id z10so24028732pgr.8
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796949; x=1683388949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJZMjZGhPlxemcvB3Mu2z9THqSgn1nVVPdwHBjlnK4c=;
        b=uRZtrKdU5SzaY5yc+W/w5KW3iSF/SeNgKq47suN9/Uusy9DeRqix1MZxzCwUxTurxt
         tmGPmGexC0QK2jay6UYdoGquq8Ab/z0jz9yFyPV2Zhy73a857VTpyo3RLlGrlg6lB1AG
         jHyZio4W3F4/k4HPRECCt+M3IyxIS/2jLjdoq8eNr3b+xQ/xDKXi4r7yLV3wVoQ6YzPE
         NuwZNGkTJka4Uqy5OE8Ifbw970Q4p//N1G+0ptxllsPXaybp+vn/uhVEaFg98pXTIpJa
         PaAAoIzvmKraLstms5fpgbGKi6451Acp5YiBDM8Vxmyq9A21yIk1vWmHX2K4IjsbnDk0
         NIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796949; x=1683388949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJZMjZGhPlxemcvB3Mu2z9THqSgn1nVVPdwHBjlnK4c=;
        b=fUfUbdNFdwqBmxpLN9xGgYgO2q0/jOXbPuRSYSjG6KyoZ9OW31gCKMp+wTAFZ/1h41
         5449G8VTtdSihEiiaDCzW0YXiAwPQ/Hfn9JS3Z8duIhqhphOt68MelBY8pjZr/LMLQ5f
         MW6tnerqEZczuI4Px38NgBN6L7vYABuRdvvZFatoM4jU+9pbi0lrbsFqyWj7jg8Hwl0W
         Lr575HVkBTnKPuuw0I1FsLJ3FUlJSacuNRtqcWQ9Yk7xe9p6Bx7fooBqiYidpKBvDZ08
         mO1TNS5AamDmcIX+ty3IWK0isPV1SxcFav2q6J/ChJxTnrhUslT3GWJk1MLP4F5TLewK
         u0BA==
X-Gm-Message-State: AAQBX9f6Si+3vqaQY/wJw+xXUZM5Efb1Ro8YpNY2lKbt3mrisua4pcP9
	Sgd2MM0oqj/7rJt4jvYNY5IfvK4uPpSYLhwJelg=
X-Google-Smtp-Source: AKy350aba4Rrpzie1licbq4GcHTfqr0vtpVXUdOxPL7XweT8Pkwb5xULNbOETwo9E7kla56nnnzETA==
X-Received: by 2002:a62:1c0a:0:b0:625:cf03:e8cb with SMTP id c10-20020a621c0a000000b00625cf03e8cbmr7374975pfc.4.1680796949276;
        Thu, 06 Apr 2023 09:02:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/26] oeqs/selftest: OESelftestTestContext: replace the os.environ after subprocess.check_output
Date: Thu,  6 Apr 2023 06:01:33 -1000
Message-Id: <273cc6d6a11c4f11f80830f23489a287f38c1a17.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179784

From: Jose Quaresma <quaresma.jose@gmail.com>

No function change but is needed to simplify the next patch.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 193d8f0d6383f54c61f90d58eeb8f41580c2360a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/context.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 78c7a467e2..0d26a07438 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -86,17 +86,17 @@ class OESelftestTestContext(OETestContext):
         oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
         oe.path.copytree(selftestdir, newselftestdir)
 
+        subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
+
+        # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
+        subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=newbuilddir, shell=True)
+
         for e in os.environ:
             if builddir + "/" in os.environ[e]:
                 os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
             if os.environ[e].endswith(builddir):
                 os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
 
-        subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
-
-        # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
-        subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=newbuilddir, shell=True)
-
         os.chdir(newbuilddir)
 
         def patch_test(t):
-- 
2.34.1


