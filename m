Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BDC4062252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 14:49:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s37EnNXo017885; Mon, 7 Apr 2014 15:49:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id H13uWKdvPrPb; Mon,  7 Apr 2014 15:49:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s37EnHOE017879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 7 Apr 2014 15:49:18 +0100
Message-ID: <1396882151.24597.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Mon, 07 Apr 2014 15:49:11 +0100
In-Reply-To: <5342A69C.9020901@dresearch-fe.de>
References: <5330220F.8050504@dresearch-fe.de>
	<1395664516.24232.56.camel@ted>	<533029C5.1000406@dresearch-fe.de>
	<1395665593.24232.58.camel@ted>	<53303FAB.5020907@dresearch-fe.de>
	<20140324151537.GD29998@jama>	<53315AE7.1020304@dresearch-fe.de>
	<53319AAD.5070506@windriver.com> <53429BF2.2050804@dresearch-fe.de>
	<5342A69C.9020901@dresearch-fe.de>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: complex versioning scenario
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
X-List-Received-Date: Mon, 07 Apr 2014 14:49:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-04-07 at 15:22 +0200, Steffen Sledz wrote:
> On 07.04.2014 14:37, Steffen Sledz wrote:
> > On 25.03.2014 16:03, Mark Hatle wrote:
> >> ...
> >> If the package 'requiring libfoo' has a DEPENDS += ... in it.. then yes, it should have been rebuilt when the libfoo was rebuilt.
> > 
> > Unfortunately i can't confirm that.  :(
> > 
> > part of the real app recipe:
> > ------------> snip <-------------
> > DEPENDS = "vala-native libdrtrace libdrhip libdrbcc jansson"
> > RDEPENDS_${PN} = "dropmodes"
> > ------------> snap <-------------
> > 
> > part of the real resulting opkg control file for this app:
> > ------------> snip <-------------
> > Depends: dropmodes, libglib-2.0-0 (>= 2.36.4), libdrhip1 (>= gitr27+42af787eb2), libjansson4 (>= 2.4), libc6 (>= 2.18)
> > ------------> snap <-------------
> > 
> > I miss the runtime dependencies for libdrtrace and libdrbcc. Where are they gone?
> 
> Some additional info:
> ------------> snip <-------------
> # objdump -p ./package/usr/lib/libdrhip.so.1.0.0
> 
> ./package/usr/lib/libdrhip.so.1.0.0:     file format elf32-littlearm
> ...
> Dynamic Section:
>   NEEDED               libc.so.6
>   SONAME               libdrhip.so.1
> ...
> 
> # objdump -p ./package/usr/lib/libdrbcc.so.1.0.0
> 
> ./package/usr/lib/libdrbcc.so.1.0.0:     file format elf32-littlearm
> ...
> Dynamic Section:
>   NEEDED               libdrtrace.so.0
>   NEEDED               libm.so.6
>   NEEDED               libreadline.so.6
>   NEEDED               libpthread.so.0
>   NEEDED               libc.so.6
>   SONAME               libdrbcc.so.1
> ...
> 
> # objdump -p ./package/usr/bin/drbccproxy
> 
> ./package/usr/bin/drbccproxy:     file format elf32-littlearm
> ...
> Dynamic Section:
>   NEEDED               libdrhip.so.1
>   NEEDED               libdrbcc.so.0
>   NEEDED               libdrtrace.so.0
>   NEEDED               libgio-2.0.so.0
>   NEEDED               libgobject-2.0.so.0
>   NEEDED               libglib-2.0.so.0
>   NEEDED               libjansson.so.4
>   NEEDED               librt.so.1
>   NEEDED               libpthread.so.0
>   NEEDED               libc.so.6
> ...
> ------------> snap <-------------
> 
> So it seems the data objdump shows are OK.
> 
> E.g. the app drbccproxy really has a dependency to a libdrbcc. But this is not refelected in the control file.

At this point you'll probably have to look at the shlibs code in
package.bbclass and see why its not picking up the shlib dependencies
correctly for the packages...

It does appear there is some problem there but its hard to saw what
without a test case to reproduce.

Cheers,

Richard




