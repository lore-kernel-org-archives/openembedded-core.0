Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6567EC6371D
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.28599.1650202878989647670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 06:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Op2cXia5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 r4-20020a05600c35c400b0039295dc1fc3so211323wmq.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=iySPHzkHYbdqwKMWroazTN+uV/cTXhlSIOdUo/CiOaA=;
        b=Op2cXia5H79TFTp2yHyedgOSFKQsmpEKcfIBgWxlYbBP3bUd5vYGl+0tf18O+rWQm7
         tK9edebr0SOpagd8bqPW6HuvlTo5UhIC7SzNeeY0cDmuNGLcClxnBBWT+Yfl2CsvZxup
         IjA68IUwwoodS18wdrvue2yf5k0rxlE46wtFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iySPHzkHYbdqwKMWroazTN+uV/cTXhlSIOdUo/CiOaA=;
        b=r7F/YzwjzOVR34JVHcsd0y60ueSPptXIbzs/Sydgl+kdIC54hQeAeWEDtXlzCRMwxu
         50+C5We+XRloAIbWf3r8BPXNcWWIPodQTtxWIo0numuO0ftzg1ZhQcRzt+D9lrKSYu1z
         CEYT64pI0rC8KApWrcnfwu5dTHUU8g1WZyYAecm4pPD2Kb6eJL/bNJK+jVKu1sPKIpUx
         fURAKaTKG9E56Bw3aV+mfgV4EfDM509BqtwkJYl2MaP0CyOeHC8ISfE+BHVFgMOfrHck
         yus1L3EdTqBlpGvWt9gslOLpC+gbYDd7Ll0EJmlhdE5AcRlKI6DuvfYYiqqqy9DgJscv
         EB+w==
X-Gm-Message-State: AOAM530Sa2DuboBNQvI/z7povQ1s99s5EmTrhDWyFT4ce44/tJ2KwL3Z
	H0syhyJhtWKKtZGB6XP150Hd3HCvi1kq6g==
X-Google-Smtp-Source: 
 ABdhPJz4/sohJfh40atZ0jFgogPHS4SiQyDNj/D8RiTACEIjCrc+u03rbq5VsmTxLWqOcoQkGTV3Lw==
X-Received: by 2002:a05:600c:4f05:b0:391:97d4:920c with SMTP id
 l5-20020a05600c4f0500b0039197d4920cmr10591151wmq.92.1650202877629;
        Sun, 17 Apr 2022 06:41:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af33:9195:2d77:ff68?
 ([2001:8b0:aba:5f3c:af33:9195:2d77:ff68])
        by smtp.gmail.com with ESMTPSA id
 9-20020a056000154900b0020a849e1c41sm4338990wry.13.2022.04.17.06.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 06:41:17 -0700 (PDT)
Message-ID: 
 <c0ca98f33f7e1731d27736e565b70ee1550be7a2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH v2 1/4] sstate: add a LockedSet class as
 python set() is not thread safe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Apr 2022 14:41:15 +0100
In-Reply-To: <16E6B2AF3CEA40C4.19917@lists.openembedded.org>
References: <20220416222846.219151-1-quaresma.jose@gmail.com>
	 <16E6B2AF3CEA40C4.19917@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164576

On Sun, 2022-04-17 at 14:39 +0100, Richard Purdie via lists.openembedded.org
wrote:
> On Sat, 2022-04-16 at 23:28 +0100, Jose Quaresma wrote:
> > With this LockedSet python class we can call the 'add' and 'remove'
> > safely inside the ThreadedPool.
> > 
> > This piece of code is taen from the stackoverflow
> > https://stackoverflow.com/questions/13610654/how-to-make-built-in-containers-sets-dicts-lists-thread-safe
> > 
> > Fixes [YOCTO #14775] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775
> > 
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/sstate.bbclass | 24 ++++++++++++++++++++++--
> >  1 file changed, 22 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 1c0cae4893..a3ba748a1e 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -918,8 +918,28 @@ sstate_unpack_package () {
> >  BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
> >  
> >  def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
> > -    found = set()
> > -    missed = set()
> > +    # https://stackoverflow.com/questions/13610654/how-to-make-built-in-containers-sets-dicts-lists-thread-safe
> > +    import threading
> > +    class LockedSet(set):
> > +        """A set where add(), remove(), and 'in' operator are thread-safe"""
> > +        def __init__(self, *args, **kwargs):
> > +            self._lock = threading.Lock()
> > +            super(LockedSet, self).__init__(*args, **kwargs)
> > +
> > +        def add(self, elem):
> > +            with self._lock:
> > +                super(LockedSet, self).add(elem)
> > +
> > +        def remove(self, elem):
> > +            with self._lock:
> > +                super(LockedSet, self).remove(elem)
> > +
> > +        def __contains__(self, elem):
> > +            with self._lock:
> > +                super(LockedSet, self).__contains__(elem)
> > +
> > +    found = LockedSet()
> > +    missed = LockedSet()
> >  
> >      def gethash(task):
> >          return sq_data['unihash'][task]
> 
> 
> The series blew up on the autobuilder:
> 
> testsdkest:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5079/steps/17/logs/stdio
> oe-selftest:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3461/steps/15/logs/stdio
> and many more, see:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3535

That last one should be:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3539

Cheers,

Richard


