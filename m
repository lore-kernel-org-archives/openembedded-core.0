Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A402C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 21:53:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.57464.1679522015973583701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 14:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DQa7cB6T;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A3BF720002;
	Wed, 22 Mar 2023 21:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679522014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RhBXUVVpq7yMj87hJmY+aErYyUtdX9sWKOkgmUdWOts=;
	b=DQa7cB6T0uC11kGmYDQuKS9uCKe95306g96NXqXTiISB3Qnsir2veIkLj1pA6A++yV8gL5
	BdHnv3dt4MrWM3/4chaJCHvwDmoIRMQCU3UEHletJQAWVOkOP1QZsILLCVfa0SpAipxvPj
	jf/s+q7ELGfvrp867ZcdfZOOkd5vpvZ/5wHbHeJqLPF2JAjfjLxIRMLTBw/XJcpzwL9Hvc
	ekHliTu5cQfQ0lrsApJSHeAUDwUxXC6VpfCQRlfemhAH2/SymjNRt1+I3p/6jtq1bNf7HM
	Lp6CoX8fhIIc/a0eUV/JdddWLMDW7wcNH4syaGDk+aoqLtAASzHYCuw4PtUhXA==
Date: Wed, 22 Mar 2023 22:53:33 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/2] debugedit: add recipe
Message-ID: <202303222153336e7e450d@mail.local>
References: <20230321154016.34836-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321154016.34836-1-Qi.Chen@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 21:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178963

Hello,

Unfortunately, this fails on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6868/steps/12/logs/stdio

On 21/03/2023 23:40:15+0800, Chen Qi wrote:
> This recipe provides find-debuginfo which is used by rpm, more
> specifically rpmbuild.
> 
> RPM upstream removed find-debuginfo and switched to use debugedit
> in the following commit.
> 
>   https://github.com/rpm-software-management/rpm/commit/04b0805a756cdd9466fb9dc717846f5bf15518cc
> 
> Without debugedit, rpmbuild fails to generate debuginfo package when
> %debug_package is added to spec file.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../debugedit/debugedit_5.0.bb                | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta/recipes-devtools/debugedit/debugedit_5.0.bb
> 
> diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> new file mode 100644
> index 0000000000..624adf0416
> --- /dev/null
> +++ b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "Tools for creating debuginfo and source file distributions"
> +DESCRIPTION = "debugedit provides programs and scripts for creating \
> +debuginfo and source file distributions, collect build-ids and rewrite \
> +source paths in DWARF data for debugging, tracing and profiling."
> +HOMEPAGE = "https://sourceware.org/debugedit/"
> +
> +LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> +                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
> +                    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz"
> +SRC_URI[sha256sum] = "e9ecd7d350bebae1f178ce6776ca19a648b6fe8fa22f5b3044b38d7899aa553e"
> +
> +DEPENDS = "elfutils"
> +
> +inherit pkgconfig autotools
> +
> +RDEPENDS:${PN} += "bash elfutils-binutils"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178889): https://lists.openembedded.org/g/openembedded-core/message/178889
> Mute This Topic: https://lists.openembedded.org/mt/97757563/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

