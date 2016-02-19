Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 8DA8077216
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 15:46:03 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1JFk2j3019447; Fri, 19 Feb 2016 09:46:02 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016021909460236-1165574 ;
	Fri, 19 Feb 2016 09:46:02 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 17:45:45 +0200
Message-Id: <cover.1455895912.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/19/2016 09:46:02 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/19/2016 09:46:02 AM,
	Serialize complete at 02/19/2016 09:46:02 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-19_08:, , signatures=0
Subject: [PATCH v6 0/4] IPK signing for the gpg_sign module
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
X-List-Received-Date: Fri, 19 Feb 2016 15:46:03 -0000

This patch series extends the gpg_sign module to support ipk signing.

v6 implements Markus' feedback. The most notable change is the sign_ipk
and detach_sign merger, as they were almost identical in functionality.
This also meant a refactoring for detach_sign and a bug fix for the
STDIN file descriptor introduced in gpg > 2.1.

Technically that STDIN bug is a feature (meh) of gpg >2.1 which breaks
existing behaviour so we have to work around it i.e. check the gpg
version and use the loopback interface. This means that gpg-agent to
which gpg >2.1 always connects needs to be running permanently.

Ioan-Adrian Ratiu (4):
  gpg_sign: add local ipk package signing functionality
  gpg_sign: detach_sign: fix gpg > 2.1 STDIN file descriptor
  gpg_sign: export_pubkey: add signature type support
  package_manager: sign IPK package feeds

 meta/classes/package_ipk.bbclass       |  5 +++
 meta/classes/sign_ipk.bbclass          | 52 ++++++++++++++++++++++++
 meta/classes/sign_package_feed.bbclass | 12 +++++-
 meta/lib/oe/gpg_sign.py                | 74 +++++++++++++++++++++++++++-------
 meta/lib/oe/package_manager.py         | 17 +++++++-
 5 files changed, 143 insertions(+), 17 deletions(-)
 create mode 100644 meta/classes/sign_ipk.bbclass

-- 
2.7.1


