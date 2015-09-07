Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CCCE360132
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 20:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t87KutrI009771; Mon, 7 Sep 2015 21:56:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KiFP8F9GwSlP; Mon,  7 Sep 2015 21:56:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t87KufkQ009760
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 7 Sep 2015 21:56:52 +0100
Message-ID: <1441659401.24871.261.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 07 Sep 2015 21:56:41 +0100
In-Reply-To: <4A72FD2B-1B79-4827-B02E-E3B23A966AE7@gmail.com>
References: <cover.1441552859.git.raj.khem@gmail.com>
	<1441654013.24871.259.camel@linuxfoundation.org>
	<4A72FD2B-1B79-4827-B02E-E3B23A966AE7@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Systemd Upgrade
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
X-List-Received-Date: Mon, 07 Sep 2015 20:57:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2015-09-07 at 13:53 -0700, Khem Raj wrote:
> > On Sep 7, 2015, at 12:26 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Sun, 2015-09-06 at 15:25 +0000, Khem Raj wrote:
> >> Changes Since last time
> >> - Now that 225 is out upgrade recipe to 225, changes between 224 and 225 are minor
> >>  but fixes in networkd are important
> >> - Implement systemd-sysv-install for OE
> >> - Enable getopt in busybox needed for systemd-sysv-install
> >> - Remove update-rc.d from default uninstall list in rootfs creation
> >> - Tested date and systemd unit tests manually to pass
> >> - Booted core-image-cmdline-full on all qemu targets
> > 
> > https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/480
> > 
> > The date test failed in two of the sanity runs with this series
> > applied :(
> 
> I think this testcase needs revisiting. My manual runs of sequence of
> exact same commands on qemux86-64 and qemuarm64 succeeds all the time.
> I have built core-image-full-cmdline
> One thing I wonder is if in AB case there might network time is
> configured and systemd-timesyncd/systemd-timedated syncs it back
> immediately when its tempered with. I see this happening with
> systemd-219 as well when I have networkd and timesyncd started on
> another instance running on minnow ( without the proposed patchset)
> 
> and for systemd we should try to test timedatectl to manipulate date
> instead of date cmd e.g. timedatectl set-time “YYYY-MM-DD HH:MM:SS”
> 
> I will try to reproduce it on my end and see if I can get something to
> whats going on.

A "bitbake core-image-sato -c testimage" replicated it here FWIW, have
you tried testimage to see if that somehow makes a difference? Shoudn't
be hard to test with that and for sato, it should run pretty quickly.

It all works with 219, its only the upgrade patches that seem to break
things :(

Cheers,

Richard


