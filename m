Return-Path: <nwwinters@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5A79A71E5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 18:23:36 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id l202-v6so4565157oig.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 11:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=/JEf8PnUbeYGWGXARV0XHedpu5W9VV6VgVoJJqN37Ps=;
	b=gspxO7rdIBWA0yxa1dtaWyD42WbktmxEkGaQ6i3bFEhZM3ilqQbuFHn5Qu1Oh50VyT
	JjtoYffL5TqPxq/2L6ZsClbYglpUAKc+v+Xz+ONslxm8M4HO0PHOsicdNpo6Z3anAX7v
	y/ovHinMRpAEkZYJVQKUFjj889nCHZE/pg6p0803s8GHqj3F9MmidjiAI67FIs7Bpuxv
	45XfDmgcKlTidNbrTuEF9FdD7fFlvVBXwsPRS7y1nRY5lrlHLOVfeUZL8QPybY3/jhLg
	sG8IZ15xxSdqZbC+7pszJTIkXQCKUhUBah+nf2i4rN9UbePNBRZEmOjutJojbnf1+bWf
	6FnQ==
X-Gm-Message-State: APzg51B6LZ43cdq9Zws7JRRBT0ltm08YUQ9kSYzrmUmRGEohJBp82iQG
	pSzTqpxs2JAuOXDZWmkxyDiLI8pb
X-Google-Smtp-Source: ANB0VdY/KSP8+kOlmkCDW1iyXyVOE6aigTTStzGBJp5En4F661RVJOBBMfYNInrqLKtUexGNlP9KEQ==
X-Received: by 2002:aca:5155:: with SMTP id
	f82-v6mr2009348oib.272.1535480617082; 
	Tue, 28 Aug 2018 11:23:37 -0700 (PDT)
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com.
	[209.85.218.49]) by smtp.gmail.com with ESMTPSA id
	a8-v6sm853172oia.24.2018.08.28.11.23.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 11:23:36 -0700 (PDT)
Received: by mail-oi0-f49.google.com with SMTP id c190-v6so4579783oig.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 11:23:36 -0700 (PDT)
X-Received: by 2002:aca:ba83:: with SMTP id
	k125-v6mr2032889oif.226.1535480616219; 
	Tue, 28 Aug 2018 11:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <CA+FvCj6uCS7iSwpyOnNx0Q-A7iXfzTg_NtcH98ihmsfLDGkn9Q@mail.gmail.com>
	<CANNYZj-Ga4t5WW+bSZ+eqXEcUuR_G-5QNfzAta40oEgAf+paqg@mail.gmail.com>
	<CA+FvCj77pcY6BQ4ecNc6a5NPFWeKjFs02Kkn4y4+BPaSBuuqAw@mail.gmail.com>
In-Reply-To: <CA+FvCj77pcY6BQ4ecNc6a5NPFWeKjFs02Kkn4y4+BPaSBuuqAw@mail.gmail.com>
From: Nick Winters <nick@wintersteam.org>
Date: Tue, 28 Aug 2018 11:23:24 -0700
X-Gmail-Original-Message-ID: <CA+FvCj70xrqZu2aTc=NRJALN-3qkfKb6aRJWyd7x8NoNBAcv7Q@mail.gmail.com>
Message-ID: <CA+FvCj70xrqZu2aTc=NRJALN-3qkfKb6aRJWyd7x8NoNBAcv7Q@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Troubleshooting sstate cache
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
X-List-Received-Date: Tue, 28 Aug 2018 18:23:36 -0000
Content-Type: multipart/alternative; boundary="000000000000b07b36057482f080"

--000000000000b07b36057482f080
Content-Type: text/plain; charset="UTF-8"

The problem may be a result of executables being built with absolute paths
to their shared libraries. When I do the following:

ldd -v
./tmp/sysroots/x86_64-linux/usr/bin/powerpc-poky-linux/powerpc-poky-linux-ar

I see the Library runpath for a shared library is an absolute path to the
original Jenkins job that was building the sstate cache, not the current
one that I am building. How do I configure Yocto not to use absolute paths
to the shared libraries?

Nick

--000000000000b07b36057482f080
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The problem may be a result of executables being buil=
t with absolute paths to their shared libraries. When I do the following:</=
div><div><br></div>ldd -v ./tmp/sysroots/x86_64-linux/usr/bin/powerpc-poky-=
linux/powerpc-poky-linux-ar<div><br></div><div>I see the Library runpath fo=
r a shared library is an absolute path to the original Jenkins job that was=
 building the sstate cache, not the current one that I am building. How do =
I configure Yocto not to use absolute paths to the shared libraries?</div><=
div><br></div><div>Nick</div></div>

--000000000000b07b36057482f080--
