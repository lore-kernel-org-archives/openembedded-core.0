Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 47BF874197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:54:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Nov 2015 06:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="847589830"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.0.72])
	by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2015 06:54:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Date: Tue, 10 Nov 2015 14:54:13 +0000
Message-ID: <2152743.VBXfi2XSoW@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.10-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <564203DB.4070709@topic.nl>
References: <1447077707-31620-1-git-send-email-adrian.ratiu@ni.com>
	<1447145447-5678-1-git-send-email-adrian.ratiu@ni.com>
	<564203DB.4070709@topic.nl>
MIME-Version: 1.0
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] util-linux: create util-linux-runuser package
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
X-List-Received-Date: Tue, 10 Nov 2015 14:54:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 10 November 2015 15:48:59 Mike Looijmans wrote:
> On 10-11-15 09:50, Ioan-Adrian Ratiu wrote:
> > Split runuser into its own package (previously provided by util-linux).
> > Since runuser is compiled only when DISTRO_FEATURES includes pam,
> > the creation of util-linux-runuser is also constrained by this.
> > 
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> > 
> >   meta/recipes-core/util-linux/util-linux.inc | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/util-linux/util-linux.inc
> > b/meta/recipes-core/util-linux/util-linux.inc index 594108f..dc460e7
> > 100644
> > --- a/meta/recipes-core/util-linux/util-linux.inc
> > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > @@ -34,6 +34,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk
> > util-linux-cfdisk util-linux-sfd> 
> >                util-linux-partx ${PN}-bash-completion util-linux-hwclock \
> >                util-linux-findfs util-linux-getopt util-linux-sulogin"
> >   
> >   PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount',
> >   'util-linux-pylibmount', '', d)}"> 
> > +PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> > 'util-linux-runuser', '', d)}"> 
> >   PACKAGES_DYNAMIC = "^util-linux-lib.*"
> > 
> > @@ -85,6 +86,7 @@ FILES_util-linux-partx = "${sbindir}/partx"
> > 
> >   FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
> >   FILES_util-linux-findfs = "${sbindir}/findfs"
> >   FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
> > 
> > +FILES_util-linux-runuser = "${sbindir}/runuser"
> > 
> >   FILES_util-linux-pylibmount =
> >   "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.so \>   
> >                                  ${libdir}/${PYTHON_DIR}/dist-packages/lib
> >                                  mount/__init__.*"
> > 
> > @@ -106,7 +108,9 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
> > 
> >   # reset calls 'tput'
> >   RDEPENDS_util-linux-reset += "ncurses"
> > 
> > -RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff
> > util-linux-losetup util-linux-sulogin" +RDEPENDS_util-linux-runuser +=
> > "libpam"
> > +
> > +RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff
> > util-linux-losetup util-linux-sulogin util-linux-runuser"
>
> I think that will need to be conditional. Without pam, you won't be able to
> install util-linux because of the missing util-linux-runuser dependency.

Not to mention you'll get a build time warning because pam is being built 
without the feature enabled.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

