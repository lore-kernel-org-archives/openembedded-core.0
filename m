Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 33FA970608
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 14:26:00 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id i13so3083817qae.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 07:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/J4L6KYpFDUSFdoG9OPGxOhCBWWzI59R5DROOcbPQ5s=;
	b=AqyWcoR2xRB4y/Ptisz6DrrEoCXBCHUBC+u9WJDXVnE2jYaV4ZQhg8UPQlWQWRpsU2
	R5qB058ilPw9mWFUUtQdl6rfdBfTjbnNVN9pb9Fy1nvYH/DIspCVyReJnwo5RJ7i3qE5
	+oOeR6WQVoXYWCrenHh/eYEDpkUwe4L1vfdOwfo7Rk5HCnAOsbt0PS4Ck3qoJpChlCwO
	tMAcjcPT6M1NNyxA8697tb2CsEoIDR5gjxLF2GtzNvJi2Y/FO52e4pl1i/cQugSzrQIX
	7J0TezpigJCgK7bnTGTJR4ycLPHI+7VEScsuafYbmP8Jx2CZxl0jpHDmFCIK+Nj3573T
	z88Q==
X-Gm-Message-State: ALoCoQl7h/fEbp85UIAcwzfsFiNm4zp+CVa/5f6HiWHa2whnEwUPVnGIG1d4iph7j3zl4Hn6OXtY
X-Received: by 10.140.35.232 with SMTP id n95mr8301249qgn.82.1405693559898;
	Fri, 18 Jul 2014 07:25:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Fri, 18 Jul 2014 07:25:39 -0700 (PDT)
In-Reply-To: <6cd5cf732c512dd0c5b6623742c8c0bbd2668513.1405689624.git.roxana.ciobanu@intel.com>
References: <cover.1405689624.git.roxana.ciobanu@intel.com>
	<6cd5cf732c512dd0c5b6623742c8c0bbd2668513.1405689624.git.roxana.ciobanu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Jul 2014 15:25:39 +0100
Message-ID: <CAJTo0LYypd-Di=2GY=kcmBBTi2zsAQ4NCX9Ep6zNef1kPi4fgQ@mail.gmail.com>
To: Roxana Ciobanu <roxana.ciobanu@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass/rootfs.py: add variables to rootfs[vardeps]
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
X-List-Received-Date: Fri, 18 Jul 2014 14:26:09 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2014 14:20, Roxana Ciobanu <roxana.ciobanu@intel.com> wrote:
> +def rootfs_variables(d):
> +    from oe.rootfs import variable_depends
> +    deps =  variable_depends(d)
> +    variables = "IMAGE_DEVICE_TABLES BUILD_IMAGES_FROM_FEEDS IMAGE_TYPEDEP_ IMAGE_TYPES_MASKED IMAGE_ROOTFS_ALIGNMENT
[snip]
NO_RECOMMENDATIONS PACKAGE_ARCHS PACKAGE_CLASSES "
> +    # keep line under 998 characters
> +    variables += "TARGET_VENDOR TARGET_VENDOR TARGET_ARCH TARGET_OS OVERRIDES BBEXTENDVARIANT FEED_DEPLOYDIR_BASE_URI INTERCEPT_DIR BUILDNAME USE_DEVFS STAGING_KERNEL_DIR COMPRESSIONTYPES"
> +    return ' '.join([variables, deps])

So a neater way of doing this would be to do:

  variables = ['BUILD_IMAGES_FROM_FEEDS', 'PACKAGE_ARCHS', (etc)]

This list can be wrapped appropriately so that it doesn't take up a
few pages and also isn't a single massive line.

Then add the variable from the rootfs with:

  variables.extend(variable_depends())
  return " ".join(variables)

> +def variable_depends(d, manifest_dir=None):
> +    img_type = d.getVar('IMAGE_PKGTYPE', True)
> +    cls = get_class_for_type(img_type)
> +    return " ".join(cls._depends_list())

If the above change happens then this should return the list, not a
joined string.

Ross

