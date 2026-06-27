Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE28C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 18:11:17 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60266.1782583870091280263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 11:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PL0fQLzf;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51a019e9ea9so20303901cf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 11:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782583869; x=1783188669; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oAsK98AjrRsyn35FtqthVtANfPp8TZ4ui/m4vTMCIb8=;
        b=PL0fQLzf8yeO/WoOke2zJSU5JHnMtiQvGNsIJTj+6INK/RPKfmMhSGVyXZBGdJBnoh
         zjP9jrjyLWmGhWW43iPGTD5k7893d/yRaYZm7hO2vv3qOpRp2XWnTnX0gmCqvOki2aF0
         7pV4OBxMirC+Mxv+oF36NSUULNu8Btqhep1iD7TEXas2VDFD//FDqRbT7vOBVW1ICorL
         CD8Aqga6B83fR1wvkkg70X3w4s5BCnxdhnyjg+gdWoqq1sQVKtSVUIvd+xB8ZZ6fbVmA
         UVqyigPH1BQdlE/sHiOwNDijluM+TBCG/kYjCQTMEU/O3pylN/T4ECGjr/y5IODny4E9
         aGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782583869; x=1783188669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAsK98AjrRsyn35FtqthVtANfPp8TZ4ui/m4vTMCIb8=;
        b=lu7cHzpBKfG+WKQ8BAKjlWkCP33K2s91zXQwpZGpc0GLAabqar7j7OO3wIvvhSMpJS
         gaoDLj2aqvcBUZjq0vYmNaix70Hb3glEtVAOTPw0sUiJLNEf64HKK8GW0+MMmRcVALLn
         ZsDYG6Dl7dyyd11EQme9oDonpmzDSjMUEYPl3MqgBu3a8M4/dCgklMf08uh3vAQ6BGyU
         rr5CqmYClDUnjY/71+3ZxoB5Z8KKYhW5TeqBkxT3WNdyZgZ0JxH+oTLkEtRXW9sc7V39
         uYzMpj8hLDJmelEuuirEp9N/xcqUvln6+L78ek88WM0nV1PgUeU2gCqZeMWSnRr3e0gU
         fgVg==
X-Forwarded-Encrypted: i=1; AFNElJ9fkydSDMrViXUfxHmQgQW9zV2PQKXNcgdBtPBY8z0xDhlByLddeq6PZC+w/uq8a6Z8j7J+0GA7KMq5/DVxd+Frmw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyd3fUGVWPvyiRzEOb6ncvJ6pFempw+wOP0uW/o/gX6dtHA9SNy
	+TrBrNNv1zvqGcVxHrb2ncYJks1OTjytQuSOWcdrsYw39MMDSzX8ESQK
X-Gm-Gg: AfdE7clnb2IL6HnPnyhgMn8HOtVbac8EMA92tcHNEsx9shr4/+4ylLZlYD0qEKSkXNj
	FUiHbj+awkfA8YqONA4j8mB+BkGVB0k1TL3diG7cjBsokcrf/3kw75wAw7RlIyj4AfGIP6S/iFO
	ZSjfx3hhsAKKZ/ld4jnDuX5R5j853Xrq2h6YY7SctlAcJHoaswAsP8Wit3wMJka3wzch33XngRs
	5feUZXS88BlLyTGGcVygoLytRK0QvIZR6IWlGZ+PraJwYluKaVbjGtoPundt3+IJ54biGy4yz+W
	NdDXYH7LKO/Wi+L3F3fyFTB1zLLKYm8IV4Wrin+wEK7WnTbyBsfuz4lZfupeIHlhiWC9E2+8O86
	Lw9Uwlb/dtUM++wiNm/l2MuoLRz5umz+6X9HZkEF7JS+WrXwxH7IdNdqDD3xeE5yFw4NVNY922q
	NUQtH04mtGKXx8s6TlwHMU2OAlZNBXRa2ig8N1nmAr2xDIZg7/o+mvVns=
X-Received: by 2002:ac8:5806:0:b0:517:a174:f419 with SMTP id d75a77b69052e-51a8afdc143mr68695001cf.19.1782583868940;
        Sat, 27 Jun 2026 11:11:08 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7fbdd5f1sm255892316d6.21.2026.06.27.11.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 11:11:08 -0700 (PDT)
Date: Sat, 27 Jun 2026 14:11:06 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: aleksandar.nikolic010@gmail.com,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
	Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: Re: [OE-core] [scarthgap][PATCH v2] wic: Fix updating fstab for nvme
 devices
Message-ID: <akASOiHwAAO8YQj-@localhost.localdomain>
References: <20260621202519.177293-1-aleksandar.nikolic22@pm.me>
 <DJJCKP83KPUW.2ECUA0V3VKK9P@smile.fr>
 <aj8Ws4BY4p5RTISk@localhost.localdomain>
 <CAMSfU+7MH7MrahkitU8Z-c0+dyZS=37bqo+V1iAczOOnUANRdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMSfU+7MH7MrahkitU8Z-c0+dyZS=37bqo+V1iAczOOnUANRdQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 18:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239702

