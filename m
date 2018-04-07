Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C478274B4D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Apr 2018 14:05:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w37E5nw3025911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 7 Apr 2018 15:05:50 +0100
Message-ID: <1523109949.2942.80.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 07 Apr 2018 15:05:49 +0100
In-Reply-To: <CAJdd5GbOcVGfGa4BSm6N0q2ffO9PzpOZnRx1s4_eQsz+f6yXcA@mail.gmail.com>
References: <1523097831-31184-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1523097831-31184-3-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJdd5GbOcVGfGa4BSm6N0q2ffO9PzpOZnRx1s4_eQsz+f6yXcA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead
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
X-List-Received-Date: Sat, 07 Apr 2018 14:05:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2018-04-07 at 13:36 +0000, Joshua Watt wrote:
> Of course, after this I finished, I think up a new idea :)
> 
> Would it be possible to add libxcrypt to the default dependencies
> (along side glibc)? The main advantage I can see is that it would
> maintain the "status quo" of libcrypt being there be default. My main
> observation from when I went though the exercise of getting this to
> build last night is that while we fixed the SDK for core-image-sato,
> others may be including additional recipes in their SDK that depend
> on libcrypt and these can fail in non-obvious ways (for example,
> util-linux would have been very puzzling to track down if I hadn't
> know it was related to the libcrypt changes).
> 
> We would obviously remove it in the next dev cycle and make the
> recipes fix their DEPENDS, like we are already planning to do.
> 
> It might even be possible to switch the target to using libxcrypt
> this way, but I don't think I would recommend it.
> 
> The main disadvantage that I can think of is that the libxcrypt
> recipe will be ugly, since it would have to build
> with INHIBIT_DEFAULT_DEPS=1.
> 
> I'm not sure I sold myself on this idea. I don't think I know enough
> about all the implications and adding additional nativesdk recipes is
> not very common, so maybe a blurb in the release notes is sufficent?
> 
> Anyway, I thought I would put it out there.

Its not a bad idea but the xcrypt dependencies would get ugly as it
would have to depend on glibc without using the default deps as you
say.

I think we're close to making it work with the virtual/crypt, at least
for nativesdk and since this matches what we'll likely ultimately have
to do, I'm tempted to go that route.

Current patchset is missing a musl PROVIDES but that is easily fixed
for the next test.

Cheers,

Richard

