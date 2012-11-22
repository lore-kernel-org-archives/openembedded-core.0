Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ndec13@gmail.com>) id 1TbXy4-0007Qo-IH
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 15:41:28 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so5748261vbm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 06:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uq3V1YDU970d67jnmtn4zYNU2VIqn6o+6mWZDelmKM8=;
	b=mNt4ZI6SJRs28CeODGIM+OvMfc0exoEjTzF6CogNxsTUY3p0Pbok0sJ1UDcIiE0P/K
	GGyV1qOzxSY5L0v6VXeyBBAEW3c+hKe7UMV6XYzG44SQeYRq1E64AXZliWEUdK8tglEt
	haDGlKsytPnCCkuEMnooQtxeuuXpeDQkOnowesMn/sYR7cODZs2iM2YLKYYrVSQ6HJJK
	7GC1wHEgLSIHAfjLqVvVzAsIDftQ50TA1hROyOfuVYqicjfo0SCaOXwoLLMupGZS511M
	94bPZ1nX8y6hnwby3v0SZDHeznN3gs4x0bnFSwPSPGvoS+2NSfz+Ly2pXBIQESt6fhsS
	WGlA==
Received: by 10.52.180.10 with SMTP id dk10mr863263vdc.101.1353594440024; Thu,
	22 Nov 2012 06:27:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.248.74 with HTTP; Thu, 22 Nov 2012 06:26:59 -0800 (PST)
In-Reply-To: <20121122140917.GF12637@jama.jama.net>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<7f73d8a0aee08a41e949ec7a1297f5edbf12ed57.1352898505.git.laurentiu.palcu@intel.com>
	<20121121162051.GK12637@jama.jama.net> <50ADE2F7.4070904@intel.com>
	<20121122083735.GU12637@jama.jama.net> <50ADE966.4060300@intel.com>
	<CAOT3mi+kr6mg4tPwkY9uHohFw9w2vWVnLPDNaZV2XDuyWbL52Q@mail.gmail.com>
	<CA+chaQf1MWGeSP=BsZBtTG+mOgGEL7dm51yUcBu_36co9bZz4g@mail.gmail.com>
	<CAJTo0LYTJD=QWk8pL+EEs-jsFvCPS+R_HxbD6N9tquiuCjR9=A@mail.gmail.com>
	<20121122140917.GF12637@jama.jama.net>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 22 Nov 2012 15:26:59 +0100
Message-ID: <CAOT3miLCzZ+XPBuUWUfLB51vQQaDMqHd0bsfczOxjnoAE3xa9A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, robclark@gmail.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 12/12] xf86-video-omap: add new recipe to follow the maintained repo
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
X-List-Received-Date: Thu, 22 Nov 2012 14:41:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 22, 2012 at 3:09 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> As said in other thread I did that already for xf86-video-glamo in
> meta-oe, so I agree that it's not *that* difficult.
>
> But I'm not sending xf86-video-glamo change before it's tested not only
> to build, but also to work in runtime.
>
> And I cannot work on xf86-video-omapfb now, because builder is still
> rebuilding armv7a after last layout changes.

xf86-video-omap was largely developped and tested on OMAP4 and OMAP5
(Panda). it was tested at some point on OMAP3 (beagle), but not
intensively.

when i introduced it in our meta-ti layer, we took care of using it
for Panda only, see:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=410dc026f2ee24a2346e7563a83f0181c79809cf
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=95e12712ddffcc7ec0789a8700137afe2e449445

what I would suggest given the current situation is to fallback to
fbdev until either someone properly tests this new driver on OMAP3, or
someone ports omapfb on new X11. I would not recommend to remove
xf86-video-omap as we are using it for Panda.

Also note that as mentioned here, video-omap needs omapdrm driver
(from staging) as well as CMA support. these bits need to make it in
the kernel before video-omap can be safely used on OMAP3.


