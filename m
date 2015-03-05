Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 327DA7388F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:28:05 +0000 (UTC)
Received: by lbdu14 with SMTP id u14so30492543lbd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 06:28:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=212JU/4sKVxQGWxST44G8fVlY2+bR6coClgOlLSeOH8=;
	b=h1OWvBQFQFw+vv8CxYFYrNtTvxmVZMvOePO7TafXORVSm/6pIO7c5P394yl8J+7MOg
	bganflU54tzlLBqCs2Mrpoc6LhZp4vlgeeMGJ86j2vXZhR2y/+j8yKIIoIjvGJehYGhI
	/u1jr5UIG9G0kdryWJnYhRt5IVAJxBQ4pPTh/tPgjRpZpVHKTS0jTYWS5Z/auRQtw3LH
	DIOLQ2tobqqRtUBP8CjXMr/ltsqZeovcF2RLZVAgydhguLuxVWSMWrqVdAp/v1kJ0SAo
	u6+4eASVGNTC2AhYsBBdr2NadpAlNoBdh7/UmQMP4KC2hKbSJarIERFzzDtf4JDCLn4Z
	1JmQ==
X-Gm-Message-State: ALoCoQkooh3amLvB3qF+dCtVyHNQzjSQRRNtV9AivJNKTvTOk2SMfQgvnR9pmRp+9TDpW1hTt9Zt
X-Received: by 10.152.25.132 with SMTP id c4mr8170453lag.101.1425565685810;
	Thu, 05 Mar 2015 06:28:05 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id ei4sm168376lad.31.2015.03.05.06.28.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 06:28:04 -0800 (PST)
Date: Thu, 5 Mar 2015 15:28:02 +0100
From: Anders Darander <anders@chargestorm.se>
To: Bruno Bottazzini <bruno.bottazzini@intel.com>
Message-ID: <20150305142802.GA6833@ad.chargestorm.se>
Mail-Followup-To: Bruno Bottazzini <bruno.bottazzini@intel.com>,
	openembedded-core@lists.openembedded.org
References: <bruno.bottazzini@intel.com>
	<1425504462-6979-1-git-send-email-bruno.bottazzini@intel.com>
	<1425504462-6979-4-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
In-Reply-To: <1425504462-6979-4-git-send-email-bruno.bottazzini@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] systemd: split modules into packages
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
X-List-Received-Date: Thu, 05 Mar 2015 14:28:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Bruno Bottazzini <bruno.bottazzini@intel.com> [150304 22:28]:
> if one wants to launch a simple deamon, most modules are not
> required.
> He will be able to save space and exclude unwanted packages
> from the final image.
> ---
>  meta/recipes-core/systemd/systemd_219.bb | 1071 ++++++++++++++++++++++++++----
>  1 file changed, 942 insertions(+), 129 deletions(-)

> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index 6a8b5b8..fd6cf57 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -56,10 +56,31 @@ LDFLAGS_append_libc-uclibc = " -lrt"

>  GTKDOC_DOCDIR = "${S}/docs/"

> -PACKAGECONFIG ??= "xz \
> +DEPENDS += "curl"
> +
> +PACKAGECONFIG ??= "acl \
> +                   blkid \
> +                   efi \
> +                   kmod \
> +                   gcrypt \
> +                   lz4 \
> +                   xz \
> +                   libidn \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"

Just a quick question before I look into the patch in more detail.

Is the new setting of PACKAGECONFIG consistent with how systemd was
built previously? I guess it is.

Another comment, you should remove the dependcies that gets added using
PACKAGECONFIG from DEPENDS, e.g. acl etc. (Or are they required
nevertheless?)

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

