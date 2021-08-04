Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.6794.1628070309735585573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 02:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A69AB240005;
	Wed,  4 Aug 2021 09:45:07 +0000 (UTC)
Subject: Re: [OE-core][PATCH] runqemu: decouple bios and kernel options
To: Matthias Klein <matthias@extraklein.de>,
 openembedded-core@lists.openembedded.org
References: <20210804085355.1951-1-matthias@extraklein.de>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <c11e0a9d-c446-7305-e654-26d582d82573@bootlin.com>
Date: Wed, 4 Aug 2021 11:45:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804085355.1951-1-matthias@extraklein.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/4/21 10:53 AM, Matthias Klein wrote:
> This will allow the use of a bios (e.g. U-Boot) in combination with
> a WIC file (from which U-Boot loads the kernel).
>
> Signed-off-by: Matthias Klein <matthias@extraklein.de>
> ---
>  scripts/runqemu | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 9c92eec030..0976273eb0 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1443,12 +1443,14 @@ class BaseConfig(object):
>              kernel_opts = "-kernel %s -append '%s %s %s %s'" % (self.kernel, self.kernel_cmdline,
>                                                                  self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'),
>                                                                  self.bootparams)
> -            if self.bios:
> -                kernel_opts += " -bios %s" % self.bios
>              if self.dtb:
>                  kernel_opts += " -dtb %s" % self.dtb
>          else:
>              kernel_opts = ""
> +
> +        if self.bios:
> +            self.qemu_opt += " -bios %s" % self.bios
> +
>          cmd = "%s %s" % (self.qemu_opt, kernel_opts)
>          cmds = shlex.split(cmd)
>          logger.info('Running %s\n' % cmd)


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Thanks!

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

