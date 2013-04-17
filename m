Received: from mail-lb0-f177.google.com ([209.85.217.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UST3w-0007N2-1C
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 16:10:16 +0200
Received: by mail-lb0-f177.google.com with SMTP id r10so1632028lbi.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 06:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=V1tBfmSOf0BoPw51zcbYLAJDgr2Df6vIxNm+Fd/L5lo=;
	b=aGRRzQw5LjUzHAjzIHmnEUbg/P12MPNAiREdWzi76fgdK9CCcv/wGqwutwJAbfbOTR
	sV79TtG1rqgLUNOtcDniSoIJplvBtuD6JAS/OXgcIwbCqdQqBxZWTc3b4KrFHogOF2Lq
	sakalf6Z7nQb9JMJMDCjqsrJrwR64Mbd488U/OTrE85Y4akzrcY3CPKAs/ohsw8VOJIl
	Il9gr/5hZ0YHTlF1if1M8B7gE0smyax/AlHzUpVOzYO1vB6Shtcgeyu4KwordDbpptA4
	yuQxF+KwoA8eC8puUVQJ39gjfD9k/LOQD4A5Ml0kvmN0WBZsALz5DLE/xOOXQux9nag3
	NLaQ==
MIME-Version: 1.0
X-Received: by 10.112.61.6 with SMTP id l6mr3630901lbr.57.1366206764205; Wed,
	17 Apr 2013 06:52:44 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Wed, 17 Apr 2013 06:52:44 -0700 (PDT)
In-Reply-To: <1366200612-22469-1-git-send-email-sergey_matyukevich@mentor.com>
References: <1366200612-22469-1-git-send-email-sergey_matyukevich@mentor.com>
Date: Wed, 17 Apr 2013 09:52:44 -0400
Message-ID: <CADkTA4Mrw50x2SXjwpug9QA-VgwpQZrAH6OpbU-F+SB2-G0uPw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Sergey Matyukevich <sergey_matyukevich@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] map_kernel_arch: x86 sub-architectures
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
X-List-Received-Date: Wed, 17 Apr 2013 14:10:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 17, 2013 at 8:10 AM, Sergey Matyukevich
<sergey_matyukevich@mentor.com> wrote:
> Suppose we build software for x86 targets on x86 build hosts. There are use-cases
> when it is not enough to specify x86 as a kernel architecture. It is necessary

What are the details of the use cases ? I've never run into this myself, and
almost no parts of the kernel build infrastructure differentiates between
x86 and x86_64 .. so I'm curious to know what is breaking.

Bruce

> to go one step further and to specify proper x86 sub-architecture (i386 or
> x86_64) of the target system.
>
> This patch modifies kernel-arch.bbclass in the following way:
>  - adds x86_64 to the list of valid architectures
>  - differentiates between i386 and x86_64 sub-architectures in map_kernel_arch
>
> Signed-off-by: Sergey Matyukevich <sergey_matyukevich@mentor.com>
> ---
>  meta/classes/kernel-arch.bbclass |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> index b3b71ba..3e29f45 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -5,7 +5,7 @@
>  #
>
>  valid_archs = "alpha cris ia64 \
> -               i386 x86 \
> +               i386 x86 x86_64 \
>                 m68knommu m68k ppc powerpc powerpc64 ppc64  \
>                 sparc sparc64 \
>                 arm aarch64 \
> @@ -20,7 +20,9 @@ def map_kernel_arch(a, d):
>
>      valid_archs = d.getVar('valid_archs', True).split()
>
> -    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
> +    if   re.match('athlon$', a):                return 'x86'
> +    elif re.match('i.86$', a):                  return 'i386'
> +    elif re.match('x86.64$', a):                return 'x86_64'
>      elif re.match('armeb$', a):                 return 'arm'
>      elif re.match('aarch64$', a):               return 'arm64'
>      elif re.match('mips(el|64|64el)$', a):      return 'mips'
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


