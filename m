Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BA0837BD69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:24:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f81so3411399wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=1IR1Pu6uhpPSG4kjTmYqtoBpYtsLe+lCzJQzmHwoUv0=;
	b=PJdqkfk2MoYII98heCOr3Sbn3SiKvfpWeDpKD2oWPCjCMZUy2WawOEWlyfI3TQF9BD
	AH0RU8H/qjId0Zj0lIB/nBpCk0xquFan/sGlaKC+xn0zD4gnoHDxZMLKKVRZ52mULbe9
	1Oan9q+d1pDvBLWUluMMOxiUaukaWbU7wpIzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1IR1Pu6uhpPSG4kjTmYqtoBpYtsLe+lCzJQzmHwoUv0=;
	b=f0nOp6mbhHmf8FIg757APD3ab/11acTzveySFEtMa8xUtClsNINa8lYyn+p/q3SmTx
	yXsUZl2xJAZvHNABi6QJDcJTIc9E+I4xyza57R1ufmxst3KXvW/YB8FfhBaNUcOQknA5
	fYAaXEIR4Ss/3e6nCRQPPbQZiN+/aSWQRc8xL/ymgYl2VZAZN3wdW0wbsfxlFZb13ivA
	Jdq0p3H/euR9XbQpKPj4kh1GW/86Yl+y8YyKKdz4vez9ULTq1+rNc4pGlBBhLv7gEMtO
	PHN+vMpb25ohHuWC2RCPQe7O5d0WH7/djCH111PMA/euSbHsXF33Pbw4pNDNk4l3spBQ
	0pzA==
X-Gm-Message-State: AA+aEWZVjxFx9gPmsZJlRnyuNZ8mAZCKp1hZv/ptf7sNUjjEPyH+QCod
	GET4szhOenx54z0B7DWRoYp57Q==
X-Google-Smtp-Source: AFSGD/W63nMfVhp+ZzDYiCjhUuihYZtbyVnreW65UqA/XiobQPNUDuCa3o+0s64bMGyee1/7fHqdgQ==
X-Received: by 2002:a1c:83c8:: with SMTP id f191mr3822830wmd.134.1545150246617;
	Tue, 18 Dec 2018 08:24:06 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k19sm5052127wre.5.2018.12.18.08.24.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 18 Dec 2018 08:24:05 -0800 (PST)
Message-ID: <2d3ed923953d6bd5747e2ddd510872c4f773c32f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org,
	bitbake-devel@lists.openembedded.org
Date: Tue, 18 Dec 2018 16:24:04 +0000
In-Reply-To: <20181218153101.9212-8-JPEWhacker@gmail.com>
References: <20181204034245.25461-1-JPEWhacker@gmail.com>
	<20181218153101.9212-1-JPEWhacker@gmail.com>
	<20181218153101.9212-8-JPEWhacker@gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH v4 07/10] bitbake: runqueue: Pass unique hash to hash validate
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
X-List-Received-Date: Tue, 18 Dec 2018 16:24:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-12-18 at 09:30 -0600, Joshua Watt wrote:
> If the unique hash is being used to track task dependencies, the hash
> validation function needs to know about it in order to properly validate
> the hash.
> 
> [YOCTO #13030]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  bitbake/lib/bb/runqueue.py | 38 +++++++++++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
> index de57dcb37b8..161f53c7cb1 100644
> --- a/bitbake/lib/bb/runqueue.py
> +++ b/bitbake/lib/bb/runqueue.py
> @@ -1378,6 +1378,23 @@ class RunQueue:
>              cache[tid] = iscurrent
>          return iscurrent
>  
> +    def validate_hash(self, *, sq_fn, sq_task, sq_hash, sq_hashfn, siginfo, sq_unihash, d):
> +        locs = {"sq_fn" : sq_fn, "sq_task" : sq_task, "sq_hash" : sq_hash, "sq_hashfn" : sq_hashfn,
> +                "sq_unihash" : sq_unihash, "siginfo" : siginfo, "d" : d}
> +
> +        for hashvalidate_args in ("(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=siginfo, sq_unihash=sq_unihash)",
> +                                  "(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=siginfo)"):
> +            try:
> +                call = self.hashvalidate + hashvalidate_args
> +                return bb.utils.better_eval(call, locs)
> +            except TypeError:
> +                continue
> +
> +        # If none of the hash validate functions worked, try one more time
> +        # with the oldest type
> +        call = self.hashvalidate + "(sq_fn, sq_task, sq_hash, sq_hashfn, sq_unihash, d)"
> +        return bb.utils.better_eval(call, locs)


I think sq_unihash shouldn't be in this last fallback option. You copy
and pasted from your updated code rather than the original (pre
unihash?) You could add (sq_fn, sq_task, sq_hash, sq_hashfn) to the
args list?

Cheers,

Richard


