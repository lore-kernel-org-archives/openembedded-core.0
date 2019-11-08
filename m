Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 534 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Nov 2019 10:05:49 UTC
Received: from relay.dream-property.net (relay.dream-property.net
	[178.19.67.222])
	by mail.openembedded.org (Postfix) with ESMTP id A85527F884
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 10:05:49 +0000 (UTC)
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 28F8F100944C5;
	Fri,  8 Nov 2019 09:56:55 +0000 (UTC)
Received: from localhost (ip-176-199-141-47.hsi06.unitymediagroup.de
	[176.199.141.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B14AA31412DE;
	Fri,  8 Nov 2019 10:56:54 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org; 
	s=dkim; t=1573207014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=S4ZS+6ZTQaH/cFKpFu/Knrx4ht2IOHl5sssmYLEbFNA=;
	b=SwEPc0Ss0/0mlzhAy53JX56U7kJd2cRFMKyTgK8bYlQhyY+DNkmu0N7hY9jr5gGRqjX8qJ
	pr7T31JDO6osogAA==
Date: Fri, 8 Nov 2019 10:56:52 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20191108105652.6f7e85ad@opendreambox.org>
In-Reply-To: <CAJ86T=UNsGMLiLfkLcT_2nh=z9e4NzaJGfXbfj5+wSN1wuQ8tQ@mail.gmail.com>
References: <20191107204943.17467-1-obi@opendreambox.org>
	<20191107204943.17467-3-obi@opendreambox.org>
	<CAJ86T=UNsGMLiLfkLcT_2nh=z9e4NzaJGfXbfj5+wSN1wuQ8tQ@mail.gmail.com>
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemd: Add runtime dependency on new ldconfig package
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
X-List-Received-Date: Fri, 08 Nov 2019 10:05:50 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 7 Nov 2019 16:58:57 -0800
Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Nov 7, 2019 at 12:55 PM Andreas Oberritter <obi@opendreambox.org> wrote:
> >
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> >  meta/recipes-core/systemd/systemd_243.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
> > index 6e7f95693b..54fcc6a5d1 100644
> > --- a/meta/recipes-core/systemd/systemd_243.bb
> > +++ b/meta/recipes-core/systemd/systemd_243.bb
> > @@ -139,7 +139,7 @@ PACKAGECONFIG[importd] = "-Dimportd=true,-Dimportd=false"
> >  PACKAGECONFIG[iptc] = "-Dlibiptc=true,-Dlibiptc=false,iptables"
> >  PACKAGECONFIG[journal-upload] = "-Dlibcurl=true,-Dlibcurl=false,curl"
> >  PACKAGECONFIG[kmod] = "-Dkmod=true,-Dkmod=false,kmod"
> > -PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false"
> > +PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false,,ldconfig"
> 
> Is this necessary? The implication of adding it is that you want to
> support situations where ldconfig is disabled in DISTRO_FEATURES (ie
> the new ldconfig package is not pulled in via a runtime dependency
> from glibc) but then manually added to systemd PACKAGECONFIG (ie
> ignoring DISTRO_FEATURES). That just seems like a misconfiguration and
> not something we should try to support.

If you enable ldconfig in systemd, then you clearly always want to install
ldconfig with systemd. That's what this patch makes sure. You can still build
other images without systemd (i.e. with sysvinit) and without ldconfig. That's
what I do.

Regards,
Andreas

