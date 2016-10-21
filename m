Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id A9ABB71A34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 09:24:38 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t0gHX01pMz3hjX2;
	Fri, 21 Oct 2016 11:24:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t0gHW6gzpzvkkY;
	Fri, 21 Oct 2016 11:24:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id yKY2qX_umLJo; Fri, 21 Oct 2016 11:24:39 +0200 (CEST)
X-Auth-Info: 7y7hCi6ruAtO2mliGZfHAkPf3RBTUy/KFdYrDMCRTSsoVDTPPvsS9pvtbV871RMN
Received: from menlobuildsrv.menlosystems.local
	(host-141-40-253-38.customer.izb-online.de [141.40.253.38])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 21 Oct 2016 11:24:38 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 09:24:27 +0000
Message-Id: <1477041868-7097-2-git-send-email-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1477041868-7097-1-git-send-email-o.mandel@menlosystems.com>
References: <1477041868-7097-1-git-send-email-o.mandel@menlosystems.com>
In-Reply-To: <1476721424-18923-1-git-send-email-o.mandel@menlosystems.com>
References: <1476721424-18923-1-git-send-email-o.mandel@menlosystems.com>
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH v2] combo-layer: handle file_exclude matching dirs
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
X-List-Received-Date: Fri, 21 Oct 2016 09:24:40 -0000

If file_exclude matches a directory, os.unlink() got called with this
directory as an argument.

Filter out paths that end in a directory separator.

This still leaves the (then empty) directories, but this does not affect
the git commit.

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 scripts/combo-layer | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 089b65f..d04d88b 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -294,6 +294,8 @@ def action_init(conf, args):
                     # again. Uses the list of files created by tar (easier
                     # than walking the tree).
                     for file in files.split('\n'):
+                        if file.endswith(os.path.sep):
+                            continue
                         for pattern in exclude_patterns:
                             if fnmatch.fnmatch(file, pattern):
                                 os.unlink(os.path.join(*([extract_dir] + ['..'] * subdir_components + [file])))
-- 
2.1.4


