Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id A8C8A60C14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 09:46:46 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id il7so220528vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 02:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=LhdM9SBFCjLW3tX57PVZZbYHBxI/pGVVPlOUyhKbtv4=;
	b=nGtDjsJXTW0zdZCY7d6lIR3FJrqtoFaQLGnWJ1EJODwoe4/HQa/EjxrH2MwOZWkfWA
	OIL6/BBXwbvPIJ3MV9afh3mD3b3LRSqs4Fg2AwEddNVVJGaIs6TheDCpbOhrg3LUfcGz
	PGjxrV2BRj8cCP5mVTQFMnidVhLfk7Pz9CGKk4CNe3fGoyvOwGe8VB4no0cBETerHmoC
	eqkO72gUYHWk4VCwZUOtGa9q45qw9rJGy+d3qynad7UEaiNCfY487GrgJH95/MNVz2XK
	zzSpsFveLtL8RO5cW9cZKAlVSruLxXZfV/OuFjCWEgnPVWMTWP2njTTZlq9cME6Lrx6F
	F9xQ==
X-Received: by 10.58.187.78 with SMTP id fq14mr10780227vec.9.1397728007462;
	Thu, 17 Apr 2014 02:46:47 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.221.5.133 with HTTP; Thu, 17 Apr 2014 02:46:07 -0700 (PDT)
In-Reply-To: <CALbNGRSqnLj6Hr+6dL0rcyacz1pXSf+XySbYs_tx_gnq5+QfEg@mail.gmail.com>
References: <CALbNGRSqnLj6Hr+6dL0rcyacz1pXSf+XySbYs_tx_gnq5+QfEg@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 17 Apr 2014 10:46:07 +0100
X-Google-Sender-Auth: h8xKDJMd3ZceFrorS7qQbUsqa2Q
Message-ID: <CANyK_8d907x2d2_9MemcBqtB3oS6fyhzZyiRWMGSOEoXTcoinA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
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
X-List-Received-Date: Thu, 17 Apr 2014 09:46:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17 April 2014 10:07, Andreas M=C3=BCller <schnitzeltony@googlemail.com> =
wrote:
> Hi,
>
> I know it is release-panic but at least for me this is an issue
> causing lots of headaches.
>
> Symptom:
> In case a recipe changes ownership of files during install, file UIDs
> & GIDs are found with incorrect values in image - at least for opkg
> (this is what I have tested so far).
>
> To investigate, I created an image containing polkit with the patch
> attached. Polkit was chosen because it is not working: no rules are
> analyzed due to missing access rights caused by wrong ownership.
>
> log.do_rootfs shows:
> | Installing polkit (0.112-r0) to root...
> | Downloading file:/home/a.mueller/tmp/oe-core-eglibc/deploy/ipk/armv7at2=
hf-vfp-neon/polkit_0.112-r0_armv7at2hf-vfp-neon.ipk.
> ...
> | update_unamecache returned false for polkitd UID: 995
> ...
> | update_unamecache returned false for polkitd UID: 995
> ...
> | Running useradd commands...
> | NOTE: Performing useradd with [--root
> /home/a.mueller/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce=
4-tiny-image/1.0-r0/rootfs
> --system --no-create-home --user-group --home-dir /etc/polkit-1
> polkitd] and 10 times of retry
> | update_unamecache returned true for  UID: 0
> ...
>
> The code creating this log is:
>     if (update_unamecache(tar.formated.uname))
>     {
>         tar_entry->uid =3D uid_cache;
>         opkg_msg(NOTICE,"update_unamecache returned true for %s UID:
> %i\n", tar.formated.uname, tar_entry->uid);
>     }
>     else
>     {
>         tar_entry->uid =3D strtol(tar.formated.uid, NULL, 8);
>         opkg_msg(NOTICE,"update_unamecache returned false for %s UID:
> %i\n", tar.formated.uname, tar_entry->uid);
>     }
>

As a slight aside to the immediate problem, the update_unamecache() in
opkg v0.2.x is fairly ugly and is removed in the current development
sources (which will become opkg v0.3.0). Instead, libarchive is used
for package extraction and it has a more flexible interface for uid
and gid lookup. It would certainly be possible to add options to the
next version of opkg to lookup uids & gids from a given passwd & group
file (which could be those from the sysroot). Is that something that
would be useful in the future?

> Conclusion:
> opkg sets file ownership during unpacking ipk. At this time the
> users/groups are not found in the image since preinst has not run yet.
> So opkg decides to set the UID/GID which were found during install as
> fallback. These IDs are coming from sysroot and are different form
> those found in the image. I checked: polkit has 995 in sysroot but
> image ends up with 997 for polkit.
>
> I did some attempts to change order of operations in opkg but these
> did not lead to some improvement yet - and I have no idea if other
> package-managers are affected too.
>
> So anybody around with more experience and willing to take care or give h=
ints?

For the problem at hand, do we know if this a new issue or was it
present in the dora or dylan branches of OE?

>
> Andreas
>

Many thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

