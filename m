Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9D77460D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 13:14:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w66DET5H006861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 6 Jul 2018 14:14:30 +0100
Message-ID: <c2d5d5a57d805f3f1ac021e8e1171737892484ba.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: He Zhe <zhe.he@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 06 Jul 2018 14:14:29 +0100
In-Reply-To: <20180706094444.11006-1-zhe.he@windriver.com>
References: <20180706094444.11006-1-zhe.he@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] scripts/runqemu: fix qemumips qemumips64 memory detection kernel panic
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
X-List-Received-Date: Fri, 06 Jul 2018 13:14:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-07-06 at 02:44 -0700, He Zhe wrote:
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 597e7e9a799..a0c556b8728 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -669,7 +669,7 @@ class BaseConfig(object):
>              self.set('QB_MEM', '-m 512')
>  
>          mach = self.get('MACHINE')
> -        if mach != 'qemumips':
> +        if mach != 'qemumips' and mach != 'qemumips64' and mach != 'qemumipsel' and mach != 'qemumips64el':
>              self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
>  
>          self.qemu_opt_script += ' %s' % self.get('QB_MEM')

Could we not just do:

if not mach.startswith('qemumips'):

?

Cheers,

Richard

