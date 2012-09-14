Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TCeHa-0005vJ-UA for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 00:22:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EMA4xE017787;
	Fri, 14 Sep 2012 23:10:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11883-03; Fri, 14 Sep 2012 23:09:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EM9sjE017774
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 23:09:55 +0100
Message-ID: <1347660597.13596.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Fri, 14 Sep 2012 23:09:57 +0100
In-Reply-To: <CAPhnLPA6GodRgpEKwyCdbVPOdv+s3nW3zp2rDUhuj3xw=K3L+g@mail.gmail.com>
References: <1347564379-14252-1-git-send-email-sgw@linux.intel.com>
	<22844638.2V3OiWsK3u@helios> <5052617D.7080206@linux.intel.com>
	<1347638477.13596.21.camel@ted> <50535FC5.9040802@windriver.com>
	<CAPhnLPA6GodRgpEKwyCdbVPOdv+s3nW3zp2rDUhuj3xw=K3L+g@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] license: Ensure we find multilib packages also
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 22:22:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 13:50 -0700, Flanagan, Elizabeth wrote:
> On Fri, Sep 14, 2012 at 9:48 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> > On 9/14/12 11:01 AM, Richard Purdie wrote:
> >>
> >> On Thu, 2012-09-13 at 15:43 -0700, Saul Wold wrote:
> >>>
> >>> On 09/13/2012 03:31 PM, Paul Eggleton wrote:
> >>>>
> >>>> On Thursday 13 September 2012 12:26:19 Saul Wold wrote:
> >>>>>
> >>>>> Make sure to find -package, this was causing a failure
> >>>>> in the multi-lib build license generation during rootfs.
> >>>>>
> >>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >>>>> ---
> >>>>>    meta/classes/license.bbclass |    2 +-
> >>>>>    1 files changed, 1 insertions(+), 1 deletions(-)
> >>>>>
> >>>>> diff --git a/meta/classes/license.bbclass
> >>>>> b/meta/classes/license.bbclass
> >>>>> index 29fe938..b29067c 100644
> >>>>> --- a/meta/classes/license.bbclass
> >>>>> +++ b/meta/classes/license.bbclass
> >>>>> @@ -88,7 +88,7 @@ license_create_manifest() {
> >>>>>         # list of installed packages is broken for deb
> >>>>>         for pkg in ${INSTALLED_PKGS}; do
> >>>>>                 # not the best way to do this but licenses are not arch
> >>>>> dependant iirc
> >>>>> -               filename=`ls
> >>>>> ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
> >>>>> +               filename=`ls
> >>>>> ${TMPDIR}/pkgdata/*/runtime-reverse/*${pkg}| head -1`
> >>>>>                 pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
> >>>>>
> >>>>>                 # exclude locale recipes
> >>>>
> >>>>
> >>>> Surely this could end up matching a the wrong file when one package name
> >>>> is a
> >>>> substring of another?
> >>>>
> >>> I am open to ideas here, I tried the ${MLPREFIX}, but it seems to be
> >>> empty when rootfs runs, that did not help, I thought about adding the
> >>> '-', but that would fail in the non-multilib case, how can I determine
> >>> what the prefix will be to get a more accurate match?
> 
> I'm not particularly happy with how we've been doing manifests for a
> while now and have been hacking at a revamp of it for the past 2
> months on and off.
> 
> We really shouldn't be relying on package data at all for license
> manifests. As the manifests are relying on list_installed_packages,
> they end up inaccurate anyway as list_installed_packages does exactly
> that. List software installed via package. Not installed via the
> package manager? Then you aren't in the manifest. This ends up missing
> quite a few things necessary from a release engineering standpoint
> (like, hey, modutils? The kernel? Not listed in the manifest. IMHO
> this is wrong.)
> 
> As a release engineer, I kind of don't really care if the software on
> my image was installed via the packaging system. I just want a list of
> what is on the images so I can audit my images to ensure GPL
> commitments.
> 
> One way I've been looking at fixing this is via event handlers. I'll
> have some code for RFC on this hopefully soon, but a preview (which
> may or may not work it's still a WIP) is at:
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=eflanagan/license_manifest
> 
> One thing the patch I've been working on does other than creates
> accurate manifests is it also tries to create a semi-compliant SPDX
> 1.0 manifest.
> 
> I know this is late in the cycle so it might not make 1.3, but this
> may be something we want to look at to end up solving this issue once
> and for all.

This depends whether this is a release manifest or an image manifest.
You likely want *both* under different circumstances. If the kernel is
installed in the image, it will be listed in the image manifest. We just
need to be really clear about what the manifest is for.

As for modutils, we use kmod now. Basically anything doing deployment
should have a manifest associated with it. That is do_deploy (kernel,
uboot, some small list of others) and do_rootfs. do_package_write_* are
also arguably deployment in another form, as are sstate feeds.

Cheers,

Richard



