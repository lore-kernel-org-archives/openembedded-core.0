Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 06B35746DC
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Apr 2018 21:15:30 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id v207-v6so18328872lfa.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2018 14:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aeEZnvvtCtrqt5MrXOBs7WbGnE+h45uUmu2PuVVYfoo=;
	b=bErb8Rq6BnYW0Nxd/A6ZbzNJLOGEdoLMmhhM4WFx0EDcv2gmD5aPikUjnkh/t9d80C
	AnjellZsdXIz+2+vBc2w2IWp4AdPxH4ejDVSfM6Opka4EaAo4nluGcB8qG3G4ffSdckc
	7eQI8gTz9LsHI+PuWKa0gXkaVjoakAh5o+OAKKBvXF8f0GS7h8aNAqqm9OEvmrDk7Ghc
	+IEbxLa/4JAAbxFLhx095TFdHbhZ5UliOmEjrNxxrVa/sBFTTxYkemeg6Tf515JrfZBU
	vUovgMeWbzEhdV6iBckIwrpPh1S8wqlV1xNFJlAhJm/GvnCw2iPRfCgx34JcjD/nkDig
	jXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aeEZnvvtCtrqt5MrXOBs7WbGnE+h45uUmu2PuVVYfoo=;
	b=E47Z7ayGQAoPqBKWbjsIH4yowtsgFPpSNwZr2UxLOdPZfAxetNdLah2dYznMPWAC1y
	u+EgKeuNwSwezhJeyzWnBteiM3OyaO7oiWfskPC2qBeChiARgLq445ww7Z4tZVxaEt3g
	BaH7KnJXFI9V7FpDgH67oQOFqoI1BkqPdhKB49vPDiH9hotH2jKmyURRnGHeyLIkRY/a
	BjpKpx62Hk6LZ4aptW0AbxhYxIHn8U5JJaKrDBg58z9XdS0O5TjZUm7zEuc12Bs0D7qf
	Dcsy0YKhifNNStyxULFJ27Ry7mwRC3/+2cGBwxFz/668AfehDuek1wWtrDjXToxgWm4Y
	/DDw==
X-Gm-Message-State: ALQs6tC1+OqO57UmrnHzAZX3s8iipwyA9iCd85ixBX7Fq4F+LOWq35gC
	ohgUq7n216PgN89RpMHqlqLwXQ==
X-Google-Smtp-Source: AIpwx4/LSXmXSe6sRWrJdSLUmMeEUK3y/jTAo0lzothPyBkPGb/kQdXvstsV6FAG50cGbWppfuhhCg==
X-Received: by 10.46.31.17 with SMTP id f17mr46242ljf.114.1522617331173;
	Sun, 01 Apr 2018 14:15:31 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan (d83-183-77-184.cust.tele2.se.
	[83.183.77.184]) by smtp.gmail.com with ESMTPSA id
	d24-v6sm2622270lfc.51.2018.04.01.14.15.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Apr 2018 14:15:30 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Apr 2018 23:15:27 +0200
Message-Id: <1522617327-11940-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] recipetool: create: fix port number parsing issue
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
X-List-Received-Date: Sun, 01 Apr 2018 21:15:31 -0000

From: Ming Liu <liu.ming50@gmail.com>

A flaw was found when I run:
$ recipetool create "ssh://git@xxx.xxx:7999/xxx.git"

the url turned out to be: "git://git@xxx.xxx/7999/xxx.git;protocol=ssh"
after parsing, the port number was parsed as part of the path, this is
definitely wrong and lead to fetching failures.

This issue could be fixed in reformat_git_uri, by filtering out port
numbers when formatting ":".

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 scripts/lib/recipetool/create.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 2fc9e0a..a371028 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -383,8 +383,10 @@ def reformat_git_uri(uri):
         # which causes decodeurl to fail getting the right host and path
         if len(host.split(':')) > 1:
             splitslash = host.split(':')
-            host = splitslash[0]
-            path = '/' + splitslash[1] + path
+            # Port number should not be split from host
+            if not re.match('^[0-9]+$', splitslash[1]):
+                host = splitslash[0]
+                path = '/' + splitslash[1] + path
         #Algorithm:
         # if user is defined, append protocol=ssh or if a protocol is defined, then honor the user-defined protocol
         # if no user & password is defined, check for scheme type and append the protocol with the scheme type
-- 
2.7.4


