Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C80D6D22C
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 14:32:15 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43371.1766068329107687402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 06:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U4GK8hZC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so345064f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 06:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1766068327; x=1766673127; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RKv+k1kBOg0Eb7XLFiaPpUKkXJjnyIXlATtUkbvW2xw=;
        b=U4GK8hZCC7E3V9Zv2Zpore5bBc/b8EZb8F1GANWI3HouH/BQqaCisLdRGNG2hZ+abu
         gPtXLHrIRPx9WM+5gT7QEeqXK/PCp8rbx9k0zASFPWglP3SWhv6cFdx+U/lNNwKSM6tA
         X7ORBSwXRxq8eux3pZRim2zHr+LTVwe6ISXfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766068327; x=1766673127;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RKv+k1kBOg0Eb7XLFiaPpUKkXJjnyIXlATtUkbvW2xw=;
        b=iF4bomZng/wfaNwTO0qUh7I7358bagot7gvTeRHL8KDbEpWh8N2mvMVcGRBP6WI6Wu
         CusaDtsqVdvQw5PgabkxOQSXiyFEatfkjTuNjOVSPlg3pdYNBZz+w+P0DVjZYR/aQ122
         ZE37T6fO6PesW1TeOgMBabwddy+9zUMWHq2WV9edulnuSOabM0clWLQlqXdWg4LHc7OX
         K2nDYU8jGYXimkVVWjSLIxmdAe513MgKUp4DiGc2StoWsHTBR/nczcQcnyAyZKxSohbv
         tpQhe8D88CGCCnAkgseey8u8gksGi7H+WD7Ni4fkqZmCtV7+jSSNmzQHx5CN8+g++urv
         dkWQ==
X-Gm-Message-State: AOJu0YyaSQmDzb71CHNzlPUOrBgPevfkJ8+W/DlaLpfq7cMnRwHDw4ts
	5/c5NErZPa+fFnU6yIVa3JC+uj4gk8P6gMmuQIC6PguPQ8G4/pcUEftZX11ujqq3c68=
X-Gm-Gg: AY/fxX5TF+T/DANwP+UIrnJSGMt4kcwf1oKZ4Rx4l2egCftpt6w+rNrseKZqKbZF8xC
	4KUQNaHulTXoD0NFC8Z1HsK0x9eBqR/Sc0V4U37uc+wZe037Qyjs9iPE/Kw3h8eCN/xk9VG67d7
	gpwXb7LjwGhJf1XIckRXgIMM3t5Hr8qrG5lCGFfzzpxF+nGIktIuDEN8vP1s1aSdypmYmAJRDjf
	ysf+j0rCWdnvjdXwD1C3UY7o0vtKpSyZtmGTlmSQ+SJ9JJah271Uf6pJcLhIhWjMx9eGfcGvg75
	VxKKKpiGcF9kRPXibcSKyPE/aqt0BuEsL+Rtk8/3HAZS41nYjYJsyoyzwI546Th/nMlYJ+5bD87
	TJVWSLa2dAJyBEhw9l0hd7lg26Lwblj8MNJAYaGAncb0BXEkuj2ALbLeZHc9RSIm3XIZZ7GuqIR
	/pcCs7nc+qMQQDbMP4H1Q35lb53Jps66Ix6D1Z5B4+ZnKRnS4jEgUPnPTrH0nwfFSo3lYFROb5D
	Ug=
