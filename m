Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C737ACD3424
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 07:31:29 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2373.1777707087925497187
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 00:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Uox/HwQ8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso12673935e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 00:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777707086; x=1778311886; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VNMaqkkZCGo+lc3yq2pQ01h69kocR+Sj+Vx4fCk6Dbc=;
        b=Uox/HwQ8ajKu6kbv0JYVEJ6R/ovn+AO4cS44PxsBlonn0eBaVFi3t78Df1M0RQHXnh
         qrPr2IZ83JemZEDOMNIQOUsez/QU4DaUUZdPUX7XUiL/lCKv+T7z3+BNg/IOx9/qonY1
         8q+3rfIB/s4wPbQvxlylSz56V8wFAcsBN0Z5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777707086; x=1778311886;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNMaqkkZCGo+lc3yq2pQ01h69kocR+Sj+Vx4fCk6Dbc=;
        b=AJTw6MshTlXbQKk5ryDbKqWuqrz4Iap5BbeDYUZWxkollLALtvohlQsTasjKxH8gPe
         Af1lGhU+eMwCOL3RLuRMfa9Eedh2VlLn2zmnUZKxZop8UE5ftXjDeROMFGsZRe98j4EP
         CBypsrhfa9I815YRq/aputga+wUzmlCXCdV66Fzzuassy5EEbQgZ8bdgL7G+HD2h0Ixq
         d78pZ/tIycWTZCPfdnYtYbSZ8wC9FjeCBnjDYbq3ceAgxb28PnJDIbVdLm1Ygy5fwevE
         J3HYxpz0J/qvfsKiKcQMMmaageIwY/6G16ytP1BTaXnd2Ea/8AR9ioEWZRY6TnisU05/
         FN7g==
X-Forwarded-Encrypted: i=1; AFNElJ+bGn+lNkSSr0e54oNxYBsi+OMaXRPJAF2spaPtrqxAlpz9UuO3nLn5kGuySO5Cxqlhz+0OITPDTqEZ/pf/fqltCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyiN524Nihu56hBpSwyhtRHdlayudXKzLXtvulkQ5/ynGxkjOpl
	l6XvMIu9qUgs8xIfLtYlXz9fA7fkdsdzDR5iGuCrGEz/2ZrEnDlzPNEl5k8ugr2ZQF0Sie0irec
	pG6ceg3D8NPn5Zi8s2xlCqzo3UZe3B0I9cN5fkjYfk1u7GENL1mdcRR4Q6VZvEBgp/iXh6v6I70
	8=
X-Gm-Gg: AeBDies02yAOdM/qh1STE099ubYYey7m9Xsb88v4PZAsVzqxTG94Pre48D17eNtaA1s
	Oy2dcdDNlCOUY7OKfW51xLl5aKF5IeUJhty23kBVmYaOgC9D3TAoCguE7E3xiB67tZ4+X75wuGW
	ujJ3nrRyLiDNlFaew37Fdq1dXpQh8DfNNFBnI2848tD8gFEKxtfLsBjiYMO8jSLtooXt/SGHdLS
	MzrtD5mLoJ49LEnxOze98sPOe3YChLcgJ9/klMtIUOLbqhGZYUxjO33ZgnfWctLq/T2gCciMd/5
	ZCjhsBIrIPu5qzknXs25Vz9KYihmqU8RWp7wMAxXhnDbrkzDq+AQ6Rh/rh6eu3UgpnySzqY9y4x
	07EuydTO9racxn73ztwUK5ofMUVy0ruICKYML53Z6YY4L2Zqp3o+SMQfD9mKu6M5tFsKApQ/Y/4
	9whpH+jdRB8kD4w6x05n/kRoxg23Az5u5v/BbOKCAkdAXVSExRbS98j/KeNYlFMjzjLXyo4P1uU
	iRUXS05MaM0D3wl7JxAgJ3WZSA=
