Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9D4C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 11:45:39 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.48101.1743075930922568108
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 04:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i+2EgVeg;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c07cd527e4so93308785a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 04:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743075930; x=1743680730; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQvLC5N0vah5oWSaeX9eZw7JnS+vqxx925OODo8nO08=;
        b=i+2EgVegrWFFh6LL6+CU7gPlksHt65LaaBXKWHStCs2UaWsOvQeyufBWgoMuyioTL/
         7ytW6qug8NPn8ktPxPMS74plHdPC5wb9kMn0LzM21LjO4kzlAmuGoP5A6WL6pJCA4nJH
         Q2KKqfWuCvhdk9mff7FQPCD8jehZrk+8QS+G2n/WUr5dvkQqoJsrg4AiAW0TQboEe4VK
         dyWkZj02bZRxGhOXoQlc2PnslRnKc4koT+q5V/iTRKcFNCF6bfqG2ZEIf+LtnDYlLSMj
         dbFIvmEQ5QQA9lO10vlPjtNfqwzYCnObu1Q47nLv4nJJZErSf4E71PafpXvXIcNFdI5E
         BEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075930; x=1743680730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQvLC5N0vah5oWSaeX9eZw7JnS+vqxx925OODo8nO08=;
        b=O+8+ogCgGYTVswlVXdpH0C6tCOtTa/MLkeCD4e1tzbnAuJSamaWQ32AlVVrmwKemwe
         P+9EQ1QCgd95GrRIYZUpAAZkPL1jM6SLXQ+VdR528HAeUrdWK/VKVoaeQtMovpMZ72Jc
         AhYeNS/uLW8nHy1+SF7tH2GV33W07h3kBiCLmQUe9n0RT6Cqlw4qQqFNxop44V9IOH81
         Pg3i0wyrBDYDDUarew9MiO15ZH9/QslCHmAVSddVrP4Oy53faHkYT93Q37sSxGspjRHG
         Dc1xnJEILdlqzxOqZB8X7+ACEj7RO0Yve6vHxu22Sb6t803lwNqvBVnV0VL2448CuguT
         tskQ==
X-Gm-Message-State: AOJu0Yx230l9fGKI1ZDRKAQCFujRXgz+KE2YMsj91ow71ZpDTIIriBJO
	TtAOojlq5cRXEA27PPdpzT1jqNfLkNsBNmIcjQIsBDQhd0tpzo3U8tXrpiN3Qvv7A6uRsoIqEZk
	68tuz74i8062FTdLbX8FtFYsqtOA=
X-Gm-Gg: ASbGncu0qKBSkKsSRRKeg9UcczhZ6YwcO3VhBDCr/CkoTk8L+fijgQGGBHs30YI170Q
	Ly+BEA3f33ku0SYVE60xHeMCuCLEndGuJKL9chOFw/lWaYlTbBe+ZRdXi2GBvg0X36avDe102fA
	uF+ohkwVfFzaHM6dL2OQWhR7F1QWI/WJGmgM9nw7xRJb6fM2EBxFiz3WAWwW7v
X-Google-Smtp-Source: AGHT+IHauyQgxVLI6X63DUF8YFmQxs8IiPK9+usGeGLUbBYQNHHYfCu7QQvAGs1l4KKWtzZUaIDewRWQ7oILMOoP2GU=
X-Received: by 2002:a05:6214:21e9:b0:6e4:6ee1:a282 with SMTP id
 6a1803df08f44-6ed238bdfa2mr45094616d6.18.1743075929692; Thu, 27 Mar 2025
 04:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250327060855.428041-1-rajendra.desai@emerson.com>
 <CANNYZj8ko8LF8m32CoM2fWTCryTWW_Nwya62K_dpBZqdU_WZZg@mail.gmail.com> <DS0PR10MB79549ADC3C849A2D68F00BDB89A12@DS0PR10MB7954.namprd10.prod.outlook.com>
In-Reply-To: <DS0PR10MB79549ADC3C849A2D68F00BDB89A12@DS0PR10MB7954.namprd10.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Mar 2025 12:45:18 +0100
X-Gm-Features: AQ5f1JqTfwLBEn5bEJW8Rw15xUNABjDWbJc3_yAia92KmNu_6rB1v-s9EJMVkd4
Message-ID: <CANNYZj8M2Qf-vq9MTFySxQy7Kni0LkC+CHYupv7YEXwutgcaTg@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [OE-core] [PATCH] perl-ptest: copy xconfig data
 from perl source directory
To: "Desai, Rajendra" <rajendra.desai@emerson.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 11:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213726

I just run perl's run ptest on poky master to observe what is happening, an=
d:

- the tests are not actually erroring out, some of them pass, some of
them are skipped
- the reported problem is not a missing header, but a missing gcc
compiler (which is hardcoded somewhere to oe-core's build environment,
not the target environment).

Can't exec "x86_64-poky-linux-gcc": No such file or directory at
/usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Base.=
pm
line 362.
PASS: dist/ExtUtils-ParseXS/t/001-basic
Can't exec "x86_64-poky-linux-gcc": No such file or directory at
/usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Base.=
pm
line 362.
PASS: dist/ExtUtils-ParseXS/t/002-more
Can't exec "x86_64-poky-linux-gcc": No such file or directory at
/usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Base.=
pm
line 362.
PASS: dist/ExtUtils-ParseXS/t/003-usage

- additionally:
SKIP: cpan/ExtUtils-Constant/t/Constant
SKIP: cpan/ExtUtils-MakeMaker/t/02-xsdynamic

I'm not sure why you are seeing something different (are you using
plain poky with no other layers?), but any fixes must first address
the issues observed on the standard ptest build performed in yocto CI,
which is the one above. Then we can get to the issue of missing
header, if it's uncovered.

Alex
On Thu, 27 Mar 2025 at 11:51, Desai, Rajendra
<rajendra.desai@emerson.com> wrote:
> Ran the ptests (run-ptest) on the built qemux86-64 image
> 5 of the mentioned tests failed with =E2=80=9CNo such file or directory=
=E2=80=9D error
> (for which, I have explained the details in the patch)

