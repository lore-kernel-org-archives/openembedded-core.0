Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9427177196
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 14:53:26 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1TErQbZ009154 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 08:53:26 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016022908532717-834961 ;
	Mon, 29 Feb 2016 08:53:27 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 16:53:00 +0200
Message-Id: <1456757580-31669-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/29/2016 08:53:27 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/29/2016 08:53:27 AM,
	Serialize complete at 02/29/2016 08:53:27 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-29_04:, , signatures=0
Subject: [PATCH v2] site: enable pthread support for x86_64 APR builds
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
X-List-Received-Date: Mon, 29 Feb 2016 14:53:28 -0000

The apache2 package is missing key pieces of pthread support (notably
pthread_kill) on x86_64 platforms. Fix this by setting cached variable
apr_cv_pthreads_cflags=-pthread which will trickle down into apache2 as
well. powerpc32-linux currently sets this option.

Suggested-by: Jacob Champion <jacob.champion@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/site/x86_64-linux | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 573a907..5b37211 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -104,6 +104,7 @@ nfsd_cv_func_statfs=${nfsd_cv_func_statfs=statfs2_bsize}
 nfsd_cv_bsd_signals=${nfsd_cv_bsd_signals=yes}
 
 #apr
+apr_cv_pthreads_cflags=${apr_cv_pthreads_cflags=-pthread}
 apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
 
 # lftp
-- 
2.7.1


