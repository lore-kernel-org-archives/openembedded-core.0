Return-Path: <matt@madison.systems>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9C452609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 12:18:04 +0000 (UTC)
Received: by pdfh10 with SMTP id h10so18428229pdf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 05:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:content-type:mime-version:content-transfer-encoding;
	bh=iq+4zBehR0s/mS8Vc0MN/UpTJja+8LkZrIq0mksDzd8=;
	b=Xx+OENe9ROULAb3j0CYouyi6veFAECmGtYW/jaIJuUl/zUcTkMtlRVXWNbPCK2HmLX
	F+JRp3hA+0XsEGRi6lDHoDhPr5YPghbVG4wijJg26xJ6H5iiyNbVw9+U3Be8Khlg2rEM
	cfAn1/zGa8D1G4zaShm0pXeiFsQuY+F6z/R6oMFllK/CRPXmXeUxyDtnVQXfKfwyzVSO
	yGpTUY+v4HZL+uSYoSXJp7lCctn0vYoOQ3yfCPoCbgof1x5/B9c6JUALh6eZit/p8/w4
	EF4VQ7IiNoSY9ZmGAR0fRQbGQ7jgUVCwtu+bBc1AFrd9dpC2ILameEkcov3PZHtsp4+J
	9MjQ==
X-Gm-Message-State: ALoCoQl3ZqjRfxDuY9sBaYecCQfyd0ESz1dn4bntAVN0T+8wL2G8D7kdgcqoh1UM+rPK9NB/aMXI
X-Received: by 10.67.3.3 with SMTP id bs3mr15088108pad.51.1432297085861;
	Fri, 22 May 2015 05:18:05 -0700 (PDT)
Received: from [172.16.1.18]
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93])
	by mx.google.com with ESMTPSA id nj7sm2028812pbc.36.2015.05.22.05.18.04
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 22 May 2015 05:18:05 -0700 (PDT)
Message-ID: <1432297083.4102.5.camel@workhorse.madison.systems>
From: Matt Madison <matt@madison.systems>
To: Ross Burton <ross.burton@intel.com>
Date: Fri, 22 May 2015 05:18:03 -0700
In-Reply-To: <1432294706-18789-1-git-send-email-ross.burton@intel.com>
References: <1432294706-18789-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] utils: add helper to perform the union of two string lists
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
X-List-Received-Date: Fri, 22 May 2015 12:18:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-22 at 12:38 +0100, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oe/utils.py | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index b8224de..f70bd86 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -55,6 +55,21 @@ def both_contain(variable1, variable2, checkvalue, d):
>      else:
>          return ""
>  
> +def set_union(variable1, variable2, d):
> +    """
> +    Expand both variables, interpret them as lists of strings, and return the
> +    union as a flattened string.


This function is returning the intersection of the two sets, not the
union.  Maybe change the name and the comment here?


> +
> +    For example:
> +    s1 = "a b c"
> +    s2 = "b c d"
> +    s3 = set_union(s1, s2)
> +    => s3 = "b c"
> +    """
> +    val1 = set(d.getVar(variable1, True).split())
> +    val2 = set(d.getVar(variable2, True).split())
> +    return " ".join(val1 & val2)
> +
>  def prune_suffix(var, suffixes, d):
>      # See if var ends with any of the suffixes listed and
>      # remove it if found
> -- 
> 2.1.4
> 

-Matt