X-Google-Smtp-Source: AGHT+IE+BBuRJWFMkcwnGg3hQNktGiojs3uMjl2rk4qI3GbMWpt0xDgbiFgGoJ/XEGTvndeIKhxKJw==
X-Received: by 2002:a5d:4584:0:b0:430:96bd:411b with SMTP id ffacd0b85a97d-43096bd49cbmr18053170f8f.58.1766068327313;
        Thu, 18 Dec 2025 06:32:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8d70:28a3:e75d:30bf? ([2001:8b0:aba:5f3c:8d70:28a3:e75d:30bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432449ade52sm5130758f8f.41.2025.12.18.06.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 06:32:06 -0800 (PST)
Message-ID: <2def11ae78c43a8a08bda13f8c063f7a71a0ce5b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] python3-pyzstd: import 0.17.0 from
 meta-python
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: koen.kooi@oss.qualcomm.com, Mathieu Dubois-Briand
	 <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 18 Dec 2025 14:32:06 +0000
In-Reply-To: <6154845B-2C91-4FC4-A48A-CB06A5461C90@oss.qualcomm.com>
References: <20251217093409.914045-1-koen.kooi@oss.qualcomm.com>
	 <20251217093409.914045-2-koen.kooi@oss.qualcomm.com>
	 <DF0KOAGYU1ZY.399MUHSJMJ1BP@bootlin.com>
	 <F86DDF1B-F439-4E6C-9335-8C8EA388F862@oss.qualcomm.com>
	 <DF0LZKG2H116.1SNE235TEG058@bootlin.com>
	 <6154845B-2C91-4FC4-A48A-CB06A5461C90@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 14:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228127

On Thu, 2025-12-18 at 13:14 +0100, Koen Kooi via lists.openembedded.org wro=
te:
>=20
>=20
> > Op 17 dec 2025, om 16:49 heeft Mathieu Dubois-Briand <mathieu.dubois-br=
iand@bootlin.com> het volgende geschreven:
> >=20
> > On Wed Dec 17, 2025 at 4:09 PM CET, Koen Kooi wrote:
> > >=20
> > >=20
> > > > Op 17 dec 2025, om 15:47 heeft Mathieu Dubois-Briand <mathieu.duboi=
s-briand@bootlin.com> het volgende geschreven:
> > > >=20
> > > > On Wed Dec 17, 2025 at 10:34 AM CET, Koen Kooi via lists.openembedd=
ed.org wrote:
> > > > > From the upstream website:
> > > > > Pyzstd module provides classes and functions for compressing and
> > > > > decompressing data, using Facebook's Zstandard (or zstd as short =
name)
> > > > > algorithm.
> > > > >=20
> > > > > This recipe is being moved over for systemd 258.x, the 'ukify' to=
ol
> > > > > depends on this.
> > > > >=20
> > > > > Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
> > > > > ---
> > > >=20
> > > > Hi Koen,
> > > >=20
> > > > Thanks for your patch.
> > > >=20
> > > > It look like this is failing on the autobuilder in various
> > > > configurations, probably only with poky-altcfg:
> > > >=20
> > > > ERROR: python3-pyzstd-0.17.0-r0 do_package_qa: Fatal QA errors were=
 found, failing task.
> > > > ...
> > > > ERROR: python3-pyzstd-0.17.0-r0 do_package_qa: QA Issue: supports p=
tests but is not included in oe-core's ptest-packagelists.inc [missing-ptes=
t]
> > > >=20
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2=
848
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/=
2837
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/=
2894
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/=
2848
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/=
2829
> > > >=20
> > > > Can you have a look at this issue?
> > >=20
> > > Sure, but I have no way of testing that patch :) V3 is on its way.
> > >=20
> >=20
> > This is a build-time issue, so I suspect you should be able to reproduc=
e
> > it with:
> > DISTRO=3Dpoky-altcfg bitbake python3-pyzstd
>=20
> builder@8458df25789f:/work/build$ DISTRO=3Dpoky-altcfg bitbake python3-py=
zstd
> ERROR:=C2=A0 OE-core's config sanity checker detected a potential misconf=
iguration.
> =C2=A0=C2=A0=C2=A0 Either fix the cause of this error or at your own risk=
 disable the checker (see sanity.conf).
> =C2=A0=C2=A0=C2=A0 Following is the list of potential problems / advisori=
es:
>=20
> =C2=A0=C2=A0=C2=A0 DISTRO 'poky-altcfg' not found. Please set a valid DIS=
TRO in your local.conf

Ok, very good. Perhaps you could test with:

DISTRO_FEATURES +=3D "ptest"

or maybe with :append instead of +=3D , depending on your setup, which
should reproduce the original issue.

Cheers,

Richard


