Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9D01E60DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 13:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s82DJpOs006459; Tue, 2 Sep 2014 14:19:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uo7Lg2Dz7_wd; Tue,  2 Sep 2014 14:19:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s82DJlua006456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 2 Sep 2014 14:19:48 +0100
Message-ID: <1409663988.18528.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 02 Sep 2014 14:19:48 +0100
In-Reply-To: <CAP9ODKqfNwXn_dEUu-WT6zLoUM_MDDtgPRp2WfUU238UcpuKJw@mail.gmail.com>
References: <CAP9ODKpWHy4XW6OVs34=-p+GRK6iOLvgsAqr22obSAaj9_2SDQ@mail.gmail.com>
	<540530B8.8040107@windriver.com>
	<CAP9ODKrxFsbVs7xNQ1tOW2xmrQ4-omTZCTVQ04aO8ms--Lu9Qw@mail.gmail.com>
	<540539E6.2030508@windriver.com>
	<CAP9ODKr_p-1z-nRLuM_nMVpei3A4Z2CuDh9wzEEpZW9jSEoL-w@mail.gmail.com>
	<540568FB.4040006@windriver.com>
	<CAP9ODKqfNwXn_dEUu-WT6zLoUM_MDDtgPRp2WfUU238UcpuKJw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error while building qemu without X11 support.
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
X-List-Received-Date: Tue, 02 Sep 2014 13:20:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-09-02 at 09:36 -0300, Otavio Salvador wrote:
> > How about only remove the x11 for target ?
> >
> > DISTRO_FEATURES_remove_class-target = "x11"
> 
> This is a workaround. Few days ago it built fine so a clear regression.

Lets take a step back and think about this for a minute.

If you build qemu-native configured with sdl, its likely you do want X
support. As this stood, the linkage with libxext was problematic.
Robert's patch makes the situation deterministic so in that sense its as
correct as the various other determinism patches.

The issue is that in some builds, you relied on x11-native not being
built and this is now showing up as an issue. What can be done is to
make the libxext dependency conditional on x11 in DISTRO_FEATURES as
we've done in other cases. It doesn't really make this invalid or a
regression, just that like other determinism fixes, we've resolved this
in a way means we need to rethink a few things.

I'd strongly suggest people think about whether they do really want x11
in "native" DISTRO_FEATURES since in reality, I suspect most people do.

So I'll take a patch making the dependency conditional but I don't
believe its what most people actually want.

Cheers,

Richard



