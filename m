Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B06696A5E1;
	Wed, 29 May 2013 14:11:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TEFebr001715; Wed, 29 May 2013 15:15:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D2flnoPjTQQy; Wed, 29 May 2013 15:15:40 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TEFYw6001697
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 29 May 2013 15:15:36 +0100
Message-ID: <1369836670.14887.217.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 29 May 2013 15:11:10 +0100
In-Reply-To: <1369835496-20815-1-git-send-email-mark.hatle@windriver.com>
References: <1369835496-20815-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] base.bbclass: Deprecate the PRINC logic
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
X-List-Received-Date: Wed, 29 May 2013 14:11:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-29 at 08:51 -0500, Mark Hatle wrote:
> Background:
> 
> At the recent TSC meeting we were discussing ways of removing the PRINC
> in favor of the PR server, which should now be standard.  The first step
> in this process is coming up with a simple patch that declared PRINC as
> deprecated.  If this type of patch is successful, the block of code could
> be replaced with a bb.error eventually.
> 
> It is not expected that this patch will go in by itself, but instead
> should be coordinated with changes to the recipes in common layers such
> as openembedded-core, meta-openembedded/meta-* and other community layers.
> 
> The commit message follows:
> 
> The PRINC logic is now deprecated, the PR server should be used to handle
> the automatic incrementing of the PR (package release) field.
> 
> A warning message has been added when princ is defined as anything but '0'.
> 
> The default setting of '0' has been retained as some layers use embedded
> python to increment the PRINC filed.  This fails if the base PRINC is not
> defined.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/base.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index b1642a2..29084a2 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -465,8 +465,12 @@ python () {
>              appendVar('EXTRA_OECONF', extraconf)
>  
>      # If PRINC is set, try and increase the PR value by the amount specified
> +    # The PR server is now the preferred way to handle PR changes based on
> +    # the checksum of the recipe (including bbappend).  The PRINC is now
> +    # obsolete.  Return a warning to the user.
>      princ = d.getVar('PRINC', True)
>      if princ and princ != "0":
> +        bb.warn("Use of PRINC is deprecated.  The PR server should be used to automatically increment the PR.  See: https://wiki.yoctoproject.org/wiki/PR_Service"

There is a missing ")" here.

Cheers,

Richard

>          pr = d.getVar('PR', True)
>          pr_prefix = re.search("\D+",pr)
>          prval = re.search("\d+",pr)



