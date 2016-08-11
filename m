Return-Path: <clemens.lang@bmw-carit.de>
Received: from cit-hm8-gw01.bmw-carit.de (cit-hm8-mail01.bmw-carit.de
	[212.118.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 359CA77196
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 10:04:41 +0000 (UTC)
Received: from [10.40.100.14] (port=53227 helo=cit-hm8-mail01.bmw-carit.de)
	by cit-hm8-gw01.bmw-carit.de with esmtps (TLSv1.2:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1bXmqt-0005A1-0B for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2016 12:04:39 +0200
Received: from clang-buildbox.bmw-carit.intra (172.20.20.251) by
	CIT-HM8-EX02.bmw-carit.intra (10.40.100.14) with Microsoft SMTP Server
	(TLS) id 15.0.1178.4; Thu, 11 Aug 2016 12:04:37 +0200
X-CTCH-RefID: str=0001.0A0C0202.57AC4DB7.003E, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Clemens Lang <clemens.lang@bmw-carit.de>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2016 12:04:12 +0200
Message-ID: <1470909853-22262-1-git-send-email-clemens.lang@bmw-carit.de>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [172.20.20.251]
X-ClientProxiedBy: CIT-HM8-EX01.bmw-carit.intra (10.40.100.13) To
	CIT-HM8-EX02.bmw-carit.intra (10.40.100.14)
Subject: gitpkgv: Fix $GITPKV for a single named git source
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
X-List-Received-Date: Thu, 11 Aug 2016 10:04:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

here's a patch that fixes gitpkgv.bbclass in situations where SRC_URI
contains a single git repository with an explicit name set, i.e.

  SRC_URI = "git://...;name=foo"

but SRCREV_FORMAT is not set. At the moment, this causes $GITPKGV to
always be "default". If you use $GITPKGV in $PKGV, this leads to QA
errors because version numbers do not increase. This problem does not
affect recipes with multiple sources, because bitbake enforces that
SRCREV_FORMAT is set when fetching from multiple version control
systems.

While preparing this patch, I noticed a couple of other potential
problems:
 - Should gitpkgv.bbclass also support the Git Annex fetcher?
 - gitpkgv.bbclass does not work correctly with fetcher names that are
   substrings of each other. A source named foo and one named foo-tests
   with a SRVREV_FORMAT of "foo_foo-tests" does not work correctly.
   That's probably not a openembedded problem but should be addressed in
   bitbake, right?

BR,
Clemens Lang
-- 
Clemens Lang • Development Specialist
BMW Car IT GmbH • Lise-Meitner-Str. 14 • 89081 Ulm • http://bmw-carit.com
-------------------------------------------------------------------------
BMW Car IT GmbH
Geschäftsführer: Michael Würtenberger und Alexis Trolin
Sitz und Registergericht: München HRB 134810
-------------------------------------------------------------------------

