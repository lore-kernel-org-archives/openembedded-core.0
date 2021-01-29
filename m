Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web08.8539.1611920508438808706
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 03:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4DRwRF5VGlz5tlD;
	Fri, 29 Jan 2021 12:41:45 +0100 (CET)
Date: Fri, 29 Jan 2021 12:41:44 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lib/oe/patch.py: Don't return command stderr from runcmd function
Message-ID: <20210129114144.lvip5kzzoo2slhqr@qschulz>
References: <20210129113808.16982-1-tomasz.dziendzielski@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210129113808.16982-1-tomasz.dziendzielski@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tomasz,

On Fri, Jan 29, 2021 at 12:38:08PM +0100, Tomasz Dziendzielski wrote:
> If a function returns any stderr it will be passed to extractPatches and
> used as path to patch.
> 
> For example subprocess command output can be:
> | sh: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
> | /tmp/oepatchhuqle8fj/0001-foo.patch
> | /tmp/oepatchhuqle8fj/0002-bar.patch
> 
> that will result in:
> | FileNotFoundError: [Errno 2] No such file or directory: 'sh:'
> 
> To fix this I separated output, made the function return stdout and
> print stderr only in case of command error.
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  meta/lib/oe/patch.py | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 40755fbb03..8ad70f53f1 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -38,15 +38,19 @@ def runcmd(args, dir = None):
>          args = [ pipes.quote(str(arg)) for arg in args ]
>          cmd = " ".join(args)
>          # print("cmd: %s" % cmd)
> -        (exitstatus, output) = subprocess.getstatusoutput(cmd)
> +        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

I'd rather avoid having shell=True passed to Popen, read
https://docs.python.org/3/library/subprocess.html#security-considerations

Can't we just use args directly instead of cmd in Popen to avoid using
shell=True?

Cheers,
Quentin
