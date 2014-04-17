Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 55EA065D3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 11:53:49 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id oy12so351504veb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 04:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=LE2xf/z/CaeNdn2Cnro6vk0sYQhVz1XS/MfZfqlWWDg=;
	b=jSvdTHsvG6Jd4T+QuYjzNS+QlOlkesvl6soTiWZqu+drM/7b1Ocmw6U5Lo2raVlJXd
	crXGTg+2N8JeSuKzd+JMQMyNDf1Jo57ueW0UvI/CkgpzE+OEg4VBjPa/LP61pWvRbwvq
	/ebInJyfCvpL+FrykZoZRnwnqioxUwvx5sYZtA64cXfCHsKNskkOC9ujL7SoCtG0kzaE
	fed7FcTYe+1JDin3GHXC1AvoII8rxqZplT0NPb3ev314Q4v9iJr0wjBPvMLYcrgkci2w
	wjrsA7nm7oAzDsW/fkc5bF4nlYUpabIX/shxMC8tDV1CoIoIIy8sZdRU8Snh1T6NmYMs
	XRtw==
MIME-Version: 1.0
X-Received: by 10.58.211.69 with SMTP id na5mr1217141vec.30.1397735630577;
	Thu, 17 Apr 2014 04:53:50 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Thu, 17 Apr 2014 04:53:50 -0700 (PDT)
In-Reply-To: <CANyK_8d907x2d2_9MemcBqtB3oS6fyhzZyiRWMGSOEoXTcoinA@mail.gmail.com>
References: <CALbNGRSqnLj6Hr+6dL0rcyacz1pXSf+XySbYs_tx_gnq5+QfEg@mail.gmail.com>
	<CANyK_8d907x2d2_9MemcBqtB3oS6fyhzZyiRWMGSOEoXTcoinA@mail.gmail.com>
Date: Thu, 17 Apr 2014 13:53:50 +0200
Message-ID: <CALbNGRSXjpbvPa9N1yFYRqHn7X5rMSw-6F5vnbrFwMpq0pXHZQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Apr 2014 11:53:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2014 at 11:46 AM, Paul Barker <paul@paulbarker.me.uk> wrote=
:
> On 17 April 2014 10:07, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
>> Hi,
>>
>> I know it is release-panic but at least for me this is an issue
>> causing lots of headaches.
>>
>> Symptom:
>> In case a recipe changes ownership of files during install, file UIDs
>> & GIDs are found with incorrect values in image - at least for opkg
>> (this is what I have tested so far).
>>
>> To investigate, I created an image containing polkit with the patch
>> attached. Polkit was chosen because it is not working: no rules are
>> analyzed due to missing access rights caused by wrong ownership.
>>
>> log.do_rootfs shows:
>> | Installing polkit (0.112-r0) to root...
>> | Downloading file:/home/a.mueller/tmp/oe-core-eglibc/deploy/ipk/armv7at=
2hf-vfp-neon/polkit_0.112-r0_armv7at2hf-vfp-neon.ipk.
>> ...
>> | update_unamecache returned false for polkitd UID: 995
>> ...
>> | update_unamecache returned false for polkitd UID: 995
>> ...
>> | Running useradd commands...
>> | NOTE: Performing useradd with [--root
>> /home/a.mueller/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfc=
e4-tiny-image/1.0-r0/rootfs
>> --system --no-create-home --user-group --home-dir /etc/polkit-1
>> polkitd] and 10 times of retry
>> | update_unamecache returned true for  UID: 0
>> ...
>>
>> The code creating this log is:
>>     if (update_unamecache(tar.formated.uname))
>>     {
>>         tar_entry->uid =3D uid_cache;
>>         opkg_msg(NOTICE,"update_unamecache returned true for %s UID:
>> %i\n", tar.formated.uname, tar_entry->uid);
>>     }
>>     else
>>     {
>>         tar_entry->uid =3D strtol(tar.formated.uid, NULL, 8);
>>         opkg_msg(NOTICE,"update_unamecache returned false for %s UID:
>> %i\n", tar.formated.uname, tar_entry->uid);
>>     }
>>
>
> As a slight aside to the immediate problem, the update_unamecache() in
> opkg v0.2.x is fairly ugly and is removed in the current development
> sources (which will become opkg v0.3.0). Instead, libarchive is used
> for package extraction and it has a more flexible interface for uid
> and gid lookup. It would certainly be possible to add options to the
> next version of opkg to lookup uids & gids from a given passwd & group
> file (which could be those from the sysroot). Is that something that
> would be useful in the future?
I think it would be useful but will not solve the problem here: For
some reason (checking upgraded files?) extracting ipk is performed
before running 'preinst' scripts. Extracting does also translation of
user/group names to GUIDs. But the IDs are not found since they were
not created yet which causes fallback to IDs at creation time
(=3Dsysroot IDs).

As you mentioned, the extracting code (libbb) was replaced. So before
doing any further, I suggest I upgrade to current git HEAD, do some
investigation and let you know.

>
>> Conclusion:
>> opkg sets file ownership during unpacking ipk. At this time the
>> users/groups are not found in the image since preinst has not run yet.
>> So opkg decides to set the UID/GID which were found during install as
>> fallback. These IDs are coming from sysroot and are different form
>> those found in the image. I checked: polkit has 995 in sysroot but
>> image ends up with 997 for polkit.
>>
>> I did some attempts to change order of operations in opkg but these
>> did not lead to some improvement yet - and I have no idea if other
>> package-managers are affected too.
>>
>> So anybody around with more experience and willing to take care or give =
hints?
>
> For the problem at hand, do we know if this a new issue or was it
> present in the dora or dylan branches of OE?
I have written this here without investigating further [1] - there
were some changes which made me think the problem is fixed. Problem
with this issue: depending on the sequence in which recipes are
installed it might occure that sysroot and image share same IDs. =3D> I
do not really have facts if releases are affected or not - sorry. But
creating images based on releases containing recipes doing chown at
install should show.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2013-May/0779=
49.html

Andreas

