Return-Path: <matthias.schiffer@ew.tq-group.com>
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
	by mail.openembedded.org (Postfix) with ESMTP id 637EA60248
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 13:54:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,440,1544482800"; 
   d="scan'208";a="6468865"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
	by mx1-pgp.tq-group.com with ESMTP; 04 Mar 2019 14:54:41 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
	by tq-pgp-pr1.tq-net.de (PGP Universal service);
	Mon, 04 Mar 2019 14:54:41 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Mon, 04 Mar 2019 14:54:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
	t=1551707681; x=1583243681;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=il1QEgZuXizhnhChi8R2wNKTuFjcvLOo8++tE6nTM3w=;
	b=ER8Q1pzAqX5Dwq78jYPNcrZpCpEYivK6l3fPqK21J3rRvfGQ6LDmddGY
	FNHAelK4o7B1mzJ+xJNETQxe/OtqSGIRaErnhlh56ySDo4T+YFh5SsI1Y
	kNL+J8RN0lNTQWsfqsteOaLzbk/KNkDWLgnsdRoUZCKBmyorDOOb/M+2G
	FNjyh/1QsQYOZ3TfDJ3R7sd1O1s5GQPpHZv9LkwZEaKna9gfGaEUG/5Dx
	0Cvr1Vyojw0Jc0xK6jAbpUTtwD3yL+xYiUQVG5czxnrA86pOsROSainxP
	Zx8gl5wkdHFJgOVi/vb8nwAfp1BpxKf7yNB6HlvVxdhdq4i6tRInRSbHI A==;
X-IronPort-AV: E=Sophos;i="5.58,440,1544482800"; 
   d="scan'208";a="6468863"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
	by mx1.tq-group.com with ESMTP; 04 Mar 2019 14:54:40 +0100
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
	[10.117.49.26])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 40E51280074;
	Mon,  4 Mar 2019 14:54:53 +0100 (CET)
Message-ID: <56e13cae6367d883f5c07c6adb683e2c0d772889.camel@ew.tq-group.com>
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 04 Mar 2019 14:54:38 +0100
In-Reply-To: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
References: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] target-sdk-provides-dummy: Extend to -dev and -src packages
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
X-List-Received-Date: Mon, 04 Mar 2019 13:54:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-15 at 16:03 +0000, Richard Purdie wrote:
> This avoids errors when running populate_sdk under opkg:
> 
>  * Problem 1/1:
>  *   - package busybox-dev-1.30.1-r0.core2-64 requires busybox =
> 1.30.1-r0, but none of the providers can be installed
>  *
>  * Solution 1:
>  *   - allow deinstallation of target-sdk-provides-dummy-1.0-r0.sdk-
> provides-dummy-target
> 
>  * Solution 2:
>  *   - do not ask to install a package providing busybox-dev
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Hi,
is this patch going to be backported to thud?


Kind regards,
Matthias



> ---
>  meta/recipes-core/meta/target-sdk-provides-dummy.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> index 26716ace87b..60499f7b66a 100644
> --- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> @@ -2,9 +2,17 @@ DUMMYARCH = "sdk-provides-dummy-target"
>  
>  DUMMYPROVIDES = "\
>      busybox \
> +    busybox-dev \
> +    busybox-src \
>      coreutils \
> +    coreutils-dev \
> +    coreutils-src \
>      bash \
> +    bash-dev \
> +    bash-src \
>      perl \
> +    perl-dev \
> +    perl-src \
>      perl-module-re \
>      perl-module-strict \
>      perl-module-vars \
> @@ -36,6 +44,8 @@ DUMMYPROVIDES = "\
>      /usr/bin/env \
>      /usr/bin/perl \
>      pkgconfig \
> +    pkgconfig-dev \
> +    pkgconfig-src \
>  "
>  
>  require dummy-sdk-package.inc
> -- 
> 2.20.1
> 


