Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id AF3B9719B8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Oct 2017 02:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7528B20B03;
	Sun, 15 Oct 2017 02:01:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fHdayJJXKFLj; Sun, 15 Oct 2017 02:01:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 48FFC208BC;
	Sun, 15 Oct 2017 02:01:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BDA841626FE; Sat, 14 Oct 2017 22:01:38 -0400 (EDT)
Date: Sat, 14 Oct 2017 22:01:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrea Galbusera <gizero@gmail.com>
Message-ID: <20171015020138.GS9221@denix.org>
References: <cover.1506759191.git.Qi.Chen@windriver.com>
	<a74d181f182de5620684e5d4d1019a31e48b400d.1506759191.git.Qi.Chen@windriver.com>
	<CAC+thW1NdA_1zAVLf2jU+bQ+Mr58yBKFT_Gec4wXWiJRjfPFgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAC+thW1NdA_1zAVLf2jU+bQ+Mr58yBKFT_Gec4wXWiJRjfPFgw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Sun, 15 Oct 2017 02:01:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 14, 2017 at 10:53:03PM +0200, Andrea Galbusera wrote:
> On Sat, Sep 30, 2017 at 10:15 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
> > Add tools required by testimage to HOSTTOOLS only when testimage is
> > inherited. These tools, as described in the comment, are only required
> > by the testimage task. So this change should not have negtive effect.
> > This would also solve build error on hosts which miss some tool such as scp.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index f41680b..94c1f27 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -484,7 +484,7 @@ HOSTTOOLS += " \
> >  "
> >
> >  # Tools needed to run testimage runtime image testing
> > -HOSTTOOLS += "ip ping ps scp ssh stty"
> > +HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
> >
> >  # Link to these if present
> >  HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> This one is breaking any recipe that fetches from git repo with
> 'protocol=ssh' in its SRC_URI... I verified that reverting this one
> restores the usual fetcher behaviour. Should ssh be added to HOSTTOOLS
> unconditionally or is there any other way to approach it?

There's an entire thread discussing it here:
http://lists.openembedded.org/pipermail/openembedded-core/2017-October/143279.html

