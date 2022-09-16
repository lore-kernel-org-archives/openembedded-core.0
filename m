Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665CCECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 09:26:38 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.4036.1663320388687954933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 02:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d1MGWXuw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id t7so35004959wrm.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 02:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=rbXbsiv9IPm7fVDaH3uc1Ml9Jf/7osCPluC9I07dm7g=;
        b=d1MGWXuwggeAIpQCqoNc2tfeVWMempnFW9BBKX6ohhP7ht8/KFwqZx/uA3XT4Xq2g9
         6DBOlNXuXtlsqKC9l1CFAVP4d0qA1KZ9MXuvut+L5G9bU7yL/whjjCR7lmIG5wWxx1CW
         ieECvhLM+IFsS5FGFEqeVRRCot3uu5WpaStQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=rbXbsiv9IPm7fVDaH3uc1Ml9Jf/7osCPluC9I07dm7g=;
        b=iRqStn1l/AYZbPZKfP+uqsk2weHDJjb2G94hhErFnDw1lAn1wDegqwKIXWhlgvrDR3
         73CAo9W6wElVpiMlIwdaINMGHPfV6qEbfyfo1Nkv/30boB8T6/CYNVohwc0mwID6OdLw
         d0+E78P8G2c12cr1SVZ3btE8xo4CbNPLcYzjd4Ru+O7pRi2cJH4o//GHT2E2HMQCX0kL
         ujaLaFBdVcbbjXlUqR/V/3agFmtKcjI8MoptZ0GRo5OvXZlR7thZxlGqz54cPtygc2Zv
         ek9zyxNlDBhi38g6U5mfDM9fYn/NKgUPowWovGiW8+dHXzKA0X3kdhpq9vLr0hcbaUE8
         nERw==
X-Gm-Message-State: ACrzQf20fY6RTm98x7ipdH0S351qX2TD8HVwL49B0dBh/q7vLF/Ecm62
	7QCIX4iCX2/ubZKaks9cNLzhbA==
X-Google-Smtp-Source: 
 AMsMyM7fsop9e9Qksi9uL7py2Koocym+IfgtIOJQqjpyNUul0UgmSVlJAvXVPclCHYyCsAH7g+XuaA==
X-Received: by 2002:adf:cc92:0:b0:22a:361c:20b1 with SMTP id
 p18-20020adfcc92000000b0022a361c20b1mr2182589wrj.691.1663320387064;
        Fri, 16 Sep 2022 02:26:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:816c:1950:863b:51c?
 ([2001:8b0:aba:5f3c:816c:1950:863b:51c])
        by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003a608d69a64sm1737765wmq.21.2022.09.16.02.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 02:26:26 -0700 (PDT)
Message-ID: 
 <1666cae38231ae6fdd98132c1e473eaac90cdc4b.camel@linuxfoundation.org>
Subject: Re: [OE-core] sstate cache SSTATE_PKG generation will silently
 fail, if hardlinking is not supported on the file system #bitbake
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Arnis <arnis.juraga@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2022 10:26:24 +0100
In-Reply-To: <2xfY.1663283114373399868.FjIK@lists.openembedded.org>
References: <2xfY.1663283114373399868.FjIK@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 09:26:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170783

On Thu, 2022-09-15 at 16:05 -0700, Arnis wrote:
> Hi,=20
> =C2=A0
> I have faced a problem today that sstate-cache `${SSTATE_PKG}`
> generation will silently fail on the file systems no supporting hard
> linking.=20
> I've faced this problem on cloud-based Kubernetes cluster, where
> persistent volume is mounted to Docker containers as shared sstate-
> cache location.
> =C2=A0
> Because of
> https://git.openembedded.org/openembedded-core/commit/?id=3D552197a0c4c9f=
75a9177c00b197ea91296ed9fc4
>  change=20
> =C2=A0
> + ln $TFILE ${SSTATE_PKG} || true
> =C2=A0
> this will leave sstate folder with only `*...tar.zst.siginfo` files
> generated, but no "*...tar.zst"=20
> =C2=A0
> As a temporary solution, I have replaced it with
> =C2=A0
> + cp $TFILE ${SSTATE_PKG}
> =C2=A0
> which obviously is not ideal.
> =C2=A0
> What would you suggest?

Unfortunately that code is rather critical as it is attempting to move
files into position atomically and not use lockfiles or hold locks.

Failing silently is bad, we should probably add a check the file exists
afterwards and error if it doens't.

That wouldn't solve your issue with that filesystem would make people
aware of it.

Cheers,

Richard


