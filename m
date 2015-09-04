Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 12CDB76F50
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 03:28:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t843SPmq020233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Sep 2015 20:28:25 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 3 Sep 2015 20:28:25 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Sep 2015 22:28:23 -0500
Message-ID: <cover.1441336912.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] v3: pseudo 1.7.2
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
X-List-Received-Date: Fri, 04 Sep 2015 03:28:26 -0000
Content-Type: text/plain

So the opkg uprev from 0.2.4 to 0.3.0 turns out to trip on a
change I thought would be harmless, but which was also unintentional-ish.

Historically, pseudo has just assumed no one will put 0700 in umask.
With xattrdb, this can break if you have 0700 in umask, and try to open
a file, because pseudo needs to be able to write to the file in order
to store extended attributes. And I spotted that, so I added manual
chmods in cases where a file mave have been created by an open.

But I used 0600 instead of the base mode | 0600, and this resulted in
losing execute bits in some cases. This was only in the base filesystem,
and normally real filesystem execute bits on things in the target filesystem
space don't matter. But opkg 0.3.0 is now doing
	sh -c /path/to/postinst_script
and that fails if the script lacks 0100.

Whoops.

(The change there is why this didn't get caught in the previous 1.7.x
testing.)

The following changes since commit aba3ef50d65e0dc8659a48bf98d0fb00dd44a6fc:

  debianutils: create package for run-parts (2015-09-02 23:51:16 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo172
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo172

Peter Seebach (1):
  pseudo_1.7.2.bb: New version of pseudo

 meta/recipes-devtools/pseudo/pseudo_1.7.2.bb | 19 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |  4 ++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.7.2.bb

-- 
2.3.1


