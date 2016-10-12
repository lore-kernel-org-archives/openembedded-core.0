Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id A5C7A719CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 17:01:07 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:ecb4:a948:3777:ace7] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>) id 1buMtv-0001Gl-H4
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2016 19:01:07 +0200
Message-ID: <1476291665.16008.59.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2016 18:01:05 +0100
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: File conflicts in DL_DIR
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
X-List-Received-Date: Wed, 12 Oct 2016 17:01:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I just ran into an annoying problem with two recipes whose upstreams
both use the same poor naming scheme for their downloadable tarballs
which causes the sources to collide in DL_DIR.  One of them is eudev,
which has:

SRC_URI = "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz

This shows up as a source checksum error when the second package finds
what it thinks are its sources in DL_DIR, but of course they are not
the files that it wanted.

I couldn't immediately find any easy way to work around this
difficulty.  Setting "localpath=eudev_v{$PV}.tar.gz" in eudev's SRC_URI
looks superficially like it ought to do the right thing, but although
this changes the location that the fetcher will search for the
downloaded file it doesn't actually cause wget to put the file there so
this doesn't work either.

I suppose I could define DL_DIR in terms of ${PN}, which would
presumably fix this problem at the cost of causing all my previous
downloads to be repeated.  Or I could stop using eudev, or wait for one
of the two packages to release a new version. :-)  Any better
suggestions?

thanks

p.


