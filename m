Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0447377E8C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Apr 2017 07:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v317JejV022367; 
	Sat, 1 Apr 2017 08:19:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q7uT-wSQVcLk; Sat,  1 Apr 2017 08:19:39 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v317JVAK022360
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 1 Apr 2017 08:19:36 +0100
Message-ID: <1491031171.13980.377.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	openembedded-core@lists.openembedded.org, liezhi.yang@windriver.com,
	ross.burton@intel.com
Date: Sat, 01 Apr 2017 08:19:31 +0100
In-Reply-To: <20170324203858.27464-2-alistair.francis@xilinx.com>
References: <20170324203858.27464-1-alistair.francis@xilinx.com>
	<20170324203858.27464-2-alistair.francis@xilinx.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 2/2] runqemu: Add a background command option
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
X-List-Received-Date: Sat, 01 Apr 2017 07:19:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-03-24 at 13:38 -0700, Alistair Francis wrote:
> This allows callers to specify commands that should be run in the
> background
> while running QEMU. This can be specified by assigning the commands
> to the
> 'QB_BACKGROUND_COMMAND' varialbe in the machine conf.
> 
> This is useful for starting automated debugging instances, automated
> testing instances (using QMP) or other servers/clients that QEMU can
> connect to.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  scripts/runqemu | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index f76d976..b5cc56a 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1118,6 +1118,13 @@ class BaseConfig(object):
>                  kernel_opts += " -dtb %s" % self.dtb
>          else:
>              kernel_opts = ""
> +        background_cmd = self.get('QB_BACKGROUND_COMMAND')
> +
> +        if background_cmd:
> +            logger.info('Running in the background %s' %
> background_cmd)
> +            if subprocess.call(background_cmd + ' &', shell=True) !=
> 0:
> +                raise Exception('Failed to run %s' % cmd)
> +

I have to admit I'm rather unsure about this. What cleans up this
process when runqemu finishes?

We tend to run into a lot of issues around cleanup and a subprocess
using "&" doesn't sound too attractive given the general issues we run
into.

Cheers,

Richard

