Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1356F7700A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 07:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t827Fe8o004232; Wed, 2 Sep 2015 08:15:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zb_To-F1IKjf; Wed,  2 Sep 2015 08:15:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t827FSSI004227
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 2 Sep 2015 08:15:39 +0100
Message-ID: <1441178128.24871.36.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 02 Sep 2015 08:15:28 +0100
In-Reply-To: <E9B6BF0B-EC31-4CF5-8756-9A338258CFF7@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
	<87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
	<1441142126.24871.21.camel@linuxfoundation.org>
	<E9B6BF0B-EC31-4CF5-8756-9A338258CFF7@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/17] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Wed, 02 Sep 2015 07:15:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2015-09-01 at 16:45 -0700, Khem Raj wrote:
> > On Sep 1, 2015, at 2:15 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Mon, 2015-08-24 at 13:03 -0700, Khem Raj wrote:
> >> Drop patches that were straight backports from upstream
> >> 
> >> MIT licence was unused and dropped from systemd sources
> >> for more details see
> >> https://github.com/systemd/systemd/commit/8f1e0c5f38cdf7e401ab4d2bb93ad816d08e7715
> >> 
> >> Drop gtkdoc dependency since libudev API documentation has been converted from gtkdoc into man pages
> >> Remove packaging gudev as it has moved to separate repository outside
> >> systemd
> >> 
> >> For more details see
> >> https://github.com/systemd/systemd/commit/2375607039517c88df51ef16ddbb624ec1c10654
> >> 
> >> package newly added script for xorg to be usable with systemd --user
> >> intance
> >> For more details see
> >> https://github.com/systemd/systemd/commit/1401ec2d34bcde406ced531a72dc46ebaf332594
> >> 
> >> For complete differences between two releases run
> >> git log --oneline v219..v224
> >> in systemd git clone
> > 
> > This patch seems to cause the build failures in:
> > 
> > https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/466
> > 
> > (two different sanity test failures)
> 
> 
> thanks for the info. Looking at the two tests.
> 
> setting up date using date -s seems to be assuming that Automatic time synchronization is not enabled
> that test could be improved for systemd by using systemd utils.
> 
> timedatectl set-time "yyyy-MM-dd hh:mm:ss”
> 
> and I don’t believe its passing with systemd-219 since locally I executed same commands on my minnow board running 219
> and it failed.

I believe it passes with 219 (master) and is a regression:

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/471

(green build with master which contains 219).

> Second test failure is a good one when mixing sysvinit scripts with systemd which is what systemctl disable avahi-daemon.service is doing
> 
> CHANGES WITH 221:
> 
>         * Support for chkconfig (--enable-chkconfig) was removed in favour of
>           calling an abstraction /lib/systemd/systemd-sysv-install. This needs
>           to be implemented for your distribution. See "SYSV INIT.D SCRIPTS" in
>           README for details.
> 
> This needs implementing  /lib/systemd/systemd-sysv-install for OE and I will update the patch to fix this one.

Thanks!

Richard


