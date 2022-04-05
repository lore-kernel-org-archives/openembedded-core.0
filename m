Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C96EC35280
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.8782.1649176816914653047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 09:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EQnQQhZQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id r7so8362851wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 09:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=CZoNBmr+67ZTKh+Bul8AeO5E/R76eC5DyuejH+6wTIY=;
        b=EQnQQhZQdE4haEOuNT5Rqtyt1LKZ7W5XOvGzIU8gWOpYUURhZ+lv01Ie/CNkrjGcxg
         m3CKJrdRbPLebb3Aip81uSyIx0OU/ZD10ottOP9P5SU1GoBL8F5TmYbbs0zR17+un2Cp
         cVLCaqmuIMi9EM2EvczZ6uOxPlb3O0Lml3SkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CZoNBmr+67ZTKh+Bul8AeO5E/R76eC5DyuejH+6wTIY=;
        b=0p1YJ/DLh/n1uhC9ZJoFDakZAqv3Jptv+ed8Dn4sMRq7vhy9htcRU+YRdefrTXvubW
         nRw4AvSxGSmbijbHDfrggD/xaGPRds/r9j3sUit2vorJGaXWRI/MjfZDo8sb39/1uB+5
         yEdi8qtUF02x7S7Y/7QY9T/wK63uHGyDoAKkJjsqpAOuo+iiyPOasIULGGYHTMoenOqm
         8/iFJAgpyXT/Z46yV0nUigCWi9oHGBZ4ihvUcpMiKPK39qD6uON/WhkAoL+wHV+grbVO
         p32ozI1RlGqPuc60YaEFSZPUq8aNWeUvAIqP8tP+f/pyu/aW5iV1AO5XCO0FRmzPovYV
         wwcg==
X-Gm-Message-State: AOAM533igUaW78rj2ZPHhQFxgMe3zbjFLR7M/hptzpPC6SROpnMiJxE6
	8G2wMRAwkSzl31A+RYNfcQA29Q==
X-Google-Smtp-Source: 
 ABdhPJzR4b0qiwuOfGJW0nW7HcbhLQB7BNCx7wVuytauavg3DB8eXo1VODHZUWq8KCrAvGlZrR0iBQ==
X-Received: by 2002:a1c:4e01:0:b0:38c:b316:e6f5 with SMTP id
 g1-20020a1c4e01000000b0038cb316e6f5mr3866139wmh.93.1649176815266;
        Tue, 05 Apr 2022 09:40:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:87d4:527c:2858:e93c?
 ([2001:8b0:aba:5f3c:87d4:527c:2858:e93c])
        by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0037bdfa1665asm3568872wmj.18.2022.04.05.09.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 09:40:14 -0700 (PDT)
Message-ID: 
 <67773b10133d941032fbdce3b39efd76ca3aac0a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libpcap: Disable DPDK explicitly
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sean.anderson@seco.com, "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 05 Apr 2022 17:40:13 +0100
In-Reply-To: <34d0965e-b533-1ba8-72a1-d76122ebc2d2@seco.com>
References: <20220210204919.3029824-1-sean.anderson@seco.com>
	 <6d9e43d436cf62b31cc0848b1d325fdecef6bb9d.camel@intel.com>
	 <34d0965e-b533-1ba8-72a1-d76122ebc2d2@seco.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164048

On Tue, 2022-04-05 at 11:18 -0400, Sean Anderson via lists.openembedded.org
wrote:
> 
> On 4/5/22 11:02 AM, Mittal, Anuj wrote:
> > [You don't often get email from anuj.mittal@intel.com. Learn why this is important at http://aka.ms/LearnAboutSenderIdentification.]
> > 
> > On Thu, 2022-02-10 at 15:49 -0500, Sean Anderson via
> > lists.openembedded.org wrote:
> > > libpcap looks for DPDK in the same way it looks for DAG. This can
> > > poison
> > > the build even if it doesn't find anything. Explicitly disable dpdk.
> > > 
> > > Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> > > ---
> > > 
> > >  meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
> > > b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
> > > index 9a8c46e0ef..dbe2fd8157 100644
> > > --- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
> > > +++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
> > > @@ -19,10 +19,11 @@ BINCONFIG = "${bindir}/pcap-config"
> > > 
> > >  # Explicitly disable dag support. We don't have recipe for it and if
> > > enabled here,
> > >  # configure script poisons the include dirs with /usr/local/include
> > > even when the
> > > -# support hasn't been detected.
> > > +# support hasn't been detected. Do the same thing for DPDK.
> > >  EXTRA_OECONF = " \
> > >                   --with-pcap=linux \
> > >                   --without-dag \
> > > +                 --without-dpdk \
> > >                   "
> > 
> > Can this be converted to a PACKAGECONFIG instead? There is a DPDK
> > recipe in a separate layer so it might be useful for someone including
> > that layer.
> 
> There's no distro feature for dpdk. How would we detect if it is enabled?
> Additionally, the configure script has hard-coded paths to
> /usr/local/include. I think this really needs to be addressed upstream
> before we could actually support dpdk.

As you mention, the change merged. We don't need it to be a DISTRO_FEATURE in
order for it to be a PACKAGECONFIG so that is a patch we could consider. It
would need to be as a follow up patch as the original has merged now (it was a
valid/correct change in it's own right).

Cheers,

Richard


