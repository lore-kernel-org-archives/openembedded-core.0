Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134F8C433FE
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 13:51:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.25870.1639489878733253100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:51:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=x6PdTEki;
 spf=pass (domain: burtonini.com, ip: 209.85.221.48,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f48.google.com with SMTP id t18so32439634wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7iBg8qjOslIxEHvP76EVsWVXnmC8cU9BtpdhqWjatGY=;
        b=x6PdTEkiThgGTQwOVANyY0JukalHU2tY7OV/+IBAuDCN/QWkLaz3Hd9Q+jWTkDxfLx
         aOV6c0h0wgxqfAMhXvoNxsHKLVM5ocvfZXxirsd+bpqOMnztuIav3dzuhH/p5+4d4hL5
         FCw8CrHHnyENA5j1f/NARJkWbYwDklsPciGX44anjPuqFiMjV7iPDu18L/8hH6x4Cr6G
         dXn/DjQHBcmPIMD9oQYxQLB53MnCJ2O6/rU91SC4zByp0zFjQqtAgNr6MNEoU67uAHqH
         Bm3iztKASTZ5MXrJU4MGFm8CpYAYW6QGD/O+HjogCB+w7T9retfU8hRL4T+JQxSwKA7W
         Q78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7iBg8qjOslIxEHvP76EVsWVXnmC8cU9BtpdhqWjatGY=;
        b=h2lOtMGjjGGqEcDAS7KFzJ4UW6EVqmDgb0wm+eXq0u6DLb6k9n518FAXFNdbofaNrV
         JNiEsuopbzvH9R0xVEFfKjXxlTBIVVFmGSq/jywUZxgkkxDOiWhZGqKLAOrxHWiTgmWA
         4i6uKIsFJeoDAbuf/0MXi/yXLwd7ysRMxpl11LGl+wEGP6Yw8Y29bxp9p1knwTybXnNk
         bBz+/mT/NzG2BGCf05i0395reTUO2a5P5BcJoFPCJrnpBN1M9PXcodGanriyZTiVIkf6
         Jb4vRpMoPSkEv7mydULgM0sfQdqEGQbugG7c5rcHMefKroHAznc3q9LYbUZr7kArG8K6
         7yyQ==
X-Gm-Message-State: AOAM532iAXO9SttsiYIJSkofXIAPvNJxXyNE0GU477CIDupnZKUOwsbT
	+m/jyh9rYrA06Km6oAYuGAmsPcj/PXt9evr0ZprfWA==
X-Google-Smtp-Source: 
 ABdhPJzFOJU2rkZMhoOPjHGzn1Szm6XNAStENNsSsttnS2ncs3f09mzpj2htlIpZd++v/+8m/ZwLs3bVuzSNM5Q8HDg=
X-Received: by 2002:a5d:5712:: with SMTP id a18mr5861454wrv.451.1639489876492;
 Tue, 14 Dec 2021 05:51:16 -0800 (PST)
MIME-Version: 1.0
References: <a3f88955-541b-7aef-d3b6-b5de28cfa83@crashcourse.ca>
In-Reply-To: <a3f88955-541b-7aef-d3b6-b5de28cfa83@crashcourse.ca>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 14 Dec 2021 13:51:05 +0000
Message-ID: 
 <CAAnfSTvyCdxsF1jjGqKXEecA2t_wj9UohEnuzAPLJV-My7mEKg@mail.gmail.com>
Subject: Re: [OE-core] ROOTFS_POSTPROCESS_COMMAND versus do_install_append()
 and using ${D}?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 13:51:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159690

On Tue, 14 Dec 2021 at 11:39, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   what i'm looking at now does it in a more curious way. there is a
> catch-all recipe file (call it "catchall.bb") which lists, as its
> DEPENDS list, *all* of the recipes that make up the image, which means
> that building catchall.bb builds and populates an image directory with
> the combination of all those other recipes, after which it defines
> both pkg_postinst_${PN} *and* do_install_append(), both of which run
> around and make changes relative to ${D}, given that the image
> directory for that recipe effectively contains, well, everything that
> will go into the rootfs.

Either you're explaining badly, or that isn't doing what you expect.

A normal catchall.bb recipe which DEPENDS on all other relevant
recipes will result in the recipe-sysroot directory containing the
sysroots for those recipes, but that is all.  the image directory
won't contain anything apart from what catchall.bb's do_install
installs.

Ross

