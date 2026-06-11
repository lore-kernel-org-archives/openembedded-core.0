Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385A3CD98D2
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:37:11 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40877.1781167023861721774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dZR+Iykd;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8ccf181a52bso69964356d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 01:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781167023; cv=none;
        d=google.com; s=arc-20240605;
        b=CCULo9W+WC6UMcpAMxSi2+U0jTwUsOscps+e1ZHS5CFEv7ts69V1q/LlVsJbvUUPXN
         hcpYpKf6cF7DsYbFqQtKZSoIuii3qppC9hU5FGRvMAdVTGyBGo7vjLrPdtUEh0mp/33l
         e+Bjk4QxlDyyG1dXJLDBiw4fPVW72uovQear70t8JlbvE2SlkJWeXTRWF8apHXrCxuCd
         H99JZToUgAT3/cfBPCZ2DT1hkCXLOk/WChAFt7zea7V4oJpkjl9OdtG8usyFzcqu+pfz
         E1rcnp5yFJ8xgCOV0BYwi3KROYAYmvgmEMw9n3ljcyxqdwJZDYxcMLQunIaVQgxctWAG
         mKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/vBmKYeBTFl6MzEoBHTx2732AHnyZlBzMv2qdPtd6e8=;
        fh=uPFtBQXidlbm8uLIVjplFZDGi6kpfsVILVwatek1FRk=;
        b=ltvCbqCZOUQteuk49enLMT2KloCfPO6acv0Yl48TpWKcmFUrMOf3IrCKTWShUvzsKH
         9uhQRPOZ2jUsiiz4ExvqiLvuE0a1OR0/tLJCNp6hgGM2JjYni7W+rDd9qXKeUlHorS9X
         i+rJ9XXyRl5KHnkjt28hy/J44zqxUDfWtpIcyWsdvBXULBrxFwKRy/FSdDLpla859MEu
         NYf1gHTqQZxHds4F/696p7eD2M9SdtDw5e9kZoZfpJjGiGwIyagDGsAx7I2LS0OCQJip
         7QbW+w1RE0OU99iXv0E8xmGvRAqhG1TgxJdoaiBnl/ZkdOijCrAH5oaWv/ZcbyglsyOT
         xzqg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781167023; x=1781771823; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/vBmKYeBTFl6MzEoBHTx2732AHnyZlBzMv2qdPtd6e8=;
        b=dZR+Iykdy0Jjrsx9g6tlONJ4bWVDswIsAoSyViYqXkYzEsIAV0mlkPr5FRcWJHfPde
         zyytv+rGPDlkYQJWYPGHrsBnep3uQljY8ED+W9Pt7/NORnYBttcDEoukyff438JyIQiF
         KmcBEYL8Itdq4tEjoM5xIST6G5VTJgqBzhSKvrEgvDtAOcgOwIaMu8eT3Px3//JqIprX
         SwPvJxM6H4tOoeU57bSet+pmb2ZStAj9RcXMhPaJcYOEtTnVAZJYGfeOHWtAz+bP5qBr
         74pgOfTV4KDHc0zDWZoSzkqTisVfIcpcf+ngr3uzJWDTKY+/apmKxeXoCDFsqECWYMfv
         e3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167023; x=1781771823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vBmKYeBTFl6MzEoBHTx2732AHnyZlBzMv2qdPtd6e8=;
        b=WKkbrDXt0HdORu9AvTjIkM7LICwr1WTDFDyyyip/y8gpmgbcfZ3xAPhYTzyUZU6UxO
         tVAVk6r7QqiULWdSt2LLbHZakpseaVGMf/IDG3+ZXRniLXA+jw2subXvhoHV2KvY+vML
         4m9JKIcytJQ5RyNXN4PqGYsNDj/ikdmSVo+qKA70AlIo3KidORED+ujy9U8I5NdjYtXJ
         BT6695gpAzDSIO49hj3RmFQKtkqKfNHbsmCj4M2oDG20VEM5jrPvW8G/v0icMV0vMxm2
         4lEp47kxdVE9ISgvF8UQjuTxFmpv6sAfI8NEAxfgWwAA4RLHcx7CzXg+UQfqgvGe/fWt
         Kd/A==
