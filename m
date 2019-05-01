Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id B77FE7D6D0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 09:00:48 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id p21so6532109wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U2Dy4aXhOdJN4Zv/iIVC1Iu4FMNpbCc12vJ+Rwr6ewE=;
	b=QvS5g3/sE38u9y/hHryDWtXRuPYBn7TQwjZtlf0q1MQkUr0kqhZYqIHWmRnuURi7UL
	P7Ac0p4N8pkH/feUnbFMYV9+qYO1Fvr0T4YlHAO/XDerA5vmN6ofurNfdNUK3iTX9Y23
	B/K9f5xi5ClRwURteoByr3gYTYtuAVIpq2olY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U2Dy4aXhOdJN4Zv/iIVC1Iu4FMNpbCc12vJ+Rwr6ewE=;
	b=WdvfV8K76a0C51YQszKurELn1g8GmF9oYJv8PPHHnHsHVqP9pL02I6eX/Nh6KbHZVm
	7xJxNgcGvbRaQregUm1jxR28k9qZdMy4O8ysH66QVJp9NxkrYYPU2ouoGvfDmcN6+zCP
	pFzwdd5tpugqPBEgD0USB0D6DNhiZr+GrQ88+77WAf3njHnFkiMFzTfMjKHkWyVAiO5d
	D9dtqSxnbPhxo6boY3AGD7EDlq+eBh7Jovy35Jsr8hhsQl4cDJlt9CyTCtJrSO5kt2vT
	ivW1MRZ6F85MtIxdK/+/npTysXCccOOuIE6euU8pySUYHBeKB0YHKHZO3Z5id7SKF9H2
	jRiA==
X-Gm-Message-State: APjAAAUY9EIKnGGh36NeOeCTsmX5OAFBG7LRZi+HjvZphILimhd4CgYp
	Fhee4hMbszwwSWD3V41azDLO8TYMmyE=
X-Google-Smtp-Source: APXvYqy+48SHy2hi14mFJFWFOKweXiNk9O4gOT/1pBxqLmRgdPgSnk+hYKs3754vwQ4J835hTiJ2qg==
X-Received: by 2002:a1c:7e8a:: with SMTP id z132mr6100590wmc.92.1556701248991; 
	Wed, 01 May 2019 02:00:48 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16sm23612517wrb.31.2019.05.01.02.00.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 02:00:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2019 10:00:47 +0100
Message-Id: <20190501090047.29835-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/ssh: Avoid unicode decode exceptions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2019 09:00:49 -0000
Content-Transfer-Encoding: 8bit

This code really needs to be rewritten to not split potential
multibyte characters, for now work around it to avoid exceptions like:

  File "/home/pokybuild/yocto-worker/qa-extras2/build/meta/lib/oeqa/core/target/ssh.py", line 211, in run
    data = reader.read(1024, 4096)
  File "/usr/lib64/python3.6/codecs.py", line 503, in read
    newchars, decodedbytes = self.decode(data, self.errors)
UnicodeDecodeError: 'utf-8' codec can't decode byte 0x92 in position 0: invalid start byte

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/target/ssh.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 8ff1f6c677c..2adbb3000c8 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -207,7 +207,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                 logger.debug('time: %s, endtime: %s' % (time.time(), endtime))
                 try:
                     if select.select([process.stdout], [], [], 5)[0] != []:
-                        reader = codecs.getreader('utf-8')(process.stdout)
+                        reader = codecs.getreader('utf-8')(process.stdout, 'surrogatepass')
                         data = reader.read(1024, 4096)
                         if not data:
                             process.stdout.close()
@@ -234,7 +234,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                 output += lastline
 
         else:
-            output = process.communicate()[0].decode("utf-8", errors='replace')
+            output = process.communicate()[0].decode("utf-8", errors='surrogatepass')
             logger.debug('Data from SSH call: %s' % output.rstrip())
 
     options = {
-- 
2.20.1


