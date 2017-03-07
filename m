Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.phycard.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 405586E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 13:47:47 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 1AB46A0022B;
	Tue,  7 Mar 2017 14:42:23 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017030714415632-315737 ;
	Tue, 7 Mar 2017 14:41:56 +0100 
From: Daniel Schultz <d.schultz@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 7 Mar 2017 14:41:55 +0100
Message-Id: <1488894116-13140-1-git-send-email-d.schultz@phytec.de>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 07.03.2017 14:41:56,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 07.03.2017 14:41:56,
	Serialize complete at 07.03.2017 14:41:56
X-TNEFEvaluated: 1
Subject: [PATCH 1/2] wic: plugins: rawcopy: Fixed wrong variable type
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
X-List-Received-Date: Tue, 07 Mar 2017 13:47:48 -0000

Without the int() function this variable will be a string. This will led
to a error in Filemap on line 545 due wrong types.

> [...]
>   File
> ".../poky/scripts/lib/wic/filemap.py", line 545, in sparse_copy
>     if start < skip < end:
> TypeError: unorderable types: int() < str()

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 scripts/lib/wic/plugins/source/rawcopy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 5bd22fd..618dd44 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -71,7 +71,7 @@ class RawCopyPlugin(SourcePlugin):
         dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
 
         if 'skip' in source_params:
-            sparse_copy(src, dst, skip=source_params['skip'])
+            sparse_copy(src, dst, skip=int(source_params['skip']))
         else:
             sparse_copy(src, dst)
 
-- 
1.9.1


