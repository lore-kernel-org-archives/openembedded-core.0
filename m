Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id B959B77182
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 18:40:06 +0000 (UTC)
Received: by iofh3 with SMTP id h3so42196938iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 10:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iX/Ak87d4caQExWoRy73RGCPx1uk2c12bmi39Fuuq0Y=;
	b=QMvwnQsUXU0EmfS/ed5K9jaLcUFDquTCoHviwOeQ4HFYgaHXuTqD/SSTCnnhFW2Bde
	f0CIH/ZK3v2IocAa4n5o40j9/UNBd3Y3iciSCiRsUlUDNdjpHdxqCY4km7QLaB/jzvbT
	TygTkIRQ1MSzXzrnX5VrE2UtezkQnvLL7i0Xj15aLiFqXITMKr0iFkvb0cYArq7CfVBz
	Dw2kuUrQCe/PLv7f07PhGckR+p5CbhcICdtQs3RN/68chSg0kyX2SWKjzuEa2PZ7IpaP
	sxoWsvGA1p4Qc6FdcUCmFa5Msn/PeJ/NrNmDg8muiSEuw1Myt60OL7pftcRAnjB+AU7M
	PAnQ==
X-Received: by 10.107.162.137 with SMTP id l131mr8307446ioe.49.1447267206388; 
	Wed, 11 Nov 2015 10:40:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Wed, 11 Nov 2015 10:39:36 -0800 (PST)
In-Reply-To: <1447263707-27696-3-git-send-email-akuster808@gmail.com>
References: <1447263707-27696-1-git-send-email-akuster808@gmail.com>
	<1447263707-27696-3-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2015 10:39:36 -0800
Message-ID: <CAMKF1srWCBeKpNEEDS2s3MxTYGvoH1iJdiQGj0L5rg6Y49LedQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ldsoconf: allow extension via local.conf
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
X-List-Received-Date: Wed, 11 Nov 2015 18:40:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 11, 2015 at 9:41 AM, Armin Kuster <akuster808@gmail.com> wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> this allows extending ldconfig search path from local.conf
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/classes/image-ldconfig.bbclass | 6 ++++++
>  meta/conf/bitbake.conf              | 3 +++
>  2 files changed, 9 insertions(+)
>
> diff --git a/meta/classes/image-ldconfig.bbclass b/meta/classes/image-ldconfig.bbclass
> index e9946da..ce10673 100644
> --- a/meta/classes/image-ldconfig.bbclass
> +++ b/meta/classes/image-ldconfig.bbclass
> @@ -11,6 +11,12 @@ ld_so_conf() {
>
>      rm -f ${STAGING_DIR_NATIVE}${sysconfdir_native}/ld.so.conf
>
> +    # dump addition lib possible defined in local.conf
> +    for file in ${LDSOCONF};
> +    do
> +        echo ${file} >> ${STAGING_LDSO_CONF_DIR}/ld.so.conf
> +    done
> +
>      # save lib dirs as defined in recipes
>      for file in `find ${STAGING_LDSO_CONF_DIR}/*/* -name "ld.so.conf"`;
>      do
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f0471f4..1f78c49 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -815,4 +815,7 @@ MULTILIB_VARIANTS ??= ""
>  #
>  # ldconfig stuff
>  #
> +EXTRA_LDSOCONF ??= ""
> +LDSOCONF = "/lib /lib64 /usr/lib /usr/lib64"

is this going to exist always even when multilib is disbled ?
how about mips n32/o32/n64 all being in same rootfs

> +LSSOCONF += "${EXTRA_LDSOCONF}"
>  STAGING_LDSO_CONF_DIR = "${TMPDIR}/work-shared/ldconfig"
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

