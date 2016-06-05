Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D446E77144
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 22:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u55M2LM3000651; Sun, 5 Jun 2016 23:02:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XGbjxgu7t-v9; Sun,  5 Jun 2016 23:02:21 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u55M2I4N000646
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 5 Jun 2016 23:02:19 +0100
Message-ID: <1465164138.13979.45.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Sun, 05 Jun 2016 23:02:18 +0100
In-Reply-To: <CAP71WjyMbP4RReFjJ-TEi-Kx8EPEVpm3qBZBnXmCm2_3_0D_8w@mail.gmail.com>
References: <CAP71WjyMbP4RReFjJ-TEi-Kx8EPEVpm3qBZBnXmCm2_3_0D_8w@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: question about -native and prefix
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
X-List-Received-Date: Sun, 05 Jun 2016 22:02:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Sun, 2016-06-05 at 23:35 +0200, Nicolas Dechesne wrote:
> i was looking at log files and I noticed that when building a
> 'native'
> recipe ${prefix} is set to the sysroot path, e.g.
> 
> export prefix="/home/nicolas.dechesne/work/oe-rpb/build-rpb/tmp-rpb
> -glibc/sysroots/x86_64-linux/usr"
> 
> as such during do_install() files are typically installed in
> ${DESTDIR}${prefix}, and as such we end up with a 'weird' path, such
> as :
> 
> x86_64-linux-libtool: install: /usr/bin/install -c
> .libs/libopkg.so.1.0.0
> /home/nicolas.dechesne/work/oe-rpb/build-rpb/tmp-rpb
> -glibc/work/x86_64-linux/opkg-native/1_0.3.0
> -r0/image/home/nicolas.dechesne/work/oe-rpb/build-rpb/tmp-rpb
> -glibc/sysroots/x86_64-linux/usr/lib/libopkg.so.1.\
> 
> e.g. the 'full path' of the sysroot is recreated inside ${D}. It
> doesn't seem to make anything bad, but i just noticed it, and it
> surprised me. what's the rationale for that?
> 
> I would have expected to find the sysroot 'relative' path in ${D}. n
> the the absolute path.

Whilst this looks a bit ugly, it is actually doing the right thing.
Native binaries are designed to install and run in $prefix. When we
install them in do_install, there is a DESTDIR as you mention which is
within WORKDIR, then a $prefix beyond that.

If you try and do anything else you end up handcrafting do_install for
natives, or the sysroot or some other solution and you end up having to
hack things. With this approach, whilst the paths are long, "it just
works". So it is actually by design and in the big picture does make
sense when you step back and think about it.

Cheers,

Richard


