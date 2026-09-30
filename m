Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A00CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 15:18:55 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16089.1790781530333336952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 08:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BPXF45Xu;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so30053395e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790781528; x=1791386328; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KBZA9lZJws5bCSfz83lo7WAtNAovs8omFqp1r/a+moc=;
        b=BPXF45XuLx/xypTEybN0BCn36ljx0EDLI8JmgDBTBvGqgsfYvWBaRKkWtsnsrVWPyT
         D8o/xXdNP+D7gDSdGdHil129TrpvefvpH1nxx/JPgPqn1LYl2m3EKModpCTcrHX9vt4I
         E8IfKipOc6S/2+Tr1DFF4H9J0X7Xp2Ap2783M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781528; x=1791386328;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBZA9lZJws5bCSfz83lo7WAtNAovs8omFqp1r/a+moc=;
        b=Xz2EmMkdfvKERQPkUyTZL0npSbQb+oOtfdeOvCRb/6fImWIDKxVpcpKvkgxJ9VYnv6
         7pKQcGCciamKMLLv3N2hLT/HIfIwT89LFAZTwP6qcvk8ZVB99zSvQykkc/Jpiz1eqYxo
         5rqs3RWPNFVd6sPOv6VWrlm/VfL2jhlN9TqA+0NtsR1nhwRucChr/M+XnoHn0Rt7b82w
         NPvX9yk0y2DF01DIh54I/TtJKGKmlA7/0c2qbKjj0NUhVtwArb1qitosaIkHiUkjScJM
         piVYg8mAZLs2u7scDcUt+Pc+HugCENUql3Duq0/fRWMxiW+MWetYZ9ji/v286cBw+Cyd
         9d4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVCVTZhuoeZ2MT/7jevdML+U26LCI/WyduxQHrLh+UdS15dIE12MHHiI4UPhN9wfyg6iKwNnBGsGGNOBKASiuZIQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++npv2ymaxF6JyiX6AcqJJVAP76zah0qkqjD6ViYbnh5wb9HtvDC
	eb+xhC6DRs1XzXrYaCJ7E2xR5YMavlsjH5O4oNa+S921r4W9EhUQnpSGWCZ7xZ9GzIc=
X-Gm-Gg: AYBFou3H1CA7hOqVmfsvhPqjQkNz9Ad3RIfzH5qDWBmLAykvju6IqRheWaBtfoWlyXX
	U4/I6wF34GWPk6PLNWXxl/+xyFGSjNXZX+jSBmsPyg8dMFH5oQRFmYL5pxDyljXpPZCs6madFYJ
	VzttEv/itituFJyRttQntp7uFaUxkQgL6DWRialFE0lwBu69tBbpOCkufO96WEm2za23PwVn4be
	TptQPLDzPhASnWk3hnqFYeRPp8ZT/Wb+7w9Mjb6GkD9Mx8vwbGOctYbFurCK8zrl6bVShIHqF2c
	elYAJgC+R0SZ1B91JbSAKexts6SKO1RMIOsoSH2V6/zBy+nJ6K50vcowftZG0NurosAm1q31iFu
	9QCjnlnM6rhTtKQCHpkPRo9NzKtG7ittB3ubLlVf9lVGu/5t3L67nq9OfCDFlK2Q7pgQx79js+F
	D9bA7m/kdRfwrsZ7EvVDipG8eW2vJVcjIT/Nf7qRTP+5YhZOiCPPkyFty7XmAhPHJEBhkVtY/ul
	HM0NBMU0lX6ARxFt4avHsM7xUgpLqyJE3/otMXdhlLthlT2vMw84KbWzwE=
X-Received: by 2002:a05:600c:6814:b0:49f:e3f2:6851 with SMTP id 5b1f17b1804b1-4a01adde98bmr31285465e9.8.1790781528443;
        Wed, 30 Sep 2026 08:18:48 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e67e01esm5544135e9.13.2026.09.30.08.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 08:18:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 17:18:40 +0200
Message-Id: <DLSR2HI5TO7O.14GNI8UNTUJUF@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Haixiao Yan" <haixiao.yan.cn@windriver.com>, "Vijay Anusuri"
 <vanusuri@mvista.com>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <OmkarAbaji.Patil@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][wrynose] gnutls: upgrade 3.8.12 -> 3.8.13
X-Mailer: aerc 0.20.0
References: <20260826101729.731747-1-OmkarAbaji.Patil@windriver.com>
 <DLPJLS9FVRFS.35QX2ZF2MZZWU@smile.fr>
In-Reply-To: <DLPJLS9FVRFS.35QX2ZF2MZZWU@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 15:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246977

