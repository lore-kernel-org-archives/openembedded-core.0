Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60110F4BB69
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 17:38:35 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26048.1771954714292430357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 09:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SGHPzg82;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c70ab3b5fcso797518885a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771954713; x=1772559513; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rnz4ttxh4hkIQiZE8MlhIiwZmntnQUcsa2IrNSDJe6o=;
        b=SGHPzg82GC/qBR2Dx20gJDMsK1MLMuzZYFlFK5sHdsKfeUfHfh+y3U1IeAftOIjFyr
         LijVksFyecRuwSltXkynH8tCX/odpTHINPL4/lca7JEiplXI3p5wvssvEptqu5k66tBk
         1g1/B6HIT9Lu+pFiukYh4XeENeL2M3N7woN/oPXfCLe8TJfKIQNq+acyPw2NZdnLrKn6
         skpK6AsieT+MpnZt+ZCC+FPlZGEwImAyeuAXRvi8Wnp2CnyU0xjYT44gS+A6bW31N/Iu
         tTXBXGawdvOdnM7PCDFVnwxNq83boImOmg27xYpm4FIR76ueoNJ1GEz7UtsPIXikyMCX
         MYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771954713; x=1772559513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rnz4ttxh4hkIQiZE8MlhIiwZmntnQUcsa2IrNSDJe6o=;
        b=JT4rcq9Q1c/s0i8Egb8WyieGgQDjEZv9XSvtdCp/xbP3zkC6e6hSvlr00A50GRrRAt
         xdLWbmOUIq5dPCA/hvPyuD89cdU3K+6oe9ax/TE5ZOPncDeR15ezLted5WHGgt1qfD9e
         kdTb4RWGP4IUKzpy9o58UQHiI5ymyVe4eV+IMwhL+mIlBEOfuZY6ebamCJhf85jnksam
         D6q8cZ6QiH/YjXMHR9yikAKIRSrOGapNNQCosqhzOSJGIQy+wS8s3l//2I2NfMdr15Rb
         zTFAIf46fwwqqXRT9UBvf3W1ujbUL6jBVGUJAqVUbbk28aqdYrqMgptrVCj7OcdmtFQ8
         KYbA==
X-Gm-Message-State: AOJu0YxUwrzYOeytWA7ypbb28c2hJbZ0vDmzMU583YOcGz+xDVBba9Fm
	JcQAwerQFLmj65m2YeSyjOJnU22IIEoTnLptiUjpeXciGjRRUDTdMSf8CF95ixua
X-Gm-Gg: AZuq6aKchu2Sao96QwHKM3eeLWvWAvi0yrnqIHOmuJ0SAqUJx7KcgJChHIqI2zki4Z6
	21ZE8fqQS/whQPWj6XnyDFRXEG+HK1q/penpK8zBWqNl/Zg3JKmXW3SrHfyxrwyonlCpIq4jFs3
	VOY5IMbVSOrpXWpPvQ76Y4Uzz2gmsF6pCAVusQV6F+ndaZaK18ga1M9/wP+M9JyYQwggUzyLHGU
	rW2tMdponHQkaMQzakmQQA/SjB6CJwGW5dHjaGZQanv5qken7FX+pFmNFIWBBz5lVK2/SEYygEU
	zNbBcI7qgx3G64cpI8UEQoNy4b3KyNJR60hCU4vvW/uEF48Ve8Oj5Wq/vNp7JiiT3t0FLrT5T8o
	qSWRYiLg3lqk67Bcd/cQUG2VwWwhlk4OJKCGmySepY55oMr5c/lNJ1gdDb/3sdzYJ8isZRhHNYq
	S8wBtEFHk9QuPzmim8L63NRyVepPjMHLtN5sXWs6dSA7yMEJWR1R1KlGlkNm4hyER/jQ==
X-Received: by 2002:a05:620a:4150:b0:8c9:f996:8203 with SMTP id af79cd13be357-8cb8c9cde5bmr1782849285a.13.1771954713222;
        Tue, 24 Feb 2026 09:38:33 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d121095sm1009103785a.48.2026.02.24.09.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 09:38:32 -0800 (PST)
