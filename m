Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D00BE72491
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 09:56:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2015 02:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,579,1427785200"; d="scan'208";a="723759491"
Received: from alefebvr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.29.139])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2015 02:56:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Tue, 09 Jun 2015 10:56:19 +0100
Message-ID: <2113977.Z7JFxjnESr@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <5576A8EF.7070800@topic.nl>
References: <1432276145-31264-1-git-send-email-mike.looijmans@topic.nl>
	<1432276145-31264-4-git-send-email-mike.looijmans@topic.nl>
	<5576A8EF.7070800@topic.nl>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 09 Jun 2015 09:56:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike,

On Tuesday 09 June 2015 10:50:55 Mike Looijmans wrote:
> On 22-05-15 08:29, Mike Looijmans wrote:
> > Set GITPKGV to mimic the meta-openembedded 'gitpkgv' class. This allows
> > a recipe to simply set:
> > PKGV="1.2+${GITPKGV}"
> > And no longer needs to inherit gitpkgv class.
> > ---
> > 
> >   conf/bitbake.conf | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> > index a35219d..5dafd52 100644
> > --- a/conf/bitbake.conf
> > +++ b/conf/bitbake.conf
> > @@ -47,3 +47,4 @@ TARGET_ARCH = "${BUILD_ARCH}"
> > 
> >   TMPDIR = "${TOPDIR}/tmp"
> >   WORKDIR = "${TMPDIR}/work/${PF}"
> >   PERSISTENT_DIR = "${TMPDIR}/cache"
> > 
> > +GITPKGV = "${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}"
> 
> This looked okay, but when put to a practical test, I noticed that this did
> not work at all. The GITPKGV variable is not set when building recipes,
> resulting in the literal string ${GITPKGV} appearing in version numbers of
> packages that try to use it.
> 
> It does work when I add this line to local.conf, but apparently bitbake.conf
> never actually gets parsed?

This is because you patched the bitbake.conf in bitbake rather than OE-Core - 
the bitbake one is really just an example and you're right, in an OE context 
it never gets used. I think Richard skipped this one as a result, so what we'd 
need is a patch against OE-Core's bitbake.conf to finish this off.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

