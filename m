Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6316E5D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 20:36:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4LKabEC014137
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 13:36:37 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 21 May 2015 13:36:36 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 May 2015 15:36:34 -0500
Message-ID: <cover.1432240437.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Make "set -x" in postinst scripts not break rootfs
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
X-List-Received-Date: Thu, 21 May 2015 20:36:36 -0000
Content-Type: text/plain

I was trying to debug a postinstall script, so I added set -x, so rootfs
creation broke. The issue is that set -x caused lines of code to be emitted
in a place where the log file checker saw them. It's totally okay for
a postinstall script to exit 1; that moves it into etc/rpm-postinsts, and
then it runs on the target.

So it shouldn't prevent rootfs creation from "succeeding". Solution: Don't
process lines preceeded by a "+", because that's probably set -x output.

The following changes since commit fe7780a9bbbfa4dcbbe457618a0842e91a3c6a0e:

  libxdmcp: make libbsd usage deterministic (2015-05-21 10:48:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/setminusx
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/setminusx

Peter Seebach (1):
  rootfs.py: Make set -x not break rootfs creation

 meta/lib/oe/rootfs.py | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.3.1


