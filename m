Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id E3B0C783AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 17:53:54 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k61so1225827wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 09:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tYK+p2AZFDS3H0kJAz5xjq+gwDu+Ms3eqnajCumvbsY=;
	b=e0CRej3b1LDj9ERUIsj/m46quNytU/KF33yGH7dzOlUVMRD0ioLp2XWiAZl/1s19i2
	LBNnUNhjSeesEpnD1XIM93/U74NFiWJmdIom2x0UHwo85uKOte8xSKSxjRboxaXbkcDp
	2pXxWk+eMX5ZJRhWgPkMivCvP686BYdnguYb7Me8J566RB8SznH8+CBaRxNSLgvJwK3Y
	vtaEpQYLm2+IPcV/6ipHbbdIaKnnz2fl0qqRMwbBFgcKA0er/OQR8gXrNuILBxn7/IS3
	Bkm3asCl/nPMZ3qpwgM2aml3YcU5kyvjZQEaS1bwU0WuBYbn5UGiXL/B7MsKWPhYAQxt
	KgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tYK+p2AZFDS3H0kJAz5xjq+gwDu+Ms3eqnajCumvbsY=;
	b=SnjPH7kgxxQRrAc7mIpaoEEjiRzvX+R/nRfgUiVl5WB6FpC8sAO8hDlNK0Qd6zogDS
	qrSbvjbpoGylOC79v9qk0X2YiyFC9JysnEw6XjSm1whZo9QyliLSSjzR99pKdM0hRwb5
	JBroR3MQM+jtZcEkoTQZS920hi4vZJ+5l6GygmvCckjrKaZ0CT485d0ShHpC5Tp4HlHD
	2K47js9kZqsfgQxlVEC2o001gN+4X6FDEEPxAsu6vF9+EptifQ8mW74ypOSK71pWXkpr
	NkHPwHeq/TC0m9ArgXebku7xu3UGxtjGqf7PBvQU3jO7/OkvyXARbFuCOq5yc0xM2ekF
	d+yw==
X-Gm-Message-State: AJaThX6qgmSZkQuMwspNY7ZZDVKJO12r2PLs2n7oFzaPSZ5KMYSrQsVH
	msEUsk6SUJLYaaqkP0SpBQWKe3uY
X-Google-Smtp-Source: AGs4zMbk6IHXLQVmNfJvzBoeS6tnuOtP+Zk4S5rwdSx5u5aJjX7AZJbLq0SNLcETfS4mnVJ0djoEUA==
X-Received: by 10.223.136.250 with SMTP id g55mr16243138wrg.54.1512496435288; 
	Tue, 05 Dec 2017 09:53:55 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	138sm1128291wmf.21.2017.12.05.09.53.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 09:53:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 17:53:51 +0000
Message-Id: <20171205175351.4499-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171205175351.4499-1-ross.burton@intel.com>
References: <20171205175351.4499-1-ross.burton@intel.com>
Subject: [PATCH 2/2] classes/sanity: check we don't have an ancient GNU patch
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
X-List-Received-Date: Tue, 05 Dec 2017 17:53:55 -0000

We depend on the host GNU patch, but patch < 2.7 can't handle git-style patches.
This results in patches that fail to apply, or worse apply incorrectly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 1410af29017..d0f507e0c50 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -456,6 +456,22 @@ def check_sanity_validmachine(sanity_data):
 
     return messages
 
+# Patch before 2.7 can't handle all the features in git-style diffs.  Some
+# patches may incorrectly apply, and others won't apply at all.
+def check_patch_version(sanity_data):
+    from distutils.version import LooseVersion
+    import re, subprocess
+
+    try:
+        result = subprocess.check_output(["patch", "--version"], stderr=subprocess.STDOUT, universal_newlines=True)
+        version = re.search(r"[0-9.]+", result.splitlines()[0]).group()
+        if LooseVersion(version) < LooseVersion("2.7"):
+            return "Your version of patch is older than 2.7 and has bugs which will break builds. Please install a newer version of patch.\n"
+        else:
+            return None
+    except subprocess.CalledProcessError as e:
+        return "Unable to execute patch --version, exit code %d:\n%s\n" % (e.returncode, e.output)
+
 # Unpatched versions of make 3.82 are known to be broken.  See GNU Savannah Bug 30612.
 # Use a modified reproducer from http://savannah.gnu.org/bugs/?30612 to validate.
 def check_make_version(sanity_data):
@@ -596,6 +612,7 @@ def check_sanity_version_change(status, d):
     import stat
 
     status.addresult(check_make_version(d))
+    status.addresult(check_patch_version(d))
     status.addresult(check_tar_version(d))
     status.addresult(check_git_version(d))
     status.addresult(check_perl_modules(d))
-- 
2.11.0


