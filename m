Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F02C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 16:32:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.15543.1675441931130461077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 08:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DXv3fnAL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id bt17so2113495wrb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 08:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6Ko2oFcSWS8URv0WFZtOLOhiSHc1p9RM93t5yIr658A=;
        b=DXv3fnALNV65i1ZXVhv22QsJ6O7pK0GM21kQvjc8Sq2lZgfkmpEICu1QaIzRlWzQ3g
         /oAbDT0SlDYrAA/QT9+zsLdb9zSmt8lqA8sWwHfzeY56q7p6MGV0RgDM0dMxanHW9LDH
         1DQ+wZtlDZ6TzqszUbIWWXK9kOwuwwVJC+67E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Ko2oFcSWS8URv0WFZtOLOhiSHc1p9RM93t5yIr658A=;
        b=dUUPPihcpGTT9Zz8/klXGEcSJUve1BYxAB/tKuLsfqhOpSZzNQMEeaXEsjHxKv5vxs
         bXzVVtPZSHdxDBDHf3jQ8jtmSIWpkKGcTj+f9ns8l6n494ERuI06byc6CLuDAEpMu6fM
         kUrM8ItNwkelZD/TxKu2aKUbsLxnhOIvkJdy5L8vHPM+sntkgistg6W4oPzuNe3EdtcC
         UhSOI495/E1Ec4PJk2PcRYfcR0vQ4MOicgMDwoRRDlNcMmKvZH9gWjE2MxjLp2JOYXkl
         +tz2AIzJqdl9EIQd5JGN/0U0vMrIPXo0TwkXt1axibQ2yiaIEesAfv6SJ8/889ada2cu
         BZQg==
X-Gm-Message-State: AO0yUKWlA+H/qE32u+VVLw2DydMizHaDagETJUhZ5VpbcWo0AjDQTOY0
	+ojo04OU8LiM3Oc5YesgCKp66A==
X-Google-Smtp-Source: AK7set+waKf688hRsTZa8cXNQFCjilx/JreqqhBp6kegRmqnKdKokYxx2ErGWXBcL8azdHYv/Jggpw==
X-Received: by 2002:a5d:4561:0:b0:2bf:65ac:ebcc with SMTP id a1-20020a5d4561000000b002bf65acebccmr8756960wrc.17.1675441929422;
        Fri, 03 Feb 2023 08:32:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a52f:3f73:91fb:2c5a? ([2001:8b0:aba:5f3c:a52f:3f73:91fb:2c5a])
        by smtp.gmail.com with ESMTPSA id k6-20020adfb346000000b0027cb20605e3sm2388246wrd.105.2023.02.03.08.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 08:32:09 -0800 (PST)
Message-ID: <ea794fe14ee22b5c7163bd14b63b9b6f2942c5bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meta: remove True option to getVar and
 getVarFlag calls (again)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 03 Feb 2023 16:32:08 +0000
In-Reply-To: <Y9002wNuWoRMTyCs@mail.local>
References: <20230201155038.539949-1-Martin.Jansa@gmail.com>
	 <Y9002wNuWoRMTyCs@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 16:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176727

On Fri, 2023-02-03 at 17:22 +0100, Alexandre Belloni via
lists.openembedded.org wrote:
> I'm not sure what you based the patch on, it didn't apply for me.

I did already take most of this one except the bits to report-
error.bbclass which Martin said were a process error on irc and can be
ignored.

Cheers,

Richard

