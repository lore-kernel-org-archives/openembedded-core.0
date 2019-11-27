Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A0BE67FC0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 14:00:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n1so26820427wra.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 06:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5cJjUG1a3bmsMm5Oa0wAoGpp01I4V5fHIofG00dya7k=;
	b=cGRWYTiHi3zki4G32yKnJ/tkfeWVMtAoQ8POQDTQ+OuTAof1FmfmaEbLiKAUl20b78
	SUnJxA+Kzw19xwkAVozLOduMlQnJG6UgEeMulon0nZD8W7j2ndM2oFmYxiWwo3qVaIQB
	dKEOsaSaHAz7rgWoWuij92wOfC1vQy+poS5lTqw8fwPHBnGydb3E4kAojViWWcd4qAZN
	Z8zkeOOBhTBMv1n28jIsaamnB/enUkOEBQEUcrdlg/sROx7RSBSrK6X4W0Bo/ovVonlQ
	wm3qI6Gfl3oUFBXCts0cYGEfXRarIMaidFq2THZoLHCInSaY+p2a8t2w5DqqGdXmuMTC
	vCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5cJjUG1a3bmsMm5Oa0wAoGpp01I4V5fHIofG00dya7k=;
	b=OyMxwnwLAxrUO5D4JTQG+l1TBOU/ve2RlFOJ2Cb4EqizKJ17fIpU8Bw6Q1QnYNzT30
	A/cUeH/D1Pwbs1AK7dgyd5D8zeOZ3G5ahCvy2MvdyPwIQrl0wSd/xgrbWQoFafz7RQ31
	5FcnaSiiLtIL0tt7ujhcdazNd4HdSApjg1V7nzUjW+F4AuuPCkbWc3A4wtEvJ/ACOQ4+
	iZHGxyrajVi6C6iPgPaonqgZ7ujHJcR/i/CfspuraQR+VxtEGrs5cNFsLCPwYDCJ+bWy
	tzclQe8xZ3Qq6TZURuMFPD+UX3b/2sP7S3FwYN8rFHYedrxCe+94149VMUKr2y6nS4G/
	DKGA==
X-Gm-Message-State: APjAAAVxwj2C4CDewqUfzN/uItimmeN2RM4rx2v1WX1j5+AhjukUydaO
	FtLmevE0knITSm24dj5bZj7leaKRAF4=
X-Google-Smtp-Source: APXvYqxtB/AzHuFvqdp4z/ynVUrmgPj1+xbwRd9KaQpoZBf2aT7RUqlITU1ROIkiDL3BFaIkIuYe/Q==
X-Received: by 2002:adf:f709:: with SMTP id r9mr41456456wrp.8.1574863237945;
	Wed, 27 Nov 2019 06:00:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o1sm19372284wrs.50.2019.11.27.06.00.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 06:00:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 14:00:27 +0000
Message-Id: <20191127140030.7838-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127140030.7838-1-ross.burton@intel.com>
References: <20191127140030.7838-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] python: package .pyo files too
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
X-List-Received-Date: Wed, 27 Nov 2019 14:00:38 -0000
Content-Transfer-Encoding: 8bit

The manifest parsing code was only adding .py and .pyc paths to FILES,
generalise the latter to .py? so it catches .pyo files too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python_2.7.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.17.bb b/meta/recipes-devtools/python/python_2.7.17.bb
index ef5d5644812..5807f63db44 100644
--- a/meta/recipes-devtools/python/python_2.7.17.bb
+++ b/meta/recipes-devtools/python/python_2.7.17.bb
@@ -218,7 +218,7 @@ python(){
             d.appendVar('FILES_' + pypackage, ' ' + value)
             if include_pycs == '1':
                 if value.endswith('.py'):
-                    d.appendVar('FILES_' + pypackage, ' ' + value + 'c')
+                    d.appendVar('FILES_' + pypackage, ' ' + value + '?')
 
         for value in python_manifest[key]['rdepends']:
             # Make it work with or without $PN
-- 
2.20.1


