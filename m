Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web12.54707.1585585759067680781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 09:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=mUe/LF8E;
 spf=neutral (domain: iki.fi, ip: 66.111.4.27, mailfrom: tanuk@iki.fi)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 4A6D85C00D1;
	Mon, 30 Mar 2020 12:29:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 30 Mar 2020 12:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=iNaeFo/aHWU717D/7hVf+WtsviBZ97LjpuzQS7sYU
	IE=; b=mUe/LF8EVubSD3wDavgM+icq2pEvQd4mHWYj4oFlvpYKFhv57ryRwRvS/
	TRrnkbhwcCNQy8Qkdcjx13RgveKLRmvKlcpnEiNc6j4KnePQA1N4M4nj83K+C71/
	pIzUN9LdjW8WXs9WYPRpzqR/ipEWQ4ueTauOPYqhEr20N76m8F5ZnbLp1cGg2GWu
	taq4rYkExVbEdouFCGBFuP1ulFxa5GJmy5Ffc0OqQXB14fENwMBO/BqsfGI5/bv2
	qm2o+au6TC6ZgRQ3SiChZJSETikd2mWjskO+Ie/GHfFsGYA6XK96UcSUIogcpZ4Y
	bd3WKSLvaJoVGZRgds/Qr+5z3UAPA==
X-ME-Sender: <xms:XB6CXt2SSWncEnYXEHynDEDKP2KpgNIIUfkdDVM_J7gpaZoGN-YXEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeihedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghn
    uhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinhepph
    grthhrvghonhdrtghomhdplhhisggvrhgrphgrhidrtghomhenucfkphepudeliedrvdeg
    gedrudeluddrjeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:XB6CXuK6y56hnx5Wawt_-742LlyeENMqCsx7IxvHjsljscth_UaZwA>
    <xmx:XB6CXgz3ejvmr06eStS28TzYHAKAlD2wX8yvlQN6dTtWfOFKm45cVQ>
    <xmx:XB6CXizjxL2QF_tC_yV4jMf90br3U-eqt_Mp_L2p2qkju_GASEOQPw>
    <xmx:Xh6CXnPiqutRNG7Md4-f_mKpGHEv_m6HEOB9Waq--08qOzh40x8mDw>
Received: from laptop (unknown [196.244.191.74])
	by mail.messagingengine.com (Postfix) with ESMTPA id 04CA5306CA0B;
	Mon, 30 Mar 2020 12:29:15 -0400 (EDT)
Message-ID: <9144dad892ac92ed87755ad0545aef0ecd4fbbcf.camel@iki.fi>
Subject: Re: [OE-core] [PATCH] pulseaudio: fix for ARM thumb + frame pointers compilation error
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Stefan Ghinea <stefan.ghinea@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 30 Mar 2020 19:29:10 +0300
In-Reply-To: <20200326152629.29272-1-stefan.ghinea@windriver.com>
References: <20200326152629.29272-1-stefan.ghinea@windriver.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-26 at 17:26 +0200, Stefan Ghinea wrote:
> From: Catalin Enache <catalin.enache@windriver.com>
> 
> When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
> since the Thumb frame pointer in r7 clashes with pulseaudio's use of inline
> asm to make syscalls (where r7 is used for the syscall NR).

Do you have a pointer to the asm code that does syscalls? I'm an
upstream maintainer of PulseAudio, and to me it sounds a bit strange
that there would be inline asm that does syscalls.

It would be great to fix this problem in upstream (either by applying
this fix/workaround in the build system, or by modifying the asm code
so that the problem goes away).

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

