Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
	by mail.openembedded.org (Postfix) with ESMTP id 000D160B3E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 13:45:37 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 48hZDx2M2fz5tlf;
	Tue, 17 Mar 2020 14:45:37 +0100 (CET)
Date: Tue, 17 Mar 2020 14:45:36 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20200317134535.kle77hptmqsj5yf5@qschulz>
References: <CAMRc=Mf_Ld80=Egf3jPBGYoGGZScSG3JHKL7cVArLihJSC8P0g@mail.gmail.com>
	<CAMRc=MdcU5UTt6iLcpjUDxs5JkwD3db7QP--b2xjXBpqiHfguA@mail.gmail.com>
	<f1026c8fbd01e72648f487e024ce3b18e09581cb.camel@linuxfoundation.org>
	<CAMRc=Md9CECDMOq1VzgmxO0w9L=eD+HcXcUeZkRp3hGrXBsnvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRc=Md9CECDMOq1VzgmxO0w9L=eD+HcXcUeZkRp3hGrXBsnvA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Guillaume Pain <gpain@baylibre.com>, Jerome Neanne <jneanne@baylibre.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Solving a circular dependency issue between the main image and initramfs
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
X-List-Received-Date: Tue, 17 Mar 2020 13:45:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Bartosz,

On Tue, Mar 17, 2020 at 02:26:37PM +0100, Bartosz Golaszewski wrote:
> pon., 16 mar 2020 o 12:01 Richard Purdie
> <richard.purdie@linuxfoundation.org> napisał(a):
> >
> > On Mon, 2020-03-16 at 11:48 +0100, Bartosz Golaszewski wrote:
> > > There has been no relevant feedback, but I've been experimenting with
> > > various things. I think that the best approach would be to make image
> > > artifacts installable into dependant recipes' sysroots (in
> > > /usr/share/images/). This way the initramfs recipe could calculate
> > > the
> > > dm-verity hashes from the resulting ext4 image before it gets
> > > deployed. We could also modify the kernel recipe to not fetch the
> > > initramfs image from the shared directory but instead have it
> > > installed in its sysroot.
> > >
> > > For this I tried to re-enable the do_install task in image.bbclass.
> > > Unfortunately either I'm doing something wrong or standard tasks are
> > > subject to different rules when it comes to dependencies. I've been
> > > so
> > > far unable to make do_install depend on any image tasks (i.e. make
> > > do_install depend on do_image_ext4/wic etc.) no matter if I use
> > > do_install[depends] or addtask or appropriate helpers from python.
> > > Unfortunately I've been unable to find any information on that in the
> > > manual.
> > >
> > > Is there some trick to changing the dependencies of standard tasks?
> >
> > I don't know how exactly you're configuring the system but it should be
> > possible to have the main rootfs built first, adding in the signing,
> > then have the initramfs depend on that.
> >
> 
> I too thought this should be possible with current implementation and
> yet I've spent so many hours on this to no avail it's not funny. :(
> 

I haven't read carefully your thread but ran into what seems to be a
similar situation two years ago:

https://youtu.be/jtLQ8SzfrDU?t=2336

So, TL;DR, couldn't create a fitimage with kernel-fitimage because of
circular dependencies and we had to create a new fitimage bbclass which
wasn't inherited in the kernel but by the image recipe IIRC.

I didn't think at that time kernel-fitimage made sense because you can
technically put whatever you want in a fitimage. I can technically not
have a kernel in it. I thought a fitimage bbclass inherited by an image
recipe made much more sense. It was two years ago, didn't share anything
with the YP folks back then, so my bad. I haven't had this issue since
then (no product requiring this) so didn't think much more about it :/

I promised once we had something good enough we would give back to the
community. Now that I've left that company and forgot to do it, you can
throw rocks at me.

Good luck and keep us posted please.
Quentin

