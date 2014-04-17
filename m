Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id C512565D13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 17:08:08 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id oz11so817991veb.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Pe528uswwJfLYLpdVabcMBOV4eX/5Xo6xv+HsRge3a8=;
	b=Id/b4K0hoiUfh1M9FQMzy6dVRk5TCxQzBKpjeaI980e93DfWWailXpsNrJw4A2Ri0c
	IaMk/12ORJaps2nFlMrQPSAWiOoRdAnLXjlPhFUNcwIi9mm5tWhqreRYQUoiZ5o+wAYP
	q4ltPVbkpgQz3iQAqg90VBgX7Bttn4zvqAZwet1FDKaiy4QUISphxDnhsfJOR+q5A/Gb
	RDjKggbNcKqtEKWcegRdKKD3q4WBb/xNvADCEyhcAXsUvuvPZH6ZESNDSJRNqc+VapaW
	h0cJwbbpFKl2R1TnRLQ501+ZkbHj8cwDTybclkavqnXx6b0j32lppK50L7maEK/6x8tF
	isvg==
MIME-Version: 1.0
X-Received: by 10.220.101.3 with SMTP id a3mr1859900vco.31.1397754489177; Thu,
	17 Apr 2014 10:08:09 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Thu, 17 Apr 2014 10:08:09 -0700 (PDT)
In-Reply-To: <CALbNGRSXjpbvPa9N1yFYRqHn7X5rMSw-6F5vnbrFwMpq0pXHZQ@mail.gmail.com>
References: <CALbNGRSqnLj6Hr+6dL0rcyacz1pXSf+XySbYs_tx_gnq5+QfEg@mail.gmail.com>
	<CANyK_8d907x2d2_9MemcBqtB3oS6fyhzZyiRWMGSOEoXTcoinA@mail.gmail.com>
	<CALbNGRSXjpbvPa9N1yFYRqHn7X5rMSw-6F5vnbrFwMpq0pXHZQ@mail.gmail.com>
Date: Thu, 17 Apr 2014 19:08:09 +0200
Message-ID: <CALbNGRTyORP9DfxidwAhNqjFb5N937vbjJYncqwLXmc4fnxjWA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: issue with file-ownership in images
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
X-List-Received-Date: Thu, 17 Apr 2014 17:08:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2014 at 1:53 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
OK I did a test with current git master.

Good news:

the sequence of running preinst-script and unpacking is correct now:

| NOTE: Performing useradd with [--root
/home/a.mueller/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce4-=
tiny-image/1.0-r0/rootfs
--system --no-create-home --user-group --home-dir /etc/polkit-1
polkitd] and 10 times of retry
...
...
| Installing polkit (0.112-r0) on root.
| Downloading file:/home/a.mueller/tmp/oe-core-eglibc/deploy/ipk/armv7at2hf=
-vfp-neon/polkit_0.112-r0_armv7at2hf-vfp-neon.ipk.
...

Bad news:

gid/uid are still identical to those with opkg 2.01 (based on same ipks cre=
ated)

I think what happens is that opkg simply uses the ids which were found
during installation.

So now with the sequence looking solved, I understand better what you sugge=
sted:
> It would certainly be possible to add options to the
> next version of opkg to lookup uids & gids from a given passwd & group
> file (which could be those from the sysroot). Is that something that
> would be useful in the future?
Yes this would solve this issue (nit: replace 'sysroot' by rootfs or image)=
.

enjoy Easter

Andreas

