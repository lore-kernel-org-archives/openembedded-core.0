Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id EEE0E605BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 10:35:20 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id oy12so7438165veb.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 03:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=OISQOX4rqg/1SBWCnVDUxQwYbKGBbvKk+cerrUaplVo=;
	b=FLojLEI2I28MYichxBPnF33gwQd5orxN1t0lJFd5V1QPRBnoNds6SOfYuJ1rUZXpQs
	Dku7ScFT2tSYfyzPsbFR0Cx7l259BHDqzWdPCJ7DZqFL4ZYbsKtgTu8n6MQWtL0m1n0F
	EuC1XPytxy1E9GoeNAIai7GRWN/doSdi6Z683z7NNA7bGpsFhOd7fAGGL6NfGYa3Y12Z
	gtlxM1nq3ubbkzMbXWUIvbNWMZJOwDqbEOBQvAnTjkeW95B8t/PfSLClChkEyF/GSOnw
	mSNiZbXdNxMOX4DC/gvNe3AdHuVUfP6Wo8R6SYAhjROD8P6+uDW2VZ4fdD5874SJUdxu
	GOSQ==
MIME-Version: 1.0
X-Received: by 10.52.183.228 with SMTP id ep4mr1098032vdc.30.1398076520875;
	Mon, 21 Apr 2014 03:35:20 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Mon, 21 Apr 2014 03:35:20 -0700 (PDT)
In-Reply-To: <CALbNGRTyORP9DfxidwAhNqjFb5N937vbjJYncqwLXmc4fnxjWA@mail.gmail.com>
References: <CALbNGRSqnLj6Hr+6dL0rcyacz1pXSf+XySbYs_tx_gnq5+QfEg@mail.gmail.com>
	<CANyK_8d907x2d2_9MemcBqtB3oS6fyhzZyiRWMGSOEoXTcoinA@mail.gmail.com>
	<CALbNGRSXjpbvPa9N1yFYRqHn7X5rMSw-6F5vnbrFwMpq0pXHZQ@mail.gmail.com>
	<CALbNGRTyORP9DfxidwAhNqjFb5N937vbjJYncqwLXmc4fnxjWA@mail.gmail.com>
Date: Mon, 21 Apr 2014 12:35:20 +0200
Message-ID: <CALbNGRSGu_rTC58mSFWAO_-tpgn67C1qKz9mrdeH09P-QwccGA@mail.gmail.com>
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
X-List-Received-Date: Mon, 21 Apr 2014 10:35:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2014 at 7:08 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Apr 17, 2014 at 1:53 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> OK I did a test with current git master.
>
> Good news:
>
> the sequence of running preinst-script and unpacking is correct now:
>
> | NOTE: Performing useradd with [--root
> /home/a.mueller/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce=
4-tiny-image/1.0-r0/rootfs
> --system --no-create-home --user-group --home-dir /etc/polkit-1
> polkitd] and 10 times of retry
> ...
> ...
> | Installing polkit (0.112-r0) on root.
> | Downloading file:/home/a.mueller/tmp/oe-core-eglibc/deploy/ipk/armv7at2=
hf-vfp-neon/polkit_0.112-r0_armv7at2hf-vfp-neon.ipk.
> ...
>
> Bad news:
>
> gid/uid are still identical to those with opkg 2.01 (based on same ipks c=
reated)
>
> I think what happens is that opkg simply uses the ids which were found
> during installation.
>
> So now with the sequence looking solved, I understand better what you sug=
gested:
>> It would certainly be possible to add options to the
>> next version of opkg to lookup uids & gids from a given passwd & group
>> file (which could be those from the sysroot). Is that something that
>> would be useful in the future?
> Yes this would solve this issue (nit: replace 'sysroot' by rootfs or imag=
e).
I think it would be better to translate user/group names to IDs
generally and error out if that fails. As seen with polkit: using IDs
used during install/packing as fallback causes strange effects - or in
other words: If environment where a package is installed has not
prepared the required users/groups, something is wrong and the package
will not work as expected.

Andreas

