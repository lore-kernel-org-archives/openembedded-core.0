Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA02C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:46 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.162531.1680796963675900486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=sLEXs14C;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id cv11so13348879pfb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796963; x=1683388963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5zlVQ3/WR2iV/TZltBkW3Owb7yMk4ffFzBtWR6O1bk=;
        b=sLEXs14CFwd9ihIoVEg6tn3AzSNTYChAf9tRq7lZ1NZAtVPL8zxVOxzJ285kX3wGQ7
         tFw4RJmaQJvg8TaRTdix7roodzVuPLVE7P8Qay2TS3hRBErw+rReUPCifimvh70M4JNi
         zgS1j7L1FAwfGWhlOHt2JZjJlEqi4VrLKB/xci8Y8Pw95vCVXJG/yV6Rtx/H0t+du1Dq
         +LlfWvZACZ4Xu6XYi6NnilPNBW/VxMnhLjn+DmnYVYTnF5fx360V9ckmP35vdJp/0PYg
         VoS6/ho5pVnplTIezZlUy2fJiI3ZV470wGRl0Hh4pmimtivIwclXSZGHX6KIPppJyMB4
         QbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796963; x=1683388963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5zlVQ3/WR2iV/TZltBkW3Owb7yMk4ffFzBtWR6O1bk=;
        b=rpwpHfldmht1np7AFr4QIL52IPKI8VZ3EoObcfH2HVAKYkbcNNXMIERZxfv7/E9JIc
         mYsK7K8nT5ztL9BarxSzQctIYJX0y4kCAKbcvjtD0v4mxgQOIxq30NyDV8wbtcfCnlrD
         6PJTQ1ctzgpfluQF7tDH3LcsiAa52PMiHsi5Vmhh3O8PNcROWapFGgzjAYJsqNVnRBs5
         IX1+F0R2kxa0rmwFFE6xnNhsnC0IOzJb46ISFhp8OUj1oZq7RHZ+oz7bmEBjCaondpNJ
         Zw7Dj6AFyfD/rqVQM4L/szjcrktKZ2IeDZahl6NXgjnhKlWsdijL1Pep6eutlIWFU7J4
         BOPQ==
X-Gm-Message-State: AAQBX9cQKxjYvnU23qKmvrDUUxi/wqevLp4Dt06h3ZWrnxHRGsgYrsJB
	rT5Y9Nnc5Vts5zcytT2MlZSJVrreF4s6gBRymPI=
X-Google-Smtp-Source: AKy350Y5KYR4n+DNcum2uo2idHj3+k1uly2OiaCnznBxnN8OvN4uu12egXaAiNNvxph/W1+HPS/nAQ==
X-Received: by 2002:aa7:9a07:0:b0:626:2ae6:31f6 with SMTP id w7-20020aa79a07000000b006262ae631f6mr9756050pfj.7.1680796962686;
        Thu, 06 Apr 2023 09:02:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/26] lib/oe/gpg_sign.py: Avoid race when creating .sig files in detach_sign
Date: Thu,  6 Apr 2023 06:01:40 -1000
Message-Id: <bbb20a6d74aebff830fcb0c69739a10fd64d9cf3.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179791

From: Tobias Hagelborn <tobias.hagelborn@axis.com>

Move the signature file into place only after it is successfully signed.
This to avoid race and corrupted .sig files in cases multiple onging
builds write to a shared sstate-cache dir.

Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4ec08ea9efebac262d43f47d95a356fe2829de9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/gpg_sign.py | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 613dab8561..ede6186c84 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -5,11 +5,12 @@
 #
 
 """Helper module for GPG signing"""
-import os
 
 import bb
-import subprocess
+import os
 import shlex
+import subprocess
+import tempfile
 
 class LocalSigner(object):
     """Class for handling local (on the build host) signing"""
@@ -73,8 +74,6 @@ class LocalSigner(object):
             cmd += ['--homedir', self.gpg_path]
         if armor:
             cmd += ['--armor']
-        if output_suffix:
-            cmd += ['-o', input_file + "." + output_suffix]
         if use_sha256:
             cmd += ['--digest-algo', "SHA256"]
 
@@ -83,19 +82,27 @@ class LocalSigner(object):
         if self.gpg_version > (2,1,):
             cmd += ['--pinentry-mode', 'loopback']
 
-        cmd += [input_file]
-
         try:
             if passphrase_file:
                 with open(passphrase_file) as fobj:
                     passphrase = fobj.readline();
 
-            job = subprocess.Popen(cmd, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
-            (_, stderr) = job.communicate(passphrase.encode("utf-8"))
+            if not output_suffix:
+                output_suffix = 'asc' if armor else 'sig'
+            output_file = input_file + "." + output_suffix
+            with tempfile.TemporaryDirectory(dir=os.path.dirname(output_file)) as tmp_dir:
+                tmp_file = os.path.join(tmp_dir, os.path.basename(output_file))
+                cmd += ['-o', tmp_file]
+
+                cmd += [input_file]
+
+                job = subprocess.Popen(cmd, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
+                (_, stderr) = job.communicate(passphrase.encode("utf-8"))
 
-            if job.returncode:
-                bb.fatal("GPG exited with code %d: %s" % (job.returncode, stderr.decode("utf-8")))
+                if job.returncode:
+                    bb.fatal("GPG exited with code %d: %s" % (job.returncode, stderr.decode("utf-8")))
 
+                os.rename(tmp_file, output_file)
         except IOError as e:
             bb.error("IO error (%s): %s" % (e.errno, e.strerror))
             raise Exception("Failed to sign '%s'" % input_file)
-- 
2.34.1


