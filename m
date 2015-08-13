Return-Path: <clemens.lang@bmw-carit.de>
X-Greylist: delayed 319 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Aug 2015 09:15:00 UTC
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 99AF373D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 09:15:00 +0000 (UTC)
Received: from exchange2010.bmw-carit.intra ([192.168.100.28]:25628
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1ZPoVt-0007sk-0q for openembedded-core@lists.openembedded.org;
	Thu, 13 Aug 2015 11:09:29 +0200
Received: from localhost (172.20.20.163) by Exchange2010.bmw-carit.intra
	(192.168.100.28) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Thu, 13 Aug 2015 11:09:28 +0200
X-CTCH-RefID: str=0001.0A0C0203.55CC5EC9.0105, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Clemens Lang <clemens.lang@bmw-carit.de>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Aug 2015 11:09:15 +0200
Message-ID: <1439456956-21602-1-git-send-email-clemens.lang@bmw-carit.de>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
X-Originating-IP: [172.20.20.163]
Subject: Avoid race condition between do_unpack and do_deploy_archives in archiver.bbclass
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
X-List-Received-Date: Thu, 13 Aug 2015 09:15:02 -0000
Content-Type: text/plain

Hi,

the following patch fixes a race condition in archiver.bbclass that can
occur when a very specific set of preconditions is fulfilled:
 - a recipe sets $S to a directory that will be created by do_unpack
 - $B is at its default value of $S
 - the license of the recipe is in COPYLEFT_LICENSE_EXCLUDE, skipping
   source code archiving
When this happens, do_deploy_archives (which is a no-op task that only
prints a single line) does not depend indirectly on do_unpack, as it
would usually do via a dependency on
  do_ar_${@d.getVarFlag('ARCHIVER_MODE', 'src', True)}.
Because do_deploy_archives does not specify a working directory, it
defaults to $B, which does not exist when do_deploy_archives is run in
parallel (or before) do_unpack.

The attached patch fixes this by making do_deploy_archives run after
do_unpack in all cases (which is already does for recipes not excluded
due their license).

This problem is also present on dizzy (and thus probably also on fido).


