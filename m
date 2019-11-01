Return-Path: <gtertych@cisco.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Nov 2019 07:17:14 UTC
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id 150DB7FC0A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 07:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1283; q=dns/txt; s=iport;
	t=1572592636; x=1573802236;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=FZ+QaF2rqLbwC4KsySFSnPamkqjB/agPtvQ4SEioDPA=;
	b=QkkJjeGPUqsmHEbNOnt236J5Axcg3g1waOnQUrtOrvMUxONInDfNX4a4
	wDrEzBqaEXBIKMDP212YtdiZ3++HhtRwTJriRqAnEWMXrW5Nq02q2pSCg
	DaQwIljqiDbm7qqqXIobj4T/NHnDAisKb7HMNnZDqFoP9VSKfLh2P30TP g=;
X-IronPort-AV: E=Sophos;i="5.68,254,1569283200"; d="scan'208";a="18691644"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	01 Nov 2019 07:10:06 +0000
Received: from carbon.cisco.com (ams3-vpn-dhcp998.cisco.com [10.61.67.230])
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id xA17A4T6002269;
	Fri, 1 Nov 2019 07:10:04 GMT
From: grygorii tertychnyi <gtertych@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2019 09:10:43 +0200
Message-Id: <20191101071043.16558-1-gtertych@cisco.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.61.67.230, ams3-vpn-dhcp998.cisco.com
X-Outbound-Node: aer-core-2.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH] archiver: avoid empty incfile in ar_recipe
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
X-List-Received-Date: Fri, 01 Nov 2019 07:17:15 -0000
Content-Transfer-Encoding: 8bit

do_ar_recipe fails on perf recipe on line:

include ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.inc', '', d)}

1. "${...}" part expands into empty string
2. bb.utils.which() takes empty string and returns first directory name from bbpath
3. shutil.copy() fails on copying directory:

Exception: IsADirectoryError: [Errno 21] Is a directory: ......

Hence, check "incfile" variable on each step.

Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
---
 meta/classes/archiver.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 093e2d95af..7c46cff91f 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -441,9 +441,10 @@ python do_ar_recipe () {
             incfile = include_re.match(line).group(1)
         if incfile:
             incfile = d.expand(incfile)
+        if incfile:
             incfile = bb.utils.which(bbpath, incfile)
-            if incfile:
-                shutil.copy(incfile, outdir)
+        if incfile:
+            shutil.copy(incfile, outdir)
 
     create_tarball(d, outdir, 'recipe', d.getVar('ARCHIVER_OUTDIR'))
     bb.utils.remove(outdir, recurse=True)
-- 
2.23.0


