Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QUfmM-0006sh-4J for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 16:00:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59DunUa013320;
	Thu, 9 Jun 2011 14:56:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12805-09; Thu,  9 Jun 2011 14:56:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59Dufmi013314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 9 Jun 2011 14:56:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB69810B00D86@shsmsx502.ccr.corp.intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<4DE67440.1020405@mentor.com> <1306950977.27470.461.camel@rex>
	<4DE69582.2090508@mentor.com>
	<1306958729.3119.3.camel@lenovo.internal.reciva.com>
	<4DE6A43A.3050401@mentor.com>
	<1306961135.3119.13.camel@lenovo.internal.reciva.com>
	<4DE6A836.3040004@mentor.com> <1307023591.27470.549.camel@rex>
	<4DE79D69.7080806@mentor.com> <1307025426.2529.209.camel@phil-desktop>
	<4DE7BA3F.4060600@mentor.com> <1307032545.27470.580.camel@rex>
	<4DE7C09F.9000104@mentor.com>  <1307606678.15712.130.camel@rex>
	<1307606884.15712.132.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69810B00D86@shsmsx502.ccr.corp.intel.com>
Date: Thu, 09 Jun 2011 14:56:32 +0100
Message-ID: <1307627792.15712.160.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jun 2011 14:00:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 21:51 +0800, Cui, Dexuan wrote:
> Richard Purdie wrote:
> > On Thu, 2011-06-09 at 09:04 +0100, Richard Purdie wrote: 
> >> I suspect you've asking for some partial sstate cache to be shared
> >> between two builds? 
> >> 
> >> Put simpler, you probably want:
> >> 
> >> in tmp0 "bitbake perl-native"
> >> in tmp1, different location to tmp0, "bitbake core-image-sato" but
> >> sharing the same sstate cache
> > 
> > I meant to add that tmp0 should be renamed before this second step so
> > if there are hardcoded references in any of the sstate packages they
> > couldn't find anything in tmp0 as it would no longer exist.
>
> Actually this doesn't work even without my patch series?
> i.e., without my patch series,
> 1) I "bitbake perl-native" in /poky.git/build/;
> 2) mv /poky.git/build /poky.git/build.bak;
> 3) in /poky.git/build2/, modify the conf/local.conf to set SSTATE_MIRRORS to point to /poky.git/build.bak/sstate-cache/, and "bitbake sgmlspl-native" would fail in do_compile:
> "Can't locate ExtUtils/Command.pm in @INC (@INC contains: /poky.git/build/tmp/sysroots/i686-linux/usr/lib/perl/5.12.3 /poky.git/build/tmp/sysroots/i686-linux/usr/lib/perl/5.12.3 /poky.git/build/tmp/sysroots/i686-"linux/usr/lib/perl/5.12.3"
> Is this an existing bug? 

Looks like it. This did work but it looks like its been broken
somehow :(

Cheers,

Richard



