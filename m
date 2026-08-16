Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7A8C5DF6D
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 17:22:10 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13749.1786900926552658896
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 10:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Bmh4Z0PV;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso1397345a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 10:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786900926; x=1787505726; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mItYwKp4Y7NPuv1HDs4dVRO2G7zsuKykHOrAGtgVvP8=;
        b=Bmh4Z0PVSIQjgl3NT7NKMZrgsyw4iKIowko6QUFN7V+UGr16+c5Rax5l1fKgf2jr9J
         61Itv8Mk3stDUcDqGRSNanym2HHoP/kR3wOj7bgwjwJPqXpeBnsKFMy4mdEKopIrX4e1
         oupFtqxkEZabemqtftPUr7X1epW8aQwIHT6oTen7crkhALM6hIlk8AIblkfjhN9Sdx5S
         SCgNvCib07HYHmIYbZkZPxcJNLPzGvkhUjnM8cxAFFL3WCBY8kGIXp236rKFCzjjrLzD
         iNjPq/q/eIJlIuMnxfmKSpv+j4RuM2Q210+u7UyzmtE8EJLA5aMUX9FG+PZO8diDT94c
         2JFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786900926; x=1787505726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mItYwKp4Y7NPuv1HDs4dVRO2G7zsuKykHOrAGtgVvP8=;
        b=U/RdXKBdTtsUf+TVt7YaLuKOhsAT+SfNSpyCxd5xbc5IATfDnnyoiMdXgzbHJOXoCz
         lhamrnYWt6vVDR6qiA5HDULvy5dUG1XPCZsKy9ztZWlWq0d0+Bz6rC7ygFC2a6rZhWw+
         O2lytdE1kPfvv9BM0KXtOGQBHFS0IRe7GGD1XK7o+4UZRXu0WsQLHisPCgJW/4y1lZaR
         u5Ay/x5lgm6s1ORzeZsLSu1XErPNonLU59mrVoe5AXDjL+PmmDdIPt/pUIYCoENWNDw2
         jjNCY4exJlSbAn219N1PVbz/QjCUIXEj2OrIpDTyUutMXiS1hAxwdkE6CzAn+5f5dl7/
         //Lg==
X-Forwarded-Encrypted: i=1; AHgh+RqiHLyjFtiiOjQWMqbW6qv8sAridHkvFXhTOyaz7zV65roDyUrsnCw/jKxrnaeUWcu02WAAEJk68frSdMtGpr7Jgg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWndu7Q62offvhnWzZblzfWvraTw1JS7fh+x+YBiQEcqv16BXq
	e2EV5Ittv3B/jS5m2vXEE1E4llroNtZlqTIfGBkqcxd5Saw4hKC/gh4N
X-Gm-Gg: AR+sD12xmp5eJ2OQsHB2thpxg/b5OQ6D+9b+5wKGmECLvwZpgGywUYsownKYAOr3q7i
	Y6Tp1Gvwe6liDkZtf+m4txxu661z4Vqk4ph0CPZQtP12kwH0SxTtsrodsyMUM5NQLSLpeP8iId7
	/2USOirkaQFbTuZ9HAHNLVfsyowyt05vCyV9vmrMl+++LrEcv9XpFpyZAuhD2QHJFVN6Jf4HI5R
	SokD7m3HFz2Diwt91l2lRG1VpVtt6X4NAsRS6M2bDh2/u7G/u9bsTPAOkEi91VCQhmZ3wTj4Z8A
	6swnC85hCWrkB91pQr8XsVZ6O4d8hH7T9YMV5UxfQpG6x2uHMDqqEJ2hnk2qV8x1o9QMjfE4wXQ
	+IG4LCtXwctASyLqPlQSieW5c2iAcwgzRUD1zB0fG5rplG4eZ29kB7877ZTjbC70G0ljeyFG9Yd
	aOsnLR4pWMh+0aAzNX7WJgKWGBt0TpJVRTjnmoc3xFKRKqf4r5NfTSrsU9K++5ddzsFkg5GQL0d
	Cc+7Iuu/9lH3zkVP2Ao6OsBhevVna4q
X-Received: by 2002:a05:6a21:6e82:b0:3cb:9594:91b8 with SMTP id adf61e73a8af0-3cc71dc08b7mr21957575637.35.1786900925755;
        Sun, 16 Aug 2026 10:22:05 -0700 (PDT)
Received: from chiron.local (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc12f6060adsm719212a12.4.2026.08.16.10.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 10:22:03 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
Date: Sun, 16 Aug 2026 10:22:01 -0700
To: Ross Burton <Ross.Burton@arm.com>
Cc: "auh@yoctoproject.org" <auh@yoctoproject.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [AUH] python3-flit-core: upgrading to 4.0.2 FAILED
Message-ID: <7pj6pqlux2goqu5gbav6zkqdppc4qwbe5qa6x2tamlywgqjpy3@svwiu3macwtb>
References: <0101019fd0766ffe-d5e0ac69-362b-441d-838b-ea7141881f91-000000@us-west-2.amazonses.com>
 <CAOyo-86ZM7wu8Dd6h9sj=RQQ4swwV3DEbX3PfYujuTP5bttnbQ@mail.gmail.com>
 <03F623D6-66CF-47BB-B016-CEF891A5CB16@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03F623D6-66CF-47BB-B016-CEF891A5CB16@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 17:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243542


On Thu, Aug 06, 2026 at 02:02:53PM +0000, Ross Burton wrote:
> On 5 Aug 2026, at 16:31, Tim Orling via lists.openembedded.org <tim.orling=konsulko.com@lists.openembedded.org> wrote:
> > 
> > Several consumers are not yet ready for flit_core 4.x (range is
> > limited to < 4 in pyproject.toml etc.):
> > 
> > python3-pyparsing_3.3.2.bb
> > python3-typing-extensions_4.16.0.bb
> > python3-jinja2_3.1.6.bb
> > python3-wheel_0.47.0.bb
> 
> I suspect we’re going to have this problem for a long time and might just need to have python3-flit-core-3 and python3-flit-core-4 recipes, and then a way for the flit class to pick between them (FLIT_VERSION ?= “3” maybe).

Fedora Python SIG is also trying to figure out how to handle this situation:
https://lists.fedoraproject.org/archives/list/python-devel@lists.fedoraproject.org/thread/WEIYY23R2H4KHCK7KSJLTJIFH5SJKD7Y/

I don't really relish creating a compatibility python3-flit-core "3" version.

I also do NOT feel strongly motivated to patch all the python packages that
**might** be able to be built with "4", but have not updated to indicate said
compatibility.

> 
> Ross
> 
> 

