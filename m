Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4FCC433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 12:46:54 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.5825.1637585213467250586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 04:46:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XCsRJbMP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id o29so15230178wms.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 04:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=e7MNmFijWCViBZVd2kUUNTqTbeA2VtVtrNf2G26hEbI=;
        b=XCsRJbMPxpHDIrY4fIVfoGl1106RwamjiPOeP3D6IECfdETsrvwKUML172pLOKtDL1
         +IBI2RT7T0VzMCcEirCG95WP525ZqaKk15M73SGPn710/jxAJUV11ftJ4DZgN5WOjISd
         IFPlCIXRcIRs1OEgeyoVA3O5Y74aS/JJd2ts8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=e7MNmFijWCViBZVd2kUUNTqTbeA2VtVtrNf2G26hEbI=;
        b=Kt7cP6srmGS7NN5ACm6ZTuHBU6gCetThHLoL8tfILvybeSLPGj7uBP4JLlKHUcb0hi
         iMYO2xs61SD2r/OtFB93J6bpcNGmcGmK6USS0vhumoFDUyBYM1FGWdgGyBRWxUkNb7Fn
         +ONzVv3XmBguQDbVNtXYQFBT9Gluvk77TV8ybf8gdbc77Qfv6jZyJc0wQfjyfETr/lDz
         ynj9Be1X5fzJzXC5isuQhFP3BMCs0lPTvJ3NfyLbQWkn+VHDN1G9S0kaHuJ5wvgFb3yD
         +WBKGwSeJfBfUsQcealtbn06zK4lcZnpj//M24YBF+S73yrqE1IvNyVnAXRP3BWoAQAN
         Bq+w==
X-Gm-Message-State: AOAM531xw7oT9eqogljZUbND3EsQUGor63S3phdoNEdUbmSrwYUu2/Pe
	czwHuuYvwrNwZy8inTzucPargQ==
X-Google-Smtp-Source: 
 ABdhPJxAXC+vzdlDYBEpoRP1MkK6axgD33EAYGgM0N+5GHaw/UstXJOLSi5tW5jZ+nBXjXva4zAVvw==
X-Received: by 2002:a05:600c:4fc3:: with SMTP id
 o3mr29311230wmq.74.1637585211871;
        Mon, 22 Nov 2021 04:46:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e31:269d:c208:4e1f?
 ([2001:8b0:aba:5f3c:e31:269d:c208:4e1f])
        by smtp.gmail.com with ESMTPSA id
 e7sm11205124wrg.31.2021.11.22.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 04:46:51 -0800 (PST)
Message-ID: 
 <0e7c2b9d388d01ab7e304b9664ae6501998f93e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/7] systemd: skip chown when building for
 nativesdk
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Date: Mon, 22 Nov 2021 12:46:50 +0000
In-Reply-To: <20211119113429.502652-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211119113429.502652-1-luca.boccassi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 12:46:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158568

On Fri, 2021-11-19 at 11:34 +0000, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> The useradd class is a no-op in the nativesdk case, so chown will fail.
> Skip them.
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: use "${PN}" = "${BPN}" as suggested by reviewers

I think that was bad advice since this would break multilib variants of the
systemd recipe and I'd much prefer this was conditional on nativesdk.

>  meta/recipes-core/systemd/systemd_249.5.bb | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
> index 8bdc0ca028..2df2de0cf3 100644
> --- a/meta/recipes-core/systemd/systemd_249.5.bb
> +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> @@ -275,7 +275,10 @@ do_install() {
>  		# which is expected to be empty.
>  		rm -rf ${D}${localstatedir}/log
>  	else
> -		chown root:systemd-journal ${D}${localstatedir}/log/journal
> +		# The useradd class is a no-op in the nativesdk case, so chown will fail
> +		if [ "${PN}" = "${BPN}" ]; then
> +			chown root:systemd-journal ${D}${localstatedir}/log/journal
> +		fi
>  
>  		# journal-remote creates this at start
>  		rm -rf ${D}${localstatedir}/log/journal/remote


I'm guessing this is only failing on systems that don't have a systemd-jounral
group as it built ok for me?

The better way to fix this is probably to replicate what we have for native,
i.e. the entry in the class:

native.bbclass:PATH:prepend = "${COREBASE}/scripts/native-intercept:"

which puts a chown and chgrp into PATH which doesn't do anything. We could do
something similar for nativesdk and it would avoid the need for these if
statements and solve the problem generically.

I am also a bit concerned about some of the other "creeping" dependencies so I
experimented a little with master to see how much it could be cut down. I could
get working builds with the lines below:

"""
PACKAGECONFIG:remove:class-native = "vconsole xkbcommon sysvinit"
PACKAGECONFIG:append:class-native = " serial-getty-generator"
RDEPENDS:${PN}:remove:class-native = "volatile-binds"
RRECOMMENDS:${PN}:remove:class-native = "os-release systemd-conf"
RRECOMMENDS:${PN}-vconsole-setup:class-native = ""

PACKAGECONFIG:remove:class-nativesdk = "vconsole xkbcommon sysvinit"
PACKAGECONFIG:append:class-nativesdk = " serial-getty-generator"
RDEPENDS:${PN}:remove:class-nativesdk = "volatile-binds"
RRECOMMENDS:${PN}:remove:class-nativesdk = "os-release systemd-conf"
RRECOMMENDS:${PN}-vconsole-setup:class-nativesdk = ""

# Nothing picks up /var in the nativesdk case
do_install:append:class-nativesdk () {
       rm -rf ${D}/var
}

BBCLASSEXTEND = "native nativesdk"
"""

which removes the need to change os-release, kbd, systemd-conf and systemd-
getty. To merge, we'd want to restructure this to alter the variable
construction so we can avoid the use of the remove operator but it is an easy
way to test and evaluate the extent of changes needed.

The above also nearly has native builds working as well. To get that to build I
had to patch meson.build:

Index: git/meson.build
===================================================================
--- git.orig/meson.buildIndex: git/meson.build
===================================================================
--- git.orig/meson.build
+++ git/meson.build
@@ -745,7 +745,7 @@ conf.set('CONTAINER_UID_BASE_MAX', conta
 nobody_user = get_option('nobody-user')
 nobody_group = get_option('nobody-group')
 
-if not meson.is_cross_build()
+if false and not meson.is_cross_build()
         getent_result = run_command('getent', 'passwd', '65534')
         if getent_result.returncode() == 0
                 name = getent_result.stdout().split(':')[0]

since we want to use the "cross" codepath there regardless. That lets everything
build but I did then see errors due to absolute path symlinks which would likely
be fixable.

I did this mainly as I wanted to understand how much of systemd is being build
and packaged since many of these packages will not make sense in a SDK or a
native build. I think the final piece of patch which we'd need to be able to
merge something like this is to trim down what is being packaged up to the
pieces which are actually useful in the native or nativesdk cases.

Cheers,

Richard






