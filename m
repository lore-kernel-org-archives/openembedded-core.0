Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE153C64E76
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.32468.1650226152610386694
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 13:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M2XfFgmo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id m14so16524231wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 13:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=RUuA4s7Wcc4zzAOR4vftDjp+y8z7nuT1Cjb5gGfl7UI=;
        b=M2XfFgmo9bjArLCMNb8mw3PgQt4NeZY/brADgpHgHc2/5ytycBF7fYS2nTZ3wV1TX/
         gc5KXVm7XyGTww8vKqXou/2WwMwsp64UUhdLrtQJc8hXGuKC8DMvv45PCdXt9VhGkBvY
         xmrJE/SDx4Tt+HyIP7k1qjEOdRt0SaC2aPl3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RUuA4s7Wcc4zzAOR4vftDjp+y8z7nuT1Cjb5gGfl7UI=;
        b=wA04shS7M9ubzkr94BZ9xsQ344srxP49Ls7auZ6n2y2brcV4hNda9/ATkeWZ9j9pjM
         /HLSx++LLZOct4iF0hxsL1aoOR524mUVMHUXnhZdr1Z2GTDflTL4ug+CK2M0J8zHFRaR
         7HUH2r1WhXAQ7clHiZMnzB6fDeK87rgVyUqGRTijq5mNTCTLUkK/TkljoWY3AjzY2E9V
         wjmtGZQ9+RyL9c/IksE9l121girhr8YudZuQE8fDwFD+wosK3/stTQ280yEHwSFpj9q1
         1++QvyPEOJMkJs1y9NuRrBx8U/FMTqKW3aB8d9FMfGaykvynVkt/0XBA6cpbUTj362Xh
         0e6Q==
X-Gm-Message-State: AOAM5323dwMyLkEASatOgo69tpTDLcxrWul0NqGME9OdGsr27qt+1mZD
	VHROJGWVFelpDWZvVyGYJk6RIg==
X-Google-Smtp-Source: 
 ABdhPJy0jJ5s8Jp7ovDTt5mAWdtrzvvMoaEnu7bBHrRYdjc/Xjn5eaAwTL8Qwi+ujHR1IarzYR0gjw==
X-Received: by 2002:a5d:510d:0:b0:207:a47d:64ae with SMTP id
 s13-20020a5d510d000000b00207a47d64aemr5898940wrt.107.1650226150818;
        Sun, 17 Apr 2022 13:09:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1b70:1911:ed27:ee6a?
 ([2001:8b0:aba:5f3c:1b70:1911:ed27:ee6a])
        by smtp.gmail.com with ESMTPSA id
 f189-20020a1c38c6000000b0038ff83b9792sm10311975wma.43.2022.04.17.13.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 13:09:09 -0700 (PDT)
Message-ID: 
 <16a5b5cab9bba7226528febe5489d60ff5b90214.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH v2 1/4] sstate: add a LockedSet class as
 python set() is not thread safe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Apr 2022 21:09:06 +0100
In-Reply-To: <16E6B2C69CA37E19.11564@lists.openembedded.org>
References: <20220416222846.219151-1-quaresma.jose@gmail.com>
	 <16E6B2AF3CEA40C4.19917@lists.openembedded.org>
	 <16E6B2C69CA37E19.11564@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164579

On Sun, 2022-04-17 at 14:41 +0100, Richard Purdie via lists.openembedded.org
wrote:
> On Sun, 2022-04-17 at 14:39 +0100, Richard Purdie via lists.openembedded.org
> wrote:
> > On Sat, 2022-04-16 at 23:28 +0100, Jose Quaresma wrote:
> > > With this LockedSet python class we can call the 'add' and 'remove'
> > > safely inside the ThreadedPool.
> > > 
> > > This piece of code is taen from the stackoverflow
> > > https://stackoverflow.com/questions/13610654/how-to-make-built-in-containers-sets-dicts-lists-thread-safe
> > > 
> > > Fixes [YOCTO #14775] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775
> > > 
> > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > > ---
> > >  meta/classes/sstate.bbclass | 24 ++++++++++++++++++++++--
> > >  1 file changed, 22 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > > index 1c0cae4893..a3ba748a1e 100644
> > > --- a/meta/classes/sstate.bbclass
> > > +++ b/meta/classes/sstate.bbclass
> > > @@ -918,8 +918,28 @@ sstate_unpack_package () {
> > >  BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
> > >  
> > >  def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
> > > -    found = set()
> > > -    missed = set()
> > > +    # https://stackoverflow.com/questions/13610654/how-to-make-built-in-containers-sets-dicts-lists-thread-safe
> > > +    import threading
> > > +    class LockedSet(set):
> > > +        """A set where add(), remove(), and 'in' operator are thread-safe"""
> > > +        def __init__(self, *args, **kwargs):
> > > +            self._lock = threading.Lock()
> > > +            super(LockedSet, self).__init__(*args, **kwargs)
> > > +
> > > +        def add(self, elem):
> > > +            with self._lock:
> > > +                super(LockedSet, self).add(elem)
> > > +
> > > +        def remove(self, elem):
> > > +            with self._lock:
> > > +                super(LockedSet, self).remove(elem)
> > > +
> > > +        def __contains__(self, elem):
> > > +            with self._lock:
> > > +                super(LockedSet, self).__contains__(elem)
> > > +
> > > +    found = LockedSet()
> > > +    missed = LockedSet()
> > >  
> > >      def gethash(task):
> > >          return sq_data['unihash'][task]
> > 
> > 
> > The series blew up on the autobuilder:
> > 
> > testsdkest:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5079/steps/17/logs/stdio
> > oe-selftest:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3461/steps/15/logs/stdio
> > and many more, see:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3535
> 
> That last one should be:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3539

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 7a18d9d554..99d125b8c5 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1058,7 +1058,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 connection_cache_pool = Queue(nproc)
                 checkstatus_init()
                 with concurrent.futures.ThreadPoolExecutor(max_workers=nproc) as executor:
-                    executor.map(checkstatus, tasks)
+                    executor.map(checkstatus, tasks.copy())
                 checkstatus_end()
                 bb.event.disable_threadlock()

fixes things.

Cheers,

Richard


