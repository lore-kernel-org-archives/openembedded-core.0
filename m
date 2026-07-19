Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117A5C4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 15:00:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6655.1784473200032862601
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 08:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VODtf0LB;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso25103145e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 07:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784473198; x=1785077998; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kHHewSR1KkgyBewOnyDJNT4qLTWLg5DfU+FmDvV7Ns=;
        b=VODtf0LB59gu604fsHGfIgadsGx1js1y8d2JLIMN1B1MnKGLyCFGHtDH25MVF5T8tX
         XCqEDTpw3uykRp346SsUKpvdMCvB5bZUJD6La9FEt4BoqT87QyaYb3+QpaFOPJYB6LbV
         +Zrwl+uUhp44Wcj3j5M/AoSEAo9f46wOKN4Js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784473198; x=1785077998;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kHHewSR1KkgyBewOnyDJNT4qLTWLg5DfU+FmDvV7Ns=;
        b=XfjC+ciSa76TnN3VcLg8662T0lrs5MjYqLvJ7amdVSR+FT8RSTffQon/9DkXqCd+KB
         MEfKglC6LsJ8O/z4pTP7CmD7YrU4n9UQoNvuUMHOYcZ4Hqjqsf65jBG7ecX9cQVXO++z
         ZZKXwIPY7WqHMUVTBJGbMio8kEq4y8sTH72/KWDeMdYceNaJeula5OOUQ/rldRveul5f
         5ZrzStXCqAHoyStyhm21YkMECQnJ04bFzo+70ryjHxHd0R+AjaKne4e6FmaqJh4LJB2K
         jUWKpgxoX/mDstFxd6w3ipsByKndezRvxQk9xZ9BmwTiFiC+lV/Xu38U/yJyV680DKH+
         G5oQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqd54+YmTDCEjb7/Z9eDsZDK9fCXwu4J9xSbRum6ClJCLuw7QTF3Y3Z3Pm5eB3I2IJN5oQEVOGwtYoHX8t/Wv9EuQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz1PSaoaLiBouFQOZgxzdaHMZSg1VQk64zAE6krKPgzzJzN5Uws
	fV1TRVuZrzp2HUnIjHeCnU34UEjfKXZc3N0w+zl4QZLXRezsD8Zr1YjqVYmUt1cS1ms=
X-Gm-Gg: AfdE7ckwbziEdmx+VYwetW9gvD9Wxz+xk1oLozQTuQcqC7sa2jljSBOOhEkFv16nZzV
	QLL0kTgWxORsx4cKXuopUIoaiEBsjJcXqwOMJ/4cL+pmg9HNyjpIrw6yKPvGQcpXo4uaqsr6y47
	UGXBC+rtfiycxQT7rh0/DoZQhbhdG8LD/X4RbNBsrXDTKEl+xodSheFyXsb93x357QZkEHwfDDK
	TpmonhJih3HBzQnAPKPw/XIgpvh/FnESkc3Ki7TNcSr0N//JXXR6fztCzNwQox+F6XD+pOB0pOL
	txEcPXIgy2AIcWH6FCTlANstQK32wubGvx+AgtL3v5Wd56NEKGAXAO+oa7n4jq9Kbd/IoWrgESW
	funSDx7mAbNafkqw3/vZ8qU+skWAgg8NKYML6tCi4r0jxFNZihGRYzbFNwyYK95IzIeCt4jyzXF
	03gjwqP9kkNcssmY4RZETAFgPeVaROlPvkaNFHbCuVOr8qDrnaU6O6o01tkP+p9Jeolb4=
X-Received: by 2002:a05:600c:3143:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-4954a3d0cd7mr123292735e9.2.1784473198201;
        Sun, 19 Jul 2026 07:59:58 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm226747815e9.2.2026.07.19.07.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 07:59:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 16:59:57 +0200
Message-Id: <DK2MYDRSPRYS.1DOX18PFR2D18@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] perl: fix for CVE-2026-42496
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <hprajapati@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260623060344.339663-1-hprajapati@mvista.com>
 <DJG8MI4MVEDF.33LV9PHJO05IJ@smile.fr> <DJRQ5LCFHTZH.1TS5PO223RSZF@smile.fr>
In-Reply-To: <DJRQ5LCFHTZH.1TS5PO223RSZF@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241287

On Mon Jul 6, 2026 at 9:11 PM CEST, Yoann Congal wrote:
> On Tue Jun 23, 2026 at 9:07 AM CEST, Yoann Congal wrote:
>> On Tue Jun 23, 2026 at 8:03 AM CEST, Hitendra Prajapati via lists.openem=
bedded.org wrote:
>>> Pick patch from [1] also mentioned at NVD report in [2]
>>>
>>> [1] https://github.com/jib/archive-tar-new/commit/17c873492a05eddc0de18=
c1485e0b2cccd5a9158
>>> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-42496
>>> [3] https://security-tracker.debian.org/tracker/CVE-2026-42496
>>>
>>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>>> ---
>>
>> Hello,
>>
>> Is that needed for wrynose and master? Since this is vendored in perl,
>> this is not trivial to check.
>
> Hello,
>
> Gentle ping, is this patch needed on wrynose and/or master?
>
> Regards

Hello,

I will now drop this patch. Please send a new submission if the above
situation changes.

Regards,
--=20
Yoann Congal
Smile ECS


