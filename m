Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 234AF7F8C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 16:36:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Bc2F0Zytz4c;
	Mon, 11 Nov 2019 17:36:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573490165;
	bh=zQ52GEAJP8wdNK0V8RPY4jghNLhKEhcQHn8EUagWeEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVFyFRAmBR2lt6neCQ2eQCQ3PUAnN+WDoYIaQTvr1iiGRoXr9PZ5vApUjlx2uzVKP
	hlAlkLocOTPLSU05rSuGwV7hMy1usP7oA/VCr0sk9OBDXANemp4cYtSXwgkxfuuZzd
	e6n/W3oZNtZfEeg06rUmF3FyM0ZhmOaQArixyWSUWGKAGnHRSaQExiAmpDffARuMse
	tPGZeXQ4MU64iF6NZFIHy+gYAWYTTVxiewtfWMduoNBx90007BIvRWkc8kznQfRZMo
	NQZYmvCoT1kf0WaFzey0+9o++7SuFlRK7H1h1CpVom1X/KY0NqASpxW9In9dqhWk08
	2qerZjzXoGbaBHK2xw4/ei/MbQNG53O77Vek8Fa7mEH4VteP8ZYy0B3agDwiJg/m67
	XLIHjjPRopKbqvgN1Ml7KtfE9RsL0FdE50hgV5PcFflttdPGEIQVh5q2+1d3ai2HCV
	mFd9J3ZMJzgMBCvi8sTQHSPqNSbmAtQdO0GfmHjPG4e3c64NfXL+X602clKvab0S5k
	LTzZTGEFvohdUaaID/+kRQf08u/8oepR8xNqYoIc9ETvZhYDIMhs5zPUQNuVEtv4eM
	w2J/+J8hkizcsyuD9WsRr7eRTPmUVqSsu2Zp/ssTXYU3nzUec1SQ+D1aviGqhSbo6g
	5axqvd4Ct9OxqVaDk/srqVbs=
Date: Mon, 11 Nov 2019 18:36:02 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191111163602.GH28797@localhost>
References: <20191109153559.15847-1-richard.purdie@linuxfoundation.org>
	<20191109100710.66530547@seebsdell>
	<5100e289ac8a5c4d0196e8ec77813859bb7a703d.camel@linuxfoundation.org>
	<20191109104619.209d9fcd@seebsdell>
	<CAJ86T=U6Rp5_nkJqHa-9e9sBpiQxn+iiD2khiZ1ZyMqq16c8GQ@mail.gmail.com>
	<dc84f473235ec05f06914abf4d8793c23ed08640.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <dc84f473235ec05f06914abf4d8793c23ed08640.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Drop static linking to sqlite3
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
X-List-Received-Date: Mon, 11 Nov 2019 16:36:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 11, 2019 at 07:59:43AM -0800, Khem Raj wrote:
> On Mon, 2019-11-11 at 05:04 -0800, Andre McCurdy wrote:
> > 
> > With this merged, we can also drop the hack to force the sqlite
> > static
> > lib to be PIC:
> > 
> >   
> > https://git.openembedded.org/openembedded-core/commit/?id=6a58e12d19c539deac9e90679a68438497a42fa4
> 
> That would be good but a caution is that if pseudo is just one usecase
> here which brought this issue forward, since we use PIE by default this
> would come up elsewhere too

The only usecase for building a static library as PIC I am aware of is 
when you want to link the static library into a shared library.

Usually linking a static library into a shared library is a bug and
the link error is preferable since you actually intended to link
with the shared library (the linker automatically uses a static
library when it can't find a shared library).

There are rare exceptions when this is done intentionally.
Linking a static libsqlite3.a into libpseudo.so was such an exception.

Whether the non-PIC code is PIE or not does not make a difference.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


