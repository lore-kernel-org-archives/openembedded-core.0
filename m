Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 863F873167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 22:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u29Mmt3i026406; Wed, 9 Mar 2016 22:51:39 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M26J9FSq1pUz; Wed,  9 Mar 2016 22:51:39 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u29MpYMc026481
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 9 Mar 2016 22:51:35 GMT
Message-ID: <1457563893.2804.195.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>, openembedded-core@lists.openembedded.org
Date: Wed, 09 Mar 2016 22:51:33 +0000
In-Reply-To: <20160309225058.GM2542@jama>
References: <18448427.V3ACvxT67R@rjs-zotac.streifs.net>
	<CAJTo0La2CZAKw0Cd4_NpPLt=qXy3x3Arv36huhUMmCH3tV14YA@mail.gmail.com>
	<20160309225058.GM2542@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Rudolf J Streif <rudolf.streif@gmail.com>
Subject: Re: Wrong sstate signatures for cross toolchain Was: [yocto] Building gdb-7.10 for arm with master
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
X-List-Received-Date: Wed, 09 Mar 2016 22:51:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-09 at 23:50 +0100, Martin Jansa wrote:
> On Sat, Mar 05, 2016 at 09:40:48PM +0000, Burton, Ross wrote:
> > On 5 March 2016 at 21:19, Rudolf J Streif <rudolf.streif@gmail.com>
> > wrote:
> > 
> > > compile fails with the following error message:
> > > 
> > > > make[2]: *** No rule to make target
> > > > '../readline/libreadline.a', needed
> > > by 'gdb'.  Stop.
> > > > make[2]: *** Waiting for unfinished jobs....
> > > 
> > > The reason seems to be a broken path to the built-in readline in
> > > the
> > > makefile as the default configuration is
> > > --without-system-readline. Enabling
> > > 
> > > PACKAGECONFIG_append_pn-dbg = " readline"
> 
> See http://patchwork.openembedded.org/patch/116843/ discussion, the
> patch from Ross mentioned bellow fixes it better and is already
> merged
> in master.
> 
> > The default is with system readline...
> > 
> > gdb-common.inc:PACKAGECONFIG ??= "readline"
> 
> BTW: this is causing gdb-cross-* to depend on target readline, which
> may
> have different signatures for different MACHINEs with the same arch.
> 
> E.g. after adding qemuarm7 MACHINE, you can easily get gdb-cross-arm
> being rebuilt/extracted-from-sstate after each MACHINE change.
> 
> I'm not sure why selftest didn't catch this, but it can be seen with:
> openembedded-core/scripts/sstate-diff-machines.sh --machines="qemuarm
> qemuarm7" --targets=gdb-cross-arm --tmpdir=tmp-glibc

Something has regressed. Do you know when this last passed? Looks like
we need to add some extra tests to selftest and get this fixed.

Sadly I'm drowning in problems to fix at the moment :(

Cheers,

Richard



