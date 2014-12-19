Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC86728CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 07:30:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ7U2gW010718
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 23:30:02 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Dec 2014 23:30:01 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 15:30:04 +0800
Message-ID: <6ba068e4f753beabdb086cf0a0b1a8a8703bfd71.1418974166.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418974166.git.Qi.Chen@windriver.com>
References: <cover.1418974166.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bind: fix conf.patch to add db.255 configuration file
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
X-List-Received-Date: Fri, 19 Dec 2014 07:30:03 -0000
Content-Type: text/plain

Add in conf.patch /etc/bind/db.255 file so that we don't get the following error.

    zone 255.in-addr.arpa/IN: loading from master file /etc/bind/db.255 failed: file not found

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/bind/bind/conf.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 2785c6a..57dbd4e 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -55,6 +55,22 @@ diff -urN bind-9.3.1.orig/conf/db.empty bind-9.3.1/conf/db.empty
 +			  86400 )	; Negative Cache TTL
 +;
 +@	IN	NS	localhost.
+diff -urN bind-9.3.1.orig/conf/db.255 bind-9.3.1/conf/db.255
+--- bind-9.3.1.orig/conf/db.255	1970-01-01 01:00:00.000000000 +0100
++++ bind-9.3.1/conf/db.255	2005-07-10 22:14:00.000000000 +0200
+@@ -0,0 +1,12 @@
++;
++; BIND reserve data file for broadcast zone
++;
++$TTL	604800
++@	IN	SOA	localhost. root.localhost. (
++			      1		; Serial
++			 604800		; Refresh
++			  86400		; Retry
++			2419200		; Expire
++			 604800 )	; Negative Cache TTL
++;
++@	IN	NS	localhost.
 diff -urN bind-9.3.1.orig/conf/db.local bind-9.3.1/conf/db.local
 --- bind-9.3.1.orig/conf/db.local	1970-01-01 01:00:00.000000000 +0100
 +++ bind-9.3.1/conf/db.local	2005-07-10 22:14:00.000000000 +0200
-- 
1.9.1


