Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4F7C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 16:51:59 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.45017.1656348713814510352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 09:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VU/4GMk5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id d17so8286431wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 09:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=izy466s1mUNUDfPPZbh0oX0mlY/sIA23XNfR5m2atpc=;
        b=VU/4GMk5u8Eg7gb/LU0J+j7blxquOOPWt7kKPC3U84dq3L6m8tQ5nmNVeDiS3VtAxF
         2UY+O6lWAgktzUKTsRQv5qCv7szAHW09+3tq8PaLHxYmzDzpoSSr34zgJEXa9uS1MGhZ
         8myRW1UQwiE9WJsExL7p9o5XcGu1WNZxaAXY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=izy466s1mUNUDfPPZbh0oX0mlY/sIA23XNfR5m2atpc=;
        b=FvB6jm91Z/+ftvog0SiE3vt2iBAcbw/Cd6caVJDLAZ6NM7Fp7RToAqtLAwEv4JiOFx
         qmruFnjNB/M3P3ziFCmFO2nd01yG932MkJwXwmhr9inn1Bq1Ayoci3i893XOiQzHbxO2
         7KsV0ttWMQuK/uXqrbXXUCAI9BB+dXde9tv3z6SzusDiPaE+8O/CjpGJbApHxxc/g82o
         tNDAhoxMrD5VjcU1Xj8kJv0s9y3kMGm+EKjDsKdi2xsTJsyIUc4B3HlFxPV4k3yiRwHp
         /6gJCCsK/lDya2jBFtkfW2EIMLDtf/2WNDYgevSf6dmIb9k0lgYwesQI131p4xFTpjSU
         Ko1w==
X-Gm-Message-State: AJIora96lqkQ43WVHcTz9+rh6Pq7toAKctYSeixKkVpS657cpepxe6Bp
	bmWeOVw4ma5lApGRnJ+E3YmkipJOqxOoBg==
X-Google-Smtp-Source: 
 AGRyM1twwKaBjHIn+hI64bgACItyyposA8KS0VCqN1xbUEY02fdUZuFtGOtV3R3jQL+mYXnilrDeYg==
X-Received: by 2002:adf:f5ce:0:b0:21b:832c:80dd with SMTP id
 k14-20020adff5ce000000b0021b832c80ddmr13136507wrp.235.1656348712376;
        Mon, 27 Jun 2022 09:51:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033?
 ([2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033])
        by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b0021b9a4a75e2sm10958055wrr.30.2022.06.27.09.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 09:51:51 -0700 (PDT)
Message-ID: 
 <064f43a0223448f2e7bb9ffa0c642ff71177fed1.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/4] package_manager: Change complementary package
 handling to not include soft dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jun 2022 17:51:50 +0100
In-Reply-To: <5A166BD2-8DCE-4519-B17A-811C83DDB236@arm.com>
References: <20220626094506.352336-1-richard.purdie@linuxfoundation.org>
	 <5A166BD2-8DCE-4519-B17A-811C83DDB236@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 16:51:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167329

On Mon, 2022-06-27 at 16:12 +0000, Ross Burton wrote:
> Whilst I agree with this series in general (obviously=E2=80=A6), some
> commentary.
>=20
> First, the impact of this can=E2=80=99t be understated.  If you enable de=
v-
> pkgs on core-image-base, and extra 424 packages are installed
> *ignoring any package with -dev in its name*. This includes
> behaviour-changing packages such as the full-fat versions of
> coreutils, util-linux, findutils, most of Python, a whole slew of
> libraries.  That is *not* good and this is a step in the right
> direction.
>=20
> There are still some edge cases though, repeating the same test with
> core-image-base installs these extra non-dev packages:
>=20
> alsa-topology-conf
> libatopology2
> libavahi-client3
> libavahi-glib1
> libavahi-gobject0
> libc-malloc-debug0
> libc6-extra-nss
> libc6-thread-db
> libc6-utils
> libfdisk1
> libform5
> libformw5
> libgcc1
> libmenu5
> libmenuw5
> libncurses5
> libncursesw5
> libnl-3-cli
> libnl-idiag-3-200
> libnl-nf-3-200
> libnl-xfrm-3-200
> libnss-db2
> libpanel5
> libpanelw5
> libpcrecpp0
> libpcreposix0
> libsmartcols1
> libss2
> libstdc++6
> libtic5
> libticw5
> libx11-xcb1
> libxcb-composite0
> libxcb-damage0
> libxcb-dpms0
> libxcb-dri2-0
> libxcb-dri3-0
> libxcb-glx0
> libxcb-present0
> libxcb-randr0
> libxcb-record0
> libxcb-render0
> libxcb-res0
> libxcb-screensaver0
> libxcb-shape0
> libxcb-shm0
> libxcb-sync1
> libxcb-xf86dri0
> libxcb-xfixes0
> libxcb-xinerama0
> libxcb-xinput0
> libxcb-xkb1
> libxcb-xtest0
> libxcb-xv0
> libxcb-xvmc0
>=20
> The bulk of these are likely from the -dev package depending on the
> real package to satisfy dangling symlinks.  This may actually be
> desirable behaviour?  Not sure I=E2=80=99d want a broken -dev package.


I did a test build and changing package_fixsymlinks() in
package.bbclaass to use RRECOMMENDS instead of RDEPENDS does remove the
packages listed above too.

I'm torn on that, making that change would complete the picture and
you'd still have the dependency there, just as a slightly weaker level
and means dev-pkgs no longer radically changes the contents of the
image which is probably a good thing?

Cheers,

Richard




