Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2B07D65C5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 13:01:39 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id u12so19446425qth.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4JWGcjbKTzq7pEGIBNIP0vxpUreoGHNOSZc0KrCVA5I=;
	b=ok78kagqGxZ2vDR2rh9MBc2QNUqwNFEN836n2FBR9fD37EZllpzOS95dt9Oze7jmFM
	APWxQH9Gp2ZqtnOfydfYXxA7Tey2OMYsYwEKnOFAtXVHvrW0vgeWtdmEl5nSGiXnlgm2
	Xt/uu6Pp6peb65pn96UR2AvOi6P/GLi3F/yNFyWfqgil6c/YAakvAliB86lKAMmWc+u2
	yDWZzlhfUnCTIjlVL12lU4vYEGEM82hY22K5VwTKdzDUyd+YjJhCQno+z9aMrM3y7uEI
	4Lw0E8Yef4DCX/3/1rhWoj8QFNhJ7hLBV7k02+NZFy/JlnLbaHzH54b2nAYu1RD6ueI2
	AwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4JWGcjbKTzq7pEGIBNIP0vxpUreoGHNOSZc0KrCVA5I=;
	b=hFhgsDpqPdWnlYQMVoDJOPOBrfVU2uCcEQZ3X4ac70aJYTJjV7NMlL05nj3Rff2zBF
	mA7ODB2QE17aOeZg1rp8aRnnppyMw1rxBQSro1VXv/AI2Sg9ALJU9kWPR4/nFa89dzUa
	u8heJrOViRA5dTOBM0WIqjPGw1dhcow/I731Cn6pms2Vo5ND21+LdFgEtw6DA6YEiHtS
	wg8KINkM7yDJmyp40DDuUvmHCI291ZK5qwlOmL2EKJANr2NA6QRSPujua+KtTI+TTcJX
	g+Ar0t9yxowA9kbam7O7RHoLn/s0D+CsBe/SVI+GQgRgYyIGIACVayC65kiZbW7LH4Rr
	IW5w==
X-Gm-Message-State: AKS2vOxA0GbGl4uq2HX9n12zzOt1rW6ed2GqTj4SiVin9bh6bzqQ5OWL
	YQSLtT12fgVcxDooQYL9XMpGaYA2hAlY
X-Received: by 10.237.40.97 with SMTP id r88mr6684463qtd.27.1497531700551;
	Thu, 15 Jun 2017 06:01:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 06:01:20 -0700 (PDT)
In-Reply-To: <c984c6cb-a098-34c7-7265-7aa3831c3446@siemens.com>
References: <1497528519-19425-1-git-send-email-andrej.valek@siemens.com>
	<1497528519-19425-3-git-send-email-andrej.valek@siemens.com>
	<CAJTo0LajDiDoMXaUFzfPJ5Tb_YhTg5-xkN440hkCfhG5Ff7m7A@mail.gmail.com>
	<c984c6cb-a098-34c7-7265-7aa3831c3446@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 14:01:20 +0100
Message-ID: <CAJTo0LbRS371WhoRQZmuUAy4uRVXDEWsT=L18STman4DAwb8DA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/7] libxml2: Avoid reparsing and simplify control flow in xmlParseStartTag2
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
X-List-Received-Date: Thu, 15 Jun 2017 13:01:40 -0000
Content-Type: multipart/alternative; boundary="94eb2c068b340d2db50551ff4574"

--94eb2c068b340d2db50551ff4574
Content-Type: text/plain; charset="UTF-8"

On 15 June 2017 at 13:46, Andrej Valek <andrej.valek@siemens.com> wrote:

> https://github.com/openembedded/openembedded-core/pull/22
>

That will do, thanks.

Ross

--94eb2c068b340d2db50551ff4574
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 June 2017 at 13:46, Andrej Valek <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:andrej.valek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><a href=3D"https://gi=
thub.com/openembedded/openembedded-core/pull/22" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/<wbr>openembedded/openembedded-<wbr>core/pul=
l/22</a><br></blockquote></div><br>That will do, thanks.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c068b340d2db50551ff4574--
