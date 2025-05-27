Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B817DC54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 16:16:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.56331.1748362609719041441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 09:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yzxid87G;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so33415105e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 09:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748362607; x=1748967407; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PFYq/kBAMMna8Aq6uWmEUwS85AoaTJQz+d8/9HWIxk=;
        b=Yzxid87GRA8y/zcgDof4DPPyF2cYEHeVwGlPjM5JrUEWPP58Vo3YZypfFpdnmtf2Jv
         iypse2c/PySCywDmhcoexM6SwGnhXA8zo1DoFq+ZbGSblVWlfLXiJOFBtxGHuHFSNOkf
         6N/f5Ke/Bw12k0tdex+vHPb9JkrrnyHnj+gfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748362607; x=1748967407;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2PFYq/kBAMMna8Aq6uWmEUwS85AoaTJQz+d8/9HWIxk=;
        b=tF3D5NL6+Ur3BxuJs45k/LcT9DuodwH47etJLzydMoKVebtVDA44f/cJQEKyWxTf7I
         0cK/pXwQF/udAskR0xTm4Fh+CB0jOWWE9rJdUw/P13RC5sagDZ+zcj5Uyc6tC0nD0t9M
         eT4EO0RdcusgkuRlscWRYn7dbGsT5dBeQ9NIiHKenDZ9PeXygUXIoffczuK0WInuCyoG
         0NcizQOZb1ZP45If5HViBYijyjaGuLcWJcmo167Lhd4px5dyMTOjqqpJACTgw+oWvZrr
         3MxrTLQbg3bTspAOtlxRzcj+QqzzQyVDmUKe2+tG/vBr7jaXwf7OL+YdxJG4i0r4Dzh8
         ptZg==
X-Forwarded-Encrypted: i=1; AJvYcCXI0GGK1nKVPfFWx4vjb56R8HLhEgMkHoMj2eB4/e8IJH6lNfqlx2bbo3hnx0imgy754qx0HtnwUObnIrmRDI51nA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyIRovLRjcSRblYqvAm6+jC8Jn9hErwIjA2WLgnY0soGZoDL49J
	9l4nyTealGqYTRzdif96VDO6Y/2Il4dlgnpjevS+A4SrzXxtPCNkKYh8a//8WaztLgA=
X-Gm-Gg: ASbGnctciEevD3eK8LB94Z+OyHdPba8hvoOQCCaHR8I0AAk9MV2MgWomLzDJRY80VKs
	XFJ9qlg2uW9KpXdUnUsByFVchiXs+GdHXp74o4myfvDPpq5Pt3LkvI9TaklCtSMMXYc9jdWxXI0
	Zb8JelMByC08d5L9sRda/QAEx09jz2USYprJWhhh9u+8Ympld08EMudQuOP/ltGiwGUpqIO5MGw
	zek2zkJ/t3jIxN/41KVwTnrY2RNhfmdIeAfNW0Wnf25VhMXSZMPuFmK/9uuDY954e7YU3zqJwn0
	+Zyi9fC0o2jc9kKeI4+Be3bOl8g6oLIMclL10OZRk14eBbUiITBuAuGJ7+GLjSx9QcH6o29F4pY
	mHsZRR/61nZWtC/g1kTCK7hhM/bgDvji7Qxx6JjWS
X-Google-Smtp-Source: AGHT+IGAlxC11PA25NuDcxpHvX0Ze/WsiEGfskTf5pMWlmkhoqiR/Um6YZaqdb41giIdcMqXc3ZJBg==
X-Received: by 2002:a05:6000:4284:b0:391:4674:b136 with SMTP id ffacd0b85a97d-3a4cb462cffmr9848377f8f.29.1748362607429;
        Tue, 27 May 2025 09:16:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6923:f643:8186:933b? ([2001:8b0:aba:5f3c:6923:f643:8186:933b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d37498e8sm8565766f8f.16.2025.05.27.09.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 09:16:46 -0700 (PDT)
Message-ID: <2c4827a29e3d68e04723c994e47af13f667d77a5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 1/3] package: change location of
 debugsources to PKGDESTWORK
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: daniel.turull@ericsson.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 27 May 2025 17:16:45 +0100
In-Reply-To: <PR3PR07MB66667C5C1EDCC3A2C2C777758A64A@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250521134400.1733473-1-daniel.turull@ericsson.com>
		 <20250521134400.1733473-2-daniel.turull@ericsson.com>
	 <5b20d775f1e183305d21e1daee8338311e9cb141.camel@linuxfoundation.org>
	 <PR3PR07MB66667C5C1EDCC3A2C2C777758A64A@PR3PR07MB6666.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 16:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217315

On Tue, 2025-05-27 at 15:06 +0000, Daniel Turull via lists.openembedded.org=
 wrote:
> Thanks Richard,
> Yes, I'm exposing the file to be able to extract the source code used
> in the other patches in the series. Since the file was there, I
> though it will be minimal changes on the current code and less
> overhead creating new tasks to extract the information that is
> already available.

Right, I totally understand why you've done this and that is fine. In
order to properly review and get this merged, we just need to consider
the other issues and properly document it. It does need to be a
conscious decision to put the data into pkgdata (and make sure we get
the format right).

> Will it make more sense to create a new file under
> "${PKGDESTWORK}/debugsources/ with the correct format and the first
> filtering done, more aligned with existing files, since the current
> file is use a temporal placeholder? Or something in the line of:
> binary_file: src1 src2 src3 ...

It is null delimited as some filenames can have spaces in. I know there
has been talk of changing our existing file format to be something less
problematic like json, the extended data is already in json. I'd
probably suggest using json for this given it is natively supported by
python.

The above format (per binary file), in json would probably make sense
though.

> I can also create a better explanation in thee commit message, in the lin=
es of:
> The information provided in debugsource can be use to have more
> detailed information on the files used during the compilation and
> improve quality on the SPDX.
>=20
> I'll try to measure the increase on the sstate.

I don't expect this to be a huge issue but some kind of number would be
useful. I'd note we did compress the extended data using zstd, just to
improve the IO impact of the files. We could consider that here too and
probably reuse that code.

Cheers,

Richard

