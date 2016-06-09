Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.1])
	by mail.openembedded.org (Postfix) with ESMTP id F39D16FEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 07:41:50 +0000 (UTC)
Received: from localhost.localdomain (111-250-192-53.dynamic.hinet.net
	[111.250.192.53])
	by msfrf2616.sfr.fr (SMTP Server) with ESMTP id 7C1131C000D18;
	Thu,  9 Jun 2016 09:41:49 +0200 (CEST)
Received: from localhost.localdomain (111-250-192-53.dynamic.hinet.net
	[111.250.192.53])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2616.sfr.fr (SMTP Server) with ESMTPSA;
	Thu,  9 Jun 2016 09:41:47 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2016 15:41:30 +0800
Message-Id: <1465458091-94186-1-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [smartpm][PATCH 0/1] smartpm: if RPM transaction fails with an empty list of problems in attempt mode, ignore it!
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
X-List-Received-Date: Thu, 09 Jun 2016 07:41:52 -0000

Since commit be0cabf816a84c59e0e951b92a570121ed843822 on 2016/05/17, smartpm will retry the transaction if ts.run() returns with an empty list of problems, and we're in attempt mode.
But then, since all the packages are already installed, the transaction will fail with "package already installed" error.

In attempt mode, it's fine to not retry nor generate an error when the transaction fails for no reason linked to files/packages conflicts, so this patch fixes this behaviour.

On a side note, it's most likely that in the case where we could get some packages to be returned in error by ts.run(), the current code that removes those packages from the list and then retry the transaction would also fail with "package already installed" error (unless no packages at all was successfully installed).
This patch does not address that case.

Herve Jourdain (1):
  smartpm: if RPM transaction fails with an empty list of problems in
    attempt mode, ignore it!

 .../python/python-smartpm/smart-attempt.patch              | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.7.4


