Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 07A98727A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 11:04:44 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBIB4doc027679
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:04:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1418900682;
	bh=NuS+KNOPvDKl5TZkeBMNPFlR5/Pb56csRDAASIZygeg=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=WJacANU1QCBAciFyx0OvDofF5sSqp8Yqh07fAp81ZPxTROO078jDlN5ii375Sf8et
	q0ehYocPgzsPnBoLgukRBdlazXHDdid36e0NQudwOHHMsioD7LR+Q01FRTdjxNhchE
	J+NmJsyZClF8Qw0eqkvrvUP9M8QGMFTU4UEByjQI=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBIB4WTV005822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Dec 2014 12:04:34 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Y1Ysf-0006NM-4V; Thu, 18 Dec 2014 12:04:30 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Dec 2014 12:04:20 +0100
Message-Id: <1418900663-20985-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 0/3] avoid refs to sysroot in pkgconfig files
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
X-List-Received-Date: Thu, 18 Dec 2014 11:04:49 -0000

Some pkgconfig files like libkmod.pc or fontconfig.pc contain absolute
paths to sysroot dirs in their Cflags: or Libs: section.  This can
break build of dependent packages because wrong paths will be created.

Patchset tries to detect and fix such issues automatically.  It is
conservative by using $PKG_CONFIG_SYSROOT_DIR instead of $TMPDIR.

Enrico Scholz (3):
  insane: added 'pkgconfig-nosysroot' check
  pkgconfig.bblcass: remove PKG_CONFIG_SYSROOT_DIR from installed .pc
    files
  insane: made 'pkgconfig-nosysroot' check critical

 meta/classes/insane.bbclass    | 16 +++++++++++++++-
 meta/classes/pkgconfig.bbclass | 17 +++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

-- 
1.9.3


