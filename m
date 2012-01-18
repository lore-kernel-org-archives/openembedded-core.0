Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RncIj-00070t-LV
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 21:40:09 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2012 12:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100111280"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga002.jf.intel.com with ESMTP; 18 Jan 2012 12:32:29 -0800
Message-ID: <4F172C5D.5020806@linux.intel.com>
Date: Wed, 18 Jan 2012 12:32:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Colin Walters <walters@verbum.org>
References: <1326651241.9066.0.camel@lenny> <4F13A366.1010807@linux.intel.com>
	<1326812944.3467.46.camel@lenny> <4F15CDFD.8050204@linux.intel.com>
	<1326916687.24335.4.camel@lenny>
In-Reply-To: <1326916687.24335.4.camel@lenny>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool: Put all libltdl headers in the correct libltdl-dev package
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
X-List-Received-Date: Wed, 18 Jan 2012 20:40:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2012 11:58 AM, Colin Walters wrote:
> On Tue, 2012-01-17 at 11:37 -0800, Saul Wold wrote:
>
>>> https://github.com/cgwalters/poky/commit/0255ac2e95bb5230f7fdf1b861be0b97b01f2ecf
>>>
>> Yes, this will work better in the future, let me know the github branch
>> that contains your patch against oe-core or poky master (which ever you
>> prefer).
>
> I've uploaded all of my current patches to the "edison" branch here:
> https://github.com/cgwalters/poky
>
Colin,

So are you asking that we pull all these changes into oe-core or this is 
the change set you have made for your system?  I guess I am alittle unclear.

Also, if you want items into OE-Core, you should ensure they are based 
against oe-core master.

Thanks

Sau!

> There's a new one there for bash:
>
> https://github.com/cgwalters/poky/commit/84549cb9435fe1bec38a18e1fe6daf350351cd5a
>
>> From 84549cb9435fe1bec38a18e1fe6daf350351cd5a Mon Sep 17 00:00:00 2001
> From: Colin Walters<walters@verbum.org>
> Date: Wed, 18 Jan 2012 14:45:21 -0500
> Subject: [PATCH] bash: Ensure we use glibc getcwd(), not builtin copy
>
> My build system runs in a chroot, and then creates bind mounts
> that point outside of the chroot.  The bash implementation of getcwd()
> breaks badly on this.
>
> glibc has a perfectly working version which on modern Linux simply
> invokes the getcwd() system call.  However, when cross compiling,
> bash's configure script gives up, and so defers to its built in
> version.
>
> I'm not sure whether dietlibc/uclibc will malloc as bash wants, so
> this patch may not be applicable everywhere.  Probably a better fix
> would be for bash to detect glibc's get_current_dir_name() and use it.
> ---
>   meta/recipes-extended/bash/bash.inc |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/bash/bash.inc
> b/meta/recipes-extended/bash/bash.inc
> index 876be1e..f5a480a 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -14,7 +14,11 @@ PARALLEL_MAKE = ""
>   bindir = "/bin"
>   sbindir = "/sbin"
>
> -EXTRA_OECONF = "--enable-job-control"
> +# Override getcwd_malloc because the copy of getcwd()
> +# in bash blows up when run inside a chroot and a bind
> +# mount pointing outside.  This assumes we're using eglibc.
> +EXTRA_OECONF = "--enable-job-control bash_cv_getcwd_malloc=yes "
> +
>   export CC_FOR_BUILD = "${BUILD_CC}"
>
>   ALTERNATIVE_NAME = "sh"


