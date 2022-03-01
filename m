Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03D2C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:34:10 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.6323.1646127250399012520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:34:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GaSfZuoT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id p9so19426662wra.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=0CYJ15osrvrwEeOGiCOybetiAcsJYa17r+EXYKOaB7U=;
        b=GaSfZuoTXZ5Sl930/LGe62s3MFflJo665IXOUlY+H2lyDpmuU/4kcFz0knGIutryvm
         cr8lTfjBvOX4jwWxbyvvArSKn4TAoNd3wljgBzhxZPdF0/UvclBKJXV3acPFGFKc5FCt
         /N6pWbsUdKo8E4LIg/JwDozzPv5CXboZbqybM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0CYJ15osrvrwEeOGiCOybetiAcsJYa17r+EXYKOaB7U=;
        b=VnpaAtTulBltMUjBfLZFx3h37a3keHRCj0LBehsJJFUKHTaHv2Cjw2JArOALtKUnI+
         mp+Q5C55YFSM5jBcaOYMPBA9eUFunoe7WNeoCozs66bj/269Fx5l1fONnlv3klZSsfLL
         OVE2TBt5cNudLMu0n8vun7rtI/Lc4FL5h7kQaMX39j+sdQWt1TXiQ63QcuJZr3P+IZuZ
         HxeyviSP4sv7EEa1vPA8uin1K/8txCEMOInSOj/Ml62f2epY+c3/0R/U709M9Zg5hzEq
         KZ0p92vvpxlG8aBARzBr2bO9PmYsDd2QlvzEKyfoVpZf9X4psYx6r0xm1FpTH2kCJPHu
         OEoA==
X-Gm-Message-State: AOAM5328uvA/vdWLj3N+zYtBw9baBx2mTUqQgZlaQi3MhxAsoaK7lKvc
	jtb95d2gTJRT2p+nGMl7aH9/jQ==
X-Google-Smtp-Source: 
 ABdhPJw++s8FkkpWtNxT4IiMBp+/6iTqk1b2AZZZWOL10z6miSzLVEiY4CGHAfFThMe2jG4K9QnwAQ==
X-Received: by 2002:adf:f611:0:b0:1ed:e11a:67a4 with SMTP id
 t17-20020adff611000000b001ede11a67a4mr18841789wrp.215.1646127248539;
        Tue, 01 Mar 2022 01:34:08 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f88:ec89:14b:c380?
 ([2001:8b0:aba:5f3c:5f88:ec89:14b:c380])
        by smtp.gmail.com with ESMTPSA id
 i20-20020a05600c355400b0038164ef5418sm2106289wmq.32.2022.03.01.01.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 01:34:08 -0800 (PST)
Message-ID: 
 <1356a980b2ab07660ee5c4c762afd2a586cad676.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pip_install_wheel: improve wheel handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lee Chee Yang <chee.yang.lee@intel.com>, Konrad Weihmann
	 <kweihmann@outlook.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Mar 2022 09:34:04 +0000
In-Reply-To: 
 <DM5PR1101MB236143C46FFE2DE38DEDF521B9029@DM5PR1101MB2361.namprd11.prod.outlook.com>
References: 
	<AS8PR09MB4645B9D742E68820D384DA6DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
	 <DM5PR1101MB236143C46FFE2DE38DEDF521B9029@DM5PR1101MB2361.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 09:34:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162538

On Tue, 2022-03-01 at 09:32 +0000, Lee Chee Yang wrote:
> Hi 
> 
> look like this is causing some build error: 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4816/steps/12/logs/stdio

Yes, 

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5156/steps/11/logs/stdio

too. I've stopped that build and dropped the patch.

Cheers,

Richard


