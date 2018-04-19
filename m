Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id D67B974562
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 10:29:28 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id p33-v6so5256398otp.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 03:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oS9S9w2yu3QjPVvR+8Nd0thAQGUfg2/bCt+sT9uFCGk=;
	b=x3FiljfTpQL1SbhXxkiDKsCYl6xtMZ5wYDc3ZUVHdWVXdunhsdoEXuHjNNlStPZY5n
	nqHMQ1ml1mjmJ4a6UsOdaZ8L1hNF4FRFjB6tED6YSay6+o4yGacdHXhl7DKIc3G+Escn
	6+X6Qu929Gt6Mhule2v5SkRjO4cNtwokiZ1HC5LgD/nrriq5ahPLQuYd6Grv9OWwVTd+
	UeXp6cKHf/vlIPJgMrVlc2ZpzZd4pC31XVcoO3ggdiXqnLj57zpARG52vGh+VuuPm/2u
	/bc9lN0qrb+nNvpuCfza3xnfgfhpkMAMmc7oGTSdKjCtRdoqBdYzlZLfxfkqqkKBuNWU
	eI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oS9S9w2yu3QjPVvR+8Nd0thAQGUfg2/bCt+sT9uFCGk=;
	b=GE1r3RdR94LH+Nx5LldnB3nELYo1V8Gf1EOhZsJn1JYnRal8GFEXHAEaBj1rXHoz+y
	lHFVASFaEm+E7Z72OutkDWUYAP6ZYNDZfikegXICSMmAmEdHvXBh+70A69HMsKyTUkMR
	Kum0+8IFE6C3VPHEkIMj1DqenWX/lKSoJOFuUAEq044kj4XJaDSiEdKtI8ckENiPa1W3
	UzM3P5yp4CdSRxC2H2VOdHxTcMlM7hhBQsXUJw0p3hnyYo2Gt6n1ZtgwxDzvMN6WHydj
	Hvr6pf+ydpakhTnAKucV7JEGyAEboXB7fnxKSZ/46nzm1Ll/1h39Gy9kvdzCN6jYFDE5
	q0KA==
X-Gm-Message-State: ALQs6tC/Gs6uovi22P6BKSyz+955nCnATIsI5k3HgUdOQIh0+4Z4QngN
	RSMArqTNJGpQJBv65cy7ksN29YML8c3G15A8PXD08w==
X-Google-Smtp-Source: AIpwx4/VKcQX1PXVlAnHHDW2Hs8xUVVgxk0sdUsOFEeqzayQUmoILSF9n//FvMxq2fek3wro92vDLxEwcRV3rEocT24=
X-Received: by 2002:a9d:1831:: with SMTP id
	b46-v6mr3334371ote.135.1524133769498; 
	Thu, 19 Apr 2018 03:29:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Thu, 19 Apr 2018 03:29:08 -0700 (PDT)
In-Reply-To: <1524116800-25332-1-git-send-email-chin.huat.ang@intel.com>
References: <1524116800-25332-1-git-send-email-chin.huat.ang@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Apr 2018 11:29:08 +0100
Message-ID: <CAJTo0LYt+=aqyHHE9p6LzVHSXDHq57-_JB3R5CXkgfgfwhta3w@mail.gmail.com>
To: Chin Huat Ang <chin.huat.ang@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toolchain-scripts: preserve host path in environment setup script
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
X-List-Received-Date: Thu, 19 Apr 2018 10:29:29 -0000
Content-Type: text/plain; charset="UTF-8"

That would mean that the environment script has the *build system*
PATH on, when the intention here is to extend the *users* PATH.

The solution here would be to do:

  echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:$PATH' >> $script

Bitbake only expands ${FOO} and not $FOO, so $PATH won't be expended
until the user runs the script.

Ross

On 19 April 2018 at 06:46, Chin Huat Ang <chin.huat.ang@intel.com> wrote:
> The environment setup script generated in the build directory has host paths
> filtered, sourcing this script will break runqemu as it requires host
> /bin/stty. To resolve this, the script generation now sets the PATH variable
> to include the original values obtain from BB_ORIGENV.
>
> [YOCTO #12695]
>
> Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
> ---
>  meta/classes/toolchain-scripts.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index eeb320d..75f76d9 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -62,7 +62,7 @@ toolchain_create_tree_env_script () {
>         script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
>         rm -f $script
>         touch $script
> -       echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
> +       echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${@d.getVar("BB_ORIGENV", False).getVar("PATH", False)}' >> $script
>         echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
>         echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
>         echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

