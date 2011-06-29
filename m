Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbvjN-000773-9a for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:27:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TENOMK005013
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:23:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04893-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:23:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TENFIu005007
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:23:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E09E857.4040908@windriver.com>
References: <cover.1307058256.git.scott.a.garman@intel.com>
	<9591788655a4de97cc5f6a0fd98e742e3ebcab23.1307058256.git.scott.a.garman@intel.com>
	<1309266295.20015.287.camel@rex>  <4E09E857.4040908@windriver.com>
Date: Wed, 29 Jun 2011 15:22:58 +0100
Message-ID: <1309357378.20015.404.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/7] useradd.bbclass: new class for managing user/group permissions
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
X-List-Received-Date: Wed, 29 Jun 2011 14:27:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 09:42 -0500, Mark Hatle wrote:
> On 6/28/11 8:04 AM, Richard Purdie wrote:
> > Hi Scott,
> > 
> > Sorry its taken me a while to get to this. Some comments below.
> 
> I think I know the answer to a few of the issues mentioned below.  Scott can
> correct me if I'm wrong.
> 
> > On Thu, 2011-06-02 at 16:50 -0700, Scott Garman wrote:
> >> This class is to be used by recipes that need to set up specific
> >> user/group accounts and set custom file/directory permissions.
> >>
> >> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> >> ---
> >>  meta/classes/useradd.bbclass |  163 ++++++++++++++++++++++++++++++++++++++++++
> >>  1 files changed, 163 insertions(+), 0 deletions(-)
> >>  create mode 100644 meta/classes/useradd.bbclass
> >>
> >> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> >> new file mode 100644
> >> index 0000000..3f07e5e
> >> --- /dev/null
> >> +++ b/meta/classes/useradd.bbclass
> >> @@ -0,0 +1,163 @@
> >> +USERADDPN ?= "${PN}"
> >> +
> >> +# base-passwd-cross provides the default passwd and group files in the
> >> +# target sysroot, and shadow-native provides the utilities needed to
> >> +# add and modify user and group accounts
> >> +DEPENDS_append = " base-passwd shadow-native"
> >> +RDEPENDS_${USERADDPN}_append = " base-passwd shadow"
> >> +
> >> +PSEUDO="${STAGING_DIR_NATIVE}/usr/bin/pseudo"
> >> +export PSEUDO
> > 
> > For reference this can be done with:
> > 
> > export PSEUDO = "${STAGING_DIR_NATIVE}/usr/bin/pseudo"
> > 
> >> +PSEUDO_LOCALSTATEDIR="${STAGING_DIR_TARGET}/var/pseudo"
> >> +export PSEUDO_LOCALSTATEDIR
> > 
> > I'm a little bit puzzled at this point. This is changing the default
> > PSEUDO state directory to be one shared by many other users rather than
> > the default of the one in workdir. Is that really what you intend here?
> > 
> > I guess the question is whether we need to preserve these users in the
> > sysroot or whether preserving them for the install/package/package_write
> > cycle is enough.
> 
> If we're populating the sysroot, we need to have a pseudo directory setup for it
> so that we can run the adduser/group items.  The new adduser/group require the
> ability to "chroot" into a (pseudo) root.  The above should only kick in while
> working with sysroots.

I understand this now. I still do have a concern about namespacing
though. I think alongside the existing code which does:

SYSROOT="${STAGING_DIR_TARGET}"
OPT="--root ${STAGING_DIR_TARGET}"

we should have these PSEUDO* exports, then they can't easily get
confused with the general pseudo environment we're using. Some comments
about what this is doing would also be useful as if I can't understand
this now, its likely in 3 months time its just going to be worse...

> The way this is implemented the new sysroot tasks call the regular tasks so the
> code only has to be implemented once.  Assuming context doesn't change, it
> should be possible to move the "PSEUDO" calls down into the _sysroot functions
> and remove them from the items that get embedded into the target packages.

I like this idea and I think it will be clearer whats going on,
particularly if we can do something like I mention above :)

> >> +			pkgs = packages[0]
> >> +
> >> +	for pkg in pkgs.split():
> >> +		param = bb.data.getVar(param_type % pkg, localdata, 1)
> >> +		params.append(param)
> >> +
> >> +	return string.join(params, "; ")
> 
> ... it's not clear to me that any of the 'd' elements are changing.  So
> localdata may not actually be needed in any way.  Either we should be consistent
> and use localdata everywhere or just 'd'.  (Normally I use localdata when I'm
> transforming the data "in-place" and using setVar... but I don't see that in here.

Good catch, I think there should be more use of localdata here too.

Cheers,

Richard





