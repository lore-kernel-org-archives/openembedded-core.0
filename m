Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB7E6011B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 14:06:13 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u24E67QT001275
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 4 Mar 2016 15:06:08 +0100
Received: from [139.16.79.50] (MD1FZU9C.ww002.siemens.net [139.16.79.50])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id u24E67tw028747;
	Fri, 4 Mar 2016 15:06:07 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <56CC6832.90506@siemens.com>
	<1457090416.2804.19.camel@linuxfoundation.org>
From: Pascal Bach <pascal.bach@siemens.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56D9964E.1070404@siemens.com>
Date: Fri, 4 Mar 2016 15:06:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457090416.2804.19.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 04 Mar 2016 14:06:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

> It really depends on your view of what the sysroot is used for. We
> intentionally strip a variety of things out of it as things work today
> basically for size/performance reasons. If we start putting debugging
> source in there, it will become huge and this will image the size of
> things like eSDK and affect the speed of operations like building from
> sstate.

From my point of view debugging from sysroots is not mandatory if I can find a suitable alternative.
One thing I want to avoid is to install -dbg packages to my image.

What I currently do is the following:

1. Enable Debugfs generation using: `IMAGE_GEN_DEBUGFS = "1"`
2. Switch debug split style to: `PACKAGE_DEBUG_SPLIT_STYLE = "debug-file-directory"`

After building the image I end up with a rootfs and a rootfs-dbg

3. Extract both rootfs and rootfs-dbg somewhere (/home/projects)
4. Setup gdb with the following .gdbinit:

```
set sysroot /home/projects/rootfs
set debug-file-directory /home/projects/rootfs-dbg/usr/lib/debug
set substitute-path /usr/src/debug /home/projects/rootfs-dbg/usr/src/debug
```

With this setup I'm able to debug trough all libraries on the system.
So so far so good.

However for this to work I need to change the `PACKAGE_DEBUG_SPLIT_STYLE` to a non default and this made me wonder if I missed something.
- Is there a way to get this setup working with the default ".debug" style of OE?
- If not why is the .debug style the default instead of "debug-file-directory"?
- Is there any documentation? I was unable to find anything more than [1] in the Yocto Mega manual.
- Is there some best practice I missed?

[1] http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#platdev-gdb-remotedebug-setup


> We don't really support debugging from the sysroot. We could talk about
> changing that but I suspect people wouldn't like the performance
> penalty.
Ok if this is not supported is there any documentation on whats the recommended debugging method?
>
> You might ask "ok, can we make it optional?". The trouble with that is
> more code paths which people will complain we're not testing and
> consequently an increased test matrix and even slower patch merging
> cycles.
I agree, there should only be one recommended and supported way to do debugging and this way should be well documented.
>
> So the question is, is this something we want to support this way?
>
> Cheers,
>
> Richard
Pascal

