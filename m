Received: from wforward1-smtp.messagingengine.com (wforward1-smtp.messagingengine.com [64.147.123.30])
 by mx.groups.io with SMTP id smtpd.web10.13742.1595151978332841707
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2020 02:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=P7gi6AZJ;
 spf=neutral (domain: iki.fi, ip: 64.147.123.30, mailfrom: tanuk@iki.fi)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailforward.west.internal (Postfix) with ESMTP id 1E41CD19;
	Sun, 19 Jul 2020 05:46:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 19 Jul 2020 05:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=GyT4EecmsyH5meiCogBLWirWWGYx5Q5/gY+CowYE+
	bw=; b=P7gi6AZJu+rXgfYNJdm6JGZk20NKrmdoFZKMgqU1XhFqyB+GUiLx46DoD
	WmZB5YQrV0+fWBpe5JdbK3EM7srtCfUWgyCOOWPsAM/jPmWZNkYAI/zevgqSRBBf
	GbMVCHe/YGho/UNXGd3feVBxkyPbG44nULiLY5FxZSu19fZJ4+m8VBSFKsQj0xUA
	igf3mA8iegzhPveha7G9Jj7Xn3RQ2486iHluditnT1vA6d7dJ3FYbpo44KfnrgQX
	Y1Z/BG1iiOC05mMi1bH26lWuvqASyLFAwq0JkG67XFpLDUds7zwlC+iv+CrdrxAF
	MRspPNbsjhw5Oys4GIgMyWO3AMN0Q==
X-ME-Sender: <xms:aBYUX0MqhzgSFy_lxhonxHu520VnbaGTFFYZoTIsNtldISJXaMsiTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgedugddulecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghnuhcu
    mfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucggtffrrghtthgvrhhnpe
    fgleekhfejvedtvdeltdekleevhfefjeetgeekfffffeduuefgleffieeugeevfeenucff
    ohhmrghinhepphgrthhrvghonhdrtghomhdplhhisggvrhgrphgrhidrtghomhenucfkph
    epkedvrddutddvrddvtddrudejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:aBYUX69MP9nyvpaT5kjGLeYl0YMR5vSb59peWPTIjNYRgCgJypfaVw>
    <xmx:aBYUX7Q4jckgWzPOlDE5Jk1mzQc11XXTw2zqLg9ymozQ8C4DIj47Lg>
    <xmx:aBYUX8tI5lQVYVFU3dFu8Qo4gttMgC5_i7QhyE3zDi71FYQo4yY1NA>
    <xmx:aBYUX2p6q4H88_50yxytIxVBCFxSXK36QL3KkLoN1oa9alG8xPiOpfBgGjo>
Received: from laptop (unknown [82.102.20.179])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9673030600A6;
	Sun, 19 Jul 2020 05:46:15 -0400 (EDT)
Message-ID: <9d8c4ff8d48a20a03bad298774d66cbdbf6940c6.camel@iki.fi>
Subject: Re: [OE-core] Why disable NEON support in recipes if runtime detection works?
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 19 Jul 2020 12:46:11 +0300
In-Reply-To: <20200719093011.GL1229@localhost>
References: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
	 <20200719093011.GL1229@localhost>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-07-19 at 12:30 +0300, Adrian Bunk wrote:
> On Sun, Jul 19, 2020 at 12:06:15PM +0300, Tanu Kaskinen wrote:
> > ...
> > I'm currently converting the pulseaudio recipe from Autotools to Meson,
> > and the old Autotools build system supports disabling NEON
> > optimizations but the Meson build system doesn't. So I'm wondering if I
> > should add the missing feature to the Meson build system, or just let
> > the runtime detection do its work.
> > ...
> 
> Looking at the git history it seems this was added as a workaround at a 
> time when the autodetection was buggy and caused build breakage.
> 
> Debian also backported commit 0af05213 (build: make ARM NEON check in 
> configure.ac more strict) to PulseAudio 4.0, which was included in
> PulseAudio 5.0.

Thanks for the archeology work! I'll go ahead and drop the
TUNE_FEATURES check then.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

