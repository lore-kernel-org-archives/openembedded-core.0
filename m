Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E2FF673D13;
	Thu,  3 Sep 2015 11:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t83BxruX023584; Thu, 3 Sep 2015 12:59:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ratOuMlsm5gL; Thu,  3 Sep 2015 12:59:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t83BxfDP023500
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 3 Sep 2015 12:59:52 +0100
Message-ID: <1441281581.24871.112.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 03 Sep 2015 12:59:41 +0100
In-Reply-To: <20150901190902.GD2458@jama>
References: <20150901104522.9FC59505A9@opal.openembedded.org>
	<20150901190902.GD2458@jama>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Alex Franco : Fix mode +st on TMPDIR when creating it
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
X-List-Received-Date: Thu, 03 Sep 2015 12:00:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-01 at 21:09 +0200, Martin Jansa wrote:
> On Tue, Sep 01, 2015 at 10:45:22AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 8236d57439640a185c0226312cd4903a3ce2f53b
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=8236d57439640a185c0226312cd4903a3ce2f53b
> > 
> > Author: Alex Franco <alejandro.franco@linux.intel.com>
> > Date:   Fri Aug 28 17:34:04 2015 -0500
> > 
> > Fix mode +st on TMPDIR when creating it
> > 
> > A sanity check fails when TMPDIR has setuid, setgid set. It was
> > proposed to fix this on TMPDIR creation instead of failing with
> > a sanity test only. This patch handles removal of those special
> > bits (and additonally, the sticky bit) from BUILDDIR and TMPDIR
> > when these directories are created.
> 
> Can you explain why it's needed to remove them?

At least in theory the sticky bit (t) can end up influencing the target
package file ownership. In the interests of build determinism we really
need TMPDIR to start in a consistent way with a consistent set of
permissions.

Put another way, I don't really want to have to add new sanity tests
that test if builds work the same if TMPDIR is +t compared to a dir that
isn't set that way.

So if you could tweak your autobuilder setup to lose the sticky bit on
that directory, I think that would be preferable to adding more corner
cases to the build environment.

If everyone had setups like this, that would change my view but it
doesn't seem to eb the ase.

Cheers,

Richard


