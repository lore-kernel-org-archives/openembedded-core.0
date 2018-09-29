Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 39C66789FF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 14:17:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8TEHocn030254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 29 Sep 2018 15:17:51 +0100
Message-ID: <35422df46140ffbb6e2676691cd74a14a2a41013.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 29 Sep 2018 15:17:50 +0100
In-Reply-To: <20180928094813.10862-1-schnitzeltony@gmail.com>
References: <20180928094813.10862-1-schnitzeltony@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] image-buildinfo: drop more verbose build configuration
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
X-List-Received-Date: Sat, 29 Sep 2018 14:17:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-09-28 at 11:48 +0200, Andreas Müller wrote:
> * before DISTRO and DISTRO_VERSION were written only - this is not
> enough to
>   get a complete picture in which environmet an image was build. Now
> same
>   information as displayed on console is written.
> * code fragment was based on bass.bbclass
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
> 
> I know timing is not the best - we are already feature freezed. But I
> think it is an enhancement worth to have an exception...

It sounds good from the commit message but anyone IMAGE_BUILDINFO_VARS
or IMAGE_BUILDINFO_LVARS is going to find a significant change in
behaviour? At the point past feature freeze I'm not sure we can do
that...

Cheers,

Richard

>  meta/classes/image-buildinfo.bbclass | 28 ++++++++++++------------
> ----
>  1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/meta/classes/image-buildinfo.bbclass
> b/meta/classes/image-buildinfo.bbclass
> index 213fb9cf9b..fbb3188040 100644
> --- a/meta/classes/image-buildinfo.bbclass
> +++ b/meta/classes/image-buildinfo.bbclass
> @@ -15,18 +15,6 @@ IMAGE_BUILDINFO_VARS ?= "DISTRO DISTRO_VERSION"
>  # Desired location of the output file in the image.
>  IMAGE_BUILDINFO_FILE ??= "${sysconfdir}/build"
>  
> -# From buildhistory.bbclass
> -def image_buildinfo_outputvars(vars, listvars, d): 
> -    vars = vars.split()
> -    listvars = listvars.split()
> -    ret = ""
> -    for var in vars:
> -        value = d.getVar(var) or ""
> -        if (d.getVarFlag(var, 'type') == "list"):
> -            value = oe.utils.squashspaces(value)
> -        ret += "%s = %s\n" % (var, value)
> -    return ret.rstrip('\n')
> -
>  # Gets git branch's status (clean or dirty)
>  def get_layer_git_status(path):
>      import subprocess
> @@ -57,10 +45,18 @@ def buildinfo_target(d):
>          # Get context
>          if d.getVar('BB_WORKERCONTEXT') != '1':
>                  return ""
> -        # Single and list variables to be read
> -        vars = (d.getVar("IMAGE_BUILDINFO_VARS") or "")
> -        listvars = (d.getVar("IMAGE_BUILDINFO_LVARS") or "")
> -        return image_buildinfo_outputvars(vars, listvars, d)
> +        # taken from base.bbclass
> +        localdata = bb.data.createCopy(d)
> +        statuslines = []
> +        g = globals()
> +        func = 'buildcfg_vars'
> +        if func not in g:
> +            bb.warn("Build configuration function '%s' does not
> exist" % func)
> +        else:
> +            flines = g[func](localdata)
> +            if flines:
> +                statuslines.extend(flines)
> +        return ('\n%s\n' % '\n'.join(statuslines))
>  
>  # Write build information to target filesystem
>  python buildinfo () {
> -- 
> 2.14.4
> 

