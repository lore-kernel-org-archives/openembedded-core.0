Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TOmxp-0008QK-Vv
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 12:04:30 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 18 Oct 2012 02:51:09 -0700
Received: by mail-wg0-f43.google.com with SMTP id dq11so6227460wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2012 02:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Xck1JSYQM8oJ6Y3Db2aA9d1DK5whDtJSAz2ODJ1dmiU=;
	b=SyLXkYsFbBE1yT0dT/lgyat1jvXzj7b71VrWjhkD2f829OBGqnZZN444kmZRiC7GRE
	1O8x43jFECJcqhST7RCRLjX6pILH6IRJ5eWTYgBzG26hD83KlzL/ba21wVMUvDIQYmzB
	oo5EVn2eKlDe+xZSz1zEjFd3h+FQmq1gsuBCfea45GhiVBNWIv3nfxgX/5uvwAgG79hk
	hYOO13DncSI+3X5+nsUL0lNn8SJqD+Tp4+8Ow/dG2UcH1fFu3UNwh8s6pdOyBRd37CLh
	d9ep0a5+XFRL43fpmwyxMWrfnoH3fCTHKoPhG/Eyd/80xGv8dG+Kjk5wmSRZWTCpiRX1
	OykQ==
Received: by 10.180.93.106 with SMTP id ct10mr10097847wib.8.1350553867231;
	Thu, 18 Oct 2012 02:51:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eq2sm32664368wib.1.2012.10.18.02.51.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 02:51:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2012 10:49:59 +0100
Message-Id: <1350553799-5977-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkChtXdnZSOu7XogwaRRyJHSZzxO1sGiZh8EAK1YAbltKl+UKEdGwAZihmo/2wXx7WWj6Os
Subject: [PATCH] sstate: when warnings about sysroot overwrites, say what the recipe was
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2012 10:04:30 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3fcaa65..b20b19c 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -165,7 +165,7 @@ def sstate_install(ss, d):
             if realmatch:
                 match.append(f)
     if match:
-        bb.warn("The recipe is trying to install files into a shared area when those files already exist. Those files are:\n   %s" % "\n   ".join(match))
+        bb.warn("The recipe %s is trying to install files into a shared area when those files already exist. Those files are:\n   %s" % (d.getVar("PN", True), "\n   ".join(match)))
 
     # Write out the manifest
     f = open(manifest, "w")
-- 
1.7.10



