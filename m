Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB4F7DF0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:20 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id t87so8435029pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oSFjNTiUAMgs0RDY9pdjgzNLIrLd90ia8yKUU2VzKFg=;
	b=IYDQjisSW+on5CSmJ7TZKbuX3HVc89o+Hb2vyxdAwyWVHTg7BNm6O1cbS5LeIcb3AI
	nPAVgjxq7iJtSF/Rnm7UVnm6ZuSpINjzEcwqXRueOUKEWWjpzcsJqM5qeTS4hebc5Brf
	jz07qSt66CjPyUYw84Yi+biGv1wRSWwVs4XibechW+nxWlDZepsbUa1GX2udM7OQEM5p
	TCRgVRkfIO9rN58bE1Fup37IHjWptKbCb179fEyg6uB7RO2RYZzXPMemytGH0pIgv+Wj
	TYt5Mm7j+K/FAcoPweOi20puNxcZB9zN85T7nJdhOVpHyiL68AsR2CXSDVAi68RH2Qfm
	NqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oSFjNTiUAMgs0RDY9pdjgzNLIrLd90ia8yKUU2VzKFg=;
	b=ayAgFNG0eHRHE2ygh0VEa8PSGhlM106kqOC86rostQd4c6XJA5Bd/uV0B7YjZGrD+V
	uyXmgv09roFaH4z6u+qNLDFQmsFJoMyiXo8kKti6tBDv43/f5QNrOU0RrB8hvBq68bod
	KMhBz4LBzfbJsamTvCjpNLR+7Z5W7yRj5et14TLp7OUQFajYl+Oho7EOV/LMl9ePi7nB
	mQCEk0rlEbZypos/sUOKJiFyWbCFY0QxKGHNWQBCcYHX4GWCHUB80ecPP+le65rg3yev
	1W5tsRXtLkwCFO7FD0venT5X+gxQPr8ADklcYF9sxhFgt5zNNP8qGzKAw5VZIwKbApAz
	UJDA==
X-Gm-Message-State: APjAAAXMDt4wKYY7iFQ9ODl8ssoDCPOwnVM+REW8DuZ71FjE6Mfer8ik
	OAGCHFLbfgvmAX0wNkJx6BcT6px5
X-Google-Smtp-Source: APXvYqx2BCzHYS94EB01DkMo2Scg9miHXmrCf9ef7KTJTFgo91RNWvW+GelDHHF+hoXWP+lzmyhqww==
X-Received: by 2002:aa7:8008:: with SMTP id j8mr38177400pfi.120.1557809661458; 
	Mon, 13 May 2019 21:54:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:56 -0700
Message-Id: <918e15e22c797d52d33c3399324e480aa1a2cc7f.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 14/23] oeqa/ssh: Avoid unicode decode exceptions
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
X-List-Received-Date: Tue, 14 May 2019 04:54:20 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This code really needs to be rewritten to not split potential
multibyte characters, for now work around it to avoid exceptions like:

  File "/home/pokybuild/yocto-worker/qa-extras2/build/meta/lib/oeqa/core/target/ssh.py", line 211, in run
    data = reader.read(1024, 4096)
  File "/usr/lib64/python3.6/codecs.py", line 503, in read
    newchars, decodedbytes = self.decode(data, self.errors)
UnicodeDecodeError: 'utf-8' codec can't decode byte 0x92 in position 0: invalid start byte

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/core/target/ssh.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 8ff1f6c..2adbb30 100644
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
2.7.4