X-Received: by 2002:a05:600c:5295:b0:489:1b10:d896 with SMTP id 5b1f17b1804b1-48a9864c2famr30016315e9.0.1777707085991;
        Sat, 02 May 2026 00:31:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8635:4fc6:d16e:90be? ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm291428055e9.13.2026.05.02.00.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 00:31:23 -0700 (PDT)
Message-ID: <2130c0c232f6f4e0bebe64c4b3838d2de5ce022b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] license.bbclass: only create hardlinks
 within $TMPDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rasmus.villemoes@prevas.dk, openembedded-core@lists.openembedded.org
Cc: chbs@prevas.dk, emkan@prevas.dk, Rasmus Villemoes <ravi@prevas.dk>
Date: Sat, 02 May 2026 08:31:22 +0100
In-Reply-To: <20260501183615.2728124-1-ravi@prevas.dk>
References: <20260501183615.2728124-1-ravi@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 07:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236305

On Fri, 2026-05-01 at 20:36 +0200, Rasmus Villemoes via lists.openembedded.=
org wrote:
From: Rasmus Villemoes <ravi@prevas.dk>

This is _not_ meant to be applied, but merely acts as a place to start
a discussion.

In our CI setup (which is gitlab-based, but I'm not sure that's too
relevant), we sometimes see spurious errors like

=C2=A0 touch: setting times of '[...]/rootfs/usr/share/common-
licenses/go2rtc/COPYING.MIT': Operation not permitted

Often, the error disappears when the job is re-run, which I don't
really claim to understand. But digging into this, it seems that it is
related to the use of hard-linking from common-licenses dir in the
oe-core repository and into the build directory (and then later steps
create further hard links).

While the test done here for whether a hard link can be made is mostly
correct (assuming the the sysctl protected_hardlinks is 1 as it is in
most distros), those are not the same requirements needed for a
subsequent utimensat(2) system call to be applied - that essentially
requires one to be the owner of the file, not merely having write
access.

We are not the only ones to have observed these spurious failures:
https://stackoverflow.com/questions/77926112/yocto-gitlab-ci-job-sometimes-=
causes-touch-to-give-operation-not-permitted

But apart from these concrete failures, at a higher level it seems
wrong for a build to cause the mtime property of files in the layer
directories to change, and it seems even more wrong considering that
if one of those files are rewritten (via open(O_TRUNC)+write(), not
via "write new file and rename on top"), that affects what is already
in build directories. Also, one could imagine two parallel builds
using the same layer directories as source, but with different values
for the REPRODUCIBLE_TIMESTAMP_ROOTFS, which would result in rather
random end results since both builds modify the mtimes of the same
inodes.

I do understand that using hard links is quite valuable for saving
time and space (I see GPL-2.0-only having 135 links, so that alone is
a few MB), which is why I don't think this should be applied as-is.

Could we do something like create a $TMPDIR/license-pool/, and
whenever encountering a src not inside TMPDIR, copy that file to
$TMPDIR/license-pool/<basename>-<sha256 of source> [if it doesn't
already exist], and then use the latter as src in the subsequent "can
we hardlink" logic? That would then also improve the case where the
meta-layers are (bind)mounted R/O, and we thus always end up copying.

I agree it does look like there is a potential issue here.

I'm not sure we have ever claimed isolation between the build metadata
and the builds, I know that for example patch files are linked in, so
that when you update patches, it updates the metadata more easily. I
can see why you might want that, equally, the ability to update patches
that way is a nice usability feature.

Did you track down where the utime of the files was being changed? From
the link, it looks like:

    find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=3D@$REPRODUCI=
BLE_TIMESTAMP_ROOTFS

in reproducible_final_image_task in image.bbclass

I think that function could be changed to clamp to anything newer than
REPRODUCIBLE_TIMESTAMP_ROOTFS rather than changing all files, and that
might actually avoid the issue.

Cheers,

Richard

