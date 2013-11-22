Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7C86C735
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:01:31 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 11768F8119A; Fri, 22 Nov 2013 07:01:30 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 07B3EF81199;
	Fri, 22 Nov 2013 07:01:30 -0700 (MST)
Message-ID: <528F63CB.1010107@mlbassoc.com>
Date: Fri, 22 Nov 2013 07:01:47 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1311220812240.14584@oneiric>
In-Reply-To: <alpine.DEB.2.02.1311220812240.14584@oneiric>
Subject: Re: is there an easy way to see the actual files that went into a package?
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
X-List-Received-Date: Fri, 22 Nov 2013 14:01:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-11-22 06:15, Robert P. J. Day wrote:
>
>    if i use "bb show" to examine the files that go into each package
> (eg, for "zlib" here), what i get is the collection of wildcards that
> will, of course, still be processed when sequentially creating each
> package:
>
> $ bb show -r zlib FILES_zlib-dev
> Parsing recipes..done.
> # FILES_zlib-dev=${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la
> ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig
> ${datadir}/aclocal ${base_libdir}/*.o ${libdir}/${BPN}/*.la
> ${base_libdir}/*.la
> FILES_zlib-dev="/usr/include /lib/lib*.so /usr/lib/lib*.so
> /usr/lib/*.la /usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig
> /usr/share/aclocal /lib/*.o /usr/lib/zlib/*.la /lib/*.la"
> $
>
>    is there an equivalently simple way to display the end result of the
> contents of each package?

You can use the package manager (opkg, rpm) to ask for this info.

For example, using opkg on an installed image:
   # opkg list-installed
   # opkg files ethtool

You can even run this on an [uninstalled] image.  From your build tree,
the tools are accessible and the image root file system as well.  In the
example above:
   $ tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f tmp/work/sabrelite-poky-linux-gnueabi/poky-x11-image/1.0-r0/opkg.conf -o 
tmp/work/sabrelite-poky-linux-gnueabi/poky-x11-image/1.0-r0/rootfs list-installed
   $ tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f tmp/work/sabrelite-poky-linux-gnueabi/poky-x11-image/1.0-r0/opkg.conf -o 
tmp/work/sabrelite-poky-linux-gnueabi/poky-x11-image/1.0-r0/rootfs files ethtool

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

