Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DAAC5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:22 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.596.1700498354523683027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kziZHxJp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6cb55001124so1250037b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498353; x=1701103153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLvvcZQl0NYNGQszSC6Ml60jQAnbEFidx1FBeBPU7gY=;
        b=kziZHxJpof3ZwvdgvKwzeoouWJ/JASn3qMhNfg/XtDxqXWL9MM57aM0VOo/TvGUcop
         CY03zJYtwaEfR18gtvzK3a9yyMo77vqqJ0Nkc6kMmNnji4inUcdX+CsKpsiaHuGOASkF
         018dfxsumQIyQ1nfolv/HPTKIJMbICtQW4FXbiiHkMTmWly6O7WM07iYVK1S1JY/hJmh
         Iewdd00mF3HDvUPrTg0KDJzS0x8QpkYJGgUA5U3Mqt48QC6m32DqTh/0K+8GMLUNZqGg
         BxVkb8cy+pr9/DSCW0wshotQTFnUP8vi5RSMleqOuhuPekjM+XMJbePSIvAnoCdv8r/w
         NtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498353; x=1701103153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLvvcZQl0NYNGQszSC6Ml60jQAnbEFidx1FBeBPU7gY=;
        b=gHgtSmzqRKlA4uwpRcxpHN49wSfB1uX+xx6w14Hiv2PHsGGmgWEgoFPMhCB3/sUfU9
         rvo3oQjlSIrz9zCONrit5KuAItBmZ3/9xR9GQTfieCZfceaSHmyS2AlOWnW7MlPCRWp1
         bpb/RBZzxnxU5wA2r7Bb4hnLmQwO2V91tXat+TvbNls8l/f3LSSPgRjO1ziI4+AMpNm/
         ICo20WuaXu9CJ550BEZ5jGgh2RGEiaNLjim5J/moTGKqELM8Ak8elmKz+SgIPfBc6/wM
         eF5bSAfUk1L8IBQUJ4NdFn/m4XT8iWbXoL+Mz1+aBmZGyhKyZMXwo4MCDCMpGiScVOvU
         HaoA==
X-Gm-Message-State: AOJu0Yyk2WgE4Gadgoscz+6Pr/RlSF+pT6Xl1KPK3mOm81uXshG951K6
	5uFIBXCg8GFs0b4ZGRO3msrWYzOQ9vsCcO85iKADVw==
X-Google-Smtp-Source: AGHT+IH7GAWA27KUBbqi3aMNMTiAJW5vnaFCFFK7MSO8pFZqZH1/2Gcx1vKpVRev+P7ByLOQ4thv6w==
X-Received: by 2002:a05:6a20:6a0b:b0:187:b2cb:2b0f with SMTP id p11-20020a056a206a0b00b00187b2cb2b0fmr12216pzk.8.1700498353078;
        Mon, 20 Nov 2023 08:39:13 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 09/33] oeqa/ssh: Handle SSHCall timeout error code
Date: Mon, 20 Nov 2023 06:38:23 -1000
Message-Id: <82215c855ee39b4e39f24113241a7fb3f20f9531.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190898

From: luca fancellu <luca.fancellu@arm.com>

The current code in ssh.py is terminating the ssh process that
does not finish its computation in a given timeout (when timeout
is passed), the SSHCall function is returning the process error
code.

The Openssl ssh before version 8.6_p1 is returning 0 when it is
terminated, from commit 8a9520836e71830f4fccca066dba73fea3d16bda
onwards (version >= 8.6_p1) ssh is returning 255 instead.

So for version of ssh older than 8.6_p1 when the SSHCall time out,
the return code will be 0, meaning success, which is wrong.

Fix this issue checking if the process has timeout (hence it's been
terminated) and checking if the returned code is 0, in that case
set it to 255 to advertise that an error occurred.

Add a test case excercising the timeout in the SSHTest, test_ssh
test function.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 948fecca1db4c7a30fcca5fcf5eef95cd12efb00)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py   | 17 ++++++++++++++++-
 meta/lib/oeqa/runtime/cases/ssh.py |  3 +++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index f22836d390..f4dd0ca417 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -232,11 +232,12 @@ def SSHCall(command, logger, timeout=None, **opts):
         output_raw = b''
         starttime = time.time()
         process = subprocess.Popen(command, **options)
+        has_timeout = False
         if timeout:
             endtime = starttime + timeout
             eof = False
             os.set_blocking(process.stdout.fileno(), False)
-            while time.time() < endtime and not eof:
+            while not has_timeout and not eof:
                 try:
                     logger.debug('Waiting for process output: time: %s, endtime: %s' % (time.time(), endtime))
                     if select.select([process.stdout], [], [], 5)[0] != []:
@@ -257,6 +258,10 @@ def SSHCall(command, logger, timeout=None, **opts):
                     logger.debug('BlockingIOError')
                     continue
 
+                if time.time() >= endtime:
+                    logger.debug('SSHCall has timeout! Time: %s, endtime: %s' % (time.time(), endtime))
+                    has_timeout = True
+
             process.stdout.close()
 
             # process hasn't returned yet
@@ -293,6 +298,16 @@ def SSHCall(command, logger, timeout=None, **opts):
                     pass
                 process.wait()
 
+        if has_timeout:
+            # Version of openssh before 8.6_p1 returns error code 0 when killed
+            # by a signal, when the timeout occurs we will receive a 0 error
+            # code because the process is been terminated and it's wrong because
+            # that value means success, but the process timed out.
+            # Afterwards, from version 8.6_p1 onwards, the returned code is 255.
+            # Fix this behaviour by checking the return code
+            if process.returncode == 0:
+                process.returncode = 255
+
     options = {
         "stdout": subprocess.PIPE,
         "stderr": subprocess.STDOUT,
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index 13aac54396..cdbef59500 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -13,6 +13,9 @@ class SSHTest(OERuntimeTestCase):
     @OETestDepends(['ping.PingTest.test_ping'])
     @OEHasPackage(['dropbear', 'openssh-sshd'])
     def test_ssh(self):
+        (status, output) = self.target.run('sleep 20', timeout=2)
+        msg='run() timed out but return code was zero.'
+        self.assertNotEqual(status, 0, msg=msg)
         (status, output) = self.target.run('uname -a')
         self.assertEqual(status, 0, msg='SSH Test failed: %s' % output)
         (status, output) = self.target.run('cat /etc/controllerimage')
-- 
2.34.1


