Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0996C149
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 14:52:16 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l9so662074wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 06:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=VX/PHHSgxjTWzRh+MYrqDXcxLzeZFxIU4AzSiKKFDEk=;
	b=Vrt78Lj+9zXkXhHCggz5xBVy/9L0TgskiGDgkGAqr5mTLGFZLnrCbK08O/wC+txkVh
	Ra/XxNBL03iu18E658nBFKwWbjKoAlUOk3jNA9CWCO7L+GVfpOcpkHopmOSxT7Pmc1C7
	QKrQsm3VzBwYLYX0TbC9gjrUT/MXsVh33sKvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VX/PHHSgxjTWzRh+MYrqDXcxLzeZFxIU4AzSiKKFDEk=;
	b=qbenkk4CAgYxhrQzAE6crInbv/Txs1561IDfDbJpkGd01JjXDmhJf/5T1wShtaGTwI
	Jb/B59HaW9o4ZGz3WP9Zmch1HIghm9v1oM6jbsAwN2QxsIziIOlQwMYqRR5ljlmBEFK1
	w5HbVGKfZYpsKMOayoL12F095qAKcl9ER5S2Xf9Xmaf3Wa+9+xVFt6dQBnjDnnKy9Gn9
	SEbvzdlQl86He7qNVtqY5E7qJH1IQy+kFzVU26UPO6ckrTFnYc40l/xkOVYaUdC+G8we
	L57Sjb+JE3oFcQIF4PadkEtRXP2NnWhi4Fhcjw9siyzLKZXNQh5akNTdg6DAljWHjA5d
	bVlA==
X-Gm-Message-State: AJcUukdZx3mGatdlWV3AzCDEvX8F8fxvM/o4/wfHYDSgVsfjYF5qdK1J
	95CmzJauQn7DeXp15znCPG2iNwNM1Vj5UQ==
X-Google-Smtp-Source: ALg8bN5JM2C3PcYcoNWMlSQBYeTex0OF3ifcCDxSvXrkNsSHH9A0kLuIt5ootLIThUFs6gk98PD+QA==
X-Received: by 2002:adf:e608:: with SMTP id p8mr52380859wrm.166.1546872736771; 
	Mon, 07 Jan 2019 06:52:16 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v1sm69001782wrw.90.2019.01.07.06.52.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 07 Jan 2019 06:52:16 -0800 (PST)
Message-ID: <9dce612ce15b25ef82a588d29247f95be436011c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 07 Jan 2019 14:52:15 +0000
In-Reply-To: <1546723013-27417-1-git-send-email-alejandr@xilinx.com>
References: <1546723013-27417-1-git-send-email-alejandr@xilinx.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] package_manager: Avoid looking at other multiconfigs for dependencies
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
X-List-Received-Date: Mon, 07 Jan 2019 14:52:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-01-05 at 13:16 -0800, Alejandro Enedino Hernandez
Samaniego wrote:
> When creating the rootfs, we look at direct and indirect dependencies
> and then after processing them we create a link for rpm/ipk/deb
> packages
> needed for each of them on the deploy directory.
> 
> The process looks at dependencies that we've already seen to avoid
> copying them twice, but when BB_MULTICONFIG is enabled, the
> dependencies
> themsevlves contain "mc:<mc_name>" in them, so duplicate packages are
> not found if they come from different multiconfigs, causing an error
> when linking the package file since it already exists.
> 
> Check which multiconfig we are currently building and avoid
> processing
> dependencies from other multiconfigs.
> 
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandr@xilinx.com>
> ---
>  meta/lib/oe/package_manager.py | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/package_manager.py
> b/meta/lib/oe/package_manager.py
> index 392fe7e..444da5d 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -643,10 +643,11 @@ def create_packages_dir(d, subrepo_dir,
> deploydir, taskname, filterbydependencie
>  
>      taskdepdata = d.getVar("BB_TASKDEPDATA", False)
>      mytaskname = d.getVar("BB_RUNTASK")
> +    mc = d.getVar("BB_CURRENT_MC")
>      pn = d.getVar("PN")
>      seendirs = set()
>      multilibs = {}
> -   
> +
>      bb.utils.remove(subrepo_dir, recurse=True)
>      bb.utils.mkdirhier(subrepo_dir)
>  
> @@ -660,6 +661,10 @@ def create_packages_dir(d, subrepo_dir,
> deploydir, taskname, filterbydependencie
>      for dep in taskdepdata:
>          data = taskdepdata[dep]
>          if data[1] == mytaskname and data[0] == pn:
> +            if mc != 'default':
> +                depmc = dep.split(':')[1]
> +                if depmc != mc:
> +                    continue

Is this the right test?

Don't we also need a "if mc == 'default', dep not startswith
'multiconfig:' ?

i.e. what happens if we're the default mc but we find a multiconfig
dependency?

I think to fix this properly we may need to add an "mc" element to
taskdepdata. We can then just do:

mc = d.getVar("BB_CURRENT_MC")

if mc == "default":
    mc = ""

if data[1] == mytaskname and data[0] == pn and data[X] == mc: 

It means a bitbake version bump but its the right time to do that and
fix this properly so the code reads understandably. The "default"
string was probably a bad idea in hindsight :(

Cheers,

Richard



