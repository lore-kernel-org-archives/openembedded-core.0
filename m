Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3F76674C97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 10:02:25 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 193-v6so1485359wme.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 03:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ChJgn/GNLzEf0d7P4SL5VnZinbnQGp5Jynu7/EO5VBE=;
	b=KMmK57maYXRxes0Pjtv878NW7wx79/N+isajeH83BnN4ecs6yopHSN58ZBfurevIoN
	k1veaE4UdAdGQz7OLp8WDBBDWRALUugE7UiwGgUoRMBMmeHpCU9gpKjGmTVY497sVDH2
	ShsFxYq4JnWvrCDNmjWFNA0v70FCPOMspRlMc1aD2nd+3+Z4UiTmDU+E4eUrJ7TyIf/B
	XZ97v3wjB85yXTdaEq/C+5FY+0SxY6X/N5sFNFbzVnn2lgM211BadfebmNz7LcCHcUr/
	3IffEHUrjxEOoDceThnV2j3bCBLY0BkH44ukVg7hvRoVX5LCFvYadKzKlPykb5LCL+47
	wryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ChJgn/GNLzEf0d7P4SL5VnZinbnQGp5Jynu7/EO5VBE=;
	b=rLDBUFK4+8jtVkelwSRKssQREyGIIgwBLfZIMSaxlu4c3T+3kGZxwAcisyIcrHXvVT
	7UZcuJvtp29fVOY5w0OoaT0Mx0yAkErMHqNz6qGkxCyItsjqdgqH15beisXpsUBi3O2x
	Uzb/nthq+/zvPsv2hbSt4swVayu2AFs+sH5yyHiwjUIeF4oeQw/dh4FfarHAWQvFFR7p
	8pHM5GeneKYlZi3G781WnCOQNaOi4KDSNKYmuWCT0wgF9bGCVG/eA4QdE9UmD/zEhNcu
	7zT5nJF0PHxI5qvkjI5rZTTKMXkLNg7mqu1kEavFAmoIWJjbEtTtHRbdiqyAewAdzngy
	vzdw==
X-Gm-Message-State: ABuFfojZ4TxV/XG8fMNQ2UDMvp/VYnvDpmnXhUTOr81UCjzRdCAGmcA2
	WE68wDgH3kUQuVNKGT3m6A4Pj0MDO4w=
X-Google-Smtp-Source: ACcGV62WbVgLUnPwzzJQDTmKuBPuSDi//mnGIodUisKKYGWXBpCmsyp9lPj5FwJC8HkkzF9uZTunnw==
X-Received: by 2002:a1c:4c16:: with SMTP id
	z22-v6mr1991435wmf.89.1539770545474; 
	Wed, 17 Oct 2018 03:02:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b5-v6sm14236061wrr.94.2018.10.17.03.02.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 03:02:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 11:02:23 +0100
Message-Id: <20181017100223.11468-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] package_manager: warn that PACKAGE_EXCLUDE doesn't work for opkg
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
X-List-Received-Date: Wed, 17 Oct 2018 10:02:25 -0000

The rpm and dpkg package managers both support package exclusion at install
time, which we expose though the PACKAGE_EXCLUDE variable.  However opkg doesn't
support this, so show a warning if PACKAGE_EXCLUDE is used with file systems
built using opkg.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2c7cdb2e17d..4214abe9f88 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1323,6 +1323,9 @@ class OpkgPM(OpkgDpkgPM):
         if not pkgs:
             return
 
+        if self.d.getVar("PACKAGE_EXCLUDE"):
+            bb.warn("PACKAGE_EXCLUDE is set but package_ipkg doesn't support this")
+
         cmd = "%s %s install %s" % (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
 
         os.environ['D'] = self.target_rootfs
-- 
2.11.0