On Sat 2026-06-27 @ 10:20:50 AM, Yoann Congal wrote:
> Le sam. 27 juin 2026, 02:18, Trevor Woerner <twoerner@gmail.com> a écrit :
> 
> > On Sat 2026-06-27 @ 12:51:14 AM, Yoann Congal via lists.openembedded.org
> > wrote:
> > > On Sun Jun 21, 2026 at 10:25 PM CEST, Aleksandar Nikolic via
> > lists.openembedded.org wrote:
> > > > From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
> > > >
> > > > In case wks file references nvme, update_fstab() function will not add
> > > > prefix 'p' before the partition number, as the if condition only takes
> > > > mmcblk into consideration.
> > > >
> > > > In case of nvme0n1 this leads that following entries are added to
> > fstab:
> > > >
> > > >     /dev/nvme0n11
> > > >     /dev/nvme0n13
> > > >
> > > > instead of:
> > > >
> > > >     /dev/nvme0n1p1
> > > >     /dev/nvme0n1p3
> > > >
> > > > The patch fixes this as it extends the if condition and adds prefix
> > 'p' for
> > > > both mmcblk and nvme.
> > > >
> > > > Upstream-Status: Backport [
> > https://git.yoctoproject.org/wic/commit/?id=f20cda73b495b75ef399c331f59b0e2401a3e76a
> > ]
> > > > Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
> > >
> > > Hello,
> > >
> > > Sorry I missed it in earlier reviews but it look like this patch is also
> > > needed on wrynose: wrynose has wic 0.3.0 but this patch is 2 commits
> > > above that.
> > >
> > > To accept this patch on scarthgap, I would need a equivalent patch for
> > > wrynose. Can you send that and ping back here?
> >
> > In scarthgap wic is part of oe-core, in wrynose it is not.
> >
> > For wrynose it would require a completely different patch; but it would
> > probably be best to just update the SRCREV instead.
> >
> 
> Trevor, thanks for the added details.
> 
> Do you plan to release a wic 0.3.1 soon? Or do you recommend we switch from
> version based SRC_URI to commit based SRCREV (I'd prefer to stay version
> based)?

I just sent: https://lists.openembedded.org/g/openembedded-core/topic/patch_wic_upgrade_0_3_0/120007269

> Looking at the master logs, I could take a 0.3.1 upgrade with the current
> master state.
> 
> Alternatively, we could backport Aleksandar's fix on top of the 0.3.0
> recipe (as usual)
> 
> Regards,
> 
> 
> > > Thanks!
> > >
> > > > ---
> > > >  scripts/lib/wic/plugins/imager/direct.py | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/scripts/lib/wic/plugins/imager/direct.py
> > b/scripts/lib/wic/plugins/imager/direct.py
> > > > index a1d152659b..b06e6a8f23 100644
> > > > --- a/scripts/lib/wic/plugins/imager/direct.py
> > > > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > > > @@ -133,8 +133,8 @@ class DirectPlugin(ImagerPlugin):
> > > >              elif part.use_label:
> > > >                  device_name = "LABEL=%s" % part.label
> > > >              else:
> > > > -                # mmc device partitions are named mmcblk0p1,
> > mmcblk0p2..
> > > > -                prefix = 'p' if  part.disk.startswith('mmcblk') else
> > ''
> > > > +                # mmc and nvme device partitions start with prefix 'p'
> > > > +                prefix = 'p' if part.disk.startswith(('mmcblk',
> > 'nvme')) else ''
> > > >                  device_name = "/dev/%s%s%d" % (part.disk, prefix,
> > part.realnum)
> > > >
> > > >              opts = part.fsopts if part.fsopts else "defaults"
> > > > @@ -266,7 +266,7 @@ class DirectPlugin(ImagerPlugin):
> > > >                  elif part.label and self.ptable_format != 'msdos':
> > > >                      return "PARTLABEL=%s" % part.label
> > > >                  else:
> > > > -                    suffix = 'p' if part.disk.startswith('mmcblk')
> > else ''
> > > > +                    suffix = 'p' if part.disk.startswith(('mmcblk',
> > 'nvme')) else ''
> > > >                      return "/dev/%s%s%-d" % (part.disk, suffix,
> > part.realnum)
> > > >
> > > >      def cleanup(self):
> > >
> > >
> > > --
> > > Yoann Congal
> > > Smile ECS
> > >
> >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#239668):
> > https://lists.openembedded.org/g/openembedded-core/message/239668
> > > Mute This Topic: https://lists.openembedded.org/mt/119915320/900817
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> > twoerner@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> >

