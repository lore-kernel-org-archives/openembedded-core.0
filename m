Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 33263739F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 01:32:49 +0000 (UTC)
Received: by pdjz10 with SMTP id z10so6719392pdj.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 18:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=0ux9vFMm9DSgw1/sthrIjgFwbDI7HdRGLuLFXmRiIN4=;
	b=Lc5J5vPatwPUISHckveLUJ16BgAnAm+7duS54tJZoAaKqWMqG6vtiDMjh0yZuEob0R
	qnvkiFhh6xI4rBezoejoXEHkRpADkmBolUv0g04QuECmqLwqSdBAPh3slU/UFgmAW6ku
	PXmIPhoLGcijnEyX4KxlIOruGI0xgMDWU/hnQZe6W47vSaNHMUYab9uKjVpJFl3hul/L
	rZK5RjEI9MQmYsjzT1x/X0iu5bg6bR9oaxbJMS7UqNwyPV4/iMk+fnjF0agkiq2qaEbl
	PpmgtgwPsYvZ6lXfemyYbh4pL3BCpAceR0dvT7BHNzr8vMWhJ9E/CBZI8aLiTry+x7+5
	QYtw==
X-Received: by 10.70.39.106 with SMTP id o10mr53752117pdk.88.1426037570798;
	Tue, 10 Mar 2015 18:32:50 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:7c40:73df:255f:421c?
	([2601:9:3580:84c:7c40:73df:255f:421c])
	by mx.google.com with ESMTPSA id o17sm3079883pdj.26.2015.03.10.18.32.49
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Mar 2015 18:32:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1426035387-18421-1-git-send-email-armccurdy@gmail.com>
Date: Tue, 10 Mar 2015 18:32:48 -0700
Message-Id: <0ED70D83-4980-495B-94B4-0A7A0E1DB1E5@gmail.com>
References: <CAJ86T=VcAgAVpk0EtU10miZzUjVb7RCqw1DQ0zgZHrktuyZ_DA@mail.gmail.com>
	<1426035387-18421-1-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] chrpath.bbclass: handle RUNPATH as well as RPATH
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
X-List-Received-Date: Wed, 11 Mar 2015 01:32:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 10, 2015, at 5:56 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Binaries linked with gold may contain a RUNPATH instead of an RPATH.
> Update chrpath.bbclass process_file_linux() to handle both cases.
>=20

This is ok. RPATH is deprecated, gold is forward looking by default, may =
be we should add --enable-new-dtags to binutils configuration in OE


> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/classes/chrpath.bbclass | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/chrpath.bbclass =
b/meta/classes/chrpath.bbclass
> index 77b1937..7a5d960 100644
> --- a/meta/classes/chrpath.bbclass
> +++ b/meta/classes/chrpath.bbclass
> @@ -10,6 +10,8 @@ def process_file_linux(cmd, fpath, rootdir, =
baseprefix, tmpdir, d):
>     if p.returncode !=3D 0:
>         return
>=20
> +    # Handle RUNPATH as well as RPATH
> +    err =3D err.replace("RUNPATH=3D","RPATH=3D")
>     # Throw away everything other than the rpath list
>     curr_rpath =3D err.partition("RPATH=3D")[2]
>     #bb.note("Current rpath for %s is %s" % (fpath, =
curr_rpath.strip()))
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


