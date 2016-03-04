Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B1AC2731A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 15:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24FTvMU030436; Fri, 4 Mar 2016 15:30:35 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GSk48pnyW7Gm; Fri,  4 Mar 2016 15:30:35 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24FUXe8030459
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 4 Mar 2016 15:30:35 GMT
Message-ID: <1457105433.2804.30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pascal Bach <pascal.bach@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 04 Mar 2016 15:30:33 +0000
In-Reply-To: <56D9964E.1070404@siemens.com>
References: <56CC6832.90506@siemens.com>
	<1457090416.2804.19.camel@linuxfoundation.org>
	<56D9964E.1070404@siemens.com>
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
X-List-Received-Date: Fri, 04 Mar 2016 15:30:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-04 at 15:06 +0100, Pascal Bach wrote:
> > It really depends on your view of what the sysroot is used for. We
> > intentionally strip a variety of things out of it as things work
> > today
> > basically for size/performance reasons. If we start putting
> > debugging
> > source in there, it will become huge and this will image the size
> > of
> > things like eSDK and affect the speed of operations like building
> > from
> > sstate.
> 
> From my point of view debugging from sysroots is not mandatory if I
> can find a suitable alternative.
> One thing I want to avoid is to install -dbg packages to my image.
> 
> What I currently do is the following:
> 
> 1. Enable Debugfs generation using: `IMAGE_GEN_DEBUGFS = "1"`
> 2. Switch debug split style to: `PACKAGE_DEBUG_SPLIT_STYLE = "debug
> -file-directory"`
> 
> After building the image I end up with a rootfs and a rootfs-dbg
> 
> 3. Extract both rootfs and rootfs-dbg somewhere (/home/projects)
> 4. Setup gdb with the following .gdbinit:
> 
> ```
> set sysroot /home/projects/rootfs
> set debug-file-directory /home/projects/rootfs-dbg/usr/lib/debug
> set substitute-path /usr/src/debug /home/projects/rootfs
> -dbg/usr/src/debug
> ```
> 
> With this setup I'm able to debug trough all libraries on the system.
> So so far so good.
> 
> However for this to work I need to change the
> `PACKAGE_DEBUG_SPLIT_STYLE` to a non default and this made me wonder
> if I missed something.
> - Is there a way to get this setup working with the default ".debug"
> style of OE?
> - If not why is the .debug style the default instead of "debug-file
> -directory"?
> - Is there any documentation? I was unable to find anything more than
> [1] in the Yocto Mega manual.
> - Is there some best practice I missed?

Using this method is a supported approach. I'm a little surprised
.debug directories don't work. Have you tried just setting:

set sysroot /home/projects/rootfs-dbg
set substitute-path /usr/src/debug /home/projects/rootfs
-bbg/usr/src/debug

as I believe it should work with IMAGE_GEN_DEBUGFS=1 "out the box". If
it doesn't that is a bug and we should try and look into fixing that.

Cheers,

Richard

