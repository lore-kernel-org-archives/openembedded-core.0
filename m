Return-Path: <sledz@dresearch-fe.de>
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id 5533E6F609
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 13:22:37 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 5A245E0122;
	Mon,  7 Apr 2014 13:22:38 +0000 (UTC)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by fensuse.internal.dresearch-fe.de (Postfix) with ESMTP id D40CD70115D;
	Mon,  7 Apr 2014 15:22:37 +0200 (CEST)
Message-ID: <5342A69C.9020901@dresearch-fe.de>
Date: Mon, 07 Apr 2014 15:22:36 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
References: <5330220F.8050504@dresearch-fe.de>	<1395664516.24232.56.camel@ted>	<533029C5.1000406@dresearch-fe.de>	<1395665593.24232.58.camel@ted>	<53303FAB.5020907@dresearch-fe.de>	<20140324151537.GD29998@jama>	<53315AE7.1020304@dresearch-fe.de>
	<53319AAD.5070506@windriver.com> <53429BF2.2050804@dresearch-fe.de>
In-Reply-To: <53429BF2.2050804@dresearch-fe.de>
X-Enigmail-Version: 1.6
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
X-List-Received-Date: Mon, 07 Apr 2014 13:22:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 07.04.2014 14:37, Steffen Sledz wrote:
> On 25.03.2014 16:03, Mark Hatle wrote:
>> ...
>> If the package 'requiring libfoo' has a DEPENDS += ... in it.. then yes, it should have been rebuilt when the libfoo was rebuilt.
> 
> Unfortunately i can't confirm that.  :(
> 
> part of the real app recipe:
> ------------> snip <-------------
> DEPENDS = "vala-native libdrtrace libdrhip libdrbcc jansson"
> RDEPENDS_${PN} = "dropmodes"
> ------------> snap <-------------
> 
> part of the real resulting opkg control file for this app:
> ------------> snip <-------------
> Depends: dropmodes, libglib-2.0-0 (>= 2.36.4), libdrhip1 (>= gitr27+42af787eb2), libjansson4 (>= 2.4), libc6 (>= 2.18)
> ------------> snap <-------------
> 
> I miss the runtime dependencies for libdrtrace and libdrbcc. Where are they gone?

Some additional info:
------------> snip <-------------
# objdump -p ./package/usr/lib/libdrhip.so.1.0.0

./package/usr/lib/libdrhip.so.1.0.0:     file format elf32-littlearm
...
Dynamic Section:
  NEEDED               libc.so.6
  SONAME               libdrhip.so.1
...

# objdump -p ./package/usr/lib/libdrbcc.so.1.0.0

./package/usr/lib/libdrbcc.so.1.0.0:     file format elf32-littlearm
...
Dynamic Section:
  NEEDED               libdrtrace.so.0
  NEEDED               libm.so.6
  NEEDED               libreadline.so.6
  NEEDED               libpthread.so.0
  NEEDED               libc.so.6
  SONAME               libdrbcc.so.1
...

# objdump -p ./package/usr/bin/drbccproxy

./package/usr/bin/drbccproxy:     file format elf32-littlearm
...
Dynamic Section:
  NEEDED               libdrhip.so.1
  NEEDED               libdrbcc.so.0
  NEEDED               libdrtrace.so.0
  NEEDED               libgio-2.0.so.0
  NEEDED               libgobject-2.0.so.0
  NEEDED               libglib-2.0.so.0
  NEEDED               libjansson.so.4
  NEEDED               librt.so.1
  NEEDED               libpthread.so.0
  NEEDED               libc.so.6
...
------------> snap <-------------

So it seems the data objdump shows are OK.

E.g. the app drbccproxy really has a dependency to a libdrbcc. But this is not refelected in the control file.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

