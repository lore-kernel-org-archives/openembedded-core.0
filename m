Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TBNtQ-0000ap-Gm
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 12:40:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1242; q=dns/txt; s=iport;
	t=1347359284; x=1348568884;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=E+NvskZzI53VbhT0fwmGeg9e+axWka+oM08elVE67AA=;
	b=m2G9n1mg+5+KNDhhFkLFrC/PkzeIsGefilQmXk8higahJq4DYPR0k6CV
	nz7DMPlfXjC0YzpoU5hpXpkyutwbBdEMEuaxeAhiwDM9O1/w1Y/vdYrNX
	x+BbjQc3zsT/jZsaao+kipgePcdUMw/i1oLpZe24/qsirSN8gaEb1tidz k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av4EAOsQT1CQ/khR/2dsb2JhbABFu0+BB4IgAQEBBBIBOAE9CxgJJQ8CRhMGAgEBHodum0aRUwGOdo4Xgx8Dki0Dgy2FX4NUhQOBZ4Jo
X-IronPort-AV: E=Sophos;i="4.80,404,1344211200"; d="scan'208";a="143633744"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-1.cisco.com with ESMTP; 11 Sep 2012 10:28:01 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q8BAS1Do004628
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 10:28:01 GMT
Message-ID: <504F1160.10906@cisco.com>
Date: Tue, 11 Sep 2012 12:24:32 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.6esrpre) Gecko/20120730 Thunderbird/10.0.6
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1347352189-30965-1-git-send-email-mertsas@cisco.com>
In-Reply-To: <1347352189-30965-1-git-send-email-mertsas@cisco.com>
Subject: Re: [PATCH 1/2] bash: Make bash_3.2.48 a nativesdk package.
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
X-List-Received-Date: Tue, 11 Sep 2012 10:40:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/11/12 10:29, Martin Ertsaas wrote:
> 3.2.48 is the bash package in oe-core which is not GPLv3. Making that a nativesdk
> package makes sure we have the same bash version in our toolchain as in our image.
>
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> ---
>  meta/recipes-extended/bash/bash_3.2.48.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
> index 509d7a0..c317a02 100644
> --- a/meta/recipes-extended/bash/bash_3.2.48.bb
> +++ b/meta/recipes-extended/bash/bash_3.2.48.bb
> @@ -48,3 +48,5 @@ pkg_postinst_${PN} () {
>  	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
>  	grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
>  }
> +
> +BBCLASSEXTEND = "nativesdk"
This can be ignored. Just found out that this bash does not like to be a
nativesdk package. It fails with
./mkbuiltins: error while loading shared libraries: __vdso_gettimeofday:
invalid mode for dlopen(): Invalid argument

Any idea what this might be, so I can fix the patch.

Sorry for sending this before it was actually ready.

- Martin


