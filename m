Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TFUeI-0004jh-FP
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 20:41:54 +0200
Received: by eeit10 with SMTP id t10so748171eei.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rIFqbv4Wb8Do0l73gXQm2whH9sKKy28x+TnDVzcIbfo=;
	b=zv2wntVR+ZcgqylGTh2UDTSmGz2rcHcWX8zdaoLcCBdgb+3niBXmFZYcxNg6VuD124
	ZZjsAegwYG0wH57a2wFNh1t9gEMiDGN5qkpHEy9pMvJ/A5894a6cmzUxRpe2hSB+CkJE
	FKJlEbZp1G/7J/8pvnn3fTU198Ht720nl9zY0Xl3cTh92YbJOLi3/c1n3yZmQzNKn3Yg
	G5UkrekbrCb06ilJ1dUSSZgtVPE5LjyjxlLES27o+nlsFKrwfQCPCKWyMn+GxlCDLTqB
	7R6xMxq8Hd+sIHePK6R7u5/PMEjmFdBH2fUF+rECvTebIN7WgasDeH0+Gdpbi3hapULq
	kz3Q==
Received: by 10.14.211.3 with SMTP id v3mr9808012eeo.43.1348338548982; Sat, 22
	Sep 2012 11:29:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Sat, 22 Sep 2012 11:28:38 -0700 (PDT)
In-Reply-To: <29c686d2d3a1f87254d62226b0e6b30d58005986.1348316945.git.paul.eggleton@linux.intel.com>
References: <cover.1348316945.git.paul.eggleton@linux.intel.com>
	<29c686d2d3a1f87254d62226b0e6b30d58005986.1348316945.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Sep 2012 11:28:38 -0700
Message-ID: <CAMKF1sqXp7m29f3+j=rm0CFMksdpMUT9r5bb=OU_mN+xV+uizg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] classes/multilib: prevent multilib extension of nativesdk recipes
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
X-List-Received-Date: Sat, 22 Sep 2012 18:41:54 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 22, 2012 at 5:29 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> It isn't supported to mix multilib and nativesdk in the same target, so
> explicitly skip multilib processing if nativesdk is inherited. As a
> bonus this fixes a bunch of related "missing file" warnings from the
> file checksum code during parsing because BPN was not correctly stripped
> for these targets.
>
> Second half of the fix for [YOCTO #3146].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Tested-by: Khem Raj <raj.khem@gmail.com>

> ---
>  meta/classes/multilib.bbclass |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index 4d3f889..7d5fc41 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -19,6 +19,9 @@ python multilib_virtclass_handler () {
>      if bb.data.inherits_class('native', e.data):
>          raise bb.parse.SkipPackage("We can't extend native recipes")
>
> +    if bb.data.inherits_class('nativesdk', e.data):
> +        raise bb.parse.SkipPackage("We can't extend nativesdk recipes")
> +
>      save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
>      for name in save_var_name.split():
>          val=e.data.getVar(name, True)
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


