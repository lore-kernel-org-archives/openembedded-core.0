Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHK0t-0002GZ-70
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 20:07:59 +0200
Received: by pvc30 with SMTP id 30so151260pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 11:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=w4IxqlqaDFkSvEI6dih/Lr1r+x+h3nWOd3EzPaKCQjQ=;
	b=RTQqvQVdX9C/S1F6z2YKtayHqklVWdUnudTh4meS6S+HZQBoMsb/9X7KScrQgBiqEf
	Mio/44G6uef3r48VZcAmXd2Y3Oi3tjhW9I9UxPTzmQwK4j2UNiEOIETgfkG7yLNqJYKS
	CFg2os1zTyxrSkEyDYlRCkaIERQK0FRAPLL7Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=THwfZYM/ZFbl8HhlfjS64aB0YBHjYvei/Ioq11Xi2ZTWdjdKV3/pqF7R4g+ZJM1tyF
	l2yLConvxpbxO/rNmGqCXN6tDEQO7Zn1dwLaGgGyp1ZPuZhy0VkmsmMfXos6inO6pUL5
	9Oqws9e3fdXnXIIc5T/rvTaNCaGJ1Nqw3Bo/A=
Received: by 10.68.3.100 with SMTP id b4mr162659pbb.325.1304445920011;
	Tue, 03 May 2011 11:05:20 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id a4sm177989pbf.56.2011.05.03.11.05.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 May 2011 11:05:18 -0700 (PDT)
Date: Tue, 3 May 2011 11:04:47 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20110503180447.GB5436@sakrah.homelinux.org>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<ed1614da74a5bf5820855d9d5bd9ab6213bc36de.1303889119.git.sgw@linux.intel.com>
	<1303981290.21461.39.camel@rex>
	<BANLkTimx4ry=vZdiNzYna1EE121Q85mUOA@mail.gmail.com>
	<1304424898.21461.107.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1304424898.21461.107.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 36/52] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Tue, 03 May 2011 18:07:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/05/11 13:14), Richard Purdie wrote:
> On Fri, 2011-04-29 at 09:11 -0700, Khem Raj wrote:
> > On Thu, Apr 28, 2011 at 2:01 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > We can make this simpler. We should just setVar("DEPENDS_GETTEXT", "")
> > > in the INHIBIT_DEFAULT_DEPS case. If anything is expanding the variables
> > > somewhere, we should fix that.
> > >
> > 
> > Infact the virtclass stuff complicates this since they are evaluated
> > specially and I am not clear weather _append gets
> > evaluation before that or after and also the anon python function
> > evaluation as the one we are defining in this class.
> > 
> > I tried to empty out DEPENDS_GETTEXT but it does not work in nativesdk cases.
> 
> I still think we can simplify this. Could you try the following patch
> please?:
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 4f20bc2..3b83e42 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -89,9 +89,11 @@ def base_dep_prepend(d):
>  			deps += " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc "
>  	return deps
>  
> -DEPENDS_prepend="${@base_dep_prepend(d)} "
> -DEPENDS_virtclass-native_prepend="${@base_dep_prepend(d)} "
> -DEPENDS_virtclass-nativesdk_prepend="${@base_dep_prepend(d)} "
> +BASEDEPENDS = "${@base_dep_prepend(d)}"
> +
> +DEPENDS_prepend="${BASEDEPENDS} "
> +DEPENDS_virtclass-native_prepend="${BASEDEPENDS} "
> +DEPENDS_virtclass-nativesdk_prepend="${BASEDEPENDS} "
>  
>  FILESPATH = "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", "${FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files", "${FILE_DIRNAME}" ], d)}"
>  # THISDIR only works properly with imediate expansion as it has to run
> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> index a40e74f..57b551e 100644
> --- a/meta/classes/gettext.bbclass
> +++ b/meta/classes/gettext.bbclass
> @@ -1,17 +1,17 @@
>  def gettext_after_parse(d):
>      # Remove the NLS bits if USE_NLS is no.
> -    if bb.data.getVar('USE_NLS', d, 1) == 'no':
> -        cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
> -        cfg += " --disable-nls"
> -        depends = bb.data.getVar('DEPENDS', d, 1) or ""
> -        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
> -        bb.data.setVar('EXTRA_OECONF', cfg, d)
> +    if bb.data.getVar('USE_NLS', d, True) == 'no':
> +        bb.data.setVar('DEPENDS_GETTEXT', "", d)
> +        bb.data.setVar('OECONFNLSOPTION', '--disable-nls', d)
> +    if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not oe.utils.inherits(d, 'cross-canadian'):
> +        bb.data.setVar('DEPENDS_GETTEXT', "", d)
>  
>  python () {
>      gettext_after_parse(d)
>  }
>  
> -DEPENDS_GETTEXT = "gettext gettext-native"
> +DEPENDS_GETTEXT = "virtual/gettext gettext-native"
> +OECONFNLSOPTION = "--enable-nls"
>  
> -DEPENDS =+ "${DEPENDS_GETTEXT}"
> -EXTRA_OECONF += "--enable-nls"
> +BASEDEPENDS =+ "${DEPENDS_GETTEXT}"
> +EXTRA_OECONF += "${OECONFNLSOPTION}"
> 
> 
> 

This has the same problem It empties out DEPENDS_GETTEXT after they have
have already been added to DEPENDS via virtclass e.g. when you build
gcc-runtime-nativesdk it will report a dep loop since now it depends on
virtual/gettext-nativesdk (added by gettext class)
and virtual/gettext-nativesdk depends on compilerlibs
provided by gcc-runtime-nativesdk. This was same problem I was trying to
circumvent



-- 
-Khem


