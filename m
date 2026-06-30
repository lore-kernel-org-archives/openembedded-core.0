Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E326C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 11:05:44 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18695.1782817538747902088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 04:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MaQC7VP3;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e53581361so170834885a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 04:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782817538; cv=none;
        d=google.com; s=arc-20260327;
        b=C+cVj2DH0mjEuSJzHFZn0m9JC0fOSXYZtOXO6QUdlYEzDigxoi5PqUNYYFIE+UVtIJ
         GwqCbgbCOeF4NxNBAvmj1DunW8ZcPgVK/peplKrDJKaA4b+64gS+kZ4akHKUwF4XfJBU
         yDHsGew4FjsTHavu2onxi+kApLFHytsJFdBO6MJRM8S8JCOh+m0onlqKvC3QhnX7nhHw
         4SsIW6eAalIy3/6dgA7/A4f4Q6w3aKsDhlwFX5DvXnrHJaqW56BnPEHL/Weuq26xCSui
         DwPK1VGk9x1Ko5Y7f3V3w4w00GBk1FXJbKobQcgVmRdLTSHfijR+oB9aIKzpwW/BMZUQ
         fA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J4Dk8xVieNxQ2d7ddDuK1Xy3xBeAFzTGCOSitF6Ragc=;
        fh=KVsJLDHlxg5us2/ThmscPOwMEERCbXK629YENmTT4EM=;
        b=nDvb1q6fZdvAhoiQENGbSbrqMhPsGpdTMsD24H393CGjuJPenQAhvjhGkw1jhDfBS4
         C9NTVAu2jsVoHjzKHEqWNFWYBCIwjVJjVmY4VrJ7KXOUTTrKW4f13pBsEgcB4+NgFyrv
         hWPVM0iwR7MsYzXQPSl6hEOW3MaZwz1FcVs6eEWiMQPbE/Udq5Wm7pFFCKJ44mRg/Lyj
         UiAGZhuftpkF8tkQ9EPW5QebpTqM++KgeWyK9OO3s/kIEgN0ctBpzSjXN/JM+MaHCNM8
         4aJ7sWOfyMVRQQl+DcjG2VA4xuE8NiXoTKHvFJro0JpAefXjhjAuNs0mtuOecVeEgdVQ
         UESg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782817538; x=1783422338; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J4Dk8xVieNxQ2d7ddDuK1Xy3xBeAFzTGCOSitF6Ragc=;
        b=MaQC7VP3lAFr9vfFAiGSEhvOpbBf8lqf9+lnBTtbTnjOLMkI8o82WFuQy8o7yPvg4z
         hlbVx6BW3nXCXIMA8blgLSbX9X0gToJ+5HMl+L9lx/QldqlumBXrHDdSDXGwu/aXzr15
         Niw+d8ffZ57GH8Zp2y6lFi24mNYWNevVrqYVB4ZpkkF+UcQZIda8yuetEjj4d+a4OZIs
         Yp8HWN1OWL3NyK/odyR3iG2r2C3srnTaCPHWFamKunSjgkTw7zsfTKFxFpwsMxKxkycl
         uKrH0D9GfLuOVfHdg5FNa7DImcFIhJ5UtXA22YjaHmMlLVFPh3Em8ACXeEO6EtH+SwF4
         df6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817538; x=1783422338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4Dk8xVieNxQ2d7ddDuK1Xy3xBeAFzTGCOSitF6Ragc=;
        b=a2WaLKzNsLbi6CGaSWk9QTK998f4JiRc5TDHqeXs153n4a/7aTxLEu5rI9P7wf3d8b
         mD8Q97cdhWC1lOyr+NlJJjPnI/4bxKjH5Ndd3poONWuFfqcNgzZhTWiyJkNzJwvJb2As
         hWqU1Yb+tr0T9/o99RNDpNS7QFFVS4sJ6I5WLtWxQBRpnkVKEn1LXY5SJP35/aY5lSH/
         P023yJYRWNhRv4jZON/TzptEfQ1nHZj32UmXATiacpEzro99YBmNlQMRlHL7Bo6pzMIc
         KEf9aQRza9+060Phghvh0UArl19wrN8rjCv4lsi7BPNGJw7GKqUo+v8cNgG+M/uzgPXz
         AP9w==
