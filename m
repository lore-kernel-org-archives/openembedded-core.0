Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D467BC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 17:41:15 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.1662.1669138867759050981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 09:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LSv8F/lD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id s5so8635920wru.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 09:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KadMnjtH85YYf4mYvp9zG6CeCpLFK6WGGHyN5AWQCls=;
        b=LSv8F/lDJdh5ioa5GMfcD3AKz4K46+W6EKGb2cJivV18YVuFW6EgxTRrG4K9UMVtwg
         rxej8hxHK8ljHJi+uVI92xpAut3YVCxvgML2uOkQgCa5gdc4ZtnesGCisL8DBcoRHNga
         QXWbe5k5oL5AVdSpGT/7IST7jxij6WkgREYAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KadMnjtH85YYf4mYvp9zG6CeCpLFK6WGGHyN5AWQCls=;
        b=NINcmN/LM2rKvPobp/7OhsArhOlHAEGfQkCn977jWx1s26TgIPQXG0i1Jf0T+5ResW
         0xeyQG0RywZAyUCrdmUsdXLIH00yhm/sfBgY9muRfhIocpz1fUXoe4/esZs0jKf+eQ0s
         O+xY5UuWw+aBGH8v9lYOZg364nGdoketKA8BFkvv4PKhSN5eXaMttKhqmXgP5BmmgYmR
         cqBdX7+Cz/43E10u41HmZdiRn/TCU94goEF9reQSvGRIlVA0xfJRNd+nh1kxy2s8CTKO
         zYbvRA0bvaNSYc4TZ1izyrnVPQlKQLe2FbWTBV9hnsD4S1X04BmRzASBrERXN/b1N13h
         yfrQ==
X-Gm-Message-State: ANoB5pnblHo7Wk343T4BO85u5fVPN4vxotP5X90vMM/IqOeWuuBleAdd
	rxygPZ8rt4ODLzlbsR34/tveTA==
X-Google-Smtp-Source: AA0mqf5cWoWByN9AO+b260zKn+Bj9o3FDASoNJcRok7P3tyye10y2RMzqz5fzcy44MfbZxKyDSVzEg==
X-Received: by 2002:a05:6000:1192:b0:241:e7a6:9135 with SMTP id g18-20020a056000119200b00241e7a69135mr1338560wrx.641.1669138866107;
        Tue, 22 Nov 2022 09:41:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445? ([2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445])
        by smtp.gmail.com with ESMTPSA id fc18-20020a05600c525200b003c71358a42dsm29743627wmb.18.2022.11.22.09.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 09:41:04 -0800 (PST)
Message-ID: <9db5f6c478ac95a0e7bda3175a756e9ba1fa75c5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] oeqa: add utils/data.py with
 get_data() function
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2022 17:41:04 +0000
In-Reply-To: <20221118160850.3964225-1-mikko.rapeli@linaro.org>
References: <20221118160850.3964225-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 17:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173693

On Fri, 2022-11-18 at 18:08 +0200, Mikko Rapeli wrote:
> get_data() uses oeqa test method name and an optional
> key to get data from image specific "testimage_data.json"
> file located in image deploy directory. Image recipes can
> provide custom versions of this file which configures
> generic tests for a specific image when testing with
> testimage.bbclass
>=20
> For example, the parselogs.py runtime test needs image
> specific configuration when the image has new errors from
> the kernel which acceptable and can be ignored.
>=20
> Same machine can be used to generate multiple images with different
> runtime behavior so using image as the key and not machine.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/utils/data.py | 41 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 meta/lib/oeqa/utils/data.py
>=20
> v2: no changes

I'm afraid I'm really against adding this json approach to adding data
and I'm not planning to merge it.

I don't like having two different files containing recipe data in
different formats and I don't like the datastore not being definitive
for a given recipe.

I agree we need to be able to extend this data on a per recipe basis
but I think we need to do that from the recipes themselves.

Just to be clear, even done with json as in this patch, it isn't
something which would be an acceptable backport to an LTS.

There are two other options. One is to 'abuse' variable flags:

OEQA_PARSELOGS_IGNORELIST[qemux86] =3D "xxx"
OEQA_PARSELOGS_IGNORELIST[qemuarm] =3D "yyy"

which I don't like but could likely be made to work today.

The other is to introduce some dedicated dict/list like data syntax to
support more structured data which I think would be the better solution
in the long run but is a bit more work to implement up front.

Cheers,

Richard



