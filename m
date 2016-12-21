Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 87DE97747C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 17:16:41 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id a197so154091802wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 09:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lrCMkzjkpUadctYPWccZRtXi+xIuuumCt+mlGx5ayHw=;
	b=WgAQiS+zjSBeMZrA04SRZ+bemgJOheUVrMPRgkj6oCrhYImJ2oDUj7UCOyrTubA9ku
	UhDoBvF0mhuZkpHogKJfV/iCOQZPZisrNKMldrGMckyGw5YZPTp9fJQk1F0cl3RKjUl2
	/NEGnseFj+hB3rfsGtRIeMoADeytk5eip0RozJU9EWt3R4OMofENsG5FeeTecaaT7kWV
	qWQkVcIA+Pa7MBzsxCqDZIyviYJIPfkzkASl2l5N81C3gUM6R+IgROf2lNX7HOFUKjKN
	z4hQJdO2gnkkZhq1vd0eFh6C7nymp4AFF/4AljZCDx/8hKAicRhuxxzYyvDCjpJVztFl
	2NJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lrCMkzjkpUadctYPWccZRtXi+xIuuumCt+mlGx5ayHw=;
	b=KOayS6PKH6NTsC0GpmcSu5qx3k1hjWnM2nCSvw6B5098clSAfP46Q3k2TBvRq+lW8o
	cxa3POZscRWpyL41ThrASYfQdWeUeKYXZxyWKuo3lkIxWI7RrCV6JqxIEAyjrEPdTnWc
	JNoLwV3LpT0e9KZZyyjH2EzmhIJHFFMGXXOkjShbgxJeeG64ucC+8oOXH5DPl9ID4t42
	MOkW/I719Ae/fKnGUsd/ER6HMZiYBgZj1LBD3UPo49ozMEgwrPvWD2mWukMxs+nELz40
	9BAO/qg35Y2KHblzHjIDfiIu5SPcrVB5D4JGbMHJPFfv+HHhiSa46SV2w7wDZYKdS+yT
	Yx/g==
X-Gm-Message-State: AIkVDXKXYSv/VQEM6/Pek48B8YTB1uRKzhLPepIsTEe4OaiUDGnbkVCdxh2f3jgRxJklydAPJcOKCc2DTdBrDg==
X-Received: by 10.28.8.202 with SMTP id 193mr5694738wmi.101.1482340603180;
	Wed, 21 Dec 2016 09:16:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.10.69 with HTTP; Wed, 21 Dec 2016 09:16:22 -0800 (PST)
In-Reply-To: <1482332711-23829-1-git-send-email-ed.bartosh@linux.intel.com>
References: <CAD4b0_Kh=LmRhtmKdpS48E5VAb66fj7f2PVbqYeirLj-ZrTX=Q@mail.gmail.com>
	<1482332711-23829-1-git-send-email-ed.bartosh@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 21 Dec 2016 18:16:22 +0100
Message-ID: <CAD4b0_+XsESunuow-uWKJokzjUjHe3HrWPq99EzxNO6AJv4Kvg@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH v2] wic: fix parsing of 'bitbake -e' output
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
X-List-Received-Date: Wed, 21 Dec 2016 17:16:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 21, 2016 at 4:05 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Current parsing code can wrongly interpret arbitrary lines
> that are of 'key=value' format as legitimate bitbake variables.
>
> Implemented more strict parsing of key=value pairs using
> regular expressions.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/utils/oe/misc.py | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
> index fe188c9..2a2fcc9 100644
> --- a/scripts/lib/wic/utils/oe/misc.py
> +++ b/scripts/lib/wic/utils/oe/misc.py
> @@ -27,6 +27,7 @@
>  """Miscellaneous functions."""
>
>  import os
> +import re
>  from collections import defaultdict
>  from distutils import spawn
>
> @@ -148,21 +149,18 @@ class BitbakeVars(defaultdict):
>          self.default_image = None
>          self.vars_dir = None
>
> -    def _parse_line(self, line, image):
> +    def _parse_line(self, line, image, matcher=re.compile(r"^(\w+)=(.+)")):
>          """
>          Parse one line from bitbake -e output or from .env file.
>          Put result key-value pair into the storage.
>          """
>          if "=" not in line:
>              return
> -        try:
> -            key, val = line.split("=")
> -        except ValueError:
> +        match = matcher.match(line)
> +        if not match:
>              return
> -        key = key.strip()
> -        val = val.strip()
> -        if key.replace('_', '').isalnum():
> -            self[image][key] = val.strip('"')
> +        key, val = match.groups()
> +        self[image][key] = val.strip('"')
>
>      def get_var(self, var, image=None):
>          """
> --
> 2.1.4
>

Looks good to me.

Thanks for fixing this so quickly.

-- 
Maciej Borzecki
RnDity

