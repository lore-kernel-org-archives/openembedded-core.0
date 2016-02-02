Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0D827772A7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:52:44 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l66so43341953wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 13:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OjILF0nFfayZ/WIiGlak0ODwckgrosQLpb+GKKDQug8=;
	b=M/33216+tfRJaiCjzy+1O/0Z/eXdveDTy46Vd4qGidA63GI/+JIyNb9Q8LJaHd94hX
	U45DRVQSxeH6WMbf0cnPkGdgxavs/L1bmURlgsBmxBwwdqls4gf8fnHdeGPv0SUftEFl
	Kz1TxEAFL06/W9nm2YkufUvswyTFDdkEqQTQA0aWyO9DvO9TC5S2+8F0NbBt6xFlTf4q
	IxyBfDjO3Op3UYIQawzYqoVBm0/7E6zVag11rzCMHGIXub5iVmloN0GRb0cL41v7rx6Y
	lfPLWrGUaazpAbvNWw0i8JxtQ3hexI7Yt1NcB9nN1vy9tBDkCz36NAiFIcSYTMkvpmKn
	lWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OjILF0nFfayZ/WIiGlak0ODwckgrosQLpb+GKKDQug8=;
	b=LJ9FvSU5Gg+jma1/lgHegoDSV6HmmZu0DenqDx7Tx3IrmIC8FDEhX5Es9WGu6+5SS7
	fngKgBG7e5/w2UcYx8VGW3k0dnmiVc37HrcgFkZZ110ozUcPXnZfGZxBZxWUGec6++tv
	al8/kUKjb5Wb2qyj4SFwQyPVNgQaWSlJU2GCnOmDC6IZzFDqwwzShBibA6RZOHJOqChX
	jFNJzNClyDKWrRmYicUI3XQr5eROmtWEsltQBM8bjGWS/mZqs6bTY/cDcoPXNq5WMzFH
	rBgXDSu9XJLzkrDar6BvVDJJZXb+JZo4b4U+WxVqIo13iAN7pOP37rS+pXjNPISERPfS
	9vFQ==
X-Gm-Message-State: AG10YOQ1A1BGSBUr52g0VeX+skkwCiK+v//LTT9F/UscMH6szQoG9m5LhJc7hAVq3MEWIa2s
X-Received: by 10.28.173.71 with SMTP id w68mr21545826wme.88.1454449965169;
	Tue, 02 Feb 2016 13:52:45 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y188sm4759194wmy.11.2016.02.02.13.52.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 13:52:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 21:52:40 +0000
Message-Id: <1454449960-7604-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] meta: add ASSUME_PROVIDED dependency on wget-native for http fetches
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
X-List-Received-Date: Tue, 02 Feb 2016 21:52:45 -0000

For clarity and consistency, add a dependency on wget-native for any URIs that
will be fetched using the wget fetcher, and add wget-native to ASSUME_PROVIDED.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 4 ++++
 meta/conf/bitbake.conf    | 1 +
 2 files changed, 5 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 75c9acc..82ec0c9 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -554,6 +554,10 @@ python () {
     for uri in srcuri.split():
         (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
 
+        # HTTP/FTP use the wget fetcher
+        if scheme in ("http", "https", "ftp"):
+            d.appendVarFlag('do_fetch', 'depends', ' wget-native:do_populate_sysroot')
+
         # Svn packages should DEPEND on subversion-native
         if scheme == "svn":
             needsrcrev = True
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0617b73..6e126b4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -179,6 +179,7 @@ ASSUME_PROVIDED = "\
     texinfo-native \
     bash-native \
     sed-native \
+    wget-native \
     "
 # gzip-native should be listed above?
 
-- 
2.7.0


