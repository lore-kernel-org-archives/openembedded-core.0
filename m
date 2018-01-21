Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 03F0778766
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 10:04:18 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0LA4H0x031132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 21 Jan 2018 10:04:19 GMT
Message-ID: <1516529057.24502.55.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 21 Jan 2018 10:04:17 +0000
In-Reply-To: <c0f872f3412b16d7fcf126473d8fd7749cd44814.1516012306.git.liezhi.yang@windriver.com>
References: <cover.1516012306.git.liezhi.yang@windriver.com>
	<c0f872f3412b16d7fcf126473d8fd7749cd44814.1516012306.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] scripts/oe-depends-dot: add it to handle dot files
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
X-List-Received-Date: Sun, 21 Jan 2018 10:04:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-01-15 at 18:34 +0800, Robert Yang wrote:
> Add it to handle recipe-depends.dot and task-depends.dot. E.g.:
> 
> * Print why rpm is built
>   $ oe-depends-dot -k rpm --why/-w recipe-depends.dot
>   Because: core-image-sato libdnf libsolv dnf
> 
> * Print bzip2-native's depends
>   $ oe-depends-dot -k bzip2-native --depends/-d recipe-depends.dot
>   Depends: automake-native gnu-config-native libtool-native quilt-
> native autoconf-native
> 
> * Remove duplicated dependencies to reduce the size of the dot files.
>   For example, A->B, B->C, A->C, then A->C can be removed. The dot
> files are too
>   big, we nearly couldn't use 'dot -T' to generate pictcures for
> target recipes,
>   remove the duplicated dependencies makes is it possible.
>   $ bitbake core-image-sato -g
>   $ oe-depends-dot -r recipe-depends.dot
>   Saving reduced dot file to recipe-depends-reduced.dot
>   $ du -sh recipe-depends*.dot
>   608K    recipe-depends.dot
>   32K     recipe-depends-reduced.dot
> 
>   It has been recuded from 608K to 32K, now we can generate a
> picture,
>   otherwise, it is too big:
>   $ dot -Tpng recipe-depends-reduced.dot -O
> 
> It also can handle task-depends.dot.

I just wanted to mention that whilst I've not tried using it due to
time constraints, I like the idea of this approach a lot, thanks
Robert!

Cheers,

Richard

