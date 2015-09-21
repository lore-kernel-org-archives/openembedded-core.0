Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id B87F560053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 13:53:43 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so115902170wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 06:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=MtkRMw2MRaWnDTE4lgnK7uM9sVP/v6eI2T5mokuCZAo=;
	b=uQy9n6SMNlDYMetEqZT1BMoRPlsELXJ6VhTVk96JY+B5l1N7DHU0NpAgk1v1pTGAeH
	zN5jXhLzIWvwwcThQPqNx5sciNYqOfNCDmhxB0GT9uRrpLqWvA0eYMzC9Dm91E5sm3ZH
	+6otcTTtTzyurIHF+aR+CrxLay4XYuR67nna5Mb/krVgn0Wslj6qiWhY15sK/iv812h2
	Swc0tkfflrC0XRL52E5ovsFmw1LsUARtvFvZzi0H+BEMpMfhD1lUmlZAWcRj0w+Q/eNc
	mje0C284QjDlS30AaMoFRZGA7k68KbwM4pjN0GV02nJ/RHaf9S+Sx99T/rOwAOYW0tb3
	Otmw==
X-Received: by 10.180.89.101 with SMTP id bn5mr13003864wib.20.1442843623580;
	Mon, 21 Sep 2015 06:53:43 -0700 (PDT)
Received: from CHL500343VM.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	ej5sm24262418wjd.22.2015.09.21.06.53.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 06:53:42 -0700 (PDT)
Message-ID: <1442843621.4766.124.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Date: Mon, 21 Sep 2015 15:53:41 +0200
In-Reply-To: <55FFFCBE.7030103@gmail.com>
References: <1442834624-25775-1-git-send-email-net147@gmail.com>
	<CAJTo0LYjGD_u+Lj7DpMfGYXx55jbg1aQr_i06=kCQOWyJuu95g@mail.gmail.com>
	<55FFF8A7.1090809@gmail.com>
	<CAB3asfgbPBqEJ9YWmGahb7U28ZNrAJf+8MA7WxQictFxVdqgfw@mail.gmail.com>
	<55FFFCBE.7030103@gmail.com>
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable problematic GCC 5.2 optimizations
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
X-List-Received-Date: Mon, 21 Sep 2015 13:53:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Jonathan

Your patch is fine on beaglebone black. At least it is possible to
login. Thank you.

Regards,
Adrian

On Mon, 2015-09-21 at 22:49 +1000, Jonathan Liu wrote:
> Hi Adrian,
> 
> On 21/09/2015 10:45 PM, Adrian Freihofer wrote:
> > On Beaglebone-black Systemd 215 does not boot if compiled with -O2.
> > Compiling with -O1 works.
> > 2015-09-21 14:31 GMT+02:00 Jonathan Liu <net147@gmail.com>:
> > > On 21/09/2015 10:23 PM, Burton, Ross wrote:
> > > > 
> > > > On 21 September 2015 at 12:23, Jonathan Liu <net147@gmail.com>
> > > > wrote:
> > > > > +FULL_OPTIMIZATION += "-fno-schedule-insns -fno-schedule
> > > > > -insns2"
> > > > > 
> > > > Are these bugs with the gcc optimisations or the systemd source
> > > > code, and if its gcc's fault are the problematic optimisations
> > > > specific to a particular architecture (such as ARM)?  Just
> > > > wondering if we can use overrides to only change the
> > > > optimisations where they're a problem.
> > > > 
> > > > Ross
> > > I am not sure how to isolate if it's an issue in the systemd
> > > source code but the issue is not present when using GCC 4.9.
> > > Haven't checked if this is occuring on other architectures. Any
> > > feedback whether this occurs on other platforms (Raspberry Pi 2
> > > is ARMv7) is welcome.
> > > 
> > > Regards,
> > > Jonathan
> > > 
> Can you try the patch instead of changing -O2 to -O1 to see if it
> fixes booting with systemd?
> 
> Regards,
> Jonathan

