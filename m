Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B12BB7D5A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 11:29:43 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d12so14796196wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yElJjipnDwNLxlfNoBDxw+iPaSxAoPggHFBoTWdSkrg=;
	b=LW6JhfxcLJM6ji5iGTmGNqvrdbDBZa9wPTROXzCFc2GJ6BFgTpFN0Nx39wszov5cY6
	LQUpuQAFgJthB6MvRM3JaDtGt59ThhPuwrlmgjZXnSLAOChyp87qvroPDNWPA9jHkApY
	Vv1xfN0Tky02QJUttGSaE8Z+H4seI682oueWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yElJjipnDwNLxlfNoBDxw+iPaSxAoPggHFBoTWdSkrg=;
	b=d/NjACg8bYtUx+eZ0jL1mBbJda8vfan0SwwW2rKvlRPCEDnLAkHRw8rsqK+PhsJRn4
	51tCc0Owfrq7uMxOcvZuzNmWO90Aw5ZLUUTp5ldefv4+TDOZp4qBOCXAer9fwOQ2jm4j
	wEGr2QiJHkRG3IFPhtDVTMpi6XjiscxFvyln30Yg0idCXz8V50aZ+A8vYxBPijge2/7B
	LfHbFH0PsJdpblynKTfd5bu3FFbW2B+dfW//uqwA6F/iuNwkn5PFxWvQo4RNqaOZxFOF
	eZh6pbO2miD3vgbkROQZuVxDf/H8rw6aEcQB6zF+BMbV5Wwvh2tTOR+nbPz/4/CifIdo
	DtPg==
X-Gm-Message-State: APjAAAWPhJBvgpYady/l7UPKoWoYkKfuCvsKf+VnbblnjzQvBa+2v+sB
	DokuYhykCJE2/ulRLfAukwfH+OgLU+0=
X-Google-Smtp-Source: APXvYqx3xUtIiY7OKcrTXcsNdFmAWZLzFolUw7YLHEBEXeb6pCm4IUoBEt3tstwkSY9vaVd/7pcbuQ==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr6216706wrj.182.1557746984151; 
	Mon, 13 May 2019 04:29:44 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y132sm8868725wmd.35.2019.05.13.04.29.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 04:29:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 12:29:42 +0100
Message-Id: <20190513112942.14103-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/target/ssh: Replace suggogatepass with latin-1 codec
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
X-List-Received-Date: Mon, 13 May 2019 11:29:43 -0000
Content-Transfer-Encoding: 8bit

We continued to see encoding problems with ssh commands run in oeqa. After much
research the conclusion was we should use the latin-1 coding which would avoid
the problems.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/target/ssh.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index cf3d44d12d5..3dee03385d2 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -210,7 +210,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                 logger.debug('time: %s, endtime: %s' % (time.time(), endtime))
                 try:
                     if select.select([process.stdout], [], [], 5)[0] != []:
-                        reader = codecs.getreader('utf-8')(process.stdout, 'surrogatepass')
+                        reader = codecs.getreader('latin-1')(process.stdout)
                         data = reader.read(1024, 4096)
                         if not data:
                             process.stdout.close()
@@ -237,7 +237,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                 output += lastline
 
         else:
-            output = process.communicate()[0].decode("utf-8", errors='surrogatepass')
+            output = process.communicate()[0].decode('latin-1')
             logger.debug('Data from SSH call: %s' % output.rstrip())
 
     options = {
-- 
2.20.1


