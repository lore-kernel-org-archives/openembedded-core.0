Return-Path: <o.mandel@menlosystems.com>
X-Greylist: delayed 387 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 17 Oct 2016 08:23:01 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 813496071F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 08:23:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3sy9yy1t68z3hjty;
	Mon, 17 Oct 2016 10:16:42 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3sy9yx3T4JzvkRy;
	Mon, 17 Oct 2016 10:16:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id zbCvSREOWiyw; Mon, 17 Oct 2016 10:16:38 +0200 (CEST)
X-Auth-Info: btydcYULZjaLNn/PObOZhl+ECzC6KCKhW5QwIRCtytf7Nbjqa1/ACgLFdRW1dExD
Received: from menlobuildsrv.menlosystems.local
	(host-141-40-253-38.customer.izb-online.de [141.40.253.38])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 17 Oct 2016 10:16:38 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 08:16:28 +0000
Message-Id: <1476692188-1520-2-git-send-email-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1476692188-1520-1-git-send-email-o.mandel@menlosystems.com>
References: <1476692188-1520-1-git-send-email-o.mandel@menlosystems.com>
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH] combo-layer: handle ambiguous git arguments
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
X-List-Received-Date: Mon, 17 Oct 2016 08:23:01 -0000

If a branch/src-repository has the same name as a file/directory, git
since 1.4.0(?) gives an error like the one below:
ambiguous argument 'bitbake': both revision and filename
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'

Add two dashes to make the intent clear.

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 scripts/combo-layer | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 4a210fb..089b65f 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -426,7 +426,7 @@ file_exclude = %s''' % (name, file_filter or '<empty>', repo.get('file_exclude',
                 merge.append(name)
                 # Root all commits which have no parent in the common
                 # ancestor in the new repository.
-                for start in runcmd('git log --pretty=format:%%H --max-parents=0 %s' % name).split('\n'):
+                for start in runcmd('git log --pretty=format:%%H --max-parents=0 %s --' % name).split('\n'):
                     runcmd('git replace --graft %s %s' % (start, startrev))
             try:
                 runcmd(merge)
-- 
2.1.4


