Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127DEC636FB
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:46 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.9871.1648889495663678907
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Apr 2022 01:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GQ4tvgFO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id w21so7297183wra.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Apr 2022 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NCTBoieeiy5WRiEJPefPkGa8UM6h6d2RDbdBypYAI+M=;
        b=GQ4tvgFOYCr5aOuwPonfucenwTOVeREYTVQ7mvBITaIDbk7YYHN7wPXbaTDfb35W5V
         VjequvoRWIZHp+VP/eByrN4+sTAVIC65jQ5WS4BCbxCY812wKf7anDmGEqN4t7Tdzdek
         qv7ETts/wfZzLQ+PVasYapK+vCggBY/BM4v1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NCTBoieeiy5WRiEJPefPkGa8UM6h6d2RDbdBypYAI+M=;
        b=w5F7TXkA9QFWEXD3A6eaj4uY56Ig5Z9AisaLASA4M9uMEGXCT0SRAaQlo9TK1TfOu+
         h+oigUNiqQRjOwAqrfdW/QxyU4utAepBoooIky/nHtYKODm7AN2AZ1a+EmTpU6dfCrzk
         B4aKDeF5DCEfWY0yBEuJgz1z2Cu16euM+PTyjc6caDMIq/42/MlhmMhdShY79z0HSH22
         +2K2gh6eJ6w1H5hq5vEp1AA5sgb59LQeqtAKXQ5REBWPNECkTBODDYcsUKm38ykok0UN
         NITXyFJ7OuRX2rwnDjzvFSXrYd42n8PM9uV40GcRL1jD8EHc0J4qLlKmBJCWphrAbM36
         98bA==
X-Gm-Message-State: AOAM533G1k5fFAxpB7qYnyINorEzpEk/PlqAsAnwIRrwPCrN69itJmWT
	+ehMzYRWMjpBCR4ugB4IUhwBGg==
X-Google-Smtp-Source: 
 ABdhPJwCn/i7BjSLTDAvfdbWPBkTMW0mY9qaC4yMrf4fU69XgiHzVTsi3gCgJ/4+79jYxBLBS+QX+g==
X-Received: by 2002:adf:f009:0:b0:206:946:b97e with SMTP id
 j9-20020adff009000000b002060946b97emr772995wro.588.1648889494125;
        Sat, 02 Apr 2022 01:51:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c5e1:7b92:5e42:dfdc?
 ([2001:8b0:aba:5f3c:c5e1:7b92:5e42:dfdc])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a5d64e7000000b00204a13925dcsm4600664wri.11.2022.04.02.01.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 01:51:33 -0700 (PDT)
Message-ID: 
 <9669fde58a98314178b55ff96f081f38558609a9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] insane.bbclass: Make do_qa_patch() depend
 on if patch-fuzz is in ERROR_QA
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 02 Apr 2022 09:51:32 +0100
In-Reply-To: <16E201CA0017277F.4558@lists.openembedded.org>
References: <20220401235906.652-1-pkj@axis.com>
	 <16E201CA0017277F.4558@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163953

On Sat, 2022-04-02 at 07:52 +0100, Richard Purdie via lists.openembedded.org
wrote:
> On Sat, 2022-04-02 at 01:59 +0200, Peter Kjellerstedt wrote:
> > Adding "patch-fuzz" to ERROR_QA should trigger the patch tasks to
> > rerun to make sure any already existing fuzz is caught. This is
> > achieved by using bb.utils.filter() to see if "patch-fuzz" is in
> > ERROR_QA/WARN_QA as it adds whether the filtered strings are set or
> > not to the task hash.
> > 
> > Since the mechanism used above ignores that a variable is excluded
> > (which WARN_QA is), the value for whether "patch-fuzz" is in WARN_QA
> > or not has to be explicitly excluded so that adding/removing
> > "patch-fuzz" to/from WARN_QA does not trigger the patch tasks to
> > rerun.
> > 
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/classes/insane.bbclass | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 0deebdb148..873706952b 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -1142,6 +1142,8 @@ python do_qa_staging() {
> >      oe.qa.exit_with_message_if_errors("QA staging was broken by the package built above", d)
> >  }
> >  
> > +do_qa_patch[vardepvalueexclude] .= "|WARN_QA{patch-fuzz} = Set"
> > +do_qa_patch[vardepvalueexclude] .= "|WARN_QA{patch-fuzz} = Unset"
> 
> I'd never seen that syntax before, it certainly wasn't intentional. Looking at
> the code, I can see how it happens to work though. It does assume a bit more
> internal implementation knowledge than I'd prefer...

I've a patch I'm testing in master-next to try and address this and remove the
need for this piece of patch.

I need to be a little careful as the loop in question is one of the most time
sensitive we have in the parsing code being iterated millions of times, so
changes need to be mindful of that.

Cheers,

Richard


