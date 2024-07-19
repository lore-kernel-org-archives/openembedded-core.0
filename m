Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5CAC3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 16:46:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.23011.1721407603083679046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 09:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4AA2B40C83;
	Fri, 19 Jul 2024 16:46:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uO6_g8WxOezr; Fri, 19 Jul 2024 16:46:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2209D407DA;
	Fri, 19 Jul 2024 16:46:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2F27D164000; Fri, 19 Jul 2024 12:46:39 -0400 (EDT)
Date: Fri, 19 Jul 2024 12:46:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jiaying.Song.CN@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
Message-ID: <20240719164639.GN17572@denix.org>
References: <20240717023201.861394-1-jiaying.song.cn@windriver.com>
 <20240718224715.GM17572@denix.org>
 <CANNYZj_PDL3P6WKEkN1BdioyPEMbYVJZP=WmuVkbKeW7=O_vVA@mail.gmail.com>
 <CANNYZj_6miWR2kz3qQpMNFEtNQM6v1iwr6ia9a-=T5hTUje92g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_6miWR2kz3qQpMNFEtNQM6v1iwr6ia9a-=T5hTUje92g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 16:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202268

On Fri, Jul 19, 2024 at 08:18:26AM +0200, Alexander Kanavin wrote:
> There was a proposal with two option (maybe that was missed) and I

Yeah, I guess I missed that one.


> suggested just adding the link and be done with it. We can drop lots of
> patches and send tweaks then.
> 
> Alex
> 
> On Fri 19. Jul 2024 at 8.17, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> 
> > But there is no alternative. Python is python3 and has been for years.

Understood, but many distros still manage symlinks via update-alternatives, 
hence my question. I guess since we don't supoort multiple versions at the 
same time, it does make sense to keep it simple...


> > Alex
> >
> > On Fri 19. Jul 2024 at 0.47, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> >> Should this be done via update-alternatives, like many other Linux
> >> distros do?
> >>
> >>
> >> On Wed, Jul 17, 2024 at 10:32:01AM +0800, Song, Jiaying (CN) via
> >> lists.openembedded.org wrote:
> >> > From: Jiaying Song <jiaying.song.cn@windriver.com>
> >> >
> >> > The /usr/bin/python cannot find the correct Python interpreter, so a
> >> symbolic
> >> > link is added to point it to the Python3 interpreter.
> >> >
> >> > Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> >> > ---
> >> >  meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
> >> >  meta/recipes-devtools/python/python3_3.12.4.bb             | 1 +
> >> >  2 files changed, 2 insertions(+)
> >> >
> >> > diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json
> >> b/meta/recipes-devtools/python/python3/python3-manifest.json
> >> > index 46092d4004..f9259e1450 100644
> >> > --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> >> > +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> >> > @@ -220,6 +220,7 @@
> >> >          "files": [
> >> >              "${bindir}/python${PYTHON_MAJMIN}",
> >> >              "${bindir}/python${PYTHON_MAJMIN}.real",
> >> > +            "${bindir}/python",
> >> >              "${bindir}/python3",
> >> >              "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
> >> >              "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
> >> > diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb
> >> b/meta/recipes-devtools/python/python3_3.12.4.bb
> >> > index 743ba0b1f1..94535e7678 100644
> >> > --- a/meta/recipes-devtools/python/python3_3.12.4.bb
> >> > +++ b/meta/recipes-devtools/python/python3_3.12.4.bb
> >> > @@ -165,6 +165,7 @@ do_install:prepend() {
> >> >
> >> >  do_install:append:class-target() {
> >> >          oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
> >> > +        ln -sf ${bindir}/python3 ${D}${bindir}/python
> >> >  }
> >> >
> >> >  do_install:append:class-native() {
> >> > --
> >> > 2.44.0
> >>
> >

