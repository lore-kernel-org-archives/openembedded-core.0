Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56461C7EE2A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 06:36:41 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.6628.1685687793462907085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 23:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=it9ZfViv;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2af2db78b38so23162511fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 23:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685687791; x=1688279791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g1IgxbV8g1oiRRiYhnuue+60W1tsPkB6UOFC5lOXaXA=;
        b=it9ZfViv0pHyhqFKfO7w8cFLbPv9iS22kIFjt7BBJm5kDNFVvzA3w/h8LXq9K5269S
         6Joj2BROzETzazvhqJcf6ATNTtcgAcCckBAWFx+yxffmgexItRwlPorhZ2fR8IaFMMQC
         K60O/Z3oWOGDtC5x4kn8O0KSYM3Ro5kNFaZUv8/Z9DzCUwaY6O8N4WJv6Nx/53wfJ5m0
         31f5V/iDL7ETWCoKeKVNEvWRAfp68ry0SmDko6AeWupst5NlQTNxzyk5SpmCltIRiZa4
         ax80RYZGHRcDyvjRPipyCWtHevLQnk0Sq/AK5HMr5yK6zKbHVXJsTe3InH/FmRcD5EoF
         GEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685687791; x=1688279791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1IgxbV8g1oiRRiYhnuue+60W1tsPkB6UOFC5lOXaXA=;
        b=b4RoHUIGUSjq9ChglNv1Z+TnzqaCWlPArUx9etuqmegPJmnpwLg5R5iThBlGoZk6Yx
         Pn7/6IxqTuiwINJKZyXzPVZOETW/5RhvcpUfHDf5bxO3A3GKXK5PzXfcgwZIpn+sJmFA
         3grvZ6g1YxAsp/dQ0oCmWQWzvcSj0bzEXKINfjQML4MN0isiZSBNKgH0M6OzqmzDfXlR
         GjwOfSqA17MMA0leitsMHbT4lSqNSo9BjWLVI5HhYYIuyY4/rHhGJ32KraZeAy/M79cY
         IvIkN8y2aq5Nws0D2gwg52rOuYLeT74nJTfpN2Mi9HWLHTVhcF9vU4TBiUCMfZNFHgPY
         dItA==
X-Gm-Message-State: AC+VfDxMS8ax4ZwXkfZVpYKFM2dfU3lLplqVD1xnnlBNZuctL3BA3GJp
	2cS/DcSfRQ8E1VmHW2kecRzw3FAjZ55/rcC/kGI=
X-Google-Smtp-Source: ACHHUZ48LKy57SmDXTkyk1vogorhnoxxUaE0gLa43o5a+8j1+1zt9uiOTzHT+YAF8xXUTSZcT3b/nKs8RwcXvwEfhk0=
X-Received: by 2002:a19:f007:0:b0:4f5:e685:f460 with SMTP id
 p7-20020a19f007000000b004f5e685f460mr1058786lfc.36.1685687791398; Thu, 01 Jun
 2023 23:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj94YtwNShEtaBQU==pOobdGvU7ohH10GOz_Sis5f6hzDA@mail.gmail.com>
 <26137.1685687687489513056@lists.openembedded.org>
In-Reply-To: <26137.1685687687489513056@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Jun 2023 08:36:20 +0200
Message-ID: <CANNYZj8hoBVZ78NE4kDk+ZRrUGSyBUkiTC7SZkq5VrKkr41=JQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH V1] xz: add ptest support
To: "duep.fnst@fujitsu.com" <duep.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182142

On Fri, 2 Jun 2023 at 08:34, duep.fnst@fujitsu.com
<duep.fnst@fujitsu.com> wrote:
> Sorry, the second email was accidentally sent by mistake.
> Now I have submitted the patch to xz upstream.
> But in xz upstream, I submitted the patch via email and it doesn't has the link.
> Could I submit the patch email as attachment here?

But why by email, and to whom?

I think it's better to open a pull request here:
https://github.com/tukaani-project/xz
Then you have a link to include into oe-core submission.

Alex

