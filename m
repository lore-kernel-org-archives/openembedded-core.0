Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 10072718E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 16:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0RGJmxD021505; Tue, 27 Jan 2015 16:19:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 77YswKBNiRG2; Tue, 27 Jan 2015 16:19:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0RGIiVX021492
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Jan 2015 16:19:45 GMT
Message-ID: <1422375524.19798.56.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Hart, Darren" <darren.hart@intel.com>
Date: Tue, 27 Jan 2015 16:18:44 +0000
In-Reply-To: <D0ECF2E2.B9709%darren.hart@intel.com>
References: <1422372551.19798.53.camel@linuxfoundation.org>
	<54C7B296.5020506@windriver.com> <D0ECF2E2.B9709%darren.hart@intel.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: Add missing depends on virtual/kernel for depmod data
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
X-List-Received-Date: Tue, 27 Jan 2015 16:19:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-01-27 at 15:48 +0000, Hart, Darren wrote:
> On 1/27/15, 7:45 AM, "Bruce Ashfield" <bruce.ashfield@windriver.com> wrote:
> 
> >On 15-01-27 10:29 AM, Richard Purdie wrote:
> >> We need the depmod data so that the kernel depmod command works
> >>successfully
> >> at rootfs time. The fact this was working inconsistently is now
> >>highlighted
> >> after the command was made to error out. A simple test case is:
> >>
> >> bitbake virtual/kernel image
> >> bitbake vrituak/kernel -c clean
> >> bitbake image -c rootfs -f
> >>
> >> We fix it by adding the missing dependency.
> >
> >Looks good here.
> >
> >Out of curiosity, was this hiding before, or did it only come about due
> >to our recent moves to the work-shared kernel builds ?
> 
> I'm being dense I guess. I went to go verify what virtual/kernel
> do_populate_sysroot is doing in the current state of things, in order to
> be sure it copied over the right files, and I couldn't find it quickly.
> Where is this defined?

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=11ef55a93bd2bbd95e203fab3aa237322923ffd9

Specifically:

sysroot_stage_all () {
 sysroot_stage_dir ${D}${datadir}/kernel-depmod ${SYSROOT_DESTDIR}${datadir}/kernel-depmod
}

Cheers,

Richard




