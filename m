Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1Ud0av-0007P8-A9
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 18:00:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4GFfTLs021654
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 May 2013 08:41:29 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 16 May 2013 08:41:29 -0700
Message-ID: <5194FE20.6000505@windriver.com>
Date: Thu, 16 May 2013 11:41:20 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Koen Martens <gmc@sonologic.nl>
References: <20130516152515.GB25740@monk.dh.sono>
In-Reply-To: <20130516152515.GB25740@monk.dh.sono>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: adding kernel headers to sysroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 16:00:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-05-16 11:25 AM, Koen Martens wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi all,
>
> I was asking this question on the irc channel earlier today, and bluelightning
> suggested I pose this question to this mailing list (with certain key people
> in cc).
>
> I have added a kernel header file to the linux kernel for my project, that
> exposes a public API for new kernel functionality I have implemented. This
> header file is needed to compile certain user-space programs. I have been
> trying to get this include file in the sysroot used to compile the user-
> space programs (as well as in the SDK i build for the project).
>
> However, I haven't managed to find out how to accomplish this. I tried
> creating a custom tarball from my own branch of the linux kernel, and use
> that in libc-kernel-headers, but alas that was not the trick.
>
> Can anyone point me in the right direction of how to accomplish this??

Aha! I can definitely point you in the right direction for this, it's 
something
that I'm working on *right* now. So the timing is good.

You definitely do not want to use libc headers, it is for just that,
libc. Modifying it is going to cause you all sorts of pain with respect
to rebuilds and consistency issues.

Since this is a new header (and not a modification of an existing one),
you are on better footing than you'd otherwise be (i.e. modifying
an existing header should be avoided at nearly all costs).

You should be able to see your kernel header file in the kernel source
that is part of the sysroot, just not in the common include locations.
is this the case for you ? Are you having build errors at the moment ?
(i.e. is this working at all ?).

There are a few approaches that I've taken, others can chime in if I
miss something obvious:

  - point your application at the STAGING_KERNEL_DIR and include the
    header from there. You are already coupled to the kernel, since
    you need this header, so it isn't as evil as it seems. This will
    also get you SDK support.

  - Install the header file to another location in the sysroot and
    include it from there. You can do this via an append to the
    kernel install. Assuming you don't collide with existing headers,
    you could use this to install into a standard location as well,
    but things start to get a bit more risk. You can also arrange

How often does the header file change ? If it really is static there's
another option, and that is to capture the header in the applications
themselves and simply use it that way. iptables, and other user application
have done this in the past, and will do it again in the future.

Cheers,

Bruce


>
> Thanks in advance,
>
> Koen Martens
>
> - --
> https://ohm2013.org/            - outdoor hacker conference, August 2013, NL
> http://www.sonologic.nl/        - hosting and DBA
> http://koenmartens.nl/          - curriculum vitae
> https://www.revspace.nl/        - hackerspace in Den Haag, NL
> http://signal.hackerspaces.org/ - hackerspace radio
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.12 (GNU/Linux)
>
> iEYEARECAAYFAlGU+lsACgkQktDgRrkFPpYH7QCfZROAcMkUVN+BiesoUtxBBzbt
> 5OQAoJBjIWbjmNf+wVvASyGwpcYeI6UH
> =HHSa
> -----END PGP SIGNATURE-----
>



