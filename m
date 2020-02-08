Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id E9D5460E9E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 09:20:12 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k24so2278294ioc.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 01:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=5O4syRN7qFcdGPLfvOGVhIBBD8dBuicmV+Tm06M9d9g=;
	b=L8L/zfJu1arx5UMBo6Jry1N75lGa1uES5QQ9YHMdQkhCRsi2mqZw7ecwReyMfOz8yR
	ijszTQwJZ4LkWvqyDVt2pVvxNj9azhp9+L7yZI89DZBccagwjIPVo44sFkgYmWmtvAR+
	FnJi8ksNltcp3dJhyVIuGq6ZGk90FFHB2PkwunEoP1Kd3no9F7qGCBiBeh3Td9jeH4Ge
	vVApvTVBt20wqpcrZnoAe5gFKH+1wtsBLGF0CGBSs4tx7ZNGik+wP0cthZgxfQvAAVG1
	HOs4Y3etMixRUIsOi6ScJNaT0M2/+0xGU+6vDY9ylK6/+oagKgtCCXSMdacdN/Y7tph6
	U0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=5O4syRN7qFcdGPLfvOGVhIBBD8dBuicmV+Tm06M9d9g=;
	b=VjiyI2qs+G3D6RdCWfm9v7kohBnfNio/iUcc/SNA+ssD/sGco8dN7YZt2B/hBGg+Dz
	SGCV77N6aWBTvUEYudF4mackfAVC3e5wF+8haE+9hY29XubYNPyL8apFKSn3+DxDlOlL
	u0WkQZWX3c9hVGlgy+HTBrxbv6zGypQ8sQwNAIl2UfZIbgJuPPHpmXU4q97zTRH18YRh
	xp9BQe1ebRMkmr1bFJp4UDW/QpsxXXFpJNTnnnXm8pGRznO9UIxLvh4gM1iX53bkaTOL
	vGu/2gLWuORJfAochXZfDmMVJo828S8d/+UPIz6QA7qCRRLGVo6GBOqJV9yvDRuiGEEv
	1UQg==
X-Gm-Message-State: APjAAAUXvRsG+LbpRuYpx0HVbJzKjbvq0FO27Fott+BrBtZhjC/EUivs
	yLXZ4EA5/9ZobzIkbqQO7PBmfUy3YzQxGqqQLww6Lw==
X-Google-Smtp-Source: APXvYqwfsPwOF6DzbQWic7fTqc3sgJ7mKSgxv4WR4eqLgpA/mS9O9bQ+MNte1QIVb5kDLBwRp0ZGo5AzcZgLteLpKgs=
X-Received: by 2002:a05:6638:34c:: with SMTP id
	x12mr2295811jap.144.1581153613585; 
	Sat, 08 Feb 2020 01:20:13 -0800 (PST)
MIME-Version: 1.0
References: <20200131162442.58931-1-alex.kiernan@gmail.com>
In-Reply-To: <20200131162442.58931-1-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 8 Feb 2020 09:20:02 +0000
Message-ID: <CAO5Uq5QPQRN2u+CEgb4omm+JCGg7Bour3jjzp8OF0NFyx4qm5w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: Handle overlays in EXTERNAL_KERNEL_DEVICETREE
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
X-List-Received-Date: Sat, 08 Feb 2020 09:20:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 31, 2020 at 4:24 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> When using EXTERNAL_KERNEL_DEVICETREE, collect DTB overlays too (*.dtbo)
> as well as iterating down into sub-directories so using the behaviour
> for naming which matches KERNEL_DEVICETREE.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  meta/classes/kernel-fitimage.bbclass | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index ec18a3d69921..d1b8cdc1f049 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -391,11 +391,10 @@ fitimage_assemble() {
>
>         if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
>                 dtbcount=1
> -               for DTBFILE in ${EXTERNAL_KERNEL_DEVICETREE}/*.dtb; do
> -                       DTB=`basename ${DTBFILE}`
> +               for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n'); do
>                         DTB=$(echo "${DTB}" | tr '/' '_')
>                         DTBS="${DTBS} ${DTB}"
> -                       fitimage_emit_section_dtb ${1} ${DTB} ${DTBFILE}
> +                       fitimage_emit_section_dtb ${1} ${DTB} "${EXTERNAL_KERNEL_DEVICETREE}/${DTB}"
>                 done
>         fi
>

Ping?

-- 
Alex Kiernan

