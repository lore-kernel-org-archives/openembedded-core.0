Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 32ACD75C61
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 11:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24BKLfm012436; Fri, 4 Mar 2016 11:20:21 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dhVf3e2aC60o; Fri,  4 Mar 2016 11:20:21 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24BKGUh012427
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 4 Mar 2016 11:20:18 GMT
Message-ID: <1457090416.2804.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pascal Bach <pascal.bach@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 04 Mar 2016 11:20:16 +0000
In-Reply-To: <56CC6832.90506@siemens.com>
References: <56CC6832.90506@siemens.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Debugging using sysroots and GDB
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
X-List-Received-Date: Fri, 04 Mar 2016 11:20:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-23 at 15:09 +0100, Pascal Bach wrote:
> Currently debugging using sysroots seems to work as long as the work
> folder containing the original source is available.
> Once this work dir is gone the debugger is no longer able to find the
> source code. This is especially confusing if some packages are taken
> from sstate and others are built in the current projects, because for
> some libraries the sources can be found and for others not. It is
> hard at first to figure out the reason why one works and the other
> not.
> 
> In order to make it easier to debug using sysroots I propose to
> modify the how the sysroots is built to do somethins similar to
> rootfs:
> 
> 1. Changing the source reference in the debug symbols to point to the
> source under /usr/src/debug
> 2. Copy the sources into /usr/src/debug under sysroots similar to how
> it is done for a debug rootfs.
> 3. Document that the user needs to add the following to the .gdbinit
> to make it work:
>     ```
>     set sysroot /project/oe/build/tmp/sysroots/<target_sysrtoot>
>     set substitute-path /usr/src/debug
> /project/oe/build/tmp/sysroots/<target_sysrtoot>/usr/src/debug
>     ```
> 
> This would also allow the sysroot to be relocatable as it is kind of
> standalone and everything required to debug is included.
> 
> What do you think? Does this proposal make sense, or did I miss
> something and this is completly unnecessary and there is an easier
> way already working?

It really depends on your view of what the sysroot is used for. We
intentionally strip a variety of things out of it as things work today
basically for size/performance reasons. If we start putting debugging
source in there, it will become huge and this will image the size of
things like eSDK and affect the speed of operations like building from
sstate.

We don't really support debugging from the sysroot. We could talk about
changing that but I suspect people wouldn't like the performance
penalty.

You might ask "ok, can we make it optional?". The trouble with that is
more code paths which people will complain we're not testing and
consequently an increased test matrix and even slower patch merging
cycles.

So the question is, is this something we want to support this way?

Cheers,

Richard


