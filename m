Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id E4B1C7701D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 07:17:12 +0000 (UTC)
Received: by iofb144 with SMTP id b144so14405432iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 00:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=Tk77WFxbuFhNK0bFDUzbVr0D5PvRJMuKRbEe/hsm7YM=;
	b=Mzfy6t4TKpRV4TOp8X2V/hnmIqdtg+LLLlHDugsQtpRoNADIbU1XqDhhhKGpFqn7IC
	y3bvdWIevhQgrPuDFhKmaTrRP7rHt+3LPPF4lsPORTjgPLhVWgqChsIjW8sRH378+G7J
	rWohbCVPg6Z7ILCmaEVX6tuQxRJABiYHEjX7AwYP+flEhKtf3BaZM8sOI7NUvBHtowDQ
	V8hm1BdJIQaDKNtIWyr4v8Rgx6jErYGHMHLg8DSdx8UEM/aP/VlH++3686axrFfBa5HJ
	I4KUeOLfug3Dki6wLm1wWVmHw5I7g2Lg21VGyVeuidZa4AfKw7FnCjaqmJnSGdMCS8o5
	6rZw==
X-Gm-Message-State: ALoCoQnX8Cbg5rDe2X8cD/ZIbsOmkGGVoqoIm7l3R8a9i32PuQxH6wWYHVb8Ir4bsl5JbYawwPKA
X-Received: by 10.107.152.139 with SMTP id a133mr4141416ioe.145.1441351032393; 
	Fri, 04 Sep 2015 00:17:12 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB6C.dip0.t-ipconnect.de. [93.232.251.108])
	by smtp.gmail.com with ESMTPSA id l14sm931354ioe.35.2015.09.04.00.17.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 00:17:11 -0700 (PDT)
Message-ID: <1441351029.9573.47.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
Date: Fri, 04 Sep 2015 09:17:09 +0200
In-Reply-To: <1441317404-6663-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1441317404-6663-1-git-send-email-alejandro.franco@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv4] Fix recursive mode -st on BUILDDIR setup
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
X-List-Received-Date: Fri, 04 Sep 2015 07:17:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-03 at 16:56 -0500, Alex Franco wrote:
> Removing recursive option from chmod -st on BUILDDIR as it would
> take very long on existing build directories

Okay, so this *is* a problem others are also seeing ;-}

> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index f5b7e4e..91bd86b 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -24,7 +24,10 @@ if [ -z "$BUILDDIR" ]; then
>  fi
>  
>  mkdir -p "$BUILDDIR/conf"
> -chmod -R -st "$BUILDDIR" 
> +
> +# Attempting removal of sticky,setuid bits from BUILDDIR, BUILDDIR/conf
> +chmod -st "$BUILDDIR" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR"
> +chmod -st "$BUILDDIR/conf" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR/conf"
>  
>  if [ ! -d "$BUILDDIR" ]; then
>      echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"

What was the reasoning behind adding these operations on $BUILDDIR/conf
before the check whether BUILDDIR exists and is a directory? Looks a bit
fishy to me.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




