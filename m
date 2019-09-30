Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF6060807
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:10 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id i30so6693937pgl.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=8TBnuWQ3nIXwo9AjsPiT62zFLW06OGuohcF4DO218I4=;
	b=lgS5rHn49gn4db91o7GSubEq79fHyRvBfwCNJMq2/MtfgKraP13/4SJ8q6U/Ou/AsP
	7YpSvbSe/9pCZytIVqtUBWKm9+QCjL2EyarrqkQ+MVih3TyfdTBsFB8EqlRXTRp1XC6o
	t3Lr55LL1P+0ryFqfgTbd8vyvk0XudOR8TDQ4BaKmYSkRAauz0tS+q2gLHO5DDvijykm
	b1HTfdLWmrZOCx+Rd8xfTagZWwmigwZrt3EcH2Ov7sia6dGRg7vRE79RRo680N2EjDDt
	6+2OCmCQOeS3hlvmuCNyU+VHIb1C2lVDZa8oSMsaGjh8ukj6KNJtMb/UWks6g4WwBtCM
	3b3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=8TBnuWQ3nIXwo9AjsPiT62zFLW06OGuohcF4DO218I4=;
	b=nkpVyO5AjFHpXk07uWGmBVjZGP7Dgf6MlwsfxYJTCh1BRcc3qkyJOdXPh/vIaYTpOp
	UYPZIBLRMJMBCrdYHNUk9xoL6YIzomnVryfwFpwfUBUKRrR36XOpHkuDnFq9lP+zuacB
	6xxfUqkkWHWQtR4Rpf0UoFD5n3HIessIp+pn4+/xnF+4vY5FXTAfkOt63/6GZv+paRdi
	pTrQNY3fs9SCe/sOP35Na185NTR06U3dolLLJtzJ0Yc/55uwy6cjR4rYaIn2+O/jCB/o
	F6wotBIXIDGnKrhoGwggAUxMmvS9+pSvwr4FPFLntA7yz6F25aeU0Zv0Rvxsf9Dr9U5L
	GY0w==
X-Gm-Message-State: APjAAAWG/jBmnKlUaoB4U+XL4QjiBe8susdS587PgAriExoUU6GhJ2yR
	ngJcHAmNHEo7VwpUt8etlgd6CSNRNAs=
X-Google-Smtp-Source: APXvYqyufpxCAVtmKSa4+oeX+3DulhlYuGDV9itq6VZ/7HKwd2cSvwePPP9Tk3+DshoU2wSAIVsezA==
X-Received: by 2002:a17:90a:db47:: with SMTP id
	u7mr23540225pjx.40.1569818891883; 
	Sun, 29 Sep 2019 21:48:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:13 -0700
Message-Id: <fe6546aab208e5fa2e238aa266db0ea66ad520a1.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 18/54] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joël Esponde <joel.esponde@easymile.com>

populate_packages relies on ``mkdir`` to both create a directory and set
its permissions. However, ``mkdir`` honors the ``umask`` value.
Therefore, some bits may be lost in the operation. In our case, the
setgid bit on the directories were lost.

This commit fixes this by having a distinct call to create the directory
and to set the permissions.

Signed-off-by: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2c44fc1..472d542 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1210,7 +1210,8 @@ python populate_packages () {
                 src = os.path.join(src, p)
                 dest = os.path.join(dest, p)
                 fstat = cpath.stat(src)
-                os.mkdir(dest, fstat.st_mode)
+                os.mkdir(dest)
+                os.chmod(dest, fstat.st_mode)
                 os.chown(dest, fstat.st_uid, fstat.st_gid)
                 if p not in seen:
                     seen.append(p)
-- 
2.7.4


