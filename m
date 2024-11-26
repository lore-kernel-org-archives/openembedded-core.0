Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDF3D3B989
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 12:17:22 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.44858.1732623441028258537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 04:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YW8QawHD;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: hiagofranco@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fc340eb006so1662465a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 04:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732623440; x=1733228240; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V9VeOiIK52xYG8OxTkspo0tm7LhyXB3BAe4NnOfS2dw=;
        b=YW8QawHDiK3JStouRpJ2tFdcmuWyni0qBV1a2aWU7kAj5IZD2WOpyO4QpDeK0B8YwG
         6lAfK3im3UfrZic20xSnrGwXwfi2TGFOpxKYp2tal6RpT6fG5e/TEyLpHgsTrlh4ZuRL
         OhPGG24martkO4W8QdPCCpMOXXmUofwrnZ9UQQvMaHMJ5oqlzMSlXcIgsra1Qhm1YKod
         jcCXvcbdvHVSbqtc+BbsepACVdKDMXltKTXrbTl1DdJJB+xKyxlwhOr32RYy5k8LldzA
         YT8K7duHn5Q4U1SA7IZjCPrclhVRWK1jguFw8z3QwfohYKdkyfvrYZ4ebTcVJXDLDAKb
         EL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732623440; x=1733228240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9VeOiIK52xYG8OxTkspo0tm7LhyXB3BAe4NnOfS2dw=;
        b=lFJz+9G3hxYU03frCWhU+5q4jBlLsinI2c/jMJbcGvlJStv7bqZWmh38pb5zGdqgzU
         V2PMludqLOlJFJYOiRqYNLumlBdK1SwoVjSCt4NFp2LfD3p5NerPmjRL2zrmqP1P7jvh
         xMLme+FFGVIjiMZmKPhfD4fQ7WpVfSByuX0Ke5dSJ0eVcsyPK+WMdapZgb3Y4asjzDme
         qajfZHTGYl/nERxxtdpPXU3x/WqRe9xX5nzr/ehJl/TzoJk7GLtQiXElj99rhh4iUgoW
         XzK0EjIZ4Xy3RZfauqz4n1P9IADn/JJ3rSNIBpq17sPA5516ZiWgnpek87WpHtzizJpx
         +w/Q==
X-Gm-Message-State: AOJu0YxbYdd/sKM4vAH1LZzO6Mr574772Q5PoezW4ixjOAk2oBH2POuS
	pXZjzPFtl1TO+57AZCx8hOxB1nBqy7xNukygcjbyu1P5RS1CNQEd
X-Gm-Gg: ASbGnctftMPgqX+5FkPWOFt0BVaBe6npyWy6znAYC4+7e779tBsYIq4Y7pVspOYis67
	dotTnZF/Wr1NSFvMVh0OZbt78QqteRpX80ffzH93hGKC/WIjR6pVCBAOpnwB2crShnvmZaj8X86
	n3Ee6rcrSpgMTVdwea528MZo4s1wbS2uFRtVEDxeKTkcF9fxnONEHBfTR/1L8sUkRLXgCvDM5De
	fopuZ+py3W5w8SjPHtO9vtHfETsS1Lj1vBomlp0i/h4orBZ
X-Google-Smtp-Source: AGHT+IEdCZSm40g5ySSIwtnSB4fxwiPIFNvUf3PcLGGrRlzl3SPHS9P6y7Yv9u1Rs7paVGBSimfuuA==
X-Received: by 2002:a05:6a20:a111:b0:1e0:ae81:58d7 with SMTP id adf61e73a8af0-1e0ae815d03mr18469299637.36.1732623440223;
        Tue, 26 Nov 2024 04:17:20 -0800 (PST)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead031523fsm12168212a91.19.2024.11.26.04.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 04:17:19 -0800 (PST)
Date: Tue, 26 Nov 2024 09:17:16 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Denys Dmytriyenko <denis@denix.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH v3 1/3] hwdata: add recipe from
 meta-openembedded
Message-ID: <20241126121716.eqskoqfleyrn4fgu@hiago-nb>
References: <20241126000836.6901-1-hiagofranco@gmail.com>
 <20241126000836.6901-2-hiagofranco@gmail.com>
 <CAMKF1spfQeh1i07Wwg5ndJ7uJpQ=Pz1eeCWc1J1KBLUfY78=9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1spfQeh1i07Wwg5ndJ7uJpQ=Pz1eeCWc1J1KBLUfY78=9A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 12:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207848

