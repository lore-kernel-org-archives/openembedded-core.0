Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOyU1-0003Z3-VF
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 22:45:42 +0200
Received: by pwj9 with SMTP id 9so3270703pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 13:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=jPvuYs+Y1/qN+BJXJyC7kjSOavIe9KwhbqP39JAoQSE=;
	b=G9uuDG5rpsR+1gFcH7PVajEIkZ03WfB9CzpqPStQ0qEWDG/1G/5JK6FCYmPbtAUf9h
	0aPaXVosKwj64eamjTk5pBa9VUSEsvsDUJOqoB7JCQA5p7ci3EWeY9pcDPwvkMlHYbkb
	UzL6Ckx9wi7zxa7i0YEwIApbgZf9hsu9Oi2H4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=CP0CCyeBas6EaEVoECpIl07iZID3P+ASBpvcmTAy/zitEOijXqwlyMTM7KmKYlUVFy
	7WvC1uF9N/xBk3ODzulJwYDtTmcGjeXUIKnBw9RTjXTYPPde1fZCQc8h/1UyLUorVGnu
	+Sq/vPJ6kmBKGG3Pp5PbWWyrB+FsBwFvh09uc=
Received: by 10.142.247.25 with SMTP id u25mr1120622wfh.362.1306269758862;
	Tue, 24 May 2011 13:42:38 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z21sm5884683wfd.11.2011.05.24.13.42.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 13:42:37 -0700 (PDT)
Date: Tue, 24 May 2011 13:41:13 -0700
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Message-ID: <20110524204113.GA18969@sakrah.homelinux.org>
References: <cover.1306264437.git.raj.khem@gmail.com>
	<0ee71fe45ec1b664287c1c277238263e3ff277ef.1306264437.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0ee71fe45ec1b664287c1c277238263e3ff277ef.1306264437.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH V2 2/2] eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS
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
X-List-Received-Date: Tue, 24 May 2011 20:45:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/05/11 12:18), Khem Raj wrote:
> * Currently we are passing -jN or -j N flags to eglibc makefiles
>   however eglibc uses a make variable called PARALLELMFLAGS
>   to pass information about parallel build to sub-makes
> 
> * Currently make install ran without parallelism but now
>   it should have parallel building flags passed to do_install
>   correctly which inturn should improve build time of
>   eglibc on systems using parallel build -j with values > 1

I forgot to attach the times of do_compile+do_install using -j 2

with patch

real    11m11.557s
user    11m27.270s
sys     2m54.000s

without patch

real    12m39.788s
user    11m36.850s
sys     3m14.310s

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/eglibc/eglibc.inc |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
> index 8314cb1..46ffa82 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -36,4 +36,10 @@ INHIBIT_DEFAULT_DEPS = "1"
>  
>  ARM_INSTRUCTION_SET = "arm"
>  
> +# eglibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
> +# PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
> +EGLIBCPARALLELISM := "PARALLELMFLAGS="${PARALLEL_MAKE}""
> +EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
> +PARALLEL_MAKE = ""
> +
>  PACKAGES = "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
> -- 
> 1.7.4.1
> 

-- 
-Khem


