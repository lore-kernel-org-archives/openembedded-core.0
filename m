Return-Path: <jatedev@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0A49A702AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 01:01:04 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id k15so4516134qaq.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jul 2014 18:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8s9yZtKu+7EC/j4EK/WASP5RR6rgK6ftBXe++UFqWN4=;
	b=WiAvfAslANH1e0O/v6uf9NK6AEzN147UitzhEjNmKgT2GLVLSV4NaxYshZG7/Ps2JO
	pblio0EwoGZPjGtASKDchmein+hPalNXvOo34tJV1CmLTtjEN10ntn9Cuqk/IAgWjoMb
	Hg3KmxKXvCLLu43/119PR30mrGlXMeehcUppUUiZiIr80wJO2gYc7Xr7Lkk5f7VAu/iA
	37SkQX7c6bB4oJVgTbrKXzL/lfpT2fm4dCzKU7zcbJc3akskiDKF/E3o+z1AZjxH0eok
	zzUW328FxHX9zlwuKd48O2o5sunIiMN4kzHF+2wHz1BMx8Fo2Cb47EFNi3AOtzTDZRiK
	+j2A==
MIME-Version: 1.0
X-Received: by 10.224.129.201 with SMTP id p9mr36199526qas.75.1405904465920;
	Sun, 20 Jul 2014 18:01:05 -0700 (PDT)
Received: by 10.140.34.76 with HTTP; Sun, 20 Jul 2014 18:01:05 -0700 (PDT)
In-Reply-To: <lylhrviyfo.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1405349203-32702-1-git-send-email-jatedev@gmail.com>
	<lyzjgchs81.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAPphmgYUX828A=6SayztArEdU9L-=Hhfkw2w3mRw1ka_AmCWsw@mail.gmail.com>
	<lylhrviyfo.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Sun, 20 Jul 2014 21:01:05 -0400
Message-ID: <CAPphmgZhVbj-Fb+XOL3p4bUVa_T0=AZnYuxetWPYqV5ZeUjNww@mail.gmail.com>
From: Jate S <jatedev@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python2: Add PACKAGECONFIG for tkinter to support tk from meta-oe
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
X-List-Received-Date: Mon, 21 Jul 2014 01:01:11 -0000
Content-Type: text/plain; charset=UTF-8

The presence of the tk library determines whether python's compile
task will build tkinter. Then the presence of python-tkinter in
IMAGE_INSTALL will then determine whether it is installed.

In the absence of tk provided by meta-oe, the python recipe will
install an empty python-tkinter package.

I cannot think of a cleaner way to do this right now. Ideally the
package python-tkinter could trigger a python DEPENDS on tk...


Martin, you originally suggested the PACKAGECONFIG. Do you have any
further thoughts on this?

- Jate S.


On Mon, Jul 14, 2014 at 2:32 PM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Jate S <jatedev@gmail.com> writes:
>
>> Python 2.7.x does not use an explicit configure option for tk support.
>> Instead, it tries to detect the tk and tcl libraries before compiling
>> python-tkinter.
>
> Your patch does not solve the issue of non-deterministic builds.  When
> tk was added by some other way, python will get tkinter support although
> PACKAGECONFIG was not set.
>
> An idea to make build deterministic might be patching of detect_modules()
> in setup.py to add disabled modules to 'missing'.  E.g.
>
> |             missing.append('_tkinter')
> |
> |+        missing.extend(os.environ('OE_HACK_MISSING').split())
> |         return missing
>
> Probably there are better/cleaner ways but I am not familar with python
> distutils.
>
>
> Enrico

