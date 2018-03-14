Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 40AAA784E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 23:52:22 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id m12so6405182wrm.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 16:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uZHUvlkdeO28j6dg461vj483GHBQ/3r3UN9f2mAL9oQ=;
	b=ouE/843rIU7bXAVi/C0EMm4evkoIeS1z9UjAlxqOzELwMFn39tsn6Q2iu6F39NyvT6
	qx/2tS7NLrv/OxjSaj0LAB5n7pTSRdfM3CMM7mK+1X+45pjZ5so3OIMulfc07UXKaExd
	7MYCoXJiIVZG1nJ7YiqGKX0bQogKXVXht4EJTAPvEAjDfYVM47tSaxiOFZFeeBgWWOmi
	fRIGZLucVqTAGHWESpXV/NDLPUhaD2hWvJLv3B24PeQWSNBx1QtoIA/ZYrU6wVUaKybA
	s2gGuxjB7xrV9LRvvt2jqCSRBpdPug9KUomrgAFVC/KozcWDUvOhhgi5jwh4mHPeL574
	SaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uZHUvlkdeO28j6dg461vj483GHBQ/3r3UN9f2mAL9oQ=;
	b=hTOyVT9sMfbs9SiO0CpqGvnlXFOs1wXMVnRLtQHoEOU8vzo+B1P26earEEVnG4Lzdg
	u9M/IZCNzs9AQnskQlCz4YOVrQJG3Iurn3GECdYTgn4kmmez+tmC+IdGX8LrAFlm0n7n
	glE1pVusO91VLoB3WjSkHgZVwbcWJoU2NFa+Y+sYIeKXFO0DkXTSsR63ZakIjyBtrlBX
	R7nWVEoNGRR3UGTgRm8fMGVb95F0PUqFS2ZGFLVhUlZ8erCMF9MdXjwgDWTtdfqCRjSm
	+F/ZjWWCV5FeXguSpjuRb9EevAZJEvuuQfV7bBrMLKaTQeeGaKGMQstl8zSZMkNGHbjx
	A5fw==
X-Gm-Message-State: AElRT7FlcjHHJATQ+p4JlbDgHBjMrPTf5Xxxs9PO0LpMLO1Z+LoT8AHt
	83EjU5aeyRBrXcnzmZqAJcyXbo32+O9Ux+Hcixk=
X-Google-Smtp-Source: AG47ELtMJBP8lTiPjETNVCtvVLTrshpXXdnGyi7X0ff9zafkMy4mgLUVXdIbtaQEzfhXnc8KGTZB2pnafUe7g7gZgJQ=
X-Received: by 10.223.170.218 with SMTP id i26mr2491665wrc.107.1521071543696; 
	Wed, 14 Mar 2018 16:52:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.133.98 with HTTP; Wed, 14 Mar 2018 16:52:23 -0700 (PDT)
In-Reply-To: <1519779977-9136-1-git-send-email-armccurdy@gmail.com>
References: <1519779977-9136-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 14 Mar 2018 16:52:23 -0700
Message-ID: <CAJ86T=V=+cLpzMFoWS42NMDAuOrUMzsLCmUHfUhTrP8aEvcR2Q@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [morty][PATCH] buildhistory: fix latest_srcrev in the common case
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
X-List-Received-Date: Wed, 14 Mar 2018 23:52:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 27, 2018 at 5:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> buildhistory was writing srcrevs.values() as SRCREV when only one
> srcrev/branch exists. This returns a view of the dictionary values in python
> 3, and used to return a list in python 2, neither of which is an appropriate
> value for SRCREV. It was resulting in latest_srcrev files like this:
>
>     # SRCREV = "346584bf6e38232be8773c24fd7dedcbd7b3d9ed"
>     SRCREV = "dict_values(['346584bf6e38232be8773c24fd7dedcbd7b3d9ed'])"
>
> Which in turn would result in invalid output in buildhistory-collect-srcrevs.
> Fix by calling `next(iter())` on the `.values()`

Ping.

> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> (cherry picked from commit ef826a395612400924bbe49859d256b237ff59e1)
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 3a5bc2c..d82e9bb 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -833,7 +833,7 @@ python write_srcrev() {
>                          f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
>                      f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
>              else:
> -                f.write('SRCREV = "%s"\n' % srcrevs.values())
> +                f.write('SRCREV = "%s"\n' % next(iter(srcrevs.values())))
>              if len(tag_srcrevs) > 0:
>                  for name, srcrev in tag_srcrevs.items():
>                      f.write('# tag_%s = "%s"\n' % (name, srcrev))
> --
> 1.9.1
>

