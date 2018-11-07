Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C32D79D71
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 09:09:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA799Jdn008634
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Nov 2018 01:09:19 -0800 (PST)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 7 Nov 2018 01:09:19 -0800
To: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>, OE Core mailing
	list <openembedded-core@lists.openembedded.org>
References: <20181107080011.1434-1-martin@geanix.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <57d7e0bc-1918-18a7-863c-9ec32ffb547c@windriver.com>
Date: Wed, 7 Nov 2018 17:15:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20181107080011.1434-1-martin@geanix.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH] shadow: improve reproducibility by hard-coding shell path
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
X-List-Received-Date: Wed, 07 Nov 2018 09:09:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/07/2018 04:00 PM, Martin Hundebøll wrote:
> The shadow configure script tries really hard to detect the running
> shell to make sure it doesn't do unsupported calls.
>
> On my system the shell is detected as /bin/sh, while a build in an
> ubuntu docker it resolves to /bin/bash. And since the shell path is
> baked into the target binaries through config.h, the build becomes
> inreproducible.
>
> Fix reproducibility by hard-coding the shell to be /bin/bash
>
> Signed-off-by: Martin Hundebøll <martin@geanix.com>
> ---
>
> I wasn't whether to use /bin/bash or /bin/sh; comments are welcome...
>
>   meta/recipes-extended/shadow/shadow.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> index 0fa80a282a..8eacca6809 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -45,6 +45,8 @@ PAM_SRC_URI = "file://pam.d/chfn \
>   
>   inherit autotools gettext
>   
> +export CONFIG_SHELL="/bin/bash"
> +
>   EXTRA_OECONF += "--without-audit \
>                    --without-libcrack \
>                    --without-selinux \

I'd suggest we use '/bin/sh', as long as it does not bring in any problem.

I noticed that the recipe has substitution in do_install.
         sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd

Best Regards,
Chen Qi

