Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 57A5860125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 09:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4J9eog9028654; Thu, 19 May 2016 10:40:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CTMWZZ29zRMx; Thu, 19 May 2016 10:40:50 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4J9elWR028650
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 May 2016 10:40:48 +0100
Message-ID: <1463650847.4578.108.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Robert Yang
	<liezhi.yang@windriver.com>
Date: Thu, 19 May 2016 10:40:47 +0100
In-Reply-To: <CA+chaQcuBXZ55wcAbzjCVEc1Xsq0UZ4obj=r5PsQt6bA57ZQAQ@mail.gmail.com>
References: <573C0726.3040402@windriver.com>
	<CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
	<573C21EE.8040104@windriver.com> <20160518092029.GA2579@jama>
	<573C365D.3070407@windriver.com> <20160518101556.GB2579@jama>
	<573D260D.2020909@windriver.com>
	<CA+chaQcuBXZ55wcAbzjCVEc1Xsq0UZ4obj=r5PsQt6bA57ZQAQ@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Thu, 19 May 2016 09:40:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-05-19 at 10:47 +0200, Martin Jansa wrote:
> As the commit says, small change in package.bbclass also causes all
> packages to be recreated with PR bump even when the content is most
> likely the same.
> 
> Fixing bug in gcc may at least provide different binaries so it might
> be useful to upgrade them on target (or at least distinguish if they
> were already rebuilt with fixed gcc-cross or not).
>
> Reverting the commit doesn't fix the issue that sstate handler cannot
> compare if the change in signature produced "significantly different"
> binaries. If it's reverted in oe-core I'll just revert the revert in
> our builds, because we care about reproducible builds and we already
> gave up on working upgrade paths, which are broken too often anyway.
> 
> Reflash of "system" partitions and storing user data/configuration
> somewhere else is faster and safer since the sstate was invented
> (since we stopped using OE classic). You can find some rant e-mails
> from me about this e.g.
> http://lists.openembedded.org/pipermail/openembedded-core/2011-Novemb
> er/051354.html
> and the Yocto bug I gave you.

FWIW I've not given up on upgrade paths and I do try and ensure basic
things do get spotted and addressed during review.

IMO, the only way we'll improve the upgrade situation is if someone
writes some automated tests for it, such that when we test changes, we
test the upgrade paths work. We have a ton of test automation now so we
have the basic framework to build something like this on top of. I do
appreciate there are some challenges since it does mean maintaining a
baseline state which the upgrade is tested from (previous state and
previous release being the two obvious ones).

Cheers,

Richard