X-Gm-Message-State: AOJu0YwoQRhwgLW+JbF7h97aqSWKSfeNIjjoZrHm3C5xTiShK7fgDNJ/
	H0Hbdfl3TWSDjPDrLVbupmRT4NZKcCiEWdBv5nb+2dozS0yoj3FEZCwjck1S6VayfSkI3nfW8UX
	ELijT6azM6wt21IOuSP9TXpufaKKJUokMzBl7x9U=
X-Gm-Gg: AfdE7cmnzHpd/wAH7rVELjNyvWEaugtnF+ng4yXnJ/zIbBBeKVWBfuLuc29ujaQnY1l
	+o9ke+nXR1NuF4lm5xdqQP5dLmiGLUCjTxGIUg3ixwHkUh7hq4ATidW9b+EC9BZ1AVbOQxG3mJ7
	wienNbREl1XrfoTgRyWwCYpPKmXbdtk2vCA7kQ0R9AB6/yJPRtTAlpG7XHlDqhqfUj0mL10eoIn
	K5RCdfVJesyFae2XMmeAnVXGdGljpV97v3Atj0F7WgcobDG6LEsJQ3UH6gTEPMg5fxo36SbPQ==
X-Received: by 2002:a05:620a:4396:b0:92e:5ba4:b81b with SMTP id
 af79cd13be357-92e6d8bcab2mr31273885a.44.1782817537639; Tue, 30 Jun 2026
 04:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <0101019f11d7a8cc-83804a7d-3721-48fb-89c9-4a1ad38679cf-000000@us-west-2.amazonses.com>
 <18BDA8231763D04D.114350@lists.openembedded.org>
In-Reply-To: <18BDA8231763D04D.114350@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Jun 2026 13:05:27 +0200
X-Gm-Features: AVVi8CfFc21EsElfV3ct_f8eDjfeFGgiHTLRwOW7KGirUvPDWmQiXHbZrsq4qtg
Message-ID: <CANNYZj9RWChsKe-Pq9PyeB7iiMEwNu3TcszO4W3sw+S_oScrag@mail.gmail.com>
Subject: Re: [OE-core] [AUH] nasm: upgrading to 3.02 FAILED
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Joshua Watt <jpewhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 11:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239879

On Mon, 29 Jun 2026 at 22:44, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> This update needs a non-trivial rebase of the patches that add
> debug-prefix-map option. I've asked Joshua to do that in the upstream
> submission:
> https://github.com/netwide-assembler/nasm/pull/8

Joshua has provided rebased patches but unfortunately they do regress
the reproducibility:
ERROR: ffmpeg-8.1.2-r0 do_package_qa: QA Issue: File
/usr/lib/.debug/libswscale.so.9.5.102 in package ffmpeg-dbg contains
reference to TMPDIR [buildpaths]
ERROR: ffmpeg-8.1.2-r0 do_package_qa: QA Issue: File
/usr/lib/.debug/libavcodec.so.62.28.102 in package ffmpeg-dbg contains
reference to TMPDIR [buildpaths]

I've pushed the work in progress to this branch:
https://git.openembedded.org/openembedded-core-contrib/log/?h=akanavin/package-version-updates-later

I vaguely remember fixing up the patches before:
https://git.openembedded.org/openembedded-core-contrib/commit/meta/recipes-devtools/nasm/nasm?h=akanavin/package-version-updates-later&id=0d7d96fb0b215e56f6dacd4dd44b12bbd7ecdd34

 but it would be much better if the specialist (Joshua :) takes over
the version update.

Alex

