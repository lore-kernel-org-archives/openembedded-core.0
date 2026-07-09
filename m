Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20941C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 08:22:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4279.1783585319326243379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 01:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gbT0IrwX;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493bab44440so3889605e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 01:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783585317; x=1784190117; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q21892T8Y/QgD84cD/VXiXNsioelhd56WMG8e7GoAkM=;
        b=gbT0IrwX9+IBx7YDnyeuTvTVlgtLRhYJhq/yh6d7TgoMFIemI79C73XC3veBtOvx3Q
         QWELmuEE5yBhackmZbuVM1YclQ4hElHguSLDZqB2tjlEaSfwtAodTcD4dyxJJXDZH6xO
         c6VDJeLUCO2rttUDcK6cSCSZSX731+1+VlW1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585317; x=1784190117;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q21892T8Y/QgD84cD/VXiXNsioelhd56WMG8e7GoAkM=;
        b=YcNcOzq1yY5SYAkF/AAB9k8E9oIXibjBy8Fz9VAizUfWgUYO1Tu8JJZzwi3853KyOu
         CrZcEx23okci6mtgvBna3agBhhrk1hV+581VvNuYVj4edlqsGUVjuGuMzIg1hF39VKII
         SCv+pdpWtivvO10AZoKmTGD1fF5geEAI5sNzsLytHDSKfGgEEpF/cN53yXN+zvZ/v9/g
         FoVO8bg3pDqzwaIRqFNFdqxujn2yvlz/0sZ53tdgxcsSf3ZrZZcsrHu+gV6a54I/ffPL
         wA6S7PTVRs5Nz911hhgDtfudpOGqkJBouFwFVaPsH8yx6+42F/+TYPQvJoZPQrBWi8YH
         EVJg==
X-Forwarded-Encrypted: i=1; AHgh+RpETbVNkQnP0YRP2b+HnCOq8vdaLpOUFBRK7PLO00XfxlqpOfXHEJZkeFajK6iaJFxemnpI5EsmI6+IKD5DP0H+cg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxNFOWshCWuMlDeK5YH7VNBRnseYF47x9JWHbwtSRFIf+i/b1S6
	qg6+UGLCNRAepISBNeFAs7XsDx5LTEXNGh/tT2mTab4Q04FAFoxXcSorXgfV9M9IJ/Q=
X-Gm-Gg: AfdE7cl215O8Ku44D4Rd7OfVYV3aeARkp30JmjL1bRkHfoQ+vlFbgyf7hapR9+Q8ZDG
	8yi2XmpoatbgIZDbXBYcv8yurW8mUytS4DiDUFMFCbofABV5IavCaGfOqtPyyBtE13HG5O2EnEH
	/A3R330WaWQXyRhGme6mjYZcndCXaTCj//V8tIPc4GRpQ/8d7NQcuCc5HONxghFXIaxgRZoa05n
	U8jTSJLdROiqEt75l/507fCEeg+ZzKjKlMAtNKD2W3lGDQJ6Xf+Ez6/CRBKdiuzeS7a8Ju1i34U
	4wX3jAeNjHLPiJNKilWQlR9hp2FYljs/g2XJzZVlUrRNerobpCgV0eCTFZtN5eSYKny3T/FcLYb
	0am/hniQXofXmLFXksIlKEcUnwxr2hl4lz75QVcAJkkXFHdpfBCUsxlhlVUyjQ62YgM0byBGoPf
	LBfIdCw0gPJXoZWgXXCMIVA/p0ylHvpFJ/XkeDR7OHilKaYdrhieKlrTXo8jGrtpZDPbqK6ym+N
	g6i
X-Received: by 2002:a05:600d:6454:20b0:493:d117:18a8 with SMTP id 5b1f17b1804b1-493ec6671aamr11580065e9.9.1783585317522;
        Thu, 09 Jul 2026 01:21:57 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ee2bcac0sm20811865e9.0.2026.07.09.01.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:21:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 10:21:56 +0200
Message-Id: <DJTW86ZQ60QQ.3FT3QU0PZJK6O@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [Scarthgap][PATCH] openssh: set status for
 CVE-2026-3497
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260629154240.2293009-1-sudumbha@cisco.com>
 <DJRT7GZ90EZQ.1CCLVP0O2PBQZ@smile.fr>
 <577721.1783575328862357840@lists.openembedded.org>
In-Reply-To: <577721.1783575328862357840@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 08:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240543

On Thu Jul 9, 2026 at 7:35 AM CEST, Sudhir Dumbhare via lists.openembedded.=
org wrote:
> Hello Yoann,
> Thank you for your review and for pointing this out.
>
> I have submitted the patch for the master branch here:
> [master][PATCH] openssh: set status for CVE-2026-3497 ( https://lists.ope=
nembedded.org/g/openembedded-core/message/240520 )
>
> and the patch for the wrynose branch here:
> [wrynose][PATCH] openssh: set status for CVE-2026-3497 ( https://lists.op=
enembedded.org/g/openembedded-core/message/240521 )

Thanks, sounds good.

In the future, may I ask that you keep some context in the mail when you
answer? It would easier for me. For example, your "pointing this out" is
not clear without reaching for the previous mails in the thread.

Thanks!

>
> Thanks and Regards,
> Sudhir


--=20
Yoann Congal
Smile ECS


