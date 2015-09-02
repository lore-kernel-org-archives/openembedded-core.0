Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 91FEA76FE2;
	Wed,  2 Sep 2015 11:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t82BFF3a017844; Wed, 2 Sep 2015 12:15:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2X5Cwzhqfo-f; Wed,  2 Sep 2015 12:15:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t82BExNx017839
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 2 Sep 2015 12:15:10 +0100
Message-ID: <1441192499.24871.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Wed, 02 Sep 2015 12:14:59 +0100
In-Reply-To: <CABcZANnjLEcMbLLnCb3C-QeFb9+_ZEu-CDHk46UjBfbHm+7STg@mail.gmail.com>
References: <20150901104522.9FC59505A9@opal.openembedded.org>
	<20150901190902.GD2458@jama> <55E63099.8090003@linux.intel.com>
	<CABcZANnjLEcMbLLnCb3C-QeFb9+_ZEu-CDHk46UjBfbHm+7STg@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Alex Franco : Fix mode +st on TMPDIR when creating it
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
X-List-Received-Date: Wed, 02 Sep 2015 11:15:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-01 at 16:47 -0700, Christopher Larson wrote:
> 
> On Tue, Sep 1, 2015 at 4:11 PM, Alex Franco
> <alejandro.franco@linux.intel.com> wrote:
>         I gather the original reason (for the sanity test, as well as
>         these changes) is that it is better for everything under
>         BUILDDIR - and certainly TMPDIR to be owned by the user
>         running bitbake and have standard permissions, the sticky bit
>         itself would prevent a user running bitbake, even with +rwx
>         permissions, from making changes to items it might need to
>         manipulate, if those are not owned by this user. Similarly
>         setuid and setgid might propagate user/group ownerships
>         different from the user bitbake is running as, into BUILDDIR
>         and TMPDIR (and items therein).
>         
>         For more info take a look at:
>         https://bugzilla.yoctoproject.org/show_bug.cgi?id=7669
>         
>         Perhaps there are more pressing reasons, perhaps Christopher
>         Larson can comment a bit on this.
> 
> Indeed, the g+s can flow down into the files put into the packages,
> and then into the rootfs. I ran into a this problem quite a bit, since
> my project areas are in a g+s area to keep the files accessible to the
> group.


There is actually another problem here. The -R means if you do this to
an existing build directory, it takes around 10 mins on the machine I
just rebooted with a cold cache. We need to lose the -R there.

Cheers,

Richard



