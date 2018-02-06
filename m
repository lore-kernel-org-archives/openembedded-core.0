Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 26FC0783AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:14 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id u12-v6so13431386ite.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lkcQ7qT5Pe4tSboYXGE9WE8mGvzp2RG4/sVn8a8QOJw=;
	b=hPACvVBTU0edY+A9QEQFcm1bfZrbPct+w2gaK0iqQrJUY6T05bIXDa3PculThrd96b
	KUqGQtu3ZYki8Caq61U3gkVIMjVOchD5DtQ8nyjbSzTdQUyt8BsZGzuvkN3+XcZgOogN
	oY6AlOnPLGO0JkPpTiPVJFn1cDiNqf9U25ldclDsUX4qRUsz5L/vQy1GUMJtzGuIdbMh
	wlixQXwe8m3YfWQKthEfp0ltQqQ6TfGumdtUbndQkAIwWbGrOoMcehEN5PZ7X+abM+JW
	z4KYx5W/8kIbEHw29yoTaj1ofp/MZPZw1FMm/AoP6EAJcFyNTrKbQoAiFNjGnbmslGZx
	Bpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lkcQ7qT5Pe4tSboYXGE9WE8mGvzp2RG4/sVn8a8QOJw=;
	b=rkgESMTI/E5GyCpWHCWblzTloNNZ/+hm0XIFHFDeDVcAb87aESlMwVwi+fQydDCCOK
	UWN9wsay7YXyQLd1hrzdgG0qU0qf/uGVsq/kMOoHkj1Xt9BoCfICqvCiyZBkbvo/cy4R
	3kH4bPOAd/MI43iPk9H8BfqagEdjrJWe3uezt4neBxhGkvRn72dEH5pctxZ1FsYBRzBV
	pbih7wsMo8PuI87ti6vLM6TWjY2P8uQerZeIhfoEo4k0FTbkc5oQBU+xCdaI3ABfi6Ps
	M5p5j5KUr8Cw0kNvkjzSW43GNV423wPea2sbmOCvlz3SLYysCfUNycUMHCQrfinr0xj3
	Ab+g==
X-Gm-Message-State: APf1xPBMkJv1GMCVRccklCHTOBAlIMVLBE865UpHtlTWqhahYoj/hV5Z
	Z99c+1+ZWNhyMgdYst97oc4olNUB
X-Google-Smtp-Source: AH8x225RKOCRMNGTtk4fNZqN5yixFT/NBfbFryr/Gn7UJixczsgd+5mFGDq91xSs4jfhQY79k+On3Q==
X-Received: by 10.36.104.149 with SMTP id v143mr5092373itb.2.1517954596049;
	Tue, 06 Feb 2018 14:03:16 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:15 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:20 -0600
Message-Id: <b45cb59359864f63ab72613a88ec454fa86a3195.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 01/14] icecc.bbclass: Move to shared work directory
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:15 -0000

Generate the icecc toolchains in a shared work directory. This class was
already setup to correctly synchronize creating the toolchains in a
shared location before the RSS changes, so return to that behavior
instead of generated the toolchains in each recipe's sysroot.
Additionally, it makes no sense for each recipe to generate a toolchain,
only to find it has already generated an uploaded to the compile server
by another recipe.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 1cc1c4ddb0f..e8725b582b3 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -151,6 +151,9 @@ def icecc_is_native(bb, d):
         bb.data.inherits_class("cross", d) or \
         bb.data.inherits_class("native", d);
 
+def icecc_dir(bb, d):
+    return d.expand('${TMPDIR}/work-shared/ice')
+
 # Don't pollute allarch signatures with TARGET_FPU
 icecc_version[vardepsexclude] += "TARGET_FPU"
 def icecc_version(bb, d):
@@ -175,8 +178,8 @@ def icecc_version(bb, d):
             archive_name += "-kernel"
 
     import socket
-    ice_dir = d.expand('${STAGING_DIR_NATIVE}${prefix_native}')
-    tar_file = os.path.join(ice_dir, 'ice', archive_name + "-@VERSION@-" + socket.gethostname() + '.tar.gz')
+    ice_dir = icecc_dir(bb, d)
+    tar_file = os.path.join(ice_dir, archive_name + "-@VERSION@-" + socket.gethostname() + '.tar.gz')
 
     return tar_file
 
-- 
2.14.3


