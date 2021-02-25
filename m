Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
 by mx.groups.io with SMTP id smtpd.web09.9687.1614250011766386463
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 02:46:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=AuRSVIMW;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.244, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id FEAOl6RTBEfgXFEAQlw5u7; Thu, 25 Feb 2021 10:46:49 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=WomwzeXv c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=qa6Q16uM49sA:10 a=-An2I_7KAAAA:8 a=TiV4sSWH4NyUlrxjU1QA:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=g3mZMHQ/jCjvi9+mdFZ2ttEKLi96iKio51VD7Pq2j5E=; b=Au
	RSVIMWV7s+AjPlh20f/ZDl12kmsu5eUFRI3SAbyVVxzNc6mgPTC4H0mG6FijYdxq48RY1odnxWDdt
	txgyq01qW1nwywg46s3SiJC7DtFplsKHAXKIZmRyjJjkJNCpRWSa3oIjbhQn8eQjahz7cQkSpvwjV
	4dUu2dyR7PX2Fs6f/WpCryKkg0rH1USpjC/pf/Cg0ehytHBFoiu0VWlavHLHS0lAvkIquRQL56hAo
	MFtnQ3l9J1b/mO1tGCYr8PbFNIgRX18AOUns65Svc+TfF9yLTY7A3prvk2lau4a49bk6j0cJccdd4
	3cBXFw00S8aedCyI8JziZph40ZzilPtQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1lFEAN-0001oo-JA; Thu, 25 Feb 2021 10:46:43 +0000
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] externalsrc: Pass through npmsw URIs in SRC_URI
Date: Thu, 25 Feb 2021 10:46:27 +0000
Message-Id: <20210225104627.10375-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJtiL0bn6zMZMcTTkxM8i1ILyTIkEa9Xm2zusWsA9XhY8SRJ/Y3oUjjoJJ/rvAcpPOJfxRdKRLy2kFMwTUUZg3aurlQRThXxJ6RTnqoLyhMLWTRh7Fqz
 0/qGhu2ugkBG5ATyt6opjiJPKMMTg/7xbGXKZwUsinliSNIqqZRbqbVsEs6tBZdeD4e7I6WQO1vB1A==
Content-Transfer-Encoding: 8bit

NPM shrinkwrap files need to stay in SRC_URI even when using
externalsrc so that npm_do_fetch can run to fetch the required
dependencies.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/externalsrc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 64e94e3301..c7b2bf2f49 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -68,6 +68,7 @@ python () {
             url_data = fetch.ud[url]
             parm = url_data.parm
             if (url_data.type == 'file' or
+                    url_data.type == 'npmsw' or
                     'type' in parm and parm['type'] == 'kmeta'):
                 local_srcuri.append(url)
 
-- 
2.20.1

