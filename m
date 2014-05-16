Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (unknown [209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 979246098B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 09:39:36 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id q107so3710460qgd.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 02:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Yu9bXnZwkRcvB6k3AeVXtCoVfv9AS1nhN3Xz4xyjlG4=;
	b=Yr20qN2hxTTdK1xkE4S86/DZoSrYN7Ur+cmQwvxsofyvkMHtXpv05TaA5aYzIqpfeh
	27Sg6/680rmcQl/1xY4S/x+t2SOH3a4KA/CcAlcsU/gJ419ITvxFIddoMrKGieHOumVA
	GlwjiseSVl4hEo9VAwGmo1sGdPJbn1qf/Q2pEafd3jB3QTMjwQayfdm66lfCWqThqKMg
	TgUZVsyao7d158PXD/2GIMO9xxszxctrAfRLdtBMsxeZkoCK2UqEkMoPKxNcjvQD81eq
	2xUIeG5c1N+5nEP5gP9EOmtH+1GnqNmCicpqyfG4aZVy3U33GeKoAtMDEqD8aQkvE5hp
	TsIg==
X-Gm-Message-State: ALoCoQnIbpGJbzsqZoX38duyMFpcRuy45FYLat1tEujF/Y1YPa3nZjC6s4ZdKFf9XAUmQlHlu1p5
X-Received: by 10.224.32.138 with SMTP id c10mr11283848qad.35.1400233177104;
	Fri, 16 May 2014 02:39:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 16 May 2014 02:39:17 -0700 (PDT)
In-Reply-To: <1400226321-5201-1-git-send-email-b40527@freescale.com>
References: <1400226321-5201-1-git-send-email-b40527@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 May 2014 10:39:17 +0100
Message-ID: <CAJTo0Lar8Hbc1Gsa3k631M697ZHDOufJ1k7ugTUU=AWXaHjMAQ@mail.gmail.com>
To: "b40527@freescale.com" <b40527@freescale.com>
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Add api-doc class
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
X-List-Received-Date: Fri, 16 May 2014 09:39:39 -0000
Content-Type: text/plain; charset=UTF-8

As this class is specific to doxygen, please call it doxygen.bbclass.

Also I think this should be opt-in not forcibly enabled as not
everyone would want API documentation to be generated.

Pretty sure you'll want to run doxygen after do_compile in case the
documentation is generated from files built at compile time.  But
don't most packages that use doxygen invoke it themselves?  You're
also not actually installing the documentation anywhere.

Ross

On 16 May 2014 08:45,  <b40527@freescale.com> wrote:
> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>
> this class use doxygen to generate api docs from source code
>
> Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> ---
>  meta/classes/api-doc.bbclass |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 meta/classes/api-doc.bbclass
>
> diff --git a/meta/classes/api-doc.bbclass b/meta/classes/api-doc.bbclass
> new file mode 100644
> index 0000000..0879c3e
> --- /dev/null
> +++ b/meta/classes/api-doc.bbclass
> @@ -0,0 +1,16 @@
> +# Helper class to pull in the right dependencies and generate
> +# api documentation from sources code
> +
> +DEPENDS += "doxygen-native"
> +
> +# Doxygen configuration file
> +DOXYGEN_CFG ?= "Doxyfile"
> +
> +do_generate_doc () {
> +    if [ -e ${S}/${DOXYGEN_CFG} ]; then
> +        doxygen ${S}/${DOXYGEN_CFG}
> +    else
> +        bbfatal "no doxygen configuration file found"
> +    fi
> +}
> +addtask generate_doc before do_install after do_patch
> --
> 1.7.0.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

