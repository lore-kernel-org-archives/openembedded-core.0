Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q26Qb-0002sB-PD
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 19:35:37 +0100
Received: by iwn10 with SMTP id 10so8021421iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2011 11:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=M8TLikM5ZNWyJelZiyH7bJIomxTcKo8Hn++VhnOQEUs=;
	b=P62dxxIKJK52kvKpIOi0vafAxCDzjZXIlbB6fYfN/BszOPn51OCDjrXx6RLjmBgvRW
	DLfj8CQyg8F/Yz4l1pZKeNJWyCENYRrbeRi2K+sS5PpAJT6lLwjq1+3PZQk1SIRP49Of
	kjX8ixOcytvh4HC/zcAKjr8IVhRtHDxvylqNc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kXoQkvu2pOMmw1U7t792hvPzQbiCzSw4UpfFE3AIhyEwCla7sSTZSAnQaTKKMFqdna
	KayT2epxvg6kO/o0fogToHwM4JGHmqT6fnnzQszDlWWwG4IoOGinvvYyqML5IrKWBzvU
	FAQJIKuU3JHN5ws4BdpkhLZBn9lsraX1TXYE4=
Received: by 10.42.147.199 with SMTP id o7mr8912384icv.448.1300818823783;
	Tue, 22 Mar 2011 11:33:43 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 8sm4545494iba.38.2011.03.22.11.33.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 11:33:41 -0700 (PDT)
Date: Tue, 22 Mar 2011 11:33:57 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110322183357.GD26336@sakrah.homelinux.org>
References: <cover.1300817337.git.tom_rini@mentor.com>
	<3f44e1b84aa48bcf4c9a92639b0146ebecc90538.1300817337.git.tom_rini@mentor.com>
MIME-Version: 1.0
In-Reply-To: <3f44e1b84aa48bcf4c9a92639b0146ebecc90538.1300817337.git.tom_rini@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/2] gettext.bbclass: Fix cases where we lost DEPENDS_GETTEXT
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
X-List-Received-Date: Tue, 22 Mar 2011 18:35:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/03/11 11:21), Tom Rini wrote:
> This is a partial sync-up with 2a9a834ce426f4dc97162870ef1632540ff044f1
> of openembedded master.  After consulting with Khem there's a few things
> that we can do to further improve the situation but doing this fixes
> the cases such as BBCLASSEXTEND where we can loose DEPENDS_GETTEXT
> and trigger the QA error about missing inherit gettext (when we aren't).
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

I think this one needs testing patch looks ok though

> ---
>  meta/classes/gettext.bbclass |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> index a40e74f..45e883f 100644
> --- a/meta/classes/gettext.bbclass
> +++ b/meta/classes/gettext.bbclass
> @@ -4,7 +4,7 @@ def gettext_after_parse(d):
>          cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
>          cfg += " --disable-nls"
>          depends = bb.data.getVar('DEPENDS', d, 1) or ""
> -        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
> +        bb.data.setVar('DEPENDS', oe_filter_out('^(gettext|gettext-native|virtual/libiconv|virtual/libintl)$', depends, d), d)
>          bb.data.setVar('EXTRA_OECONF', cfg, d)
>  
>  python () {
> @@ -13,5 +13,9 @@ python () {
>  
>  DEPENDS_GETTEXT = "gettext gettext-native"
>  
> -DEPENDS =+ "${DEPENDS_GETTEXT}"
> +DEPENDS_prepend += "${DEPENDS_GETTEXT} "
> +DEPENDS_virtclass-native_prepend = "${DEPENDS_GETTEXT} "
> +DEPENDS_virtclass-nativesdk_prepend = "${DEPENDS_GETTEXT} "
> +DEPENDS_virtclass-cross_prepend = "${DEPENDS_GETTEXT} "
> +DEPENDS_virtclass-crosssdk_prepend = "${DEPENDS_GETTEXT} "
>  EXTRA_OECONF += "--enable-nls"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


