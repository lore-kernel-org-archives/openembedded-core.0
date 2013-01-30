Received: from mail-ie0-f182.google.com ([209.85.223.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U0dzW-000380-CP
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 21:10:44 +0100
Received: by mail-ie0-f182.google.com with SMTP id k14so1674508iea.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 11:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=t9HnKATL/q48aAoAlIPUJF42lyHufE4L5xqC1dn/GBE=;
	b=iwBji+iG3FCD2kZ3m4YnsGf1Dvp5DuBvWQTVZrEnzyXJLL8rAHuM5TXZsaFK/okfi7
	JDE4xB0GscfFtYJYioeauB9OnBoZMeVN2MiMWrktV8qWgfPZxD4g2356ouD0Nq+8t/Y7
	OgwPvG1TTKFY4ddO+DD74pVXBic0FKMxkCl7ymLOY+ZZYq18q8W867EXCkYsJWHszJVP
	ccwBr8nmYx8SbYNuW41XS7qaFy9FuYVZqIC5rf1hhRLVa9l7LCo041G2hgL8Icgh9ACi
	LOyxZggPN3BER53bn6i0WUGoPm+g121Xl4oBpyw2z7F/Q9FPwJTKJntAoYs/LNPZqStj
	U4eg==
X-Received: by 10.50.140.34 with SMTP id rd2mr4530446igb.93.1359575700168;
	Wed, 30 Jan 2013 11:55:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Wed, 30 Jan 2013 11:54:30 -0800 (PST)
In-Reply-To: <1359563200-28139-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1359563200-28139-1-git-send-email-bogdan.a.marinescu@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jan 2013 11:54:30 -0800
Message-ID: <CAMKF1spNf-U6MqUeC-2snPcdXB1=6H=EMeeMM=0p4sVc6DzGsQ@mail.gmail.com>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: don't list the same path twice in RTLDLIST
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 20:10:44 -0000
Content-Type: text/plain; charset=UTF-8

Looks ok to me.

On Wed, Jan 30, 2013 at 8:26 AM, Bogdan Marinescu
<bogdan.a.marinescu@intel.com> wrote:
> Before modifying RTLDLIST in ldd, make sure that it doesn't already
> contain the right path, thus avoiding duplicate entries in RTLDLIST.
>
> [YOCTO #2655]
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  meta/recipes-core/eglibc/eglibc_2.17.bb |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bb b/meta/recipes-core/eglibc/eglibc_2.17.bb
> index c1cae4f..7bdb267 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.17.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
> @@ -1,6 +1,6 @@
>  require eglibc.inc
>
> -PR = "r1"
> +PR = "r2"
>
>  DEPENDS += "gperf-native kconfig-frontends-native"
>
> @@ -143,8 +143,11 @@ do_compile () {
>         echo "Adjust ldd script"
>         if [ -n "${RTLDLIST}" ]
>         then
> -               sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)"\(.*\)"$#\1\2#'
> -               sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)\(.*\)$#\1"${RTLDLIST} \2"#'
> +               prevrtld=`cat ${B}/elf/ldd | grep "^RTLDLIST=" | sed 's#^RTLDLIST=\(.*\)$#\1#'`
> +               if [ "${prevrtld}" != "${RTLDLIST}" ]
> +               then
> +                       sed -i ${B}/elf/ldd -e "s#^RTLDLIST=.*\$#RTLDLIST=\"${prevrtld} ${RTLDLIST}\"#"
> +               fi
>         fi
>
>  }
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


