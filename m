Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id E3C48781E9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 18:17:25 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id b9so227558wra.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Sep 2017 11:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jzv0aOVUHxTp6wofrKQqFpJyfMB+n4Nz61QEN0lLEXY=;
	b=UItqsG0jeg8VzXGiRqpgmzstyDEVLeDT/mphsyXeKRjCOwlHd+WNNotfmB+sOTnTmr
	umDv0vl5W3kwx3uCmXdrymvKZsQcniQzmsYRtcZAKOYJTRu4ImZdn732y1jIZ6OqMI1l
	8x90jdmgt2GiPj7vwk50duEyQpMpFESeZbdklFzhZKVVSMiDuQR8y1hj6zuE9TbiSZHZ
	+qNkRYw1vhGC1K9UR44N92pYSvkLwE4iKLrfQJgbSD3zTrOkBORglIZMhrHRnGdip5pi
	N+o/h1aedjP+/0knVE6s67dEvVNJQUcNqg7KQhknzm2e8TGYe13SOcBxL88/XNTAAgkg
	fwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jzv0aOVUHxTp6wofrKQqFpJyfMB+n4Nz61QEN0lLEXY=;
	b=i/B86HJrKseLx4/K112zE0cXlJ2u89vnO3T5tY3MooQeWyn/Gxb/DyuqErA1YB7UaT
	D2Bcio0ATCChg6avqYzhhbcmAkMLsXr+2bkl2wqG6bRvD57L8RBFRtoEB3nndZ576suS
	KkpqSRVl32Am77HaiUTVPtCy46AHSMrpVyPB22JgF3tlpoXhh97IdSIJhTdb/bFK2GfL
	lrsiscISrDkb9QCNQfyONVuqPgylvQ9DRgN+ZQ/g5Xxl6sT149Mx3xDqmuG302pKunWm
	AmvN5QF+S3tLFLI8xT/O7jI2SnYpU9xwzarOx/MLZQUL6IQXFzFP0DUtbvpmvCex7UxL
	D2Vw==
X-Gm-Message-State: AHPjjUho/OWO3bMWYyYosqsC7Z06TSzmeW1cq0Rg14BhgS3FqYjBFV8C
	UIG/xEXrz3iviIJmSUj05EHSYvTAMw==
X-Google-Smtp-Source: ADKCNb61b5D1jSq7pJ3bRHVNyqQMbaLK0k+qVF7vLIAeqqcopZsZrWhGojDoBI4M15HzLjKvCmPs3Ur7Aq/5bIAx9Ig=
X-Received: by 10.223.143.110 with SMTP id p101mr152330wrb.182.1504808246558; 
	Thu, 07 Sep 2017 11:17:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.184.166 with HTTP; Thu, 7 Sep 2017 11:17:25 -0700 (PDT)
In-Reply-To: <20170907123142.28622-1-willn@resin.io>
References: <20170907123142.28622-1-willn@resin.io>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 7 Sep 2017 11:17:25 -0700
Message-ID: <CAJ86T=VV16HToqmQDuYgRJRvSEggTe2SZf-h1g1XyqVx9tyqHQ@mail.gmail.com>
To: Will Newton <will.newton@gmail.com>
Cc: Will Newton <willn@resin.io>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Thu, 07 Sep 2017 18:17:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 7, 2017 at 5:31 AM, Will Newton <will.newton@gmail.com> wrote:
> The previous logic applied a regex to TUNE_FEATURES which could
> set the GOARM value to 7 incorrectly, for example when dealing
> with an arm1176 core. Simplify to check for the presence of
> "armv7a" instead. At the same time add a check for "armv6" and
> set GOARM to 6 in that case.
>
> Signed-off-by: Will Newton <willn@resin.io>
> ---
>  meta/classes/goarch.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 4a5b2ec..35f2987 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -38,8 +38,11 @@ def go_map_arch(a, d):
>
>  def go_map_arm(a, f, d):
>      import re
> -    if re.match('arm.*', a) and re.match('arm.*7.*', f):
> -        return '7'
> +    if re.match('arm.*', a):
> +        if 'armv7a' in f:

You need to test for both armv7a (Cortex A9, etc) and armv7ve (Cortex
A7, A15, etc).

> +            return '7'
> +        elif 'armv6' in f:
> +            return '6'
>      return ''
>
>  def go_map_os(o, d):
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

