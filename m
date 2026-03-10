Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BFDFD2D74
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:18 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39260.1773147016827241962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e0hsFzDL;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-899eabc5292so95405386d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 05:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773147016; cv=none;
        d=google.com; s=arc-20240605;
        b=dgOcELbE3p3V+wvf+0UPYAURZKsyuVhLcEIsUKQejldZYYo5DU3Nr0OumFTDXZHTZm
         z+z3bfnAdooZMEWXXdn5fkkpGX93yiJuWjM+bmERaePdGpqumve9e5B56TzSPFZ9G6Dq
         8935wz3vV/NPmXlmKEZoIzpZzFPueNKytyVJDWDRIuK4O+jXYqlUpLBzEihGpAz/+ycD
         K8vusuTUdWOH7yNpZuV1g/4I6NuXSbCao99RtW2712Zw4GJcDERfqowrLfml07AEaOs0
         E3XrgCOmvtiqAWgP4CIRKK1WMTxtd/AHpKEYgKZUenAquB/pyaKMmdQuS4BloyX5VDCN
         CEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kuDg8BBLvfp8Qe5bYojvHNud9G3owrFm1Kk3F5KTuI0=;
        fh=3Hr5hsk5yz7Ab8xqOERZxazP0G8aojU2NwQOtBQC92s=;
        b=AbLqtDot0mpMnqW472j8++8NtLk6rPDYRnxksby3R6O/wrz66PPBli/mb1woUq9Y4w
         TgT3ad6esVaLZaruhYbv5gpfPo4WGhSNXHFfuRdq0rCqQ5VUAP5iv+Ycc+Q8Raw+3vwf
         SUTOBf/nZhbHkIwa7FEb6vMsdVI2gL8F3u+C7oIkTZ8+O2zBXtweNVK7Jq5D9oTuNr6V
         xqgC69l+hswuQRvHhWdtIvfXzp/t9iWcW3kp4fRfAgVtwwnac2PPkXTYcXbh2gMfszlp
         vE9wwpovagPQUuFJSv1M1jLRzp6gAaMTKk79hrrC+aTTI9p07nQVnN1tuC5car7uQ9Yq
         jajg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773147016; x=1773751816; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kuDg8BBLvfp8Qe5bYojvHNud9G3owrFm1Kk3F5KTuI0=;
        b=e0hsFzDLt6caiB9NlawbL0HMB+LpRD+b6tWX1AP/XnAYK8nX8DYf15JDR6hqPB+zQO
         ETdfx+8vYoqEkSpJ6dZvDsnamtFuNtYxDNA09N43XTc8VDUU/lzLarPdajWEnL54GZ1d
         9ARO/tm8opY4KSC+td3+yuJOK9OvJjOojvwHLW0vV+0M6VYnHFkjAhVfcPKV1pO8xWnJ
         i4qjJwW8ive2aEP6MfAJCwly1qE5f1miKfxgPottVCRRsk5TW9gNSETkLw0qPBEV6zI2
         mz6OrHSap3RymF+FxO6vb7znztLgP91mRLBIfp+xx6+rwoWsRooEsycWECRpCRgJNrrY
         ARBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147016; x=1773751816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuDg8BBLvfp8Qe5bYojvHNud9G3owrFm1Kk3F5KTuI0=;
        b=KeT41e5zsZCen35x6DCMBhQSpQV6FnBFRCL31+3/+eL6Bmzl0xqmmQfGDdzbC7th/C
         bKZt1FjZke5eg2Eztg/1tg53P3TMF0vhqUTuP04U87wIaEsmNEB5Uuuw/RjxIN2QFKAR
         TkLA1SU0cIf/MCC7f6qyLBtmEs1mCtBpNcmWwfXfrNayZt459hUctT2+x9Ez0EleLnrC
         V+xfcS15jMph2dDWofQ51OwaQVhkoC11jOYPOzNK6tKysRzFGZO1D6UuEg8UNj72ECs9
         xdpIGOyXEgSqEtNXCJxnVN2Ri9qFplQP/EGCjAbN2tnHLpDrQqrEnKn2AF75cr8z3xFY
         7RFg==
X-Gm-Message-State: AOJu0YxNQScxfzwmxWB2BKiJZP0FMU15cnmUKLbmi8XI7dWE6Efh6A2o
	O4dli70fPG58V36K2+oU8RNCT1p3wLS3I0EeCfu+52kV5EJFLstR2WaBDvxijIBDeEE8AQxDWRw
	Sgx80neyis478ihZ8KG31ai2B6WNiTWY=
X-Gm-Gg: ATEYQzyavym1ea7wD2BixZAsZsywMW8Fu/Jbl3pWkbdSL6+2Xmz8Cub2v3KZPfQITOD
	NrpFuFkG68d+YRtjUOWXaeLIIb2ZjSpGkB+2gADAeChR47oyjI8CoYz+4dk8jEQ+cAdh8Ys5Ycs
	JN1ilM51IzEmcXndAM9Xg6VW8tjeYKoQQYqwVSU50IDNceiV9qv3Hoh1EIV52Z1iLxmwPZbUS/o
	4KCLyFLtr0VhfXkNgqArAQnsoyj7XoOcYRG3HMusKNJtcut+rtLuXIgHOCWwZP/lrmgy3sF8bmb
	TbzUFns5Vpc9S2lOWXlaIftS9gYZFJwohAtGW5SM/g==
X-Received: by 2002:ad4:5c68:0:b0:896:f97c:2f83 with SMTP id
 6a1803df08f44-89a30ace6d0mr204536416d6.33.1773147015724; Tue, 10 Mar 2026
 05:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Mar 2026 13:50:04 +0100
X-Gm-Features: AaiRm52xyUfqorEiGkMGadkw87nX3CGInoT7NbTsA9mLJtOc_S3SD-FRhhA25t4
Message-ID: <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
Subject: Re: [OE-core] RPM 6 in Wrynose
To: mattware@cisco.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Elliot Sparling (esparlin)" <esparlin@cisco.com>, Robert Yang <liezhi.yang@windriver.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 12:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232778

On Tue, 10 Mar 2026 at 13:24, Matthew Ware (mattware) via
lists.openembedded.org <mattware=cisco.com@lists.openembedded.org>
wrote:
> I see that the next OpenEmbedded release, Wrynose, currently uses RPM 4.20.1, but that there are efforts to use RPM 6 instead. I was wondering, what is the current state of the RPM 6 effort? Is it looking likely that Wrynose will take RPM 6?

It still has issues, so whether the update makes it in wrynose is
unclear, and the effort may not be ready in time. Rpm updates tend to
break all over the place in all kinds of corner cases, and fixing
issues often reveals new issues, especially when the person working on
the update isn't able to run yocto CI pipeline themselves.

If rpm 6 in wrynose is important to you, help is very welcome.
Mathieu/Robert should be able point to particular remaining issues.

Alex

