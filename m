Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3424CCCD19A
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 11:31:20 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.12853.1760700012946554560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 04:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lrJi0ve7;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: dani.barra25@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-63c12ff0c5eso3337528a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 04:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700011; x=1761304811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vxBFTyJ0sU0Drs0rn99UdEoKSgv//Kc4MnZENqgg6U=;
        b=lrJi0ve7EVkafxLlsGDW6bRZuHh1Zj7yQnDCqTwxA+Oe6hiLTSMhZRs/wkYA3p8S+G
         VA3+2FIjTrhLE/px5W4NU2dx3g0zAZ5ASKaoVhYSoX0qSIz5iTkb+Gfrq+86kPHKfaA8
         0NEGybcmmM3QhUGq132UxIb9st3UjufjmHqiVqEaCbfYWUbecyI6HYb+Yu+ivVpBpnoc
         +gYtk29EoE4Cw3eEBmd3RSQGdQYyPDv3peUH7XvrKfROyy51cR/DPNN3CFr1ijGB35qG
         w8pS0oPCO4a8BIdzJc3LVAzMPWc6BFwtzWsdfED0SpEgqSk7zL3xqStlOoY7cHEjDxPF
         MVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700011; x=1761304811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vxBFTyJ0sU0Drs0rn99UdEoKSgv//Kc4MnZENqgg6U=;
        b=gitu0q0tFrLJkxZIEnohFzLIcbY31oVq9VZAoWAgctlb/HTU0LTuia7jWjC+BNLOIw
         cSyuxt7Gh5mc8fu9ZOC2tsBU8pN+DRFFcU0eO9qn50OoVrN6o8kjLB1DeBg6S9XsH54l
         U3cI1wV3wBgpidal0csXcku6dPct9bxStkPTRAK1hpIBd22TTH852qdpcuqM51R0mf2w
         p7suAmD0IYC7jEnVgZVysIKCLS2GNZ13B7HXktidLOIe7mFQ+nZedYS6Z5t3SEcSe3nA
         SRBehItbG5yf6gQ24OyibeURWQUwDRs3dAu3VdkIvetzEm4Ecroa3kosqo0g++cZMsZH
         CLWA==
X-Gm-Message-State: AOJu0YwLs/hef3f2RgTFk7wne3wP110cMqbeoA7ZFJS+KtTHxdcQIwC2
	/oRLBHrAGZb8pr2r9aqyAGsK86t/ZCF5kGx30o7+Yxj1MScT+Y7JWcNUXBoMYA==
X-Gm-Gg: ASbGncsmu0cG4+fF38jAQiuEQ2j/zbR0BEgClwcbAm4WladqtpwhNuWGJwLy7drp3/N
	wTPrRw5qDtiOjUZusUzlEBQXsRrdJ3DGH4lO+7ABg5NHAnkErMHNAuiDWJX3UU1UCieSCq5vpRi
	+LVtAGvp9BAdE4UCEelJSDaBzqUnPbWPQqfzvtFHqoN+Btrnc04X24m4ZaobDCWCWQTIE3r9Uxw
	84Z0BAIyrUWa94JrEtBb0hhhhLtL4mwPK9Ms2rWmf9RkBwH9TzC8zCEqV+T8grM0viKDuXv3NMG
	gOejGvJAPwawOzEa2sBcOXsarXS7QNoXlMMdKgMI0n6SXkFWFDjVzGkCT4pOfd7Fqb9AOhV4f4T
	+27wCJfCexTlPXgeK95/WaPckgg5WWk9/22+2qCql8EP1PDjXNr0ubEmQeCmYb8yGN7wZ8pMU6c
	ahS+ZeBvIjD7tVvwqPIZT4F1pjesTZZRdppBbGpCg=
X-Google-Smtp-Source: AGHT+IFZTqPBVkPCvtdseWF6hF1XYF0/UW+Nmlo844ua+u8O0LuFbZXA4RNytx1x44P/TEbtJGY24w==
X-Received: by 2002:a05:600c:c083:b0:471:611:c1e2 with SMTP id 5b1f17b1804b1-471098fe59dmr44783735e9.3.1760699553283;
        Fri, 17 Oct 2025 04:12:33 -0700 (PDT)
Received: from dani.lan (a81-84-220-145.cpe.netcabo.pt. [81.84.220.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426e50ef821sm25855028f8f.38.2025.10.17.04.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:12:32 -0700 (PDT)
From: dani.barra25@gmail.com
To: openembedded-core@lists.openembedded.org,
	mathieu.dubois-briand@bootlin.com
Subject: Re: [OE-core] [PATCH 1/1] wic: Content of the temporary updated fstab should be copied into the original not replacing it entirely.
Date: Fri, 17 Oct 2025 12:04:15 +0100
Message-ID: <20251017111210.501333-1-dani.barra25@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <DDFITTM4J8SO.13FKL48ZAQCD0@bootlin.com>
References: <DDFITTM4J8SO.13FKL48ZAQCD0@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 11:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225010


Hi Mathieu,

Thank you for the you time testing this thoroughly.
After some test, I was able to provide a new alternative (attached to this message if everything goes well).

For the performance part of ext* and msdos fstype I have nothing to counter argument. I did not find a way to add xattrs using those methods and, according to what seemed to be the natural way of
the code design of wic, I let all the fstype flal under rootfs.py.  Any other solution is welcome!

For the second part, this time, instead of using cp, I let the install be like it was before. However, instead of running it under the pseudo environment, I executed it as the host machine.
This way, I was able to recheck the database using pseudo, which will fail and therefore led the files.db to be rebuilt. This happens because he is able to detect the inodes of fstab entry on all
the tables do not match and update them accordingly. This way we don't run the risk of modifying the original content of fstab under the normal yocto output files because the file is actually not the same.

I also ran oe-selftest -r wic.Wic.test_no_fstab_update on a core-image-minimal image with the patch and it seemed to have passed.

Best Regards,
Daniel