On Mon, Nov 25, 2024 at 04:51:37PM -0800, Khem Raj wrote:
> Don’t forget to send a patch to remove it from meta-oe once it get merged
> into core layer here

Sure, thanks. I will do it once this is merged.

> 
> On Mon, Nov 25, 2024 at 4:10 PM Hiago De Franco via lists.openembedded.org
> <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> 
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > Move hwdata recipe from meta-openembedded to openembedded-core.
> >
> > libdisplay-info is now a requirement for Weston, since commit
> > a16598b038b2 ("backend-drm: make libdisplay-info mandatory"). However,
> > in order to build libdisplay-info, hwdata is required. Since Weston is
> > built inside openembedded-core, move hwdata in order to be able to
> > upgrade Weston, so oe-core has no dependency on meta-oe.
> >
> > hwdata contains various hardware identification and configuration data.
> >
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc    |  1 +
> >  meta/recipes-support/hwdata/hwdata_0.389.bb | 30 +++++++++++++++++++++
> >  2 files changed, 31 insertions(+)
> >  create mode 100644 meta/recipes-support/hwdata/hwdata_0.389.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> > b/meta/conf/distro/include/maintainers.inc
> > index d61b88f7de6c..04208ebbf22b 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -262,6 +262,7 @@ RECIPE_MAINTAINER:pn-harfbuzz = "Anuj Mittal <
> > anuj.mittal@intel.com>"
> >  RECIPE_MAINTAINER:pn-hdparm = "Denys Dmytriyenko <denis@denix.org>"
> >  RECIPE_MAINTAINER:pn-help2man = "Hongxu Jia <hongxu.jia@windriver.com>"
> >  RECIPE_MAINTAINER:pn-hicolor-icon-theme = "Anuj Mittal <
> > anuj.mittal@intel.com>"
> > +RECIPE_MAINTAINER:pn-hwdata = "Hiago De Franco <hiago.franco@toradex.com
> > >"
> >  RECIPE_MAINTAINER:pn-hwlatdetect = "Alexander Kanavin <
> > alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-i2c-tools = "Anuj Mittal <anuj.mittal@intel.com>"
> >  RECIPE_MAINTAINER:pn-icecc-create-env = "Joshua Watt <
> > JPEWhacker@gmail.com>"
> > diff --git a/meta/recipes-support/hwdata/hwdata_0.389.bb
> > b/meta/recipes-support/hwdata/hwdata_0.389.bb
> > new file mode 100644
> > index 000000000000..8ab455cd2e99
> > --- /dev/null
> > +++ b/meta/recipes-support/hwdata/hwdata_0.389.bb
> > @@ -0,0 +1,30 @@
> > +SUMMARY = "Hardware identification and configuration data"
> > +DESCRIPTION = "hwdata contains various hardware identification and \
> > +configuration data, such as the pci.ids and usb.ids databases."
> > +HOMEPAGE = "https://github.com/vcrhonek/hwdata"
> > +SECTION = "System/Base"
> > +
> > +LICENSE = "GPL-2.0-or-later | XFree86-1.0"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
> > +
> > +SRC_URI = "git://
> > github.com/vcrhonek/${BPN}.git;branch=master;protocol=https
> > <http://github.com/vcrhonek/$%7BBPN%7D.git;branch=master;protocol=https>"
> > +SRCREV = "5313a12eb992a354c17fc895c1d69c8c42b09a06"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit allarch
> > +
> > +do_configure() {
> > +    ${S}/configure --datadir=${datadir} --libdir=${libdir}
> > +}
> > +
> > +do_compile[noexec] = "1"
> > +
> > +do_install() {
> > +    oe_runmake install DESTDIR=${D}
> > +}
> > +
> > +FILES:${PN} = "${libdir}/* \
> > +               ${datadir}/* "
> > +
> > +BBCLASSEXTEND += "native"
> > --
> > 2.39.5
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#207804):
> > https://lists.openembedded.org/g/openembedded-core/message/207804
> > Mute This Topic: https://lists.openembedded.org/mt/109782305/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> > raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >

Cheers,

Hiago.

