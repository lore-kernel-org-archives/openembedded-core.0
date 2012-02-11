Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rw2T7-0003ED-Bt
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 03:13:41 +0100
Received: by daln34 with SMTP id n34so2373917dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 18:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dYncrytXvrATerB8KcnndeqnNf5e1cnq7Qkyh1w31Q0=;
	b=Cc9KZbsVfFRATAFKW9qzYJ40RupAAgKxS4xkTOU3VLIxXPLcqyfkRc3yT+zgChj4HZ
	UFtY7rw32bvvdXCADBMP3dxEyhSl0EEv+gIFMLf4eFBy973ZvcZLfuKfmISm1lKCgv0D
	gmY4CzwjvjhAGQ/a3q/uy0jlSwF4PqxqG6uHk=
Received: by 10.68.73.103 with SMTP id k7mr21396997pbv.132.1328925933321;
	Fri, 10 Feb 2012 18:05:33 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id w4sm17970490pbf.4.2012.02.10.18.05.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 18:05:31 -0800 (PST)
Date: Fri, 10 Feb 2012 18:05:27 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120211020527.GD2095@sakrah.homelinux.org>
References: <1328888467-31364-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1328888467-31364-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC] zlib: export LDCONFIG = true to disable runnig host's ldconfig
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
X-List-Received-Date: Sat, 11 Feb 2012 02:13:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/02/12 16:41), Martin Jansa wrote:
> * it's called from install-libs target and when /etc/ld.so.cache is writeable by user running bitbake
>   then it creates invalid cache (in my case libstdc++.so cannot be found after building zlib(-native)
>   and I have to call touch */libstdc++.so && /sbin/ldconfig to fix it

hmm does it happen only with native or with both ?

i think we need to fix zlib install in this case.
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/zlib/zlib_1.2.6.bb |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-core/zlib/zlib_1.2.6.bb b/meta/recipes-core/zlib/zlib_1.2.6.bb
> index a220773..dcdc16f 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.6.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.6.bb
> @@ -11,6 +11,9 @@ SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
>  SRC_URI[md5sum] = "dc2cfa0d2313ca77224b4d932b2911e9"
>  SRC_URI[sha256sum] = "fa3e3e4881fa5810b8903f2c7e0dcd5a0a673535f0438021c4bbb5db1b918c8e"
>  
> +# disable calling ldconfig on host, it breaks /etc/ld.so.cache if it's writeable by user running bitbake
> +export LDCONFIG = "true"
> +
>  do_configure (){
>  	./configure --prefix=${prefix} --shared --libdir=${libdir}
>  }
> -- 
> 1.7.8.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


