Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB737E094
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:28 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id f97so7573748plb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=c7FbYcn7+UL73B2gCD4/NEB5CQtcFAeRALx3g6Loq94=;
	b=ekieQO6zVs2iiFb9C0KH1JOrUSqwjA3VR/4Etpc5Ze2YAVK2nyQH6A47HjmOT4gCXd
	tStgsAm3O9k7tEkgmHpAqxYoNv5vCsdNqUswK4ROHpUQOyj+K0mS+tZU2W3S+OYV11TZ
	F7A98+KglqbDr7euND/zgy4RabBlWI+afg5SrgALaiVtRzITzKzXBUl43PomDzbyhCdf
	Rqryjgk9mWTVik2e8R08Z6RPRcueaOaRHGJrFDEN/xiEFYAWFi0wqQ3dwqfsehOugRrT
	0BYnpo6K08aVhL1/LqzoSoy0xVk+Ozqhm5mjkAplOk+pP8R64V678l2PEVDaEvMTANzS
	SCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=c7FbYcn7+UL73B2gCD4/NEB5CQtcFAeRALx3g6Loq94=;
	b=RrsMl4x8DpdJHESI7i15z+3v9Od0Z4iNsC+ORb4KvqwM9NxKuuKaUUauMKrf4dlAuH
	1Ry9s2DQN7+ArN7dZHmbXx9E9Ip2Y9VJqsZMrfPCGX+XZyKZ83ZqZEfVTBi2mCgnvgx1
	D9jYW8sKo7m/g7wadym1aCfkrqEYFgq4r7NTWfL1cOqZpzy27YDn3Tbvyi+guytCavpl
	4dqTkovxwOmgn7kAo9LbLW9SF0EV6u7mZsBtcFjibmqz3+ZTAM/+vI4F6q7e6BUQhXDv
	sG6dAwdJ/SCX9RQECGZcFOqVCzqExqj6FyuA7rEJ+acfb3RY2/7N/m6X6XNH0xPY8a3z
	aCrw==
X-Gm-Message-State: APjAAAXuntGVl6O0YS3ALN5W1DEAru97+LdbSex1TZLh5R4dycI15ose
	F487pLMwtCjRMNLrwTOic5+7bYqv
X-Google-Smtp-Source: APXvYqxfFgdD/onEoWby04Zfd3zuRaenMU2n5JqUClvNb9dxPfi/vT8xvg5p1D/aCkMzQYOAMHx+CA==
X-Received: by 2002:a17:902:b581:: with SMTP id
	a1mr78121291pls.206.1558403009324; 
	Mon, 20 May 2019 18:43:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:11 -0700
Message-Id: <b876f5b6154ba2773e3ab717556e7e1a6f083b74.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 09/15] oeqa/target/ssh: Replace suggogatepass with ignoring errors
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
X-List-Received-Date: Tue, 21 May 2019 01:43:28 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We continued to see encoding problems with ssh commands run in oeqa. After much
research the conclusion was we should use ignore the errors since some occasional bad
locale encoding is better than the unicode decoding issues we were seeing which crashed
large parts of tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/core/target/ssh.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 2adbb30..0c09ddf 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -207,7 +207,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                 logger.debug('time: %s, endtime: %s' % (time.time(), endtime))
                 try:
                     if select.select([process.stdout], [], [], 5)[0] != []:
-                        reader = codecs.getreader('utf-8')(process.stdout, 'surrogatepass')
+                        reader = codecs.getreader('utf-8')(process.stdout, 'ignore')
                         data = reader.read(1024, 4096)
                         if not data:
                             process.stdout.close()
@@ -234,7 +234,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                 output += lastline
 
         else:
-            output = process.communicate()[0].decode("utf-8", errors='surrogatepass')
+            output = process.communicate()[0].decode('utf-8', errors='ignore')
             logger.debug('Data from SSH call: %s' % output.rstrip())
 
     options = {
-- 
2.7.4


