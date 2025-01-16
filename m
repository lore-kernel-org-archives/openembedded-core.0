Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68733C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 16:56:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.256.1737046572418720102
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 08:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JRRKxt6J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436249df846so7714075e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 08:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737046570; x=1737651370; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zh3iuTw+GrmDWqNIjXFe3lObDIRicOFyqGIMH0QeO64=;
        b=JRRKxt6J6BEyOx02eyPqh/73r8qM20P/pBauqgF+HPJ+d0vVcqIcVuPb/g7QpQ1+0z
         qtDag6r+R6+6qCqq1RTykS4shlA54+oWn+oq+D+sQHg+wSIwjuQ/R1B7QkNikKdqRiSQ
         MSzLDnsJy9c977L83As7pzKax5dObPeF0mhz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737046570; x=1737651370;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zh3iuTw+GrmDWqNIjXFe3lObDIRicOFyqGIMH0QeO64=;
        b=u1STwRQqD9+e8ZO8xl8z0TWVbJs/9g9azBpOekYaeEp1MIOgVs5I8AN2kB08bk+9hr
         sTZ2JEdovMgmFMG18ll8iV165ugw7CfxttlZ65bjzW0Lr/EXbcJNt6jrIuOyS3PE8pag
         70UJb4GKw2EfxWwyx1WnQ/X1Z1kqso9vcEzPKR86+wJUhSgKC4zBL2IdEjuSkZ2iUhF3
         CQhrS3d4/Yy2k88XyjrJ+zrZVGzxajwVoIYduPLPsBMZZwxW1cLlQoGTONDVPVwK6WHc
         f56AVfZ4l7Qpr2lyquVDgtVO/FACQp/+vlKVD+7OiKyplB1inab71ZQefbtiixlvsdzY
         cgbg==
X-Gm-Message-State: AOJu0YxpCkIviPmOozGID0ejDLPqVU9Ku3pVIPwCbccQSGypOPYbcf6E
	n4BXiAzoBQij7s7DrVvAF8xjUhnIgxzACRixS+xreX9w9l6cu85J456KGEjL5Z0UxdOpynSDJTt
	dP9M=
X-Gm-Gg: ASbGnctxD2oSiKOn+h4lLoGUbVMMm5C736k08Pc4Bg71SEY7PSIBHsgh35KYOW46XTz
	Sbnc+XSj3jV+6E8vAK30odt4QuFhbFR+Ri2FuTaWxfVAHqKjMTr0Kckbdq8gBtVObsWqFF8HS+d
	y6pU3vUXGf5PybtlZJ9Z4+7oQ9OMjZtPJ/HhdSYtJZ2zmNrhVNXfCQAUMmpyOJrPx+oINXIk1MR
	VcJqlEqbGPByL91Zhe+fcVAte94NXeYsD2iJA0pi0CTqV2rJQX7h2fYEssp11AI7wX1z6ryyu9f
	57dY8K7EqBDiY911q41ve4+wSk9KNcJDn/HmNmL74Zx9ng==
X-Google-Smtp-Source: AGHT+IHtPPjXhWZMIieuQhrQvtR6enxP5vL73pIUGjKxGaYADE62CXckk0Vw73PLshg7Nzon4XQnLw==
X-Received: by 2002:a05:600c:1d29:b0:436:46f9:4fc6 with SMTP id 5b1f17b1804b1-436eedf0025mr235689305e9.8.1737046570425;
        Thu, 16 Jan 2025 08:56:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7fc3:ea77:314b:489f? ([2001:8b0:aba:5f3c:7fc3:ea77:314b:489f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389041f7e9sm4942895e9.23.2025.01.16.08.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:56:09 -0800 (PST)
Message-ID: <209dd128aad0eb29fa451e0decf2d74ba2b80d72.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] base: Add virtual/cross-XXX recipe
 specific provider control handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Date: Thu, 16 Jan 2025 16:56:08 +0000
In-Reply-To: <181AF8C1771E649F.1614@lists.openembedded.org>
References: <20250115204830.4030611-1-richard.purdie@linuxfoundation.org>
	 <181AF8C1771E649F.1614@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 16:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209969

I should perhaps talk about the issues this patch series highlights.

My first observation is a conflcit between my choice of "virtual/cross-
sdk-cc" and our renaming wanting it to become "virtual/nativesdk-cross-
sdk-cc" due to MLPREFIX being needed/added for multilibs. I'm torn on
going through another iteration trying to see if "virtual/nativesdk-
cross-cc" works better, I suspect it will.

My second set of concerns are around the usability. The patch
implements DEPENDS remapping but not task[depend] handling so you end
up with changes like:

-POPULATESYSROOTDEPS:class-target =3D "virtual/cross-binutils:do_populate_s=
ysroot"
+POPULATESYSROOTDEPS:class-target =3D "${PREFERRED_PROVIDER_virtual/cross-b=
inutils}:do_populate_sysroot"

for the 4 cases I found where this is done in core. Not the end of the
world but will catch someone out in future (probably me).

The need to hack around the problem with allarch due to ordering issues
is a bad sign too.

I'd note that if we accepted the syntax above more widely, we could do
that everywhere and not need the remapping. It is really ugly and
unreadable though so I'm thinking that would be the wrong move.

One alternative to the second patch's approach could be "filter"
implementation for variables (Joshua once had a prototype of it) which
would help DEPENDS but not task flags.

Another would be to drop this "in metadata" approach and move the
remapping to bitbake and make it API. This was going to be my original
approach until I realised something was possible in the metadata.

Thanks for Joshua for talking through this for a minute, it has
encouraged me to write down the issues/questions.

There is unfortunately a little bit of deadline pressure too since M2
is due on Monday and I'd ideally prefer to get a change like this into
M2.

Cheers,

Richard














