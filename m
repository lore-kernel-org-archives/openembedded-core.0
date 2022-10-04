Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0514CC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 10:45:07 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.9150.1664880296371218321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 03:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zo+NYFNW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id bq9so20688294wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 03:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=RVppOf39Yv305y4e1ae0AAIkbV/qf37kNF20q1et+fA=;
        b=Zo+NYFNWO9CIVKtsrd/B3EvIz4x2pkZIsW/n2Js8lU2+YTa8EKrcpjHrxj3u1kR8Zu
         WWwjN1wr3zzQ44eM3JTwoTgpIyUlDrpME6xfTR5pfMVGrY28/84eh8y8ccun9N5r1zrK
         BbGBN8DLEh8NUUWZ91HJTU1BQGMPyIYsMAB60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=RVppOf39Yv305y4e1ae0AAIkbV/qf37kNF20q1et+fA=;
        b=oDbDcsOtAqHrchJ7f303OTZcQLYnfNSVa4bJw1q9RW1uGtE41sdJFnxzd/FaQvPkwn
         yZ0BtPW2QFbT7qCJzwurUl8vwAuINavthK+z5gFviLn8opBifmb6yIfT0DFN2cb1/i2G
         zElCNw/2qXFyjI5PeUdv5Xa4V/vWGg8DxnKVu3MTHRIAcbHF3QTlfO5xvE8vXeoCOOyZ
         luVDX/jke/Un6ow7+iFNPgq9u8o2VF+PplxlrmmYdEuvxYfikeyPokFPMvYN3Y1XaL2Z
         WULQHh1wsms1ghi8mXE9ZqFpm2mXT7W6C17OrDHd10jkESZbTVn08AeSzsWSkbdaxYm7
         +sXQ==
X-Gm-Message-State: ACrzQf3aygRWs/Pi9tJ7wsnGadOhmQFAGkAWl66ymo4cXKlc483fk7t+
	bzrCcLZoHPNZwXNTSgpVPvjPvg==
X-Google-Smtp-Source: 
 AMsMyM6qBdd91saylKX3WH0+RpB37LYoof8eTDoZZ+If0UGDOcFFHOQlCOCE+Zr7oTI9k0AcPm4vUQ==
X-Received: by 2002:a5d:59a3:0:b0:22e:4b62:7ceb with SMTP id
 p3-20020a5d59a3000000b0022e4b627cebmr2169619wrr.90.1664880294760;
        Tue, 04 Oct 2022 03:44:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a418:d17a:77b7:6987?
 ([2001:8b0:aba:5f3c:a418:d17a:77b7:6987])
        by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c154b00b003a3442f1229sm20456253wmg.29.2022.10.04.03.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 03:44:53 -0700 (PDT)
Message-ID: 
 <e0fc2054236524ba2cca50068503089aaaf72c08.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] linux-yocto: use openssl-native.bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
	openembedded-core@lists.openembedded.org
Date: Tue, 04 Oct 2022 11:44:51 +0100
In-Reply-To: <20221004101107.2745139-1-mikko.rapeli@linaro.org>
References: <20221004101107.2745139-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 10:45:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171380

On Tue, 2022-10-04 at 13:11 +0300, Mikko Rapeli wrote:
> It sets environment variables etc correctly for openssl-native use.
> For most kernel side use cases are covered by plain openssl native
> wrapper but some out of tree e.g. python scripts may be not.

When you say "out of tree", you mean scripts in the kernel we don't use
by default, or scripts that aren't in the kernel at all but some users
add?

I'd have thought the dependency on the class would be added where it
was being used?

Cheers,

Richard

