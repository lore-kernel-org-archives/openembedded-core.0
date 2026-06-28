Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E177C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 12:11:37 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71552.1782648696659434564
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 05:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NGuUX7HM;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8e5be46f663so18590786d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 05:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782648695; cv=none;
        d=google.com; s=arc-20260327;
        b=Hn8PWVcm/bBKVlHKJxY10pGCoM7nbU9GfsioN0rM8rn+d64vXHaOQDApF8CHCEWNv1
         4bsCPP0qJ0yD2ESHbFEwr5D9DmdUoywpiKTUBNt2Z9uQ+hCd4+8YgBbCySrbBbYOExTB
         Eq6dhAvB5dECDUdwGCjhYXXWXjqvkUCb/EfX9egNoypSVI8ttBGu+v0hU6YoX1zFSa/z
         S+gkT4yLr3SRz4uRb6UYsdlNKUUnrAxvz2YVN7PVkqcEhcQ8BLOaPh9qhkIdH3rqsnpv
         cj+RmLbPshYuHTmyIyVOhI/qFBAYPL7K1LimedkMn24x/v9GBpsMRbo+tFNCEcTWMYDe
         QXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v55BjfLt8C+qBYv062c1Ftakuy1/nUIDShvrGPCr/BU=;
        fh=oGbjW5SdUvNhGPGu8FwTOV7zIUUC3mUepWZVUSG5CkE=;
        b=DtMayuJ4l3sd1R38yj1K9JjlqFRBYQpoSXeNMFuF8HUL1IG4buOTOM5zayG95MbJJe
         IaUi5uPokJWRw/5FTPIu9FPp2O5r7FGVCAppKg56IGn8bz0YuJCNBGFfYF91a9PNQwM9
         Cs+Cn1TA0ttRuq8D3HRRjE5fIzwU6I28OLnCfu6ZZQ6OZU5oqXjciPIA1HuDa30upZvg
         186tA/lEmrDcHZLsr7dPFjLxj82by8ns3CVT/oAD402064ul45wuIYn/BrqVHkd/QJPg
         PZ/y6c0tQ6mdCbr3jcbIpvwPoTF2/tiPGPbSL8MXds0XuARuPr34vVI/8txTfmbSoEoG
         wN5w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782648695; x=1783253495; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v55BjfLt8C+qBYv062c1Ftakuy1/nUIDShvrGPCr/BU=;
        b=NGuUX7HMRs1NyvxzkkWhKG5v2OlWZJluvtBw+KY8CY8IS4zoZ8456qVkynUie7PfkZ
         oGPQoWuc7U70724JBxkULNaa6MQFdzMGd2HsaRT0vPdu7OiJSxyQljam/PDLcr3FYgYz
         aUfs9JpKOHwhW7ndyfufzfL97it5KkYElFvXG2/0PPa1KHcHIFHJ6kP6u7c/Mw2/HzlI
         MYBJZteOLKwuMD2GlulR+p2hiulOzZlicK+jr14YUy5neSEyT/T75wf3Fu6Z5/sfMblf
         DRilc+u471Kh0oJPYohdpfiWej8HWHWvuOQOSrqwEnAnP+ppQB+IxfrSxABbBxkIRFEW
         b9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782648695; x=1783253495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v55BjfLt8C+qBYv062c1Ftakuy1/nUIDShvrGPCr/BU=;
        b=S9gqNJxI14SuphKLVZQbe+hxACeIMQHEVvWyag1BgS8SGLiXNGTz6yeamwxzcXeyON
         vqY3TMxAC16tUw76Q3er7sKv8ioTffT4hwdiKTdx9XTE/QwwgsrMRmwA7gFZrZju6O6y
         xWBcT6GOZp6mkSbUfeCF0nTOuoHgesEq4LDL33IHNCLXnrSv1HJxa9JUbrj72VtwaHVu
         Ws0OJT8m7XnHHxXX922M37Ric/14PjkHB1ZQCmE92IBh5bdaSJSYSqbvkEOFDlmu+YeH
         0Ev0QKnOiTK7LSiRelfMt+6zxbSZf6Sn582PIl8wO9yI+Q7OvJIAud1ReXxsSBO/ReJG
         geXQ==
X-Gm-Message-State: AOJu0YxIsO4Ydf8alrBX88zw9zxN9OrnBn2Rj6GuyRxYNt4OPgHyAfgO
	4Dkz1eTNInvpwQCcz4OxAiFNPZaa8Qt+vMuQxT1+708cG1OtaAro/rwVVuDPAHlCIzVefaXpV6M
	IEsHW7D1qOP5C4lKfTFvcj4gQ+oELSZ38fkAd
X-Gm-Gg: AfdE7cnhm6sVJiTFtADrVs3tG2HhTAFsNfptyVfwK1YmaFzea7Of4rg+mAOvnWbD62y
	/5tq2vdOvr7kPEhABNdZk9CqYk1NOKw3PxtsBorshSA7EKYv3LieW2j5ZAJj3T/MkyOW9d4Lcnq
	A84ZBnmrPF/YGAwdwFTdPAAJ+pXdJO5QFcLH219+/eNn0HJ4GWe8s7z/MrRIF3rK8OEXnRdRrlF
	wIVcqm0qAnFnzfOH1YVZ0hF5ZbZ/c5Loou9PStkK//gpxO6b3CHRZ6FQU3vsXJPhvqmNeTl0w==
X-Received: by 2002:a05:6214:941:b0:8e9:f62b:8f9e with SMTP id
 6a1803df08f44-8e9f62b9256mr79890106d6.51.1782648695442; Sun, 28 Jun 2026
 05:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <CABF_=yhLuHYF6MAW03=CbgUMFdBXaNBpQ=OEVe8d-bCimYv9eA@mail.gmail.com>
 <CANNYZj_=-X6Q_7r4qcSOT2f9f+pT=+E2TbHrpyM1Ksfv08neqA@mail.gmail.com> <CABF_=ygeFfSHEEk3SXZqh63cPLHEtVkZj6MRz=hUviQWGs6dOA@mail.gmail.com>
In-Reply-To: <CABF_=ygeFfSHEEk3SXZqh63cPLHEtVkZj6MRz=hUviQWGs6dOA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 Jun 2026 14:11:24 +0200
X-Gm-Features: AVVi8Cf3_NwMT3DC16pAY-gldwkya-phy_yKkh4VZ63fjl4ka67AjLKh5oOeXCc
Message-ID: <CANNYZj-+VZveLduSPFjk8G7P73prp7f4_-5iraM=hsmPV0we1A@mail.gmail.com>
Subject: Re: [OE-core] -native: which tests should be done
To: jan vermaete <jan.vermaete@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 12:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239713

On Sun, 28 Jun 2026 at 13:38, jan vermaete <jan.vermaete@gmail.com> wrote:
> The  recipe that requests the -native version of python3-unidiff is in meta-ros.
> Is this enough to consider it as 'general'?

Details about what needs that and why are lacking, but some questions
need to be first considered. Is this a new error? How was it tested
before it was committed and pushed? How is it supposed to work, and
did it work before? Perhaps this should be discussed with meta-ros
maintainer first, before rushing to fix things in other layers?

Alex

