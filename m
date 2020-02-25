Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 49EAF61809
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:19:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Rc0Y25cMz4M;
	Tue, 25 Feb 2020 12:19:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582629597;
	bh=ttd5f8FIO6kHwjUtEQet94gGmFA0VXHgnxDosr2o+00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kuapmNFrSP3Mu3FiaQatldpUA21qZlOQNZkrYrNSPto1KlII0VTY0EQOGCO4Oygo+
	myasbC+S9udMyQQy23f27X+w//W4GZHR2yxQW7BWcXMRADlr6kbEQuFw8b+bRFCDzB
	YFJdCq16glyEviJSBs1mwGF6d6lqLMCseOdopn/nob+0d2Bu8P1eLuWpa8HssPY6UI
	Yx23yiJdlIHXZHSXcmFH0T7cE6HrRsrDo8lzPZqRUnwdMl8MZR/zBx85vw2jOz83HW
	GWHfqB1saLCh7VvWFl99IPuatK13i84sCEUQOQoTXLuzeYLfLaog8/ayWpKK7WLGoF
	GcWdWexeLyLPZ0XTcEdJia3ri3DyHuvBSKdj3cFiOxqyAeRzox5TpeZMCEFv8YCWIh
	J0Bq59LWcoT+eS17oGMKstp4YC1O0hRr8cmVzqXA5kAqzBGdqjkA3/jZMww+Xak9qz
	tpSfX0a6RnJV5rfg0x/PkNzdV/grO/y0JynJq1dx0CACzJbbK18dk9E6SLqhbPmgS8
	I0NLcyz7DWPCsoKaguP+kGWUgZk25c0P/GndxXZ1alH8VamBxYzfVn3sdpm9tfforV
	LmIO+MA0C7Ztu+sGib3xU5I8g6gBdASk5RxmA0Og6MTGYtJULCU3Vshcbs39YNfiR8
	i5j2M7gxGiIyiAGq/Cw9XaO4=
Date: Tue, 25 Feb 2020 13:19:55 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200225111955.GA13902@localhost>
References: <20200223182933.6168-1-bunk@stusta.de>
	<fd59ef897ef077f4f0160e1e2d7c95466c75a3f7.camel@linuxfoundation.org>
	<20200224104635.GA27036@localhost>
	<20200224140801.GC27036@localhost>
	<CANNYZj91N68ocXm=UKzcH6U7nEnVLuQzDStR3O0_cO3GsY9uag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj91N68ocXm=UKzcH6U7nEnVLuQzDStR3O0_cO3GsY9uag@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/6] webkitgtk: Remove unnecessary REQUIRED_DISTRO_FEATURES requirements
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
X-List-Received-Date: Tue, 25 Feb 2020 11:20:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Feb 24, 2020 at 10:45:33PM +0100, Alexander Kanavin wrote:
> On Mon, 24 Feb 2020 at 15:08, Adrian Bunk <bunk@stusta.de> wrote:
> 
> > Alexander, wayland support in webkitgtk requires mesa built with x11
> > support (otherwise gl.pc is not available).
> 
> I had a look; I'm not sure I understood the options correctly, but the
> issue is due to this:
> 
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl
> opengl', '' ,d)} \
> 
> The above works if both opengl and x11 are enabled as DISTRO_FEATURES, but
> if x11 is not enabled, then it should be "webgl gles2". Can you try that?

Thanks, that did the trick.

Expressing everything might still be problematic, is there a way to set
REQUIRED_DISTRO_FEATURES to
  x11 || (wayland && opengl)
?

Using webkitgtk with x11 without opengl might not be common,
but it is explicitly supported upstream.

> Alex

cu
Adrian

