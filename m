Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id EDA547F43D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:41 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id b13so738071pfo.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=8TBnuWQ3nIXwo9AjsPiT62zFLW06OGuohcF4DO218I4=;
	b=DzIZUm+YRvvcOyTORIZ/R/qLVJv4eKyIKkKS8nhqJBZz53YorDAq8tjgWRYQgN2T97
	0ae7k4Cq7y/2HcTX56kWEQkGm+e/mE11Jfny6peOsjxftIoybaDRNtCJideA3Rld5nRQ
	Cx+ZrGvKbvZXpKFPlq8YhPoIn+rwWEHM7o5XwUAflU0399NpshaYJHXywXQbYj4NYOTu
	tXvfeSDAgKryoMVwRydStuaPa+dYqbTfVphTJmqf3txrRVtqukgxdmS04zlODwJh6NAX
	OFvoVSII8zPavY5aCJzPGYonskI25J5X7cdtwoYOGxh0u5t3510yanVzx31urbsGFHDB
	yU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=8TBnuWQ3nIXwo9AjsPiT62zFLW06OGuohcF4DO218I4=;
	b=iPjt1a+UJPZl7YDDGejS/5Xi7IgXKHI2UGNzuZGHPPmoVeC4Z2Wn5TClhaSRM2LxaZ
	YZbpqkaHxooRkCBwIl+x/Znj+aNJFqn737jMw7UlVqxBipNatcap3rP6+uhNz4IcUQ6y
	rEImi43AsvUX81D0lGWnBNqGio0Onx1Y/CYzywMqrESAh01Hq8gpbJ50ibynErPyZtdo
	QTWeYFQGOiIXZ0GvG1i7ALKMA2wHy8Ork3G/6jFHCAQLzhZo5CYtF0h5NEsjdMx4J2eP
	88jknZclSoECFX/LMDCmNlsAh0NMKw5iHRLm06H/q1ZZhzv/uGPVBjGwkqQor8SmrWp4
	G4qA==
X-Gm-Message-State: APjAAAUaw6qD8VV/+K/DtWk8718jSCdv/nQjLzDE0jT1AEjiGuCzkrr7
	GLijd7OyUAiNFvCGoVNOTs+VjuHt
X-Google-Smtp-Source: APXvYqw9m0pizbnjhuOb1bx2fBrGaG5LCaRz9FQTj0bSHJcQqIHcylqfpkfve/lNmVi3OrIYdeE31w==
X-Received: by 2002:a62:f208:: with SMTP id m8mr28542327pfh.108.1567348602977; 
	Sun, 01 Sep 2019 07:36:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:57 -0700
Message-Id: <c05342e30581a6280aabac621c31174eafa1ffd3.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 19/43] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:42 -0000
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


