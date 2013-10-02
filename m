Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id F30006CBDA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2013 23:18:20 +0000 (UTC)
Received: from mailserv59-us.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	r92NILUw022602; Wed, 2 Oct 2013 18:18:21 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by mailserv59-us.natinst.com (Lotus Domino Release 8.5.3FP2 HF169)
	with ESMTP id 2013100218182179-717603 ;
	Wed, 2 Oct 2013 18:18:21 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 2 Oct 2013 18:18:01 -0500
Message-Id: <1380755881-17842-1-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 1.8.4
X-MIMETrack: Itemize by SMTP Server on MailServ59-US/AUS/H/NIC(Release
	8.5.3FP2 HF169|September 14, 2012) at 10/02/2013 06:18:21 PM,
	Serialize by Router on MailServ59-US/AUS/H/NIC(Release 8.5.3FP2
	HF169|September 14, 2012) at 10/02/2013 06:18:21 PM,
	Serialize complete at 10/02/2013 06:18:21 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.10.8794, 1.0.431,
	0.0.0000
	definitions=2013-10-02_09:2013-10-02, 2013-10-02,
	1970-01-01 signatures=0
Cc: paul.eggleton@linux.intel.com, gratian.crisan@ni.com, ken.sharp@ni.com
Subject: [dylan, master][PATCH] populate_sdk_base: Fix relocate_sdk.py execution on Arch
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
X-List-Received-Date: Wed, 02 Oct 2013 23:18:21 -0000

relocate_sdk.py is #!/usr/bin/env python, but is not python3-compatible.
The PEP 394 alias `python2` is sadly not universally supported, so
instead of modifying relocate_sdk.py directly, change the `exec` in
relocate_sdk.sh to use it if it exists.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/classes/populate_sdk_base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index e5bc0b4..e67d8b6 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -256,8 +256,9 @@ if [ x$tdir = x ] ; then
    echo "SDK relocate failed, could not create a temporary directory"
    exit 1
 fi
+python_bin="$(command -v python2 2>/dev/null)" || python_bin=python
 echo "#!/bin/bash" > $tdir/relocate_sdk.sh
-echo exec ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files >> $tdir/relocate_sdk.sh
+echo exec $python_bin ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files >> $tdir/relocate_sdk.sh
 $SUDO_EXEC mv $tdir/relocate_sdk.sh ${env_setup_script%/*}/relocate_sdk.sh
 $SUDO_EXEC chmod 755 ${env_setup_script%/*}/relocate_sdk.sh
 rm -rf $tdir
-- 
1.8.4


