Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABF9A605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 21:20:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB7LK5Lw023253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Dec 2017 13:20:05 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 7 Dec 2017 13:20:04 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Dec 2017 16:20:03 -0500
Message-ID: <20171207212004.3479-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.14.2.666.gea220ee
MIME-Version: 1.0
Subject: [master][rocko][PATCH 0/1] Fix uninative link when loaded from a file url
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
X-List-Received-Date: Thu, 07 Dec 2017 21:20:04 -0000
Content-Type: text/plain

If the uninative link is set from a file URL, a symlink will be created.  If
that file is later deleted (i.e. referenced a file in another project layer).

The system will fail on a backtrace during the os.symlink.  The same type of
problem must have existed in the bitbake fetcher, as the code there was
already written to allow this case.  This copies that design and does the
same procedure of checking for a broken symlink, and unlinks in that case.

This also adds the secondary step if there are two processes that happen to
get to there at the same time (shared DL_DIR for two projects), the exitence
of the link will not trigger a failure due to the try/except.

Mark Hatle (1):
  uninative.bbclass: Fix broken symlink issue

 meta/classes/uninative.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.14.2.666.gea220ee


