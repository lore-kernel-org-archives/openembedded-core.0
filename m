Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.5685.1626947689958539895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 02:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FeySCCHm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id o3-20020a05600c5103b029024c0f9e1a5fso932934wms.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OI0/Tb/7jPaO6/3CjAP6VBh4NazW34StEJyS07EjNdY=;
        b=FeySCCHm7GQ0bFSjeKFnMmT25pEXgPsc1Vstirck4e/0+1/iLdKgF6PB4GtKRFhHUN
         dHDAvRc7W7f7HopcdiVsMQG5Vjk8Qab2qNR8HpoM7p+5lSzl9vSLk2brHy1kUgaP+N9A
         p4779DBLSeNmmyMcD3dJJ2zUlvsjqJicUlxzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OI0/Tb/7jPaO6/3CjAP6VBh4NazW34StEJyS07EjNdY=;
        b=J6utuZjiAlziP8APpgw8QZ8mN3Nn7y0FNHhHwGt4VWLpP8fSjItyZYP9NGqiPHkIuQ
         ZMkYAtpilIblzaEAAVvX1LGVpkuuQXnC1OjJZCimYTbTt1DGe4iLbLRXvUwKhWlwBAPp
         I9Ju5Lk8AuSsTVLN2Dcc9rGSOgLqjXaTjH42QJ8eY55K4a6Ebh7sK8BWc2TO4V4i4sPD
         cfy3C7jjTlB4ouRXTezclHMnhjET0+/IdV+0Hx/n5B3V8Om+HdwaT1chc8UKD+8jrYVf
         5D5bIr9J281VZl9LTsYPvZBZee+hvbX+lacpB7yC0jw4x00UtIOk+vvoQV7ApIL+qYsb
         xmqQ==
X-Gm-Message-State: AOAM532AHBp3kuRjwIu2bmWwT3WBtD4ARnyHk0AjH6ER4WZnSgk9psbq
	WIDv8HzfBblw9LBGRECiM39jfw==
X-Google-Smtp-Source: ABdhPJyM50A0KzOIBpSYOKBnTaSCsUUUuj3V6f1DoOrRDvILa8pyihl4+8pzPHdpJvRL9rbSPPmIcg==
X-Received: by 2002:a1c:7706:: with SMTP id t6mr41687420wmi.36.1626947688408;
        Thu, 22 Jul 2021 02:54:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:40b3:3f27:e412:a801? ([2001:8b0:aba:5f3c:40b3:3f27:e412:a801])
        by smtp.gmail.com with ESMTPSA id b15sm34563261wrr.27.2021.07.22.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 02:54:48 -0700 (PDT)
Message-ID: <c1e1b6baaf6f997dcfa869811b4b5e7061948881.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] yocto-check-layer: Avoid bug when iterating and autoadding dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jul 2021 10:54:46 +0100
In-Reply-To: <CAP71Wjyp8kXrxzKU0DZA5Znvg+5vgy50pU16k668nUueSqGhpg@mail.gmail.com>
References: <20210424142633.1646440-1-richard.purdie@linuxfoundation.org>
	 <CAP71Wjyp8kXrxzKU0DZA5Znvg+5vgy50pU16k668nUueSqGhpg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-07-22 at 11:34 +0200, Nicolas Dechesne wrote:
> hey Richard,
> 
> better late than never they say ;) 
> 
> On Sat, Apr 24, 2021 at 4:26 PM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > If iterating a layer with multiple components and auto-adding dependencies
> > the tests can break since layers are never removed and order isn't guaranteed
> > to account for that.
> > 
> > Fix this by resetting the layer list back to the original list each time
> > before auto-adding the dependencies in each case.
> > 
> > This fixes scanning of meta-openembedded in particular where the sublayers
> > may not be added in order of minimal dependency.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  scripts/yocto-check-layer | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
> > index b7c83c8b543..deba3cb4f8c 100755
> > --- a/scripts/yocto-check-layer
> > +++ b/scripts/yocto-check-layer
> > @@ -138,6 +138,9 @@ def main():
> >                  layer['type'] == LayerType.ERROR_BSP_DISTRO:
> >              continue
> > 
> > +        # Reset to a clean backup copy for each run
> > +        shutil.copyfile(bblayersconf + '.backup', bblayersconf)
> > +
> > 
> 
> 
> I was spending some time in yocto-check-layer, and noticed this patch. You have 
> the exact same statement 10 lines later. I think this patch should have moved the 
> statement before the call to check_bblayers() instead of duplicating it. And I 
> think this patch is a fix for a problem introduced in be02e8dbfb0d (checklayer: 
> check layer in BBLAYERS before test).
> 
> I can send a patch to remove the duplicate statement, or if simpler for you, you 
> can do it directly. 

I've queued and sent out a patch, well spotted, thanks!

Cheers,

Richard

