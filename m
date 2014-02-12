Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id B6CBF6E903
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 08:03:44 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id e4so1209262wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 00:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=n/0Kq0U0CWWYo/nO9N7A2dTpEJmnkvA0IwfwzsbB17k=;
	b=LH65lxkRtBB5L1fc70BafCFgDb9+5rye8amYNuSni/8Gg02bb7A3UGYZKxkmheeu5W
	r3eq8qu0UKKo+Unqxext/WHQZOROkiJ/YfZEmgHfHZPKQJkCwKj+pFyfWwLZxf/nc0ep
	+4W5vbkviXysGhZq7S9jaLwl5czExyJjrs/p2ZYTzfVaq5DddXdkbVnVHrPpImS8l8+h
	/CBOoD+bGnX6vD0mZtzHkHy9Li0jkx7kBTv+4lbJNIvaUcIV3z3v52lNGesJRZrjCtTB
	1PEq7tKZmfH5BAXCXCzfZ+64lSGKrcNuP0x7sPK2sTd75sj4ZUntaBl3smsNEijjiJX7
	roCw==
X-Gm-Message-State: ALoCoQn7eIG08fkcL830Oh9ftIfa9rZ6X3skKLharBOlQjLi6oJrllK7IqvEVJ289xifDnwiieHz
X-Received: by 10.180.96.102 with SMTP id dr6mr936585wib.19.1392192224983;
	Wed, 12 Feb 2014 00:03:44 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	ha1sm50329592wjc.23.2014.02.12.00.03.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 00:03:44 -0800 (PST)
Message-ID: <52FB2ADF.70209@linaro.org>
Date: Wed, 12 Feb 2014 09:03:43 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
In-Reply-To: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
Subject: Re: [PATCH] grub git: workaround debugedit problems for 64 bit targets
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
X-List-Received-Date: Wed, 12 Feb 2014 08:03:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/15/2014 11:15 AM, Koen Kooi wrote:
> I've limited it to 64bit targets, but to be honest debug splitting doesn't make sense for grub since it won't run in your rootfs and attaching gdb is pretty much impossible.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>   meta/recipes-bsp/grub/grub_git.bb | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
> index 1796e7f..bc79cfa 100644
> --- a/meta/recipes-bsp/grub/grub_git.bb
> +++ b/meta/recipes-bsp/grub/grub_git.bb
> @@ -51,8 +51,13 @@ do_configure_prepend() {
>   do_install_append () {
>       install -d ${D}${sysconfdir}/grub.d
>       install -m 0755 ${WORKDIR}/40_custom ${D}${sysconfdir}/grub.d/40_custom
> +
>   }
>
> +# debugedit chokes on 64 bit platforms
> +INHIBIT_PACKAGE_DEBUG_SPLIT_aarch64 = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT_x86-64 = "1"
> +
>   RDEPENDS_${PN} = "diffutils freetype"
>   FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
>
>

Since the package.bbclass change went in yesterday: ping


-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

