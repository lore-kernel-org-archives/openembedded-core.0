Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E1EC36009A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 16:24:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7FGYjoY010711; Thu, 15 Aug 2013 17:35:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2cTsfhgvmXL3; Thu, 15 Aug 2013 17:35:25 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7FGZMJd010723
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 15 Aug 2013 17:35:24 +0100
Message-ID: <1376583837.22952.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Thu, 15 Aug 2013 17:23:57 +0100
In-Reply-To: <1376560519.17787.16.camel@phil-desktop.brightsign>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com> <520B1595.3060909@windriver.com>
	<20130814065609.GQ17945@jama> <1376477217.22952.5.camel@ted>
	<20130814105915.GU17945@jama> <520CA4AF.4040403@windriver.com>
	<1376560519.17787.16.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Thu, 15 Aug 2013 16:24:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-15 at 10:55 +0100, Phil Blundell wrote:
> On Thu, 2013-08-15 at 17:51 +0800, Rongqing Li wrote:
> > OK, But your issue is not related to me.
> > 
> > I can reproduce my issue by two simple script.
> 
> If tar is deciding that the file has "changed" just because the link
> count on the dentry has increased, that sounds like it is probably a bug
> in tar and ought to be fixed there.
> 
> That said, I can't immediately think why autotools_copy_aclocal couldn't
> use a symlink rather than a hard link which would avoid this whole
> problem.  If the file is in the sysroot then there should be no risk of
> it going away underneath its user.

Sadly this doesn't work. We block copy a set of .m4 files from the
sysroot. We can be running do_configure of package A whilst package B is
de-installed from the sysroot and this leads to files disappearing
whilst they're being accessed. Its turned out to be a really awkward
problem to fix.

Cheers,

Richard




