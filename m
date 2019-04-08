Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id D47507D573
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 21:04:37 +0000 (UTC)
Received: by mail-it1-f169.google.com with SMTP id x132so1491096itf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 14:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ahNHK/Qs5YOJ8xSNS+BJrC8l4zycZmLAQixM8M2n1C4=;
	b=landZtqrbQTxqNXfqz2xyU220X7ubZAxokp0CLbrO+6GJU3UJbGV4gZMhQthbCnFN5
	cIZ//I2SO1rhLfmM69NqPKDNjgxwSho5KD19D2x1gsObbE/bRbXerKKssyOaYD8vvxtI
	IufTSp6OEvc69Y35m71ck7mA8nWccUCWRswvthbwra/ErkYZJTm3I4uNZWae8v/deJ/s
	3cynbFypj5s5Fq66HDCQC9+CHXn0fY+sKu14sh5maFPdcrBgQP25tidvsXA2W6NY3Pcc
	NrRqutn3h06pl0YxsyXe3Soc8mC3NJz1pUoJYAiKjGyJ8AkGGAqhpIFgNlJwFPT4f5Rx
	yeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ahNHK/Qs5YOJ8xSNS+BJrC8l4zycZmLAQixM8M2n1C4=;
	b=G+xNW/xNoRCVX09PdEaK1yKslYmZV1REEZjTqKRZ53+CpjYqvM+Sk5rgOtY+6DJZEi
	3CHGH+XIT1s8CKJbetEcYjVT/8Ja5/kdfwdoCrAGuoXgHpPw2UD2OhVbYJkCbJe4XJ3I
	2nlAy+AGaGhaSYROwbzdb3bXNXCdSquPGWcRqVFx/0GMouLrvvSWClmWjxg3vaO2NYz8
	mSefIzHPK0sem54yZgSKh2FCFIOEOwf8QWN1YoIRuman1u3IJJjA4gbglv/bRkB1i1TJ
	w0E42QG4OYiXmeLoj8z67XZRZv51xobksfYO8eNMV3IEx/a90y3xYmrzmfTTFUZSd0ue
	e4lA==
X-Gm-Message-State: APjAAAUWfgiNFOHnfSrxyiemfV/XkEThXMDI9lg4f5jKRcpTZnVc+OOh
	QFyuSHUS+aa+pYhSfkEFJSHzOFresJsciRxPdCHMOg==
X-Google-Smtp-Source: APXvYqxQVZ9m8Rtjxb88lesm6YB24p5CN70H/F8yodbFfQAU7NTqtVUu0Bg5zaPFiyTT/hXxNZKpEA7bBt32ur/9mz0=
X-Received: by 2002:a24:1749:: with SMTP id 70mr22426193ith.50.1554757478777; 
	Mon, 08 Apr 2019 14:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190408205558.11994-1-douglas.royds@taitradio.com>
In-Reply-To: <20190408205558.11994-1-douglas.royds@taitradio.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Apr 2019 22:04:27 +0100
Message-ID: <CAJTo0LZSDcbaqTx=6gi3SuYDC-r3F_iVSBXLMYdjRaQGsQ1QuA@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: Nikhil Pal Singh <nikhilpal.singh@taitradio.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Support Eclipse and other cmake generators
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
X-List-Received-Date: Mon, 08 Apr 2019 21:04:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Apr 2019 at 21:56, Douglas Royds <douglas.royds@taitradio.com> wrote:
>  python() {
>      generator = d.getVar("OECMAKE_GENERATOR")
> -    if generator == "Unix Makefiles":
> -        args = "-G 'Unix Makefiles' -DCMAKE_MAKE_PROGRAM=" + d.getVar("MAKE")
> +    if "Unix Makefiles" in generator:
> +        args = "-G '" + generator +  "' -DCMAKE_MAKE_PROGRAM=" + d.getVar("MAKE")

So are there other generators such as "Unix Makefiles - Something
Else" that needs to trigger this code path?  A real world example
would be useful.

>      else:
>          bb.fatal("Unknown CMake Generator %s" % generator)

Because obviously at this point, arbitrary generators are very much
not supported yet.

Ross

