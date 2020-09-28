Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.38543.1601304725555472129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 07:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J59hwpbQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id e17so1435467wme.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 07:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0jmwGS+rgHTAXgB09XU4k9f7KkSi97i2+8wrys5oSd0=;
        b=J59hwpbQV9Wb8FhgQWJoJTsEiv277VPEqelUUpPExL2cvNcMBGjLaP2hLwtXPOIB4I
         5fpw+yCpPlPyyK0gXJ4oBexCqq5A72i1lcT9qH1g8yp8ua4d9uB1iL472dG48cMD25ht
         Vjdznzkr3SXeMSaDrpmI1R+Pm50bgni2laNNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0jmwGS+rgHTAXgB09XU4k9f7KkSi97i2+8wrys5oSd0=;
        b=A+JWYi8Bkwcd78Tlk8x7mJlSSujdpi+pwdKL1TSM//4Z0a9kcLNW4MvNAgcjcC4yA1
         EDJ+xgT+gvqPwX8Rs73gOkU9ZDmwPosm+xUozpZBKFPaepIIBsBYBmhdzsw/xoWqvufW
         fwRi+sOgiw9L+g9/5HEh7IqeNAp7bzlHh08zwu0UidwG0BGqcQXx73bCimuXLsBfzVTF
         cKjKMyKo2vyFHn9QdHaWG0Fy/HFpdGs4j8V0Ioo9a4IWN1QH/7/vYHOstYmsHFDJxo7K
         cpulz0g+p6HE85TMel2IfAGNVNtxD+YKSbTL7O/zdSBRV56hHUCVaR/L2JoCkwNIBxvO
         J+Ag==
X-Gm-Message-State: AOAM5321QGZGc6HaeAAHn5NJc2J3OGBNDWQI54t+Jvmcbpi3JnwrEeKc
	O+1BMsuZ9DZ1f7bJMTbcw7Oa7A==
X-Google-Smtp-Source: ABdhPJzhHZutHzmstjcA2LHg3Tgox4R5BwDKpIrIf5zL9WGxv7sdLUex5WyejISHOKOi1CIwZrKp1Q==
X-Received: by 2002:a1c:3985:: with SMTP id g127mr2140186wma.32.1601304723849;
        Mon, 28 Sep 2020 07:52:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.d.f.d.8.7.4.c.e.3.5.3.c.6.0.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.d.f.d.8.7.4.c.e.3.5.3.c.6.0.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6c:353e:c478:dfd1])
        by smtp.gmail.com with ESMTPSA id z19sm1630562wmi.3.2020.09.28.07.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 07:51:55 -0700 (PDT)
Message-ID: <19cfd5621921a2cf1f19be76bf216c7ac42b2e4e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/4] pseudo: Ignore mismatched inodes from the db
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2020 15:51:53 +0100
In-Reply-To: <20200928091341.3eebf87c@seebsdell>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
	 <20200928133803.2741507-2-richard.purdie@linuxfoundation.org>
	 <20200928091341.3eebf87c@seebsdell>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-28 at 09:13 -0500, Seebs wrote:
> On Mon, 28 Sep 2020 14:38:01 +0100
> "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
> 
> > This can happen when files are deleted outside of pseudo context
> > and
> > the inode is reused by a new file which pseduo then "sees".
> 
> I'm just going to say again:
> 
> The **ENTIRE REASON** pseudo exists to replace fakeroot is that
> fakeroot did this, and it consistently, repeatedly, reliably,
> resulted in horrible database corruption.

I understand. I have strong evidence that the current handling of such
a case does the wrong thing though as copying the data from the
original inode leads to pretty bad corruption in its own right.

> If files that pseudo knows about are being deleted outside the pseudo
> context, that is violating a crucial precondition, and **you cannot
> then trust the database to make sense**. Yes, you can throw away some
> of the specific files when you detect them -- pseudo already did this
> for specific cases, like directory vs plain file mismatches -- but
> you should always view it as a serious bug in the rest of the
> environment.
> 
> If it's **really** necessary to allow things to corrupt the
> filesystem, we need a way to tell pseudo of **specific** files that
> it should be forgetting about or disregarding.

I agree, which is why I spent the weekend making patch 3/4 work.

The big win of the next patch is that it reduces the entries in the
database to only the ones we actually care about. This doesn't tell
pseudo about specific files but of specific directories of files. The
result as mentioned in the patch is two orders of magnitude fewer files
in some sample pseudo database and the files left are the ones we care
about. Its not perfect, there are still a few that shouldn't be there
but it is an improvement.

I can't see any other way to handle this for the reasons I mention in
the patches, the performance hit for tracking all files would be too
great (and just moved the race window in many cases).

> But, in general, "a thing that isn't under pseudo is modifying the
> part of the filesystem pseudo thinks it owns" means "your entire
> database is presumptively corrupt and you should not be guessing at
> which parts of it might have survived that".
> 
> I know it seems like this could conceivably be correct, but our
> experience with attempts to fix it up in other ways was that it
> always ended up resulting in very weird and incomprehensible
> corruption.

This patch tweaks one very specific corner case in a very specific way
since I've seen first hand that the current behaviour causes
corruption, I believe the alternative is safer.

I'm actually making pseudo do less magic fixups rather than more!

In many ways I'd like to make these corner cases hard errors. In order
to do that we need to ensure we're not hitting them though and to do
that we need the next patch.

Once we have the ability to ignore subtrees, we could just hard error
for the potential corruption cases and force those issues to be
addressed properly.

Cheers,

Richard


