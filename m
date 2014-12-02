Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA5A072336
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 06:00:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB260Ibp014728
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Dec 2014 22:00:18 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 1 Dec 2014 22:00:17 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Dec 2014 14:00:38 +0800
Message-ID: <2d5ed9ff99319e5eb332b5008b39ee8d6e381dd1.1417499998.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417499998.git.Qi.Chen@windriver.com>
References: <cover.1417499998.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bind: fix conf.patch to remove configuration that causes failure
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
X-List-Received-Date: Tue, 02 Dec 2014 06:00:21 -0000
Content-Type: text/plain

conf.patch added db.255 confgiuration entry to named.conf. However,
We don't have db.255 configuration file, so remove this entry to avoid
the following failure.

zone 255.in-addr.arpa/IN: loading from master file /etc/bind/db.255 failed: file not found

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/bind/bind/conf.patch | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 2785c6a..7bab072 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -124,7 +124,7 @@ diff -urN bind-9.3.1.orig/conf/db.root bind-9.3.1/conf/db.root
 diff -urN bind-9.3.1.orig/conf/named.conf bind-9.3.1/conf/named.conf
 --- bind-9.3.1.orig/conf/named.conf	1970-01-01 01:00:00.000000000 +0100
 +++ bind-9.3.1/conf/named.conf	2005-07-10 22:33:46.000000000 +0200
-@@ -0,0 +1,49 @@
+@@ -0,0 +1,44 @@
 +// This is the primary configuration file for the BIND DNS server named.
 +//
 +// If you are just adding zones, please do that in /etc/bind/named.conf.local
@@ -155,11 +155,6 @@ diff -urN bind-9.3.1.orig/conf/named.conf bind-9.3.1/conf/named.conf
 +	file "/etc/bind/db.0";
 +};
 +
-+zone "255.in-addr.arpa" {
-+	type master;
-+	file "/etc/bind/db.255";
-+};
-+
 +// zone "com" { type delegation-only; };
 +// zone "net" { type delegation-only; };
 +
-- 
1.9.1


