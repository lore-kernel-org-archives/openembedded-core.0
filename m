Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web08.13780.1611074208639890796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 08:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4DKvSG0WC4z5tl9;
	Tue, 19 Jan 2021 17:36:45 +0100 (CET)
Date: Tue, 19 Jan 2021 17:36:44 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 1/5] wic: Ensure internal workdir is not reused
Message-ID: <20210119163644.bhwhbulrzxkhnjdf@qschulz>
References: <20210119162610.13104-1-pbarker@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20210119162610.13104-1-pbarker@konsulko.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Tue, Jan 19, 2021 at 04:26:06PM +0000, Paul Barker wrote:
> If a path is specified for the internal wic working directory using
> the -w/--workdir argument then it must not already exist. Re-using a
> previous workdir could easily result in rootfs and intermediate files
> from a previous build being added to the current image.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index b329568c7a..f107e60089 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -62,7 +62,7 @@ class DirectPlugin(ImagerPlugin):
>  
>          self.name = "%s-%s" % (os.path.splitext(os.path.basename(wks_file))[0],
>                                 strftime("%Y%m%d%H%M"))
> -        self.workdir = options.workdir or tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
> +        self.workdir = self.setup_workdir(options.workdir)
>          self._image = None
>          self.ptable_format = self.ks.bootloader.ptable
>          self.parts = self.ks.partitions
> @@ -78,6 +78,16 @@ class DirectPlugin(ImagerPlugin):
>          self._image = PartitionedImage(image_path, self.ptable_format,
>                                         self.parts, self.native_sysroot)
>  
> +    def setup_workdir(self, workdir):
> +        if workdir:
> +            if os.path.exists(workdir):
> +                raise WicError("Internal workdir '%s' specified in wic arguments already exists!" % (workdir))
> +
> +            os.makedirs(workdir)
> +            return workdir

os.makedirs already raises a FileExistsError if the directory exists, so
probably:

try:
    os.makedirs(workdir)
    return workdir
except FileExistsError:
    raise WicError("Internal workdir '%s' specified in wic arguments already exists!" % (workdir))

That being said, you could even not catch the exception? Don't know how
"normal" exceptions are handled by Yocto and the loggers though.

c.f. https://docs.python.org/3/library/os.html#os.makedirs the exist_ok
parameter.

> +        else:
> +            return tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
> +

Since the if condition returns in all cases, the indentation here is not
needed.

All nitpicks so not a blocker.

Cheers,
Quentin
