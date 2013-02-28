Received: from mail-ia0-f170.google.com ([209.85.210.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UB5zp-0004K5-Qe
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 17:06:17 +0100
Received: by mail-ia0-f170.google.com with SMTP id k20so1669377iak.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 07:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=0KsOh+pBCtdchvqn6tjQfgfUQgdCrHEO761xnqpM7NY=;
	b=mO7HfXc6u3IMbzO8yektgEYCXlBuwz1NIceak+zs1TDIOFnHACOlpXo/dNnvxCqEZV
	q936xtE5NFw5eO9gC1fHcyy3U+x7nHzoVbvPtMjNvQ33cAFAa4Ahp/fwxR4mudh8WuG4
	7U0a88Dg7JyzADShYgDTywwUjkeFxfFaqCYnUL7i2mg/9PnslefnvQYe8aYQWUfnY/eW
	5ZZORy1mKYZA55rUrslH50+saPeS0JqCSHtye26xycNxgbVMe57GTpeT/NIhP5bWeHzP
	loFxrgl2wqlCKjkg8IPUw7L0up3fTh8HwaGWuc7BY6zQVTjLyBbDnRFV3cLZCUloKG0B
	LeUA==
X-Received: by 10.50.17.131 with SMTP id o3mr4067434igd.112.1362066591074;
	Thu, 28 Feb 2013 07:49:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Thu, 28 Feb 2013 07:49:21 -0800 (PST)
In-Reply-To: <CAJTo0LaFN=Q7kJQoJGTqrZamC=OT_pRD9qYrsO2854TWcG9Q0w@mail.gmail.com>
References: <cover.1362033854.git.hongxu.jia@windriver.com>
	<CAJTo0LaFN=Q7kJQoJGTqrZamC=OT_pRD9qYrsO2854TWcG9Q0w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2013 07:49:21 -0800
Message-ID: <CAMKF1spTzzKjh+6+z2vEjXApLVFPU8MS0NrXVxa9UA=viOj8mQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/2]fix native package compile error with gcc 4.3.4 on x86 host
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
X-List-Received-Date: Thu, 28 Feb 2013 16:06:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 28, 2013 at 3:06 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 28 February 2013 07:09, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Change from V2: as Khem Raj suggested, use `-march=native' to cause the
>> compiler to auto-detect the architecture of the build computer, if the
>> auto-detect is unsuccessful the option has no effect.
>
> What happens if you're in an environment where you're sharing sstate
> between multiple developers, and the build machine is an i7 but
> another developer's machine is a Core2?    These machines have
> different sets of extensions available

yes I thought about it later on. adding march=i686 when host is 32bit
and march=x86-64 which build host is 64bit in bitbake.conf is probably
one way but I feel its overkill to please an old compiler and for one recipe
so may be you should try to deduce the version of gcc. i think best is to
fix the autoconf on glib-2.0 where you would add a test to find the version
of compiler and inject the needed option to flags


>
> Using the architecture as determined by bitbake seems like a better
> idea (which was V1, right?) as that's embedded in the sstate hash.
>
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


