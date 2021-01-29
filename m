Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.7766.1611916681205224211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f/AN/BlS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id m2so6457899wmm.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=f0Rk3hsKAt6feOrP0W8yxgljDp626fpBRcgxBaa7wVM=;
        b=f/AN/BlSzZYz5Hikhc0aZRLdzuCoQkQTW5gG3pR7JpDy220awCR3gMfRHLKZMIFxUT
         qmlbk5CnA6wXvttAU3yUOfKF/nKKT/Ap8Ce+hpBbQcVYLj/B9tJCKT3HhgKvL8+Tdrdq
         o3Rc+natJmBxKRzWWWd69DuKIvxkU6Zdqweko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=f0Rk3hsKAt6feOrP0W8yxgljDp626fpBRcgxBaa7wVM=;
        b=LP8MLjRsYMNwxKyAOmDJRwzycLQKisygP2IviGBp4h+yFmCzVVcAh688GEcCZrJV4f
         dnDyDBjFd2QMeabMi5aQdZJ3Z33rMazOVTIxpe4SnkDhMRyefvvWHyDRjZbkSxjqz76P
         LN/+lESfjxhgKxC5IFYa34x2Yfttf2AglLxle0xbMWYPWHdO7JTPTb3XPL98+Wxn091Z
         zWH9uNL5ZjlnZnxArxflaSPp/byvSB6xl3TEdOfjOjPTjHrTSAx3FViO6r/LXyz3fyL3
         9UWSaYkdSwn6F22/19polWI+Y60tgysxb1UXA7TCw5t/mA5O8M1IJlUCUUcMawqzX7W6
         aQiA==
X-Gm-Message-State: AOAM532HFpbc0hJy1XK+dF/VUBh7BW9NLcHU7NTlvJKjeNVdX0NFcCFr
	2lvyJgbjMh5UIeZ+gnCj5P/Xxg==
X-Google-Smtp-Source: ABdhPJzh4L+RhzBT1l33Ee73Vd7suMS0CEtT6h/RGt9rWtCUrMgqVqp4uv3ZlQhSkxAMgc8Yx1u2Rw==
X-Received: by 2002:a1c:7312:: with SMTP id d18mr3127958wmb.155.1611916679597;
        Fri, 29 Jan 2021 02:37:59 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:93ef:509c:4f16:14ff? ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id d2sm12715691wre.39.2021.01.29.02.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:37:59 -0800 (PST)
Message-ID: <c8e374aa714b3165d3555c29b13e87297d0259ec.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/13] gobject-introspection: Fix variable override order
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2021 10:37:56 +0000
In-Reply-To: <20210129103115.pxlpkl3hyesofb5l@qschulz>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
	 <20210129103115.pxlpkl3hyesofb5l@qschulz>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-29 at 11:31 +0100, Quentin Schulz wrote:
> Hi Richard,
> 
> On Fri, Jan 29, 2021 at 10:24:07AM +0000, Richard Purdie wrote:
> > The DEPENDS variable override ordering here was almostly certainly
> > incorrect and led to weird behaviour when making changes elsewhere.
> > Correct it.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  .../gobject-introspection/gobject-introspection_1.66.1.bb     | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
> > index ee0ab2866b8..ebac8d3a432 100644
> > --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
> > +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
> > @@ -28,14 +28,14 @@ GTKDOC_MESON_OPTION = "gtk_doc"
> > 
> >  MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"

> > -DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
> > +DEPENDS += " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
> >  
> 
> Not sure to understand the reason for this change other than "cleanup"?
> 
> Are you expecting to be able to override DEPENDS from other recipes and
> couldn't do so because of the "_append"?
> 
> If that is the case, it seems this patch should be split in two so
> there's proper explanation?

This is a recipe, not a class so overriding from other recipes isn't an
issue here and I maintain that even the classes should really be using
+=. What is an issue is how the DEPENDS_append below interacts and also
how the native.bbclass remapping interacts with things. I was wrestling
with both of those trying to get the code to do the correct thing,
probably before realising the bigger issue was the reversed overrides
order below.

It probably is ultimately a cosmetic change but it seemed 
to make sense to clean it up whilst in here. To me, it seemed in
keeping with the other change and I was already sending enough
patches...

It is also the combination I tested and I have little interest in
separating and testing it individually without the other change which I
suspect will break.

> >  # target build needs qemu to run temporary introspection binaries created
> >  # on the fly by g-ir-scanner and a native version of itself to run
> >  # native versions of its own tools during build.
> >  # Also prelink-rtld is used to find out library dependencies of introspection binaries
> >  # (standard ldd doesn't work when cross-compiling).
> > -DEPENDS_class-target_append = " gobject-introspection-native qemu-native prelink-native"
> > +DEPENDS_append_class-target = " gobject-introspection-native qemu-native prelink-native"
> > 
> 
> Ah, the classic :)

Indeed. I do suspect there were issues in the way native class
extensions were behaving which may have lead to this :/.

Cheers,

Richard


