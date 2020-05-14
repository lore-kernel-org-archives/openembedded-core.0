Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.2083.1589493552227829621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 14:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XX2cisOq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id e16so782609wra.7
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 14:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=TIKQJ0OzLsc+XYXild/rrvLE/q3srQWLbGycH45ulJg=;
        b=XX2cisOqQTJA/7E+sZ7SUcvsDIDbetsqqjhcjymIvmna6hsiDKEnbFRm3OkA/BsjFz
         3VOonZTi4jglbonbuUWHzByOrKoyO+UXsW12bH/a8ganASr/VBf9WUSAMuO4eXnefPME
         9CGkLowLthhZ0x7T7q3HCz51HGwj0lTPApLdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TIKQJ0OzLsc+XYXild/rrvLE/q3srQWLbGycH45ulJg=;
        b=C031lj2RuMJjKLXpKUQMHGNTVMlR5QYoGNrTKphzlyId5MUUXXGGCJcPt8O/Z5QLr4
         a39GEVjuL7qdywxije0m8cIIpwiksHVLC8YAIMqEc90CgrDZcvY6aeMihtv4lPLgbtUv
         CW2Hmt2wQPWiI5wmyGwUxrCmI8uDKUeNjyRQWE1LHxYbvANFmZsWVPpm0Byg8HQNaKWt
         FFCkJ5byz0n9I6q1yWHV3gYs40jaSO33MCKEUImT66JimK3eNJ0mDHh76o/cuxzf825A
         JkK/D8LHjS5Y8H6mi1pexebE0kcmUcTpc+5dOpVE09FI1XsO599KhnUvJPDtFRudGkNt
         qykA==
X-Gm-Message-State: AOAM531tipZLLSEQlpsq7LW+ChrPvxxDbgfCKf+d5IioqywKjK4VxFSa
	BixnRArk2hkL4SYDk95MwZb9cw==
X-Google-Smtp-Source: ABdhPJzT3ifyWv60KOuGISwF2CMbv6MqD7z7T3qGDxHhmv0OUDWzi9dlyZ8abrJwOpm9JlrHKYE+uQ==
X-Received: by 2002:a05:6000:1241:: with SMTP id j1mr586049wrx.42.1589493550748;
        Thu, 14 May 2020 14:59:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id o15sm438681wrw.65.2020.05.14.14.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:59:09 -0700 (PDT)
Message-ID: <a040ae6cce408cb4dfaa7f302679d426b65e66c1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] image_types: declare support for wic.zst
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Diego Rondini <diego.rondini@kynetics.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2020 22:59:06 +0100
In-Reply-To: <CAMfw5YopZDvTBsL=zVKGTLPv5uvfmJ0L7j+y0r9PpO7drYwKMQ@mail.gmail.com>
References: <20200514131956.18463-1-diego.rondini@kynetics.com>
	 <46e7dbc17ee0237529c6ae3d3f5162aa16105cd0.camel@linuxfoundation.org>
	 <CAMfw5YopZDvTBsL=zVKGTLPv5uvfmJ0L7j+y0r9PpO7drYwKMQ@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-05-14 at 23:53 +0200, Diego Rondini wrote:
> Hi Richard,
> 
> On Thu, May 14, 2020 at 11:21 PM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2020-05-14 at 15:19 +0200, Diego wrote:
> > > Declare images in wic.zst format as supported, as bmaptool now supports
> > > zstd:
> > > https://github.com/intel/bmap-tools/commit/1b8437d58447d3796dc11fd0f2c62bec5746e5d6
> > > Given the very fast decompression speed of zstd over, for example, gzip,
> > > writing images with bmaptool can provide big write speed improvements
> > > when decompression speed is the limiting factor (especially with very
> > > sparse images).
> > > 
> > > Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> > > ---
> > >  meta/classes/image_types.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> > > index f82f1d8862..ab05cc90ff 100644
> > > --- a/meta/classes/image_types.bbclass
> > > +++ b/meta/classes/image_types.bbclass
> > > @@ -273,7 +273,7 @@ IMAGE_TYPES = " \
> > >      ubi ubifs multiubi \
> > >      tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
> > >      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
> > > -    wic wic.gz wic.bz2 wic.lzma \
> > > +    wic wic.gz wic.bz2 wic.lzma wic.zst \
> > >      container \
> > >      f2fs \
> > >  "
> > 
> > Causes selftest failures:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/931
> > 
> > (oe-selftest -r imagefeatures.ImageFeatures.test_image_fstypes)
> > 
> 
> I'm wondering how this didn't pop up earlier. The following patch introduced zstd support:
> http://git.openembedded.org/openembedded-core/commit/meta/classes/image_types.bbclass?id=77e0f502020085875bbc74da66815c89f19a9351
> of course specifying a DEPENDS on zstd-native:
> http://git.openembedded.org/openembedded-core/tree/meta/classes/image_types.bbclass?h=yocto-3.1#n316
> but... zstd is NOT in oe-core, but in meta-oe!
> http://layers.openembedded.org/layerindex/recipe/116635/
> 
> I guess the solution for master is to move zstd to oe-core, right?
> 
> But what about dunfell? It has the zstd support in image_types.bbclass patch, but we can't add zstd. Shall we revert the patch?

I think:

meta/lib/oeqa/selftest/cases/imagefeatures.py:        blacklist = set(('container', 'elf', 'f2fs', 'multiubi', 'tar.zst'))

may be the clue to fixing this.

Cheers,

Richard

