Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04255C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 20:21:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.260.1788466886156713051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 13:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h7+Bquxz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso3354895e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 13:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788466884; x=1789071684; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gcRFN5F4H7+CiCxwS8YcMkmQI3NR9tVptuyfZC5VPLk=;
        b=h7+BquxzJC4wPDSnt2k9N7BEGxTcq/HnxxnQeOGuI00z+xY+i86d+YeR6qZAGRaJHJ
         yyqN1DbBJ0IP9dMxYAIm61kx3K/hG8pCiU/S60B7tbHfaLCUcd0mhIupZTbsuu8j8WAY
         FuY73C0dawHFQVye5rYRKOvcMEVT5B8pyUq8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466884; x=1789071684;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcRFN5F4H7+CiCxwS8YcMkmQI3NR9tVptuyfZC5VPLk=;
        b=OcBNS8tyg1R6ASF+y8g/VO9EkKRftQTIDPqgiTpRdxauxvl/2JKlN5JTdCGM66riJK
         SalqIzGOK7EWCdB2cIImFzt2s1S9hj7bCckyvGkWOMPh/3sYdDa9QrHTy7hjl4P8Q+/u
         ahOg9JKy/543dDrgwtbvTRUrSM97h6G5sbR3mXgMxJMnPZwH6Q0qemtY4CZ2yQN6FDxt
         nyA217IIAbtcdaBOkNgIKoWvSvC6jQh3eSFUYV/qVvGJWv0ucgE+GgeDnehfLlUt1Vwn
         ulofbFclvzerhP5ZnQtGz64uiRbmzVFdIQHnL4aIH3Xia8Q54URVC5lVXjjdA1Pgbg02
         yTsg==
X-Forwarded-Encrypted: i=1; AKwUvBwjgvIITdbzPVym3emLTpLt7H2VoxSSOsyORzPn7RsUTb9XbnZyHgxp4Z7l7ydnk84dlh4ihKIfVBzk+D7XQ8xMaA==@lists.openembedded.org
X-Gm-Message-State: AFuF++mc6GYRMOn6wDAbBJdI1SzlpmfOcu6DFXvkeHfcKUeqr4cjqOQr
	w/TvewSXFiqWVGYH58BJRr0n/xuaaIdc0pjrayXuLK33JfJjTEy8/BGFUd+eu9PT2vk=
X-Gm-Gg: AYBFou1HjcRFkjvkr+6AENjiXigCfWQnkf4IRVsFUBbG1bJRTvjjzodbXVsTEsLH4vb
	mw8GPiO454kF7bE1NmEC3v5DDpXExO3el73VtG91GFeCbRwQQIVmoNmn5qn+sDcArou35Xtag3D
	PmZlI+p5AWSQG9Gdeggpdbhx9W7WbDSgLcNvfSUVa6iILDvBwuYLDfyuu+h+ntbVttcxMw3h8F7
	CiuYuSkqW2GDE7m2Yl15gupRCnUYNY/56R+zGc+FsLGMhLC/iGAEiTrjE8Bka7/HH7JkYB/DJ0t
	hVekGG6kVAXgZ4AeM+ll7sYPutYTd8OqVAG6iYWrucHzyxJZdF1MDHAPADAj25ZR7H4ENZTWh4Q
	BPA50HseusVGK8acmm1IldOtqn1OaMKrRzpaY5tELa8ZiYBHZCWGq9RE5uR+sawj0OC7OXbIA99
	h87LRvly0b9wMGjTHNsKUBW49vWT9lSyzXcPlFTWYOIGgyTJIG8OXfPssJ7slHMqNqI92uvw/eS
	WRTpi6rdNhLTMQ3ykB7+ipGY9tvxyzf/CTNBkyAO39fZDbpuxs=
X-Received: by 2002:a05:600d:8498:20b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49cf828c65amr6137715e9.16.1788466884271;
        Thu, 03 Sep 2026 13:21:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3f77:7f7:7ec1:8841? ([2001:8b0:aba:5f3c:3f77:7f7:7ec1:8841])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm21485825e9.15.2026.09.03.13.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:21:23 -0700 (PDT)
Message-ID: <59f84c8da48e254a2974ca4ddeef4426734e64b7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 02/25] devtool: ide-sdk: dedupe
 solib_search_path entries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Sep 2026 21:21:22 +0100
In-Reply-To: <1ffaac43051093ec29916ce154a96b6e1fd943bc.camel@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
			 <20260830214912.1346063-3-adrian.freihofer@siemens.com>
		 <92d96154859f9da579f751003a941a97921a32fb.camel@linuxfoundation.org>
	 <1ffaac43051093ec29916ce154a96b6e1fd943bc.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 20:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245041

On Thu, 2026-09-03 at 16:06 +0000, Freihofer, Adrian wrote:
> On Thu, 2026-09-03 at 12:18 +0100, Richard Purdie wrote:
> > On Sun, 2026-08-30 at 23:48 +0200, Adrian Freihofer via
> > lists.openembedded.org wrote:
> > > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> > >=20
> > > With usrmerge in DISTRO_FEATURES (the default), root_prefix becomes
> > > exec_prefix, so base_libdir and libdir resolve to the same path.
> > > This
> > > made most entries of solib_search_path() literal duplicates. Dedupe
> > > while preserving order.
> > >=20
> > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > > ---
> > > =C2=A0scripts/lib/devtool/ide_sdk.py | 3 ++-
> > > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/scripts/lib/devtool/ide_sdk.py
> > > b/scripts/lib/devtool/ide_sdk.py
> > > index 4fdeeec24d..6f08940c9c 100755
> > > --- a/scripts/lib/devtool/ide_sdk.py
> > > +++ b/scripts/lib/devtool/ide_sdk.py
> > > @@ -643,7 +643,8 @@ class RecipeModified:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 os.path.join(image.rootfs, base_libdir),
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 os.path.join(image.rootfs, libdir)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return so_paths
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # base_libdir =3D=3D libd=
ir when usrmerge is in
> > > DISTRO_FEATURES (the default), dedupe
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return list(dict.fromkeys=
(so_paths))
> >=20
> > This is a little hard to read, would set(so_paths) work here?
>=20
> The order of these paths is essential. Therefore set would not work.
>=20
> I'm working on a v3 which will improve the comments for this
> complicated function as much as possible.


I wondered if order was important. I think in that case I'd change the
way you're building it in the code above to use a dict, assume dict
ordering and then just make a list from that...

Cheers,

Richard


