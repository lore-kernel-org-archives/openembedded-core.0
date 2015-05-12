Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 08D6E73EFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 00:34:44 +0000 (UTC)
Received: by obcus9 with SMTP id us9so83325054obc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 17:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pZVjJEAk7fP9tUT4RA8iGNAq+y4nQaIfxiMMuLKsaGk=;
	b=AD/cD0q8CESw7FlqMA+uNvgj8f1sOzsXiA9QOdXee/iz6OuLNGgsUwMA2uS8xv/VqK
	3wmBrWNC9vv9Q86P8tkb6+73edcNh5+ZIH0WSIMetXZO3SEWJ0WfXKLpN1mX8NoXq+KG
	Bff76alDRBwu31+BqoHNf6d5vfEq1qBOBjQjvxCE9UFdkl1wHerbor9oeKa97OCq+umY
	WoQd59LzZgmCyejy6d/DK6pQlyswFPq7tY3h7xPcfN71+9GMuMVYrLpXXBBFbeR45fbg
	0LuY/M+UKa8DCVCGvy8DmPcrCq3XU2qGUNfhLQ7f116fj3wgfjvgwpZsuiuRKvRYKR4J
	G+sA==
MIME-Version: 1.0
X-Received: by 10.182.214.74 with SMTP id ny10mr9860942obc.25.1431390885408;
	Mon, 11 May 2015 17:34:45 -0700 (PDT)
Received: by 10.202.102.13 with HTTP; Mon, 11 May 2015 17:34:45 -0700 (PDT)
In-Reply-To: <84f2bc2ad049dd54b4bc62f8810de014ff223f6b.1424877305.git.cristian.iorga@intel.com>
References: <cover.1424877305.git.cristian.iorga@intel.com>
	<84f2bc2ad049dd54b4bc62f8810de014ff223f6b.1424877305.git.cristian.iorga@intel.com>
Date: Mon, 11 May 2015 17:34:45 -0700
Message-ID: <CAJ86T=VeT9qXjvPJo0Gb+HefkMZhaD7C6PQxUBoZoZbBy6NUmw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] meta/lib/oe/utils.py: properly implement both_contain()
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
X-List-Received-Date: Tue, 12 May 2015 00:34:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 25, 2015 at 7:15 AM, Cristian Iorga
<cristian.iorga@intel.com> wrote:
> oe.utils.both_contain() just does a find() on the value
> rather than splitting the value and then looking in the
> list of split items. The result is that if you add a
> feature to MACHINE_FEATURES that itself has a substring
> that matches one of the values looked for when building
> COMBINED_FEATURES, you end up with an incomprehensible
> error (here with "ext2i" in MACHINE_FEATURES):
>
> ERROR: Nothing RPROVIDES 'packagegroup-base-ext2'
> (but /home/balister/src/oe-core/oe-core/meta/recipes-core/
> /packagegroups/packagegroup-base.bb RDEPENDS on or otherwise requires it)

This change seems to break COMBINED_FEATURES.

$ bitbake -e packagegroup-base | grep '^COMBINED_FEATURES='

dizzy:
  COMBINED_FEATURES="alsa         "

fido:
  COMBINED_FEATURES="set(['alsa'])         "


> Fix [YOCTO #6888].
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  meta/lib/oe/utils.py | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 1f84ba4..bedade2 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -42,7 +42,15 @@ def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
>          return falsevalue
>
>  def both_contain(variable1, variable2, checkvalue, d):
> -    if d.getVar(variable1,1).find(checkvalue) != -1 and d.getVar(variable2,1).find(checkvalue) != -1:
> +    val1 = d.getVar(variable1, True)
> +    val2 = d.getVar(variable2, True)
> +    val1 = set(val1.split())
> +    val2 = set(val2.split())
> +    if isinstance(checkvalue, basestring):
> +        checkvalue = set(checkvalue.split())
> +    else:
> +        checkvalue = set(checkvalue)
> +    if checkvalue.issubset(val1) and checkvalue.issubset(val2):
>          return checkvalue
>      else:
>          return ""
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

