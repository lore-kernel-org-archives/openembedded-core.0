Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 by mx.groups.io with SMTP id smtpd.web12.13096.1598450447572009768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 07:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@efficios.com header.s=default header.b=Qkcl4UtQ;
 spf=pass (domain: efficios.com, ip: 167.114.26.124, mailfrom: jonathan.rajotte-julien@efficios.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id DE6DC9E466;
	Wed, 26 Aug 2020 10:00:46 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id iajiMCIrivIO; Wed, 26 Aug 2020 10:00:46 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 5EB029E463;
	Wed, 26 Aug 2020 10:00:46 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 5EB029E463
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1598450446;
	bh=SCoEbIgtMk6LYSHdi7y6Jl8c3uOuVY+lQi8TMeiQbzE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Qkcl4UtQgjm/oi+5cfvChHJSCPtSQrkCGO+SfFPFD3Ncebso0cppj39xwgs6oGCsO
	 3WqaDEeMEMPVRyBuglZHs9PM1AemrTdIAleP0Qljsu9xWAQlPRlUB9FeLsJz15m3Ih
	 eT7PdfqzJmyw1t8TAGitE5JrKNpQZPneMj7fqqjzzc2XAgksbWS+wDjHAH3DWgOsv0
	 jGm7CveeM3vMNhZrO8UZf8oguKIlidarRF2dXI0pr8e7vrhhXgrmWHnyoCdrfapHRQ
	 yqAXNEEBvxsEF+QZZn2W1H0UDVgWTF/Nmmc7G4OXYuNh/osFo7dLB3WfoVQZivftSB
	 0Fr8oDdQ+hV8g==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TEwIqNUFnKGH; Wed, 26 Aug 2020 10:00:46 -0400 (EDT)
Received: from joraj-alpa (unknown [107.159.43.215])
	by mail.efficios.com (Postfix) with ESMTPSA id 3F4EF9E462;
	Wed, 26 Aug 2020 10:00:46 -0400 (EDT)
Date: Wed, 26 Aug 2020 10:00:46 -0400
From: "Jonathan Rajotte-Julien" <jonathan.rajotte-julien@efficios.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lttng-tools: Do not build for riscv64
Message-ID: <20200826140046.GJ1638231@joraj-alpa>
References: <20200826054101.856417-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200826054101.856417-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

LTTng does not have a hard requirement on lttng-modules (on paper), when kernel modules
(tracer) is not present kernel tracing is disabled and only userspace tracing is
available.

Was there any report that lttng-ust (userspace tracing) is not working as
intended on riscv64?

Cheers

On Tue, Aug 25, 2020 at 10:41:01PM -0700, Khem Raj wrote:
> Since lttng-modules are not buildable, there is no point of building
> tools either
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../packagegroups/packagegroup-core-tools-profile.bb           | 1 +
>  meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb                | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> index ca35af1ec3..608e406f83 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> @@ -41,6 +41,7 @@ LTTNGUST_arc = ""
>  
>  LTTNGTOOLS = "lttng-tools"
>  LTTNGTOOLS_arc = ""
> +LTTNGTOOLS_riscv64 = ""
>  
>  LTTNGMODULES = "lttng-modules"
>  LTTNGMODULES_arc = ""
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
> index e9c8e18e22..0614e86713 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
> @@ -162,3 +162,6 @@ do_install_ptest () {
>          esac
>      done
>  }
> +
> +COMPATIBLE_HOST_riscv64 = "null"
> +
> -- 
> 2.28.0
> 

> 


-- 
Jonathan Rajotte-Julien
EfficiOS
