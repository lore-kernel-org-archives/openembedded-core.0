Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Svp6x-0007uK-NS
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 14:30:12 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 30 Jul 2012 05:18:34 -0700
Received: by weyt11 with SMTP id t11so3148206wey.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 05:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=PIsE8pn9bCd/ISBi0vMgf/QbsoXufqShlxdInhca+1Q=;
	b=UACnMA2d4XC+7vHNwEOKjCPWoFZNpiXmtAuxmQJGOT6vAHbK0FBeDZC5ozeq5HcmAB
	cotyW0uxPtER6/Zhc1TSP2ftvJiRlX6IddRDQ0JpMv/PE5NpAWo/DsPU6bIWGwQdKuZ0
	1h6CGcdo3YalSBPRIldHEBgygfX+QMMZlev91FQeyqcajNKZn3ZvImECniufZkb3oPpm
	olT0yqgWo3WgY9BDW5nLbRe5bVTyjHRy6CgtMUHVWKD1/meDMuoYMVOwPYQNsfTtrNoP
	9THrorm6S++aOqsQtLUzM+iFW8PUWAF+sdXBcmjArYU1A8ZUjQktMMENtPMqnerhAELG
	AFXg==
Received: by 10.216.136.72 with SMTP id v50mr5267174wei.203.1343650712862;
	Mon, 30 Jul 2012 05:18:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id o2sm23885626wiz.11.2012.07.30.05.18.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 05:18:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2012 13:18:06 +0100
Message-Id: <1343650687-2307-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkqCvA9PNi6loMWLuwzKCjtGCysOGdzsmzS23YvhjLIU3jGagmuf8ldE8HNSD02KDOqKKCj
Subject: [PATCH 1/2] buildhistory: correctly handle reductions of numeric fields
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 12:30:12 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 29dc4a9..d0e0808 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -300,7 +300,7 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
                     percentchg = ((bval - aval) / float(aval)) * 100
                 else:
                     percentchg = 100
-                if percentchg < monitor_numeric_threshold:
+                if abs(percentchg) < monitor_numeric_threshold:
                     continue
             elif (not report_all) and key in list_fields:
                 if key == "FILELIST" and path.endswith("-dbg") and bstr.strip() != '':
-- 
1.7.10