Date: Tue, 24 Feb 2026 12:38:30 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5 04/10] wic: provide oe-core wks files
Message-ID: <aZ3iFjn1BpA_6eo4@localhost.localdomain>
References: <20260223215008.2062721-1-twoerner@gmail.com>
 <20260223215008.2062721-5-twoerner@gmail.com>
 <afa3b3fb5c285e9d0a2b55a753244df88ac70465.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afa3b3fb5c285e9d0a2b55a753244df88ac70465.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 17:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231898

On Tue 2026-02-24 @ 10:08:30 AM, Paul Barker wrote:
> On Mon, 2026-02-23 at 16:50 -0500, Trevor Woerner via
> lists.openembedded.org wrote:
> > By convention, wic will look for a "wic" directory in the top-level
> > of all BBLAYERS in order to find *wks files. oe-core was the only
> > exception; it stored its *wks files in scripts/lib/wic/canned-wks.
> > Take the *wks, *wks.in, *inc, and *cfg files that were in the old wks
> > location and place them in a "wic" top-level directory in the oe-core
> > layer, thereby following the convention of every other layer.
> > 
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > changes in v5
> > - rebase with master
> > - split patchset out again
> > 
> > v4: skipped to align/combine with other patch set
> > 
> > changes in v3:
> > - squashed into 1 large patch
> > 
> > changes in v2:
> > - none
> > ---
> >  meta/classes-recipe/image_types_wic.bbclass |  2 +-
> >  meta/wic/common.wks.inc                     |  3 +++
> >  meta/wic/directdisk-bootloader-config.cfg   | 27 +++++++++++++++++++++
> >  meta/wic/directdisk-bootloader-config.wks   |  8 ++++++
> >  meta/wic/directdisk-gpt.wks                 | 10 ++++++++
> >  meta/wic/directdisk-multi-rootfs.wks        | 23 ++++++++++++++++++
> >  meta/wic/directdisk.wks                     |  8 ++++++
> >  meta/wic/efi-bootdisk.wks.in                |  3 +++
> >  meta/wic/efi-uki-bootdisk.wks.in            |  3 +++
> >  meta/wic/mkdisk-ufs.wks                     |  5 ++++
> >  meta/wic/mkefidisk.wks                      | 11 +++++++++
> >  meta/wic/mkhybridiso.wks                    |  7 ++++++
> >  meta/wic/qemuloongarch.wks                  |  3 +++
> >  meta/wic/qemuriscv.wks                      |  3 +++
> >  meta/wic/qemux86-directdisk.wks             |  8 ++++++
> >  meta/wic/sdimage-bootpart.wks               |  6 +++++
> >  meta/wic/systemd-bootdisk.wks               | 11 +++++++++
> >  17 files changed, 140 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/wic/common.wks.inc
> >  create mode 100644 meta/wic/directdisk-bootloader-config.cfg
> >  create mode 100644 meta/wic/directdisk-bootloader-config.wks
> >  create mode 100644 meta/wic/directdisk-gpt.wks
> >  create mode 100644 meta/wic/directdisk-multi-rootfs.wks
> >  create mode 100644 meta/wic/directdisk.wks
> >  create mode 100644 meta/wic/efi-bootdisk.wks.in
> >  create mode 100644 meta/wic/efi-uki-bootdisk.wks.in
> >  create mode 100644 meta/wic/mkdisk-ufs.wks
> >  create mode 100644 meta/wic/mkefidisk.wks
> >  create mode 100644 meta/wic/mkhybridiso.wks
> >  create mode 100644 meta/wic/qemuloongarch.wks
> >  create mode 100644 meta/wic/qemuriscv.wks
> >  create mode 100644 meta/wic/qemux86-directdisk.wks
> >  create mode 100644 meta/wic/sdimage-bootpart.wks
> >  create mode 100644 meta/wic/systemd-bootdisk.wks
> 
> Can we move these files from scripts/lib/wic/canned-wks to the new
> location before removing wic, i.e. re-order this and the previous
> commit? That would better preserve the history of these files and
> simplify the diff.

Great idea! I'm disappointed I didn't think of it :-)

