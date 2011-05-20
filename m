Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNUVS-0002r2-Eq for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 20:33:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KIU3tc028275;
	Fri, 20 May 2011 19:30:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28004-05; Fri, 20 May 2011 19:29:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KITvct028265
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 20 May 2011 19:29:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTinNWWa326y1rS8eWNkXrYYaSqTh8Q@mail.gmail.com>
References: <cover.1305752660.git.chris_larson@mentor.com>
	<b7564c32452e9ce33d9790465b986471ef5a3cba.1305752660.git.chris_larson@mentor.com>
	<1305914753.3424.670.camel@rex>
	<BANLkTinNWWa326y1rS8eWNkXrYYaSqTh8Q@mail.gmail.com>
Date: Fri, 20 May 2011 19:29:51 +0100
Message-ID: <1305916191.3424.674.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 4/5] image.bbclass: switch to OE's IMAGE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 May 2011 18:33:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-20 at 11:09 -0700, Chris Larson wrote:
> On Fri, May 20, 2011 at 11:05 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2011-05-18 at 14:06 -0700, Chris Larson wrote:
> >> From: Chris Larson <chris_larson@mentor.com>
> >>
> >> Currently, all image features are assumed to be package groups defined with
> >> oe.packagegroup (PACKAGE_GROUP_<group> = "<list of packages>").
> >>
> >> Signed-off-by: Chris Larson <chris_larson@mentor.com>
> >> ---
> >>  meta/classes/core-image.bbclass |  112 ++++++++++++++-------------------------
> >>  meta/classes/image.bbclass      |   41 ++++++++++++++-
> >>  meta/conf/bitbake.conf          |    1 +
> >>  3 files changed, 79 insertions(+), 75 deletions(-)
> >>          - SDK
> >> @@ -26,75 +24,43 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
> >>  # - nfs-server          - NFS server (exports / over NFS to everybody)
> >>  # - ssh-server-dropbear - SSH server (dropbear)
> >>  # - ssh-server-openssh  - SSH server (openssh)
> >> -# - dev-pkgs            - development packages
> >> -# - dbg-pkgs            - debug packages
> >>  #
> >
> > I like the patch, there are just two things which bother me a little.
> > Firstly, if I understand correctly and haven't missed anything,
> > "dev-pkgs" becomes "dev" with this change?
> >
> > A quick grep shows users of this such as:
> >
> > recipes-core/images/core-image-minimal-dev.bb:IMAGE_FEATURES += "dev-pkgs"
> > recipes-extended/images/core-image-lsb-sdk.bb:IMAGE_FEATURES += "apps-console-core tools-debug tools-profile tools-sdk dev-pkgs ssh-server-openssh"
> > recipes-extended/images/core-image-lsb-dev.bb:IMAGE_FEATURES += "apps-console-core dev-pkgs ssh-server-openssh"
> > recipes-sato/images/core-image-sato-dev.bb:IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs"
> > recipes-sato/images/core-image-sato-sdk.bb:IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} tools-debug tools-profile tools-sdk dev-pkgs qt4-pkgs"
> >
> > and I'd expect the changelog to at least mention it and correct this.
> >
> > I'm also thinking IMAGE_FEATURES = "dev" doesn't really indicate what it
> > means very clearly which is why dev-pkgs was originally used...
> 
> Good points, that's fair enough. I only went with 'dev' for
> compatibility with upstream OE. I'm not opposed to switching to
> dev-pkgs. Would you like me to do that and resubmit, with the other
> issues addressed?

Yes please :)

> >> --- a/meta/classes/image.bbclass
> >> +++ b/meta/classes/image.bbclass
> >> @@ -11,8 +11,45 @@ INHIBIT_DEFAULT_DEPS = "1"
> >>
> >>  # "export IMAGE_BASENAME" not supported at this time
> >>  IMAGE_BASENAME[export] = "1"
> >> -export PACKAGE_INSTALL ?= "${IMAGE_INSTALL}"
> >> -PACKAGE_INSTALL_ATTEMPTONLY ?= ""
> >> +
> >> +PACKAGE_INSTALL = "${@' '.join(oe.packagegroup.required_packages('${IMAGE_FEATURES}'.split(), d))}"
> >> +PACKAGE_INSTALL_ATTEMPTONLY = "${@' '.join(oe.packagegroup.optional_packages('${IMAGE_FEATURES}'.split(), d))}"
> >> +RDEPENDS += "${@' '.join(oe.packagegroup.active_packages('${IMAGE_FEATURES}'.split(), d))}"
> >
> > I also noticed this patch changes things so PACKAGE_INSTALL_ATTEMPTONLY
> > is used for the dev/doc/dbg packages. I'm not sure its a major issue but
> > it is a change in behaviour and I'd have expected it in the commit
> > message.
> 
> Ah, that's my mistake then, I didn't realize the behavior was
> different in the current implementation. I just figured some packages
> might not have dev/doc/dbg, so it should be nonfatal to miss them. We
> may also need to make sure rpm/deb both handle attemptonly properly,
> as upstream's did not. I'll add this to the commit message, unless you
> think they shouldn't be optional? I'm inclined to prefer it this way,
> as, iirc, the depchain stuff uses recommends rather than depends.
> (though i may be remembering wrong?)

I just checked and all the rootfs package backends have code which looks
like it makes that work. I'm fine with the behaviour change as long as
we document it.

FWIW, I merged the other patches in the series since they were not
directly related.

Cheers,

Richard




