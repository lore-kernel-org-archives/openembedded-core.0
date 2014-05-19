Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (unknown [209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id D363D6028A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 09:46:32 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id q107so8420191qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 02:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=F2ywdsW5YspqC/vZGqwSpx4XUXMD6VqI5G1KAS6ceqA=;
	b=lNt9quKaG3S/99rnTmmgTptwrgXRPF9mxjgyJdN1GJpgr0l33hMIG6YjuvHggj77dy
	PbrQpyCfJUsewqx2JSm2nJrJNftobJZ3veabNboUEzTPO2FiLWkGbq3AkIWKdhiDrV8u
	MsG5oIbKaeTH/2TdV92a9Lhlw/kVVWVWfe1wiMiYlGru1Qdh9Fu9mQZO7/dKfpRr8/VE
	ZlSpqgGs19d1/rpTaVbLJrxMc/T+TQ9cTQqqS7Cphw0ViIKHYtDUuCqJj33VYQ1FAAxs
	Iwwu85O9c29TJWKPijUZhPPNGutC5zxjWDgYi13HqVKmORq80cz4+XG1bIwKxm7Uy8l+
	frcA==
X-Gm-Message-State: ALoCoQmG3p4euIVWY67sNXkPM2K58pEdkttM0Nn61ieHdsTNLxxDe2rcH8c+42aeh5jhSwDb6+7+
X-Received: by 10.140.48.161 with SMTP id o30mr45972284qga.68.1400492793340;
	Mon, 19 May 2014 02:46:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Mon, 19 May 2014 02:46:13 -0700 (PDT)
In-Reply-To: <003001cf7311$13ceec40$3b6cc4c0$@com>
References: <1400226321-5201-1-git-send-email-b40527@freescale.com>
	<CAJTo0Lar8Hbc1Gsa3k631M697ZHDOufJ1k7ugTUU=AWXaHjMAQ@mail.gmail.com>
	<000501cf70f0$2f2d17a0$8d8746e0$@com>
	<CAJTo0LavgOS4HyXLB2ur6PsH3yAaWW7SQf5qFcoz1yia_uMfqA@mail.gmail.com>
	<003001cf7311$13ceec40$3b6cc4c0$@com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 May 2014 10:46:13 +0100
Message-ID: <CAJTo0LbFKcv+riCYiNSJ0vOZHb4j6hi5hfLNpFya=pAkMyZ1kg@mail.gmail.com>
To: Zongchun YU <b40527@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Add api-doc class
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
X-List-Received-Date: Mon, 19 May 2014 09:46:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 May 2014 04:18, Zongchun YU <b40527@freescale.com> wrote:
>>It's not opt-in: once a recipe is using doxygen.bbclass then it has a bui=
ld dependency on doxygen-native and *will* generate documentation.
>>This is needless overhead if you don't intend to read the documentation.
>
> I think if you intend to read the documentation. Just inherit this class.=
 If not. there is no need to inherit this class.

So you're suggesting that if a user wants documentation generated they
should know what recipes they can add "inherit api-doc" to?

I'll repeat my proposal: every recipe that can generate doxygen
documentation inherits a doxygen class, and that class can look at a
distro-level variable along the likes of GENERATE_API_DOCS (which a
hypothetical non-stub gtk-doc class can also respect).

>>You can't assert that the documentation is solely generated on the shippe=
d files in the tarballs: what if some of the files are machine-generated?  =
Or if with for example DBus, the doxygen is generated?
>>I've nothing against a doxygen class and would like to also see a gtk-doc=
 class that isn't a stub, with a single distribution-level "generate API do=
cumentation" variable controlling them.  But the documentation has to be ge=
nerated at build time, and I think it's fair to assume that is a package ha=
s API documentation then "make" will build it, otherwise the method to buil=
d the documentation will be different for every package.
>>For example, DBus has a Doxyfile.in at the top of the source tree, so not=
 only does configure needs to run to generate a Doxyfile but that Doxyfile =
is written to ${B}, not ${S}.
>
> OK. You are right. What about configure task? Maybe we should adjust this=
 task before it. Doxyfile(or other name) is the file which will be used by =
doxygen. It is one part of source code to be maintain.

Give me ten minutes and I'll find a package that builds documentation
from a file generated at build time.

Are there really that many recipes that support doxygen but don't run
it themselves at build time? I'd have expected packages that can use
doxygen to generate the documentation at build time (using DBus as an
example, if it finds doxygen at configure time it will build
documentation).

Ross

