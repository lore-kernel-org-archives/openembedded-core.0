Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 113B173232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 23:48:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8ANmBcX015013
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 16:48:11 -0700 (PDT)
Received: from seebs-worktop (172.25.40.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 10 Sep 2015 16:48:11 -0700
Date: Thu, 10 Sep 2015 18:48:10 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20150910184810.566531e7@seebs-worktop>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: opkg --install and "attempt-only" packages
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
X-List-Received-Date: Thu, 10 Sep 2015 23:48:12 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

So, I'm not 100% sure yet, but it appears to me that if you have a large list
of "attempt-only" packages, and *any* of them can't be found at all, opkg
bails out without doing anything about the rest of them.

This seems a little surprising, because my assumption would be that the
expected behavior for "attempt-only" packages would be to try to install as
many as possible.

Looking at other cases, it looks like the RpmPM and related code try to
handle each package separately to build a list, but OpkgPM doesn't.

I note also that RpmPM will allow an empty list of mandatory packages, while
OpkgPM only accepts an empty list when attempt_only is True.

This affects us because we have a setup in which we put a very large pool of
packages in as attempt-only because we know that there will be small
variances in package lists which are hard to anticipate, and the net result
is that none get installed at all.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

