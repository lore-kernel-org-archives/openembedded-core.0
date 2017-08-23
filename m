Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 097E477A2C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 14:58:08 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7NEw66A001677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 23 Aug 2017 15:58:07 +0100
Message-ID: <1503500286.32591.162.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Khem Raj
	<raj.khem@gmail.com>
Date: Wed, 23 Aug 2017 15:58:06 +0100
In-Reply-To: <77e11e27-ec62-4a4d-2ca0-f874d9d09883@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<ab92e7d90c416d6e5cdb17cdba269e09ec967607.1503283308.git.bruce.ashfield@windriver.com>
	<CAMKF1soEQpj++eDz_Cq23t-OEJGi8jJW7V2sYStEyMHwrUrm2g@mail.gmail.com>
	<c24b84e6-3fa5-371b-e7f4-71055be6814a@windriver.com>
	<CAMKF1so-ifGj68AZj6WxFeFRrmDZMq9KcvpQsXYzdi_N5W89-A@mail.gmail.com>
	<77e11e27-ec62-4a4d-2ca0-f874d9d09883@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 23 Aug 2017 15:58:07 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] kernel-yocto: ensure that only valid BSPs are built
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
X-List-Received-Date: Wed, 23 Aug 2017 14:58:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-08-23 at 10:42 -0400, Bruce Ashfield wrote:
> On 08/23/2017 10:40 AM, Khem Raj wrote:
> > 
> > On Wed, Aug 23, 2017 at 5:37 AM, Bruce Ashfield
> > <bruce.ashfield@windriver.com> wrote:
> > > 
> > > On 08/22/2017 11:40 PM, Khem Raj wrote:
> > > > 
> > > > 
> > > > On Sun, Aug 20, 2017 at 7:58 PM, Bruce Ashfield
> > > > <bruce.ashfield@windriver.com> wrote:
> > > > > 
> > > > > 
> > > > > There was a bug in the search routines responsible for
> > > > > locating
> > > > > BSP definitions which returned a valid match if only the
> > > > > ktype
> > > > > matched.
> > > > > 
> > > > > This meant that someone looking for "qemux86foo" (which is an
> > > > > invalid definition) would potentially end up building
> > > > > "qemuarm"
> > > > > and be none the wiser (until it didn't boot).
> > > > > 
> > > > > With this fix to the tools search routine, and improved
> > > > > return
> > > > > code testing, we will now stop the build and report and error
> > > > > to
> > > > > the user.
> > > > > 
> > > > > [YOCTO: #11878]
> > > > > 
> > > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > > > > ---
> > > > >    meta/classes/kernel-yocto.bbclass                       |
> > > > > 3 +++
> > > > >    meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |
> > > > > 2 +-
> > > > >    2 files changed, 4 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/meta/classes/kernel-yocto.bbclass
> > > > > b/meta/classes/kernel-yocto.bbclass
> > > > > index 1ca0756c4959..3c6df92131bc 100644
> > > > > --- a/meta/classes/kernel-yocto.bbclass
> > > > > +++ b/meta/classes/kernel-yocto.bbclass
> > > > > @@ -143,6 +143,9 @@ do_kernel_metadata() {
> > > > > 
> > > > >           # expand kernel features into their full path
> > > > > equivalents
> > > > >           bsp_definition=$(spp ${includes} --find
> > > > > -DKMACHINE=${KMACHINE}
> > > > > -DKTYPE=${LINUX_KERNEL_TYPE})
> > > > > +       if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then
> > > > > +               bbfatal_log "Could not locate BSP definiton
> > > > > for
> > > > > ${KMACHINE}/${LINUX_KERNEL_TYPE}."
> > > > > +       fi
> > > > 
> > > > this breaks non linux-yocto kernels which are using the kernel
> > > > infra
> > > > from OE-Core
> > > > since they may not have kmeta structure and bsp_definition may
> > > > be empty
> > > > for them
> > > > so either provide a way to override bsp_definition to something
> > > > dummy or
> > > > infact
> > > > fall back to dummy by default with a warning or note during
> > > > parse
> > > > time. fatal is a bit harsh here.
> > > 
> > > Fair enough. I can make it a warning versus fatal, or only make
> > > it
> > > fatal if I detect a defconfig.
> > > 
> > > The issue is that the tools haven't found a configuration entry
> > > point
> > > and could end up building a garbage/invalid configuration. A
> > > defconfig
> > > could stand in as a 'valid entry' point, since it signifies a
> > > baseline
> > > configuration.
> > > 
> > > Also, I do have completed code to move fragment merging into a
> > > common
> > > location and avoid things like this .. once it goes through some
> > > more
> > > compatibility testing, I'll post it to the list.
> > 
> > Irrespective this was merged today into master, can you send a
> > followup
> > quickly so we can unbreak meta-raspberrypi
> I hadn't pulled today, and yes, I'll send something by end of day,
> since
> I don't want this to stay broken!

Thanks, I merged this as the discussion was happening not realising
there was this issue.

I did at least hopefully get all the other 4.12 issues addressed,
thanks for the help there.

Cheers,

Richard

