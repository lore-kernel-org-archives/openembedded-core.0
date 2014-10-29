Return-Path: <paul.betafive@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7744F65C87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 13:06:22 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id f51so2159478qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 06:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=qUu/bg6TV1LqjR/dH8/d5PLDvbgwMK16WQW/L10p4aI=;
	b=trWODvQw29OJ46TQxnoGiyXV/HbXRDf3lIycG3SBleq1e1qxLUqGR2fJV6DJbd5RPl
	hBajB2jgR2shpS00zkXCA4R47TB5N7Rhs4CJB5XsQ/m/i7Kysjz6VNhP9OEFdc8M1bBv
	gEocI9O+vkUJohV2I08yY9WflWbIDKF9F5EX+AGrQ2TbKVyE1lg+N+dAGQrprprCJ9+f
	5LRM+GWGw/Ya5mG7Jqgn+hfVbOGFBRoFs1d7B1TdJXQ7eD2Czv9Ss0EQaq5R/CbBUCon
	Ba9mzZx0JCBNd7wbxRlcU7bv0sBvfXhtk7X4RY/kZR9K+mdcdG7nyK0HH8vtf/GR93AW
	3djw==
X-Received: by 10.140.23.198 with SMTP id 64mr14728153qgp.62.1414587982017;
	Wed, 29 Oct 2014 06:06:22 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Wed, 29 Oct 2014 06:05:41 -0700 (PDT)
In-Reply-To: <1414581527-5448-2-git-send-email-martin@hundeboll.net>
References: <1414581527-5448-1-git-send-email-martin@hundeboll.net>
	<1414581527-5448-2-git-send-email-martin@hundeboll.net>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 29 Oct 2014 13:05:41 +0000
X-Google-Sender-Auth: x2w-YkLJdimkaoAhTa3DqbF4Iz8
Message-ID: <CANyK_8d3=cmQ0aDxwDtzGZcqHvaL1fhasnS2kimBia0WhJgSuw@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@hundeboll.net>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] scripts: use python2 explicitly in shebangs
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
X-List-Received-Date: Wed, 29 Oct 2014 13:06:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29 October 2014 11:18, Martin Hundeb=C3=B8ll <martin@hundeboll.net> wrot=
e:
> As distributions start moving to python3, scripts should explicity
> request python2 in the shebang. This patch changes all occurences of
>     #!/usr/bin/python and #!/usr/bin/env python
> to
>     #!/usr/bin/env python2
>

<snip lots>

> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index bba6f8f..b514aa5 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -33,7 +33,7 @@ fi
>  # sanity.bbclass because bitbake's source code doesn't even pass
>  # parsing stage when used with python v3, so we catch it here so we
>  # can offer a meaningful error message.
> -py_v3_check=3D`/usr/bin/env python --version 2>&1 | grep "Python 3"`
> +py_v3_check=3D`/usr/bin/env python2 --version 2>&1 | grep "Python 3"`
>  if [ "$py_v3_check" !=3D "" ]; then
>         echo >&2 "Bitbake is not compatible with python v3"
>         echo >&2 "Please set up python v2 as your default python interpre=
ter"
> @@ -43,7 +43,7 @@ fi
>  # Similarly, we now have code that doesn't parse correctly with older
>  # versions of Python, and rather than fixing that and being eternally
>  # vigilant for any other new feature use, just check the version here.
> -py_v26_check=3D`python -c 'import sys; print sys.version_info >=3D (2,7,=
3)'`
> +py_v26_check=3D`python2 -c 'import sys; print sys.version_info >=3D (2,7=
,3)'`
>  if [ "$py_v26_check" !=3D "True" ]; then
>         echo >&2 "BitBake requires Python 2.7.3 or later"
>         return 1

This is the section of shell script which checks the python version
when you run 'oe-init-build-env'. If you want to change the way python
is ran I'd start by looking at this code. If this script could
automatically try 'python2' if 'python' is found to be Python 3, and
ensure the correct interpreter is used in all commands that run after
the environment is setup that would be fantastic. It'd probably be a
mess to implement though.

The change as it currently stands looks confusing as py_v3_check is
set by running python2.

I used to use a virtualenv to temporarily set Python 2 as the default
for the shell in which I ran bitbake commands. That was a while ago
though, all my current builds are running on Ubuntu 12.04/14.04 server
instances which I access via ssh from my Arch Linux box.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

