Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web08.164.1627387457926287156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 05:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=GF+f90Mh;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627387456; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LdYla/6AQ0dAIR/nU34eEzvnMqTfjCDgmrSfqtp2ooy9HXU5Xx9t+H2poCgvdOCh/UYpjU6VV5ARoP49z7ep/OdgXYPoLFPvz4XrPoWW3zQ3euDu2NcC39nQam2VpbjvKRgFvmeaqFtHw+HGPJlqp+v9u+fRysJu/JLLNnRQH0A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627387456; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=2ZmRFRS+T6LIW8wScGvhVs6KDzpJJq7JwRVfVVlyMfw=; 
	b=jz/Tws+TVpAlC/c58yngT6m1Bcme0/c/Me+qgYCANVduyLpnAgd6Rj25fICDY/59VhhcYB+hH14Bux5vVRHCnUzIzgHiNWtjai2ibKjIdQUukCTRxIpsConiH4lpLJQQcriW+SsDba1HfrQ4kpXWCHaFAmOgapTX8AWWDlo6hn4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627387456;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2ZmRFRS+T6LIW8wScGvhVs6KDzpJJq7JwRVfVVlyMfw=;
	b=GF+f90MhsIdArgH4ymz6LJq8hnT/y0jTaiMRkTU8YtH0oHB45vYwe2M4ZG4fEaEH
	6KAG8dyaGFlY5JqCDdqCVRIo8hvfCM5RU/KUX/+117vMA89wWoU5feLurDr2nNPHUrw
	8hvBUkYPvlSCcwTrjNSP9kRQiUw3jix0P4JSpFN0=
Received: from localhost.localdomain.pl (91.230.58.69 [91.230.58.69]) by mx.zohomail.com
	with SMTPS id 1627386551310912.9791652483618; Tue, 27 Jul 2021 04:49:11 -0700 (PDT)
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH pseudo 2/4] Do not pass null argument to pseudo_diag()
Date: Tue, 27 Jul 2021 13:49:04 +0200
Message-Id: <20210727114906.191837-2-dwrobel@ertelnet.rybnik.pl>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the following warning:

 pseudo_client.c: In function ‘pseudo_root_path’:
 pseudo_client.c:848:17: warning: ‘%s’ directive argument is null [-Wformat-overflow=]
   848 |                 pseudo_diag("couldn't allocate absolute path for '%s'.\n",
       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   849 |                         path);
       |                         ~~~~~

Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
---
 pseudo_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pseudo_client.c b/pseudo_client.c
index 579db33..2583bca 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -846,7 +846,7 @@ pseudo_root_path(const char *func, int line, int dirfd, const char *path, int le
 	pseudo_magic();
 	if (!rc) {
 		pseudo_diag("couldn't allocate absolute path for '%s'.\n",
-			path);
+			path ? path : "null");
 	}
 	pseudo_debug(PDBGF_CHROOT, "root_path [%s, %d]: '%s' from '%s'\n",
 		func, line,
-- 
2.31.1

