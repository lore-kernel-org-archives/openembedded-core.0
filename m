Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U8YeP-0000AN-Ho
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 17:05:40 +0100
Received: by mail-oa0-f41.google.com with SMTP id i10so9310680oag.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 07:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=IN8NI0+rxlAvU5LrYnxyEbSXCWK9/OTfcRlmtD3Loks=;
	b=LxHkswngD+yLv6XJ/0mSH27lP2yhUFrhreXGUGrGUi0fTw/8pqgUd1gmMitw+HfC6U
	kU9TgI2LYZ4iz8ceY7kvSNjD9Ih4LcvfZwCsFkKx835ZiDkpXKib+uHU0gxDj+iXflsO
	Ntb5CTEhpnABXVbHDHbJ+96rq7bJnkuogpv/qZclQ8DKVu7eSQJvEGEw+c53ffZUI/Td
	oJU3y6ZWY07mxPiZXghoIQmjCTZWGUFAfpsAMl0PKwqY0xf4gX7QrPSaUfFGmWRhz1Qb
	Aq3IA85lWxcDGfElLCvVZAFYKQRTvVbEoZqydue7EmRO52iT8g58sCWGBTuVVqQ3tYJs
	0jog==
MIME-Version: 1.0
X-Received: by 10.60.8.40 with SMTP id o8mr10999690oea.112.1361461764817; Thu,
	21 Feb 2013 07:49:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Thu, 21 Feb 2013 07:49:24 -0800 (PST)
In-Reply-To: <CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
Date: Thu, 21 Feb 2013 12:49:24 -0300
X-Google-Sender-Auth: hjWwb16FMTwNFCenFpw0DHKyq3g
Message-ID: <CAP9ODKovbTu92VLH6TyGFNxZ16YRBv8znUjyhqs+si=1_oH08Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Thu, 21 Feb 2013 16:05:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 21, 2013 at 12:35 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi,
>
> This thread started sprawling, so I'll do my best to cover all the
> points.  This is also mainly an attempt to get more information as to
> how people are using init managers, as it's still not very clear what
> people want beyond "choice".

Awesome. I agree it is difficult to track in a such big thread.

> "With recent systemd packaging change, the rescue image size grow up
> from 5.9 MiB to 27 MiB because systemd dependencies are hardcoded in
> mandatory packages."
>
> This certainly can happen.  core-image-minimal-initramfs went from 19M
> up to 35M if you turn on systemd with the (unmerged) busybox enabling
> turned on.  Investigating this shows that the cause was busybox
> recommending busybox-syslog which depends on systemd, which isn't
> useful in the initramfs.  My branch adds busybox-syslog to
> BAD_RECOMMENDS and it's back down to 19M.  This works as this image
> has a custom /sbin/init so it doesn't use an init manager at all.

Right. However BAD_RECOMMENDS is a little *manual* ... more on this later ...

> When people are building images with and without systemd, how are the
> non-systemd images booting?  If sysvinit, what's the rationale for

Last time I tested no. systemd-udevd would need to be split from
systemd package and have init scripts as an option.

> this?  Will you consider switching to systemd for everything if the
> disk increase was only a new MB, on the grounds of consistent booting
> behaviour?  I can imagine many rescue or initramfs images are using a
> custom /init, but as these don't/shouldn't actually have any daemons
> installed this is practically a solved problem.

No; one of our products is build with an initramfs (using
initramfs-framework) and it is much easier for this than the systemd.
In some cases we use the init.d scripts provided by packages to allow
reuse in initramfs-framework and it works fine.

> systemd as integrated is currently too big for very constrained
> environments, and I'm not denying that.  Using this
> core-image-minimal-initramfs as a test whilst pulling in systemd I've
> been cleaning up spurious dependencies and have managed to trim around
> 4MB from the footprint, but there's massive low-hanging fruit like a
> 4MB /lib/udev/hwdb.d.  Rescue images likely don't need this, so we can
> split it out and not always install it (now down to a 5MB footprint
> compared to no init system).

Yes; this is a regression from the status we had in meta-oe *before*
the merge in oe-core. It was more flexible.

> One massive problem with making init system an image time choice with
> packages is what happens when you have a feed with both pn-sysv and
> pn-systemd packages in.  If after the initial construction you want to
> install a daemon, you'll have to know to manually install the right
> init package too.

Yes; this is one problem. I think we might think about havig something
in package manager that try to fullfil a virtual provide (as we had
for locales).

> Supporting multiple init systems in the same packaging would be
> achievable, but would people who want this be happy with pulling the
> systemd libraries into sysvinit images?  The alternative is that if
> sysvinit and systemd are enabled we can't do any real systemd
> enabling.   The good thing is that we could certainly make
> systemd.bbclass inject a recommends instead of dependency on systemd
> and add guards around the systemd calls, ditto for update-rcd.bbclass.

It depends. If I have 'systemd' enabled in the distro I am sure
expecting it to happen. If I don't, I don't expect it to happen.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


