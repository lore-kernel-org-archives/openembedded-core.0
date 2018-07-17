Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ACFEA78869
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 01:54:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6H1s8ox015179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 18:54:08 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 16 Jul 2018 18:54:07 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20180716225009.3403-1-alistair.francis@wdc.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <b562af34-25d1-67e5-0eb5-8de62a8b3e2e@windriver.com>
Date: Tue, 17 Jul 2018 09:57:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180716225009.3403-1-alistair.francis@wdc.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH] systemd: Enable coredump if it is in PACKAGECONFIG
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
X-List-Received-Date: Tue, 17 Jul 2018 01:54:08 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alistair,

I don't think this file needs to be modified. And you are uncommenting 
the default values. The behavior is expected to remain the same.

Also, I just did a quick test with coredump enabled and things were 
working correctly.

Best Regards,
Chen Qi

On 07/17/2018 06:50 AM, Alistair Francis wrote:
> Previously if coredump was enabled in PACKAGECONFIG the user would still
> need to modify the conf file to enable it. Now the config will be
> enabled if coredump is enalbed in the PACKAGECONFIG.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   .../systemd/systemd/coredump.conf             | 21 +++++++++++++++++++
>   meta/recipes-core/systemd/systemd_237.bb      |  5 +++++
>   2 files changed, 26 insertions(+)
>   create mode 100644 meta/recipes-core/systemd/systemd/coredump.conf
>
> diff --git a/meta/recipes-core/systemd/systemd/coredump.conf b/meta/recipes-core/systemd/systemd/coredump.conf
> new file mode 100644
> index 0000000000..4cbc19cdc5
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/coredump.conf
> @@ -0,0 +1,21 @@
> +#  This file is part of systemd.
> +#
> +#  systemd is free software; you can redistribute it and/or modify it
> +#  under the terms of the GNU Lesser General Public License as published by
> +#  the Free Software Foundation; either version 2.1 of the License, or
> +#  (at your option) any later version.
> +#
> +# Entries in this file show the compile time defaults.
> +# You can change settings by editing this file.
> +# Defaults can be restored by simply deleting this file.
> +#
> +# See coredump.conf(5) for details.
> +
> +[Coredump]
> +Storage=external
> +Compress=yes
> +ProcessSizeMax=2G
> +ExternalSizeMax=2G
> +#JournalSizeMax=767M
> +#MaxUse=
> +#KeepFree=
> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
> index 3efca33e73..db2848fd65 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_237.bb
> @@ -276,6 +276,11 @@ do_install() {
>   			chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>   		fi
>   	fi
> +
> +  # If coredump was enalbed, enable it in the config
> +  if ${@bb.utils.contains('PACKAGECONFIG', 'coredump', 'true', 'false', d)}; then
> +    install -Dm 0755 ${FILE_DIRNAME}/${BPN}/coredump.conf ${D}${sysconfdir}/systemd/
> +  fi
>   }
>   
>   



