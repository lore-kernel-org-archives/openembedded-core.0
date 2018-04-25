Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 179C871BA1;
	Wed, 25 Apr 2018 13:51:25 +0000 (UTC)
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3CD5C21759;
	Wed, 25 Apr 2018 13:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD5C21759
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
Received: by mail-wr0-f172.google.com with SMTP id o15-v6so53416656wro.11;
	Wed, 25 Apr 2018 06:51:26 -0700 (PDT)
X-Gm-Message-State: ALQs6tCFuAWyerv95U3jkapZc1bxZSW4r15x9fPU85S7fVM63iABEB1g
	Fq4cGMkDmS2P50OCMyazWy/cVEctHYFDEXJ0kCA=
X-Google-Smtp-Source: AB8JxZoigSV/TxkWDCPhXVU48kQTfoBB5ZLLPTjKd+ELDWsLwfgXukVzdvN08N0eQ/BGqUq9w4vEjOWu0rnru71kbN8=
X-Received: by 2002:adf:a075:: with SMTP id
	l50-v6mr2231281wrl.227.1524664284736; 
	Wed, 25 Apr 2018 06:51:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.199.7 with HTTP; Wed, 25 Apr 2018 06:51:24 -0700 (PDT)
In-Reply-To: <1524664054-21717-1-git-send-email-krzk@kernel.org>
References: <1524664054-21717-1-git-send-email-krzk@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 25 Apr 2018 15:51:24 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe0SWcHYxKjKUsiAT+YMJFsjWzroguaO8aQO69T=cTkgg@mail.gmail.com>
Message-ID: <CAJKOXPe0SWcHYxKjKUsiAT+YMJFsjWzroguaO8aQO69T=cTkgg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [meta-networking][rocko][PATCH 1/2] kernel_wireless_regdb: Add class for embedding regulatory data into the kernel
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
X-List-Received-Date: Wed, 25 Apr 2018 13:51:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 25, 2018 at 3:47 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Small embedded systems might:
> 1. Want to get rid of daemons as much as possible (therefore be built
>    without CRDA),
> 2. Not receive user-space incremental updates but an entire system
>    upgrade (with kernel).
>
> Add class kernel_wireless_regdb which allows in such cases to embed the
> wireless regulatory database directly in the Linux kernel during build
> process.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  meta-networking/classes/kernel_wireless_regdb.bbclass        | 12 ++++++++++++
>  .../wireless-regdb/wireless-regdb_2016.06.10.bb              |  8 ++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta-networking/classes/kernel_wireless_regdb.bbclass
>
> diff --git a/meta-networking/classes/kernel_wireless_regdb.bbclass b/meta-networking/classes/kernel_wireless_regdb.bbclass
> new file mode 100644
> index 000000000000..6ae90d2d088c
> --- /dev/null
> +++ b/meta-networking/classes/kernel_wireless_regdb.bbclass
> @@ -0,0 +1,12 @@
> +# Copies the regulatory plaintext database to kernel sources before compiling.
> +# Linux kernel must be compiled with CONFIG_CFG80211_INTERNAL_REGDB to use it.
> +
> +DEPENDS += "wireless-regdb-native"
> +
> +SRCTREECOVEREDTASKS += "do_kernel_add_regdb"
> +do_kernel_add_regdb() {
> +    cp ${STAGING_LIBDIR_NATIVE}/crda/db.txt ${S}/net/wireless/db.txt
> +    echo ${S}

Ah, some debugging code slipped in. I'll send v2.

Best regards,
Krzysztof

