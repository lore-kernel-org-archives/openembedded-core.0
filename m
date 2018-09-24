Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 346E979017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 14:05:09 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8OE593B027590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 24 Sep 2018 15:05:10 +0100
Message-ID: <be7a233326b1d6709c57398e1a01ed5a371ddb3b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 15:05:09 +0100
In-Reply-To: <20180924132500.30363-1-adrian.ratiu@ni.com>
References: <20180924132500.30363-1-adrian.ratiu@ni.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] rootfs: always update the opkg index
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
X-List-Received-Date: Mon, 24 Sep 2018 14:05:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-09-24 at 16:25 +0300, Ioan-Adrian Ratiu wrote:
> The previous logic assumed that if $BUILD_IMAGES_FROM_FEEDS=1 then a
> complete set of ipk feeds from which to build the image is already
> present under $IPK_FEED_URIS at do_rootfs runtime.
> 
> $IPK_FEED_URIS usually contains "file://${DEPLOY_DIR_IPK}" which
> renders the above assumption bad because some recipes in the current
> build can contain code like do_install[nostamp] = "1" which will
> cause
> rebuilds bumping $PR and invalidating the index.
> 
> Even when the index is manually re-created before an image build
> ("bitbake package-index"), the nostamp will cause failures because
> the
> dependency gets rebuilt before do_rootfs in the "bitbake <image>"
> call.
> 
> So make the opkg rootfs index logic the same as for rpm/deb, to
> always
> update the index in $DEPLOY_DIR_IPK to fix the above nostamp failure.
> 
> Feeds outside $DEPLOY_DIR_IPK continue to work as usual.

Is this with master or an older branch?

With master, a copy of the feed is constructed under WORKDIR which is
then indexed since other image generation or package writes could occur
and the index isn't static. I'm guessing it doesn't do this for
external feeds and assumes those feeds are static. 

I am wondering what happens if you put a remote (http://) url into this
though? Does that still work or does it break?

I'm also worried about what happens if the file:// path you point at is
owned by another user and isn't writable.

Cheers,

Richard





