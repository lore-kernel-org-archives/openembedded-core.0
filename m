Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DE5CD5858
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 11:05:44 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3468.1767783940744496331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 03:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PhOfW3gK;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8888546d570so23417506d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 03:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767783940; x=1768388740; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cplGQFVKBbGIAhIJJVJSISWVLQmYy5ygqjfBNhKFTaw=;
        b=PhOfW3gKFUIzIuwtVaGnCpR7DhcEdLsNNgs1vwi9nYfWvYVh0LXpS8mwP2m0xu4CNj
         Jw85VyGqg+tdYBvFbr8AH7NwjEuIXY8cYQYUc41LxddMF7sewkeL1TZyL3ehazcMYeiG
         tx4pvHYaymup56sKxYxbgmk/NoebRqpMz3A+wy4UWPiIi6z3SMEGZw8kHFbXMOkxy2cs
         6+YoYFtIVtQSLSMLlOQCL0t99ajDcQPz3nCUgLrIGPDBF+PtNkIHGQAWnTLWaAmyZY9D
         sMMzkMvQ6nnZ+PWlseYjjTTDtT6ZZxM2+hZkUaapd+Y9Bk4LDNjmlQsE3H+8surcmzt7
         Lbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767783940; x=1768388740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cplGQFVKBbGIAhIJJVJSISWVLQmYy5ygqjfBNhKFTaw=;
        b=GqKqpgAh5tespxFlxjXdAYzcYYZ2Wto1Z1dS9BPeqZ5OFrHcOuZUnQUUugGTAijUsq
         V0HbNjyZ13W2Xbi2EG2Pckzr2b1vEM8ythygR0bkFw9UYJJYLGDxlbPoLAcJFaqR0YSl
         /AMDhO/v/6LgUrFpCOH8kwWHM+zR3LyAK/kBKPBWDbMl/7IOXHusOYj87TQjHKFGXe3z
         hPYI8ghE4so6XvWNibloN4ZU6Qz9Cjd4PissGNxqPB2uUOP/1eOpfTkavKhgZu+AL0h6
         mEwjnu9w3DzmRd5zLwOMdWCnC7ZX6LWdpZ6ZlPe9nL0N4k4doM/r5KxE93THXSWnfWdW
         q1TA==
X-Gm-Message-State: AOJu0Yx4J7Li3rhkS+sFOZqx/RZ0yOs7Mrr0NUdYk+KWrNeGLqLveToJ
	XGwWKHbAQNxVsd1r13aj3w43i7N70ZbbKYkaNqoypTe3AW+F9EtbjdC3rjfRSulU3Y9TygnA8Qn
	F4yaCVxkqnF/6NAqeOfMwm3O59C0OYeTryJ8U
X-Gm-Gg: AY/fxX58jNNR3tx2nMCBo7+VrjTnDUHXVDHY0PUTTAdNXXwpuk+DVTaGoI/2TtxKai5
	L7uJPuLha/qctZBB/pG+A8hPRcq2XVMBmaWo6Il2gQ+PjaVEQFlTf/rDywtohdDpM674gKbbYw4
	FsPNPN5wMyM7djZkpA1nV9ALmCkFtBo9Dy52hV5n1ut2Zs/XrX/BhFLOxkkrxJkGRcvzRUHRZYN
	D/lDSisuR/nsS47ZDYew48zEXyiD86oNviEuCdBqXHkRSx3m3LdCGVIBqeUb+45oi6fhZ3aU3gl
	3w9WGU5kti0+XXz3DSSuYoAzWHN7VKyABd3DgtIx
X-Google-Smtp-Source: AGHT+IFXlmKOdEzibqJZjW13wlUoiVz8Ch9/ISXZTeZCme9+I+wgCSV8DHZQRqqNeNePpbWhfeOC7UnhdZhLM0bGRWI=
X-Received: by 2002:a05:6214:4782:b0:890:8b82:4f31 with SMTP id
 6a1803df08f44-8908b824f5fmr5871916d6.10.1767783939713; Wed, 07 Jan 2026
 03:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20260106233539.1886869-2-t.f.g.geelen@gmail.com>
In-Reply-To: <20260106233539.1886869-2-t.f.g.geelen@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Jan 2026 12:05:28 +0100
X-Gm-Features: AQt7F2pTt0GVwsGc3GGVo1uB0Cw0fVmDoxaZ9LbQ7UrROpRjGgd8jYiycDDEs-U
Message-ID: <CANNYZj86TB69QaoCsZqdZw578wy0zr7DCoH+71KRXSR_Co5uEw@mail.gmail.com>
Subject: Re: [PATCH] Devtool: Make qmp detection for qemurunner more robust.
To: Tom Geelen <t.f.g.geelen@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 11:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228989

On Wed, 7 Jan 2026 at 00:36, Tom Geelen <t.f.g.geelen@gmail.com> wrote:
>      def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
> -        # use logfile to determine the recipe-sysroot-native path and
> -        # then add in the site-packages path components and add that
> -        # to the python sys.path so the qmp module can be found.
> -        python_path = os.path.dirname(os.path.dirname(self.logfile))
> -        python_path += "/recipe-sysroot-native/usr/lib/qemu-python"
> -        sys.path.append(python_path)
> +        # Discover qmp module location robustly.
> +        # 1) Try path derived from logfile (historical behavior)
> +        # 2) Fallback: search TMPDIR/work/*/<rootfs>/recipe-sysroot-4native for qemu-python or site-packages
> +        candidates = []
> +        base_from_log = os.path.dirname(os.path.dirname(self.logfile))
> +        candidates.append(os.path.join(base_from_log, "recipe-sysroot-native", "usr", "lib", "qemu-python"))
> +
> +        # We can deduce the location for qmp also from the image which is being called as we know:
> +        # - this will have qmp in recipe-sysroot-native
> +        # - this will need to be called as this will derive TESTIMAGE
> +        for p in glob.glob(os.path.join(self.tmpdir, "work", "*", os.path.basename(self.rootfs).split('.')[0], "*", "recipe-sysroot-native", "usr", "lib", "qemu-python")):
> +            candidates.append(p)
> +        # Print all candidates to the debugger
> +        for candidate in candidates:
> +            self.logger.debug("qmp candidates : %s", candidate)

Apologies, but I can't agree to this. It's a lot of guessing against
hardcoded path elements, which can go wrong in various ways. The
correct fix is to pass in the correct native sysroot path explicitly
from further up, how to start with doing that was previously
discussed:

https://lists.yoctoproject.org/g/yocto-patches/message/2762

This bit:

"I'd say in this situation AUH is right, and the code in point 1 is
wrong. It needs to figure out the path to qmp module directly from
WORKDIR, but I don't know yet which of the many parameters to
QemuRunner's constructor and launch() method can be used. Can you look
into it? You can tweak the code to print them all, and see if
something suitable is in there."

Alex

