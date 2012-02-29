Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S2kYP-00067e-WD
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 15:30:54 +0100
Received: by obqv19 with SMTP id v19so2411959obq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 06:22:24 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.182.1.104 as permitted sender) client-ip=10.182.1.104; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.182.1.104 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.182.1.104])
	by 10.182.1.104 with SMTP id 8mr208011obl.19.1330525344928 (num_hops =
	1); Wed, 29 Feb 2012 06:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=745OfSPoDIB1HmL30EYAenYP8BtaYPkYTM56iDgW0oY=;
	b=bU3nyhPDgyz1S+SOqf5813W1RNkB1/WMqEKMMaeGGWqBH2o5kWpgWPKqaZSkCzm/s4
	di2LXvMf2zHPUvqjdVG50e30oJv+WGyBYcFv7h5qJTs2SmbbUz/VsdtJwD6Rtb5nWZTZ
	KgvderuiXYzfDFVSBLPLZol5UaH/LGKK6mFSc=
MIME-Version: 1.0
Received: by 10.182.1.104 with SMTP id 8mr181171obl.19.1330525344856; Wed, 29
	Feb 2012 06:22:24 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Wed, 29 Feb 2012 06:22:24 -0800 (PST)
In-Reply-To: <20120229084544.GH21882@ibawizard.net>
References: <CAGDS+nmNeyC3P+x+mk0g-qOKhkJ5pMNhX-ckBXr4F273poq2yw@mail.gmail.com>
	<4F4DB40B.6000300@windriver.com>
	<20120229084544.GH21882@ibawizard.net>
Date: Wed, 29 Feb 2012 06:22:24 -0800
Message-ID: <CAGDS+nnW6QBngHLVVn7AS=HU_DAdc6JQr9k=mrpu9mx=dLRLOQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: psuedo-native strangeness on 64 bit build machine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Feb 2012 14:30:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 29, 2012 at 12:45 AM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
>> On 2/28/12 10:35 PM, Steve Sakoman wrote:
>>> I did a clean build on an Ubuntu 64 bit build machine a couple of days
>>> ago with no issues.
>
> I can confirm same situation here.
>
>>> After a pull of today I did an image build for an OMAP3 machine and
>>> encountered an issue with psuedo-native.
>
> Just pseudo? What's your setup, I mean layers etc. Are you using Angstrom=
's
> setup-scripts?

For a simple image, just pseudo-native.  As to layers, meta,
meta-yocto, meta-oe and meta-gnome from meta-openembedded, and my own
bsp layer.

I am not using Angstrom or the Angstrom setup scripts.

>>> Has anyone else been successful building on 64 bit machines?
>
> What version of Ubuntu is that? I'm on 12.04.

I am on 10.04 64 bit server edition with ia32-libs package installed.
The build machine is quad core.

>> I'm building pseudo on 64-bit machines right now, no problem.
>
> I think, that it's some problem with parallel make. If I clean the stamps=
 and
> tmp dir of pseudo-native manually (-c cleanall doesn't work actually, bec=
ause
> pseudo-native is missing, chicken-egg problem? :)) and set PARALLEL_MAKE=
=3D1
> NUM_THREADS=3D-j1, then it builds just fine.

If so, it is only a parallel make issue on 64 bit -- my build on an 8
core desktop 10.04 setup works flawlessly.

> There must have been something introduced in the bitbake or the layers
> recently, since I was able to build Angstrom/systemd-image/beagleboard fr=
om
> scratch 3 weeks ago with the same settings (PARALLEL_MAKE=3D4 NUM_THREADS=
=3D-j4").
> Now it's impossible to finish the build, the most noticeable failure is g=
cc,
> which fails for me in patching task due to the parallel build settings.
> Changing the parallel settings back to 1 helps here also.

I just tried building gcc and can confirm that it fails for me on the
64 bit build machine.

Steve


