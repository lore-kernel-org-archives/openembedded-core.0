Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C1C0360123
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 14:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3IEpJHV007878; Mon, 18 Apr 2016 15:51:19 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id C9idENf5QVRf; Mon, 18 Apr 2016 15:51:19 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3IEpE23007875
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Apr 2016 15:51:15 +0100
Message-ID: <1460991074.9308.209.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>,
	"Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Apr 2016 15:51:14 +0100
In-Reply-To: <CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
	<CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
	<5714DC35.7040206@windriver.com>
	<CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
	<CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Mon, 18 Apr 2016 14:51:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-04-18 at 16:16 +0200, Andreas Müller wrote:
> On Mon, Apr 18, 2016 at 3:55 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > 
> > On 18 April 2016 at 14:08, Hongxu Jia <hongxu.jia@windriver.com>
> > wrote:
> > > 
> > > If sysroot is required, override DEBUG_FLAGS to remove -fdebug
> > > -prefix-map
> > 
> > 
> > We should probably get this in the release notes, as many people do
> > indeed
> > want remote debug to work.
> > 
> > Can you tell gdb the base path to use when looking for symbols? 
> >  I've not
> > done remote GDB for some time but wouldn't "set substitute-path /
> > //my/sysroot/" work?  Or maybe /usr /my/sysroot/usr?
> > 
> > If gdb can't be told then instead of having to replace all of
> > DEBUG_FLAGS it
> > would be neat if the prefix mapping variables where in another
> > variable that
> > could just be unset.
> > 
> > Ross
> OK I think I could live with removing -fdebug-prefix-map for now.
> 
> A thought: We have the setting IMAGE_GEN_DEBUGFS - I have not yet
> tested. As far as I understand it creates an unstripped sysroot and
> does not affect target rootfs - is that correct? Does the sysroot
> created by IMAGE_GEN_DEBUGFS contain the sources? If yes we could set
> that as sysroot for gdb.
> 
> I think one of the problems we have here is that there is no
> reference
> way documented (or it is outdated) how remote debugging is meant to
> be
> performed.

FWIW I do believe the prefix mapping variables are the right thing to
do, it makes sense that the paths in the -dbg files should be /usr/src/
rather than some build time path. We've aimed to do that for a long
time, first using debugedit and more recently directly when compiling
rather than editing later.

We do need to figure out how to explain that to gdb, or if that can't
be made to work, even consider patching gdb and upstreaming the patch
such that it can look at a sysroot and work correctly.

I think it comes down to more people getting involved as we're
struggling to do everything with the current people and as I've said in
other threads, its also aboutbetter test cases so that when something
regresses that people care about we do get to know sooner.

Cheers,

Richard



