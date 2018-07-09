Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 000B974D41
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 03:13:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w693D4Fi021253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Jul 2018 20:13:04 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 8 Jul 2018 20:13:03 -0700
To: <andreas.kling@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20180707122840.31909-1-andreas.kling@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <65520c34-cddd-860f-84a4-e2bc0c0c1daa@windriver.com>
Date: Mon, 9 Jul 2018 11:16:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180707122840.31909-1-andreas.kling@gmail.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH] systemd: fix missing path separator in firmware-path
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
X-List-Received-Date: Mon, 09 Jul 2018 03:13:04 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andreas,

I'm OK with this patch.

I'm interested in your environment. Could you please give me some more 
details about why you need this userspace firmware loading mechanism?

I'm upgrading systemd to 239, and I'm going to remove this option in 239.
The reason is that systemd's minimal kernel requirement is 3.13, and 
userspace firmware loading is needed before kernel 3.7. I just checked 
237, its minimal requirement is also 3.13.

The userspace firmware loading support has been removed from udev for 
several years. It's said that using userspace firmware loading is slow, 
and kernel has been able to do this for a long time.

So could you please give me some details about your environment? Is 
there some compelling reason to use userspace firmware loading 
mechanism? This would help me to check if we should keep local patches 
with more details updated in them.

Best Regards,
Chen Qi



On 07/07/2018 08:28 PM, andreas.kling@gmail.com wrote:
> From: Andy Kling <andreas.kling@peiker-cee.de>
>
> udev fails to load firmware for CONFIG_FW_LOADER_USER_HELPER
> systemd-udevd[158]: did not find firmware file 'xxx'
>
> function builtin_firmware currently assumes FIRMWARE_PATH ends with "/"
> fixing the path passed to meson allows the firmware loader to succeed.
> systemd-udevd[145]: writing '/lib/firmware/xxx'
>
> Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
> ---
>   meta/recipes-core/systemd/systemd_237.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
> index 3efca33e73..8ff049160b 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_237.bb
> @@ -185,7 +185,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
>                     -Drootlibdir=${rootlibdir} \
>                     -Drootprefix=${rootprefix} \
>                     -Dsysvrcnd-path=${sysconfdir} \
> -                  -Dfirmware-path=${nonarch_base_libdir}/firmware \
> +                  -Dfirmware-path=${nonarch_base_libdir}/firmware/ \
>                     "
>   
>   # Hardcode target binary paths to avoid using paths from sysroot



