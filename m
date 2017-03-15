Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 68CBB730F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 21:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2FLs8WW016584; Wed, 15 Mar 2017 21:54:08 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vaytZ8yJGL_M; Wed, 15 Mar 2017 21:54:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2FLs4HG016580
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Mar 2017 21:54:07 GMT
Message-ID: <1489614844.13980.77.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Date: Wed, 15 Mar 2017 21:54:04 +0000
In-Reply-To: <373dcecc935f454eb93d1fa97a7f9e36@XBOX02.axis.com>
References: <373dcecc935f454eb93d1fa97a7f9e36@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: RSS-related problem after update to OE-Core with dnf
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
X-List-Received-Date: Wed, 15 Mar 2017 21:54:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-15 at 09:29 +0000, Peter Kjellerstedt wrote:
> I update my Poky to the latest on master yesterday (i.e., I went
> from 
> a version using smart to one using dnf) and when I rebuilt my image
> I 
> got the following error:
> [...]
> I.e., it is trying to link a MIPS library with an x86_64 one...
> 
> After I did a "bitbake libsolv -c cleansstate", the problem went
> away, 
> and checking the log.do_compile afterwards it seems it is not even 
> trying to link with librpmdb.so at all any more.
> 
> My guess is that the librpmdb.so (which was a link to librpmdb-
> 5.4.so) 
> was a leftover from before the switch from smart to dnf. However,
> the 
> fact that it remained in ${WORKDIR}/recipe-sysroot-native AND that
> it 
> was picked up by the build indicates both a problem with the 
> determinism of RSS, and the with the build of libsolv itself.

FWIW I have read this and it is a concern. Unfortunately RSS is just
that, *recipe* specific, not task specific and therefore as I mentioned
in the original commits, it can't be perfect as it doesn't know
anything about the dependencies of other tasks this recipe may have and
which may be running in parallel.

I'm contiuing to see if there are better ways we can ensure stale
things get removed from the sysroots but its a hard problem due to the
parallelism. I do have some ideas though.

Distilling an easy to reproduce test case would help if someone has the
time.

Cheers,

Richard

