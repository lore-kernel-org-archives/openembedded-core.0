Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id B194B61056
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 19:38:31 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hq4so5873178wib.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 11:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dzQN3gP3BU1BPhD6pTPHU7sJCjMQNT0GwM+I6X83JKg=;
	b=mLV827L2/XRiaFC65uvDppVwJSIKqMbOIrNp4LaE7CukRTfttbiulRsGwD8Jag6O8D
	IPH8oug8iyM8WL31cGLIX1KR+tsz2f2HcDW1llE7Tq/r653nDzip17AodFIpQG1VDA3K
	HnbmeZ4UiUgGbesWPVAofD7lHyXwx7pUaN9AlPmaY38lCNuM/s8QZy4hEzW8wrWTc88H
	A/eEdiiLoa3QigDXi2g8wVMDTiCfY4aNAVD3++BhtbwHq/HHRlo9Terk4cyr/Dv7k8hK
	YQVgffUR8UGvhfCQP98nTU3xlb64+JpFuSR7peNLYj6SgeKsD8cHIr+t85Fm9jg9PrXn
	fQZg==
X-Gm-Message-State: ALoCoQksyYPy+1KRcNT/tSQrCBcqC8fA7ARwpjunsvAySdw4UAKWFdtvEB9m4LKf4BqthmRFyFmU
X-Received: by 10.180.24.137 with SMTP id u9mr20708161wif.5.1386704310863;
	Tue, 10 Dec 2013 11:38:30 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id n6sm7886238wix.3.2013.12.10.11.38.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Dec 2013 11:38:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2013 19:38:26 +0000
Message-Id: <1386704306-3021-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] insane: handle recursive configures when checking for unknown configure options
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
X-List-Received-Date: Tue, 10 Dec 2013 19:38:33 -0000

Some recipes have configure scripts that recursively call other configure
scripts (e.g. dropbear).  These multiple-line matches were not being handled
correctly, so iterate over every matching line instead of assuming only one line
was found.

[ YOCTO #5646 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a51f504..e77e993 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -941,8 +941,10 @@ Missing inherit gettext?""" % (gt, config))
         try:
             flag = "WARNING: unrecognized options:"
             log = os.path.join(d.getVar('B', True), 'config.log')
-            output = subprocess.check_output(['grep', '-F', flag, log])
-            options = set(map(lambda s: s.strip(' ,'), output.partition(flag)[2].split()))
+            output = subprocess.check_output(['grep', '-F', flag, log]).replace(', ', ' ')
+            options = set()
+            for line in output.splitlines():
+                options |= set(line.partition(flag)[2].split())
             whitelist = set(d.getVar("UNKNOWN_CONFIGURE_WHITELIST", True).split())
             options -= whitelist
             if options:
-- 
1.7.10.4