X-Forwarded-Encrypted: i=1; AFNElJ8DnNH3sgU164rAlc5EmKK6a6LgnjYQ80Gpid4uXYQfO03N1mvOpwAe7kKoJw0W3roh1t7nWpMYobwAMnqjMKHnBg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzhedBR8Iqj7Lhd/wEce2n+BeBQ5j1fPre+FVvUOrbEJ+cNoDy
	mXPRwQbF5NRATv0Ui2RoonX31H2PBI+VTxMoquqd/MM7XCB/ocePUBipMiBrykaagxRuUWkwT48
	Niv+pHKViGmANA+q/3osBcjCQVgZ2KzZQtw==
X-Gm-Gg: Acq92OEXmpdOYAaLgaCmf/hHrRzLE4mh0/es8niil30PEP3LyZSMIB5yWfIQlpUszTc
	fk6BQizmW0/Bb/Au4+e8QSinrD7CvSPMnA6DKAR458lqnlDR8dSUsdYrmo0qaoS6CADtYHF9dMV
	04ddcYh4GL6lwNOtBqG/B//qF7roJb9jrIQY9qtCqtc/vaeDd9JP/068GFprL+QgMScCTKx+fam
	lBm+UweiqhViO2N61/XAxwiR6Csfbdj9yI75I5b8bprI/XFTbXIAbMRvAhiT5oTkedREqitBSSc
	MHnTkdU7Eq5na4Pji2w=
X-Received: by 2002:a05:6214:2386:b0:8cc:f72d:6a5 with SMTP id
 6a1803df08f44-8d1df23ea6emr26466046d6.36.1781167022753; Thu, 11 Jun 2026
 01:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260609014110.3859502-1-Shilong.Jiao@windriver.com>
 <DJ4E5OTQSRTG.JX0ANFWCLECZ@bootlin.com> <18B75E544A0EA1A3.61226@lists.openembedded.org>
 <SN7PR11MB66786F424595B04D017F6116801D2@SN7PR11MB6678.namprd11.prod.outlook.com>
 <DJ5DVPB75QO4.F4OPEQNML7BM@bootlin.com> <SJ0PR11MB48297A9B780C8DD714642A48801B2@SJ0PR11MB4829.namprd11.prod.outlook.com>
 <DJ5YSG3O3Q40.3I3CWDSCY07FA@bootlin.com> <SJ0PR11MB482976D2BFC3372B8D58C8A3801B2@SJ0PR11MB4829.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB482976D2BFC3372B8D58C8A3801B2@SJ0PR11MB4829.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Jun 2026 10:36:52 +0200
X-Gm-Features: AVVi8CdYE815jxKxha_nd5jSDcbZst2-RzQbGnzHXuc2gmjt6CuNvJMSduO_11s
Message-ID: <CANNYZj9dWgjGVG3-S-tnxVr82VbO8M=jNkDGV_x+RC2YvHPoLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support
To: Shilong.Jiao@eng.windriver.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238430

On Thu, 11 Jun 2026 at 08:33, Jiao, Shilong via lists.openembedded.org
<Shilong.Jiao=eng.windriver.com@lists.openembedded.org> wrote:
> Thanks for the feedback. I agree that submitting to six upstream is the
> right approach. I've prepared a patch (attached) that fixes the test
> order dependency issue.
>
> However, I don't currently have a GitHub account. Would it be acceptable
> to include this patch in Yocto with "Upstream-Status: Pending" for now,
> while I work on setting up an account to submit it upstream?
>
> The patch is ready and tested - it just needs to be submitted to:
> https://github.com/benjaminp/six

As the patch is done for the purpose of adding a new ptest, and not to
fix an existing issue in oe-core, it's better to first get it
upstream, then submit to oe-core. There's no rush, and adding
'Pending' patches should be avoided.

Alex

