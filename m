Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BDBCD3420
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 11:06:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.20788.1725361601517670044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 04:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XdC+CzsZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bc19e94bdso27649145e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 04:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725361600; x=1725966400; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiV/A3SDMVJzN01vN5+WmrSyRZvdeEO54z3kKK55IlM=;
        b=XdC+CzsZF2rprzPXekXqg5dF+NxBcGoWmnlZFI0YkeLxXHS9DYaqwjLNVEvzm2nqR+
         8DodAzz/DRjbFZHYDf/hwv3DlulxNVNTEHWXQjrHn7yKf+NMpsylc0CVW27g/cHDutiN
         0phjQGrKARstJi5bZf1fTYIQ8nFArGU6cb/tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725361600; x=1725966400;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiV/A3SDMVJzN01vN5+WmrSyRZvdeEO54z3kKK55IlM=;
        b=IK4kGqcJT15CsHMLWbl/q5thQYSqwbPpYrtUg392CmZjJoMoZLZRiGep2sXqdfJM8c
         hshu0c/ZQxtR5JESAo2EK+iad4SXS+B7Zf18kc1ZL2Dmx00UnfIKc6RTLtxu29IXAzzu
         M9sCAqo3rc98RvrhT1ScKdoxZa8MnosliaMPAosdNpgAlJQz/3Ai2V9PNtqiBhAHsQNQ
         IxeJJ6s3rcwVrIsV7V3CabFQovcnTciQP62YRv26FmpBMQVy7YRN4l13Jyn2JCu7rqsm
         Hh4gK4JuDKqO05eUs7tKeF0yOBzZiS/3ZemmsbT4+nzsEjJc3VU2WeeN/EkTsTOA5i5I
         1V5A==
X-Forwarded-Encrypted: i=1; AJvYcCWJfgV+wCqqWQ2gjcJ9fsI2uKCepIrcEFrxgJF0DwU4tY03O0UOc9vZtr+BGSb9lUUVp1rC/gjvYoscpiaw4oFWig==@lists.openembedded.org
X-Gm-Message-State: AOJu0YygP2b3pxoTXib2rCHHrCmY78TUwzndznDj9jxyZrfipl+RGCTs
	gYHMAO2M7tuMoxq+8UpXM8k0mTJVV+/vmFGbAibJQdcXiupocAEIU984O+BSh48=
X-Google-Smtp-Source: AGHT+IHTcfWLNx5UCsyVZnysn/kEhEEV86T1hyGzXsL4YWp4GBalDVg/BFmXmbnEPFbrCuHfMSuAjg==
X-Received: by 2002:a05:600c:154e:b0:427:9922:4526 with SMTP id 5b1f17b1804b1-42c8de5f5e9mr2966795e9.7.1725361599591;
        Tue, 03 Sep 2024 04:06:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1580:b583:9f1b:260d? ([2001:8b0:aba:5f3c:1580:b583:9f1b:260d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6deb2f5sm167826515e9.2.2024.09.03.04.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 04:06:39 -0700 (PDT)
Message-ID: <42621b4902e9c806c4403805297bc70a073ea382.camel@linuxfoundation.org>
Subject: Re: [OE-core] does do_install_ptest() need to check "PTEST_ENABLED"?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 03 Sep 2024 12:06:38 +0100
In-Reply-To: <f33c3781-fab7-dee3-79b9-9385584076d3@crashcourse.ca>
References: <f33c3781-fab7-dee3-79b9-9385584076d3@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 11:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204156

On Tue, 2024-09-03 at 06:56 -0400, Robert P. J. Day via
lists.openembedded.org wrote:
>=20
> =C2=A0 another quirk in my travels through the ptest feature so i can
> write
> a tutorial, i ran across precisely two OE recipes that check
> PTEST_ENABLED in their definition of do_install_ptest():
>=20
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/get=
text/gettext_0.22.5.bb#n147
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/elfutils/elfutils_0.191.bb#n68
>=20
> that test *seems* unnecessary, or is there something particularly
> subtle that might require that? i don't see any compelling reason to
> have to check that variable.

It is unnecessary with how the class is written now.

Cheers,

Richard

