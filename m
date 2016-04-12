Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 137BA60123
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 16:32:51 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f198so195050266wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=YqJCIDAsRAML+qVdcMgTIR6iZzE6i8pIB7KsB4bQzFY=;
	b=Ir1yTEii4bNkc4oAzew6lQUHwRrhe0bUx+8Tqq1lSdUGfNXPtLwHLSb4fFNUc52Vas
	Bpur8KwWjw+nlsKxgG7wc25FhKqR4Zq/kyQolT4Byo/9c3upvP7n2hcvxUlAhrd7YV2B
	dGIqN/bhzMqDFNFnxPKGrk+O9gqIryN+3WCdfDJD9KaGb+IF/qIoQF9wMVckYkcfhURE
	i8iGXAThqIe9IttcR+W6ZXoRYQYQcq2UNFkuL9K8MqpGuLAN+tdGoYU63nwXuOSPIkw6
	nZMDPi0YoloogEXkbxnLnkmOWNm8STZHRh+xYFAe/IcuPP/f8jd5wrvubfpRAGQQ503+
	0QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=YqJCIDAsRAML+qVdcMgTIR6iZzE6i8pIB7KsB4bQzFY=;
	b=QcTm5qbYpkdBWvaBDV4UHL2KEhICOka7nLCJMn9NNasAt3/a47N5oqgz4I+qEvxUPg
	nWh+5GuaVucfUzpWxJJeI03INizU9NCXWK37u58rLfhZ4Evww9BmGGOyEMTMlGAHu5EP
	DysT1BqHFSpMwjkY7yC3qH9u4qc31P3YHvnhaTMcIcJUXBG+12nMjKKLEPOO7T42yQbp
	TOqVe4lRou3s2kKwcL3yqE88TWv7e8yxHtPnI0npriZp30zBbkubudcPFCIiO8MEpRps
	/nUJyKAB+XcBI5HwRhFEOMLcsSjG+GBQrsaPPGrKmHGWlmimyne+PvDO/esAPv9AhiHK
	aUqw==
X-Gm-Message-State: AOPr4FWHwl8wY4hkJlE8ai8Ks90TWfgHUaqYSodGzAxwt5EbUG+03+C6iZWQuFpyUx3y7/w5
X-Received: by 10.28.147.135 with SMTP id v129mr5972781wmd.65.1460478771958;
	Tue, 12 Apr 2016 09:32:51 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i5sm34196014wjx.15.2016.04.12.09.32.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Apr 2016 09:32:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 17:32:49 +0100
Message-Id: <1460478769-13151-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] sanity: allow sftp and ssh mirrors
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
X-List-Received-Date: Tue, 12 Apr 2016 16:32:52 -0000

URLs in MIRRORS and PREMIRRORS are vetted against a hard-coded list of protocols
which were missing sftp: and ssh:, so add them.

[ YOCTO #9444 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index eda0ea9..77813e4 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -860,7 +860,7 @@ def check_sanity_everybuild(status, d):
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs', 'npm']
+                 'bzr', 'cvs', 'npm', 'sftp', 'ssh']
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var, True) or '').replace('\\n', '\n').split('\n')
         for mirror_entry in mirrors:
-- 
2.8.0.rc3


