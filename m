Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id E85A9771B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 13:42:59 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1TDgxui004333 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 07:42:59 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016022907430035-820378 ;
	Mon, 29 Feb 2016 07:43:00 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 15:42:34 +0200
Message-Id: <1456753354-7448-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/29/2016 07:43:00 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/29/2016 07:43:00 AM,
	Serialize complete at 02/29/2016 07:43:00 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-29_04:, , signatures=0
Cc: Jacob Champion <jacob.champion@ni.com>
Subject: [PATCH v1] site: enable pthread support for x86_64 APR builds
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
X-List-Received-Date: Mon, 29 Feb 2016 13:43:02 -0000

From: Jacob Champion <jacob.champion@ni.com>

The apache2 package was missing key pieces of pthread support (notably,
pthread_kill) on x86_64 platforms. Fix this by setting some cached
variables that are already set for other targets:

  apr_cv_pthreads_cflags=-pthread: enables pthread support for APR,
  which will trickle down into apache2 as well. powerpc32-linux
  currently sets this option.

  apr_cv_process_shared_works=no: several platforms already set this
  option, which conservatively disables support for PROCESS_SHARED
  mutexes.

Signed-off-by: Jacob Champion <jacob.champion@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/site/x86_64-linux | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 573a907..9a67445 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -104,6 +104,8 @@ nfsd_cv_func_statfs=${nfsd_cv_func_statfs=statfs2_bsize}
 nfsd_cv_bsd_signals=${nfsd_cv_bsd_signals=yes}
 
 #apr
+apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
+apr_cv_pthreads_cflags=${apr_cv_pthreads_cflags=-pthread}
 apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
 
 # lftp
-- 
2.7.1


