Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.769.1608316189051205718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 10:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mJ0+7BVN;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [PATCH 4/4] initscripts: Use initctl on sysvinit only
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608316188;
	bh=LzospuRPFpV9fgtgqYkTutwW+tRMN5+m1XlpJine5j8=;
	h=To:References:From:Date:In-Reply-To:From;
	b=mJ0+7BVNbf5i/8jbyxwWChERcdMC7IGDP92TY/4rLWiB1/gUIJUquYSsLHdhUXSD0
	 sbrxAkKCrZ8bQRGAykszaRjohLrWvaGAwam6R5pkHlE1xb2/N6U+wK+OBasxTS529X
	 VMs4fIiylyn9c6kcscihr4P5VvJo0e7mXj63T/PTEWnjxl0E/BLfLqjrTBcoF2XAWe
	 0rOGbAS/cI/Avefm8+ErX1njaC58jg7hq+jb5xMufPTnlsy2eq/nbGTaIRMBXSRRw9
	 evUjZwyML3Jdh+cX8ALUEU3SMPJrd3YHBn8Vbzpx66NLf+cAyNqfMLgWTLnVqoWRrt
	 5b6lKU1x/Xmgg==
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20201217225440.2633474-1-raj.khem@gmail.com>
 <20201217225440.2633474-4-raj.khem@gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <f888a821-9dd9-fd5c-5372-2e7e777adcb7@kernel.org>
Date: Fri, 18 Dec 2020 13:29:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201217225440.2633474-4-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/17/2020 5:54 PM, Khem Raj wrote:
> +if [ ! -p "$INITCTL" ] && [ "$(readlink -- "/sbin/init")" = "/sbin/init.sysvinit" ]; then

Can this be done at build time for targets using sysvinit only?

> +    # Create new control channel
> +		rm -f "$INITCTL"
> +		mknod -m 600 "$INITCTL" p
> +
> +		# Reopen control channel.
> +		PID="$(pidof -s /sbin/init || echo 1)"
> +		[ -n "$PID" ] && kill -s USR1 "$PID"
>  fi
> -kill -USR1 1

