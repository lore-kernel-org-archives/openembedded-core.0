Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B779B75886
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 10:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t59ADnjl013998; Tue, 9 Jun 2015 11:13:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YTA2DSnp8JA9; Tue,  9 Jun 2015 11:13:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t59ADZMP013981
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 9 Jun 2015 11:13:46 +0100
Message-ID: <1433844815.28975.120.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 09 Jun 2015 11:13:35 +0100
In-Reply-To: <2113977.Z7JFxjnESr@peggleto-mobl.ger.corp.intel.com>
References: <1432276145-31264-1-git-send-email-mike.looijmans@topic.nl>
	<1432276145-31264-4-git-send-email-mike.looijmans@topic.nl>
	<5576A8EF.7070800@topic.nl>
	<2113977.Z7JFxjnESr@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] bitbake.conf: Set GITPKGV variable
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
X-List-Received-Date: Tue, 09 Jun 2015 10:13:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-06-09 at 10:56 +0100, Paul Eggleton wrote:
> Hi Mike,
> 
> On Tuesday 09 June 2015 10:50:55 Mike Looijmans wrote:
> > On 22-05-15 08:29, Mike Looijmans wrote:
> > > Set GITPKGV to mimic the meta-openembedded 'gitpkgv' class. This allows
> > > a recipe to simply set:
> > > PKGV="1.2+${GITPKGV}"
> > > And no longer needs to inherit gitpkgv class.
> > > ---
> > > 
> > >   conf/bitbake.conf | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> > > index a35219d..5dafd52 100644
> > > --- a/conf/bitbake.conf
> > > +++ b/conf/bitbake.conf
> > > @@ -47,3 +47,4 @@ TARGET_ARCH = "${BUILD_ARCH}"
> > > 
> > >   TMPDIR = "${TOPDIR}/tmp"
> > >   WORKDIR = "${TMPDIR}/work/${PF}"
> > >   PERSISTENT_DIR = "${TMPDIR}/cache"
> > > 
> > > +GITPKGV = "${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}"
> > 
> > This looked okay, but when put to a practical test, I noticed that this did
> > not work at all. The GITPKGV variable is not set when building recipes,
> > resulting in the literal string ${GITPKGV} appearing in version numbers of
> > packages that try to use it.
> > 
> > It does work when I add this line to local.conf, but apparently bitbake.conf
> > never actually gets parsed?
> 
> This is because you patched the bitbake.conf in bitbake rather than OE-Core - 
> the bitbake one is really just an example and you're right, in an OE context 
> it never gets used. I think Richard skipped this one as a result, so what we'd 
> need is a patch against OE-Core's bitbake.conf to finish this off.

I just applied it to the one in bitbake since that was the one the patch
was written for.

To make this work in OE, we'd need one for OE-Core.

My only reluctance to put this into OE's bitbake.conf is that we can run
the risk of tracebacks/errors in the "bitbake -e" output. I think we
already get this for SRCREV.

Toaster is also generating errors on the autobuilder when it iterates
through the datastore and tries to expand variables like SRCREV, this
would add another such error there too :(.

Cheers,

Richard