On Sat Sep 26, 2026 at 10:49 PM CEST, Yoann Congal wrote:
> On Wed Aug 26, 2026 at 12:17 PM CEST, Omkar Patil via lists.openembedded.=
org wrote:
>> From: Peter Marko <peter.marko@siemens.com>
>>
>> Solves CVE-2026-33846, CVE-2026-42009, CVE-2026-33845, CVE-2026-42010,
>> CVE-2026-3833, CVE-2026-42011, CVE-2026-42012, CVE-2026-42013,
>> CVE-2026-42014, CVE-2026-5260, CVE-2026-42015, CVE-2026-3832 and
>> CVE-2026-5419.
>>
>> Release notes: [1]
>>
>> Rebase patches and drop patch included in this release.
>> Add patches to fix linking with musl libc.
>> Increase memory needed to successfully run test key-openssl.
>> Drop code for previous release tarball problem.
>>
>> [1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS
>>
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
>> ---
>>  meta/recipes-core/images/core-image-ptest.bb  |   2 +
>>  ...fragments-implement-a-basic-DTLS-tes.patch | 258 ------------------
>>  ...s-mini-dtls-framents-link-to-gnulib.patch} |  12 +-
>>  ...ust-list-fault-fix-issues-in-linking.patch |  31 +++
>>  ...merge_handshake_packet-using-recv_bu.patch |  96 -------
>>  ...s-add-more-checks-to-DTLS-reassembly.patch |  65 -----
>>  ...fragments-extend-with-a-1816-reprodu.patch | 159 -----------
>>  ...fragments-extend-with-fragmenting-Cl.patch | 149 ----------
>>  ...ch-DTLS-datagrams-by-sequence-number.patch |  42 ---
>>  ...fragments-1839-mismatching-message_s.patch | 104 -------
>>  .../gnutls/gnutls/Add-ptest-support.patch     |   4 +-
>>  .../gnutls/gnutls/CVE-2026-3832_p1.patch      |  52 ----
>>  .../gnutls/gnutls/CVE-2026-3832_p2.patch      | 114 --------
>>  .../gnutls/gnutls/CVE-2026-3833.patch         |  90 ------
>>  .../gnutls/gnutls/CVE-2026-42009_p1.patch     |  62 -----
>>  .../gnutls/gnutls/CVE-2026-42009_p2.patch     |  48 ----
>>  meta/recipes-support/gnutls/gnutls/c99.patch  |  41 ---
>>  .../{gnutls_3.8.12.bb =3D> gnutls_3.8.13.bb}    |  22 +-
>>  18 files changed, 43 insertions(+), 1308 deletions(-)
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-d=
tls-fragments-implement-a-basic-DTLS-tes.patch
>>  rename meta/recipes-support/gnutls/gnutls/{0008-tests-mini-dtls-frament=
s-link-to-gnulib.patch =3D> 0001-tests-mini-dtls-framents-link-to-gnulib.pa=
tch} (68%)
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11=
-trust-list-fault-fix-issues-in-linking.patch
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0002-buffers-shor=
ten-merge_handshake_packet-using-recv_bu.patch
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0003-buffers-add-=
more-checks-to-DTLS-reassembly.patch
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0004-tests-mini-d=
tls-fragments-extend-with-a-1816-reprodu.patch
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0005-tests-mini-d=
tls-fragments-extend-with-fragmenting-Cl.patch
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0006-buffers-matc=
h-DTLS-datagrams-by-sequence-number.patch
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/0007-tests-mini-d=
tls-fragments-1839-mismatching-message_s.patch
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.=
patch
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.=
patch
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3833.pat=
ch
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1=
.patch
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2=
.patch
>>  delete mode 100644 meta/recipes-support/gnutls/gnutls/c99.patch
>>  rename meta/recipes-support/gnutls/{gnutls_3.8.12.bb =3D> gnutls_3.8.13=
.bb} (78%)
>
> Hello,
>
> Sorry, this upgrade was requested (and rejected) before:
> See https://lore.kernel.org/all/20260603074613.2846839-1-haixiao.yan.cn@w=
indriver.com/
>
> Regards,

That said, we might consider this upgrade if that solves a problem that
is otherwise too hard to do (like patches hard to backport) and simplify
maintenance.

(@Haixiao Yan, @Vijay Anusuri: you also sent this upgrade request)

@All: Is there a reason why you sent the upgrade instead of the
backports? (I guess the reason you had could be a justification for the
upgrade exception)

Thanks,
--=20
Yoann Congal
Smile ECS

