Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64547F5545B
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 05:10:49 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22167.1771944992824424622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KWbKvz6w;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: feroz.afshan@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5674cd243d9so4472071e0c.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:56:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771944991; cv=none;
        d=google.com; s=arc-20240605;
        b=TMygpWzdy4IgytapEhKTvDcFwIG7AptAX9VAaW93qATlcdXdpLrQFr8mVnBKtCadOc
         JD3myY8ye0iaw9/oXt8ymxTymOp3lbqyqJIuAPxapXNFmdlc/aSL6wdUSvK6oV6o6AoX
         p1OLU3XRdo7/uJuRm/i3XdCajDc5LfyJ/vY5vzcepzZojvfwbz6bbENZUtEJyfIeTxxM
         GSnEWmJwDLxoukf90xnsk62lO+eVcj/DfPcQ8HLxsxL6qb6NU3j8rbvxEqqvgcOTMimg
         JuzIw4gpIKA+ourXF1ch1iaBGyA0726Rrxjkvn7meBc7q8453IZzK9eLAtBKzsjSoxVv
         iNRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=aDTUnlmU6u90DMX+bGx31cRMz00bs99vuZgk14rTozk=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=Od+D+ifympjUJqc35QD7dibDfft7kXAfQ3QbPUito9bKx/5BTM4XQnMRpDZgfEspcl
         mLQxO9dZNl6tEtVNVp/VHwV3u6SXt3nyVC0pvRfU0LNNf4CWd8Xv9stKOsr78vNqlIBx
         Y5G18kFoTx+f4IJxRvXU1WqIFO5pZXF27q1opm+c43Btay+T93wcd7E5jE19MCMTkRYV
         tKAA0DOh1eL2ezfNgelFWnvb3NcII3mDeVT3Zo9xwa8b1Cn7gKGKMXgXmoqH+j0KUYvh
         KTaZejtyii6qa2ZC9EDZUMjIL/pPnK4BwMuFK9vand9hJe8Ru3qy8o21Br9wS2dfURYz
         PfcQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771944991; x=1772549791; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aDTUnlmU6u90DMX+bGx31cRMz00bs99vuZgk14rTozk=;
        b=KWbKvz6wZDSsAUp7H411UhywnwYDRQcVHubsuZ4K3MFCT2zOBBLV4A8T4kiFzqk63b
         auE96ptG1ultoCwIrytXDuU2+YOA4w/4tZCqHcnBYezTTZ2Wfnyn6P7vdM+1QUDkvHf4
         Zjn5hb1yXZbZyfsGqdi2bmu3CoxmKGqexVpSwkDlyRQnbaP0zaFN2xCok7CURYsWbEys
         b8tYjmD7YcrtFG3Cir0rEJqSw9YSKwWaDo9MQUq2pZv/mnFqx4HtNouCGsbI+HWgTYQC
         uwpqRjGdRK5eG7jYh09UrwS0UVkd/eQcvFxjm4lB7mlaqqp5pwmeJry213jjvz0bZpqB
         yo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944991; x=1772549791;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDTUnlmU6u90DMX+bGx31cRMz00bs99vuZgk14rTozk=;
        b=eyMaZw7IP0rF3kUTRGW67NZowFLzcYKbtV1zYlOHBUD6tazu4RXiHThf7hryF/Rk9N
         6yh4GcEaNY5wp8/evpaTrxOLX6TwbzdD51UH5OYKxtbp4rHrZRKCLmr8mpPjjj5KO2FO
         uqRpHtWouqYoYApp4JH8HSM/M9pnwWZYW5JWScUHYKXozmGfiSKp/+UrR0IKugEmwrov
         lj/8LFgQApSuKibR9WF8XsIvQ/Ft1v1LXKS6NwnsQ3o1v3QSwl6GMpi87kQYbepiCWaL
         CGCSG0BqbRty+uTI51nBHZjoxQyrEfzSH1XAzfU8JfBkd3DFKT3LC8NGSAUZmB3mZHIT
         1eNA==
X-Gm-Message-State: AOJu0YzKiik+eyypGvJ4TiG87D/tEynwWAAu4m4iVIuQzFPm2/VlQMxX
	lAEHci5oh1NYczqNRwi8QTzf5CPnyxGl41tNucHDnXiAWys/eSlTWoMgm2K43+N/lz2k8mGDXmc
	zGCo5niDglZk/7jBFxjQT8b8chPlWxf8c5w==
X-Gm-Gg: ATEYQzzU1OvsBtjc3aSFMfTPLt51/6REdah+5SJKwhFPc+WvcS0n9nme0HmtVUfhDUj
	F7HOJSPeUDortxoOn2kVIWdBymgvyY7I2RZ+KxcaVmYd0ZHhwHnTQZXSLM09/LUeYq7Z1YBzRsa
	knmGAlcVbSrB8xa0ZyEkPweuvLgB+zRiSicwkRm4e7/qPw0VckF8wKV2Isop8z5V334Ek7dK5Op
	hE4mWpt/pl0nvZ2ZM+5CHI+2zFWm1PMv3+Qa94GG/U9QIHtYo/wucQhgO/BtctYM3eCpFRsEHuy
	iDDlLA4z2DgZED759g==
X-Received: by 2002:a05:7301:7015:b0:2ba:7b2a:6a5f with SMTP id
 5a478bee46e88-2bdbc347a89mr76304eec.8.1771944664435; Tue, 24 Feb 2026
 06:51:04 -0800 (PST)
MIME-Version: 1.0
From: FA <feroz.afshan@gmail.com>
Date: Tue, 24 Feb 2026 20:20:51 +0530
X-Gm-Features: AaiRm52ENJ83X5KlWeOTRcFcynYTscQ-0GfcWTIuR2TAnlXeRquIe9gRDPHDt4c
Message-ID: <CA+ZN1cdtUfAf9b36tpvye9JxgsUSgm28c5C-4WZ3VzTMXMJzcA@mail.gmail.com>
Subject: Net-snmp upgrade to 5.9.5
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000491055064b9304f5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 05:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231927

--000000000000491055064b9304f5
Content-Type: text/plain; charset="UTF-8"

I would like to know if there is a plan to upgrade net-snmp to 5.9.5.

I see that we backporting all the vulnerabilities and important fixes to
5.9.4 in LTS branch (scarthgap).

As per NVD, it recommends upgrading  to 5.9.5/5.10.pre2 to address
CVE-2025-68615.

https://nvd.nist.gov/vuln/detail/CVE-2025-68615

Since vulnerable tools report, net-snmp 5.9.4 is vulnerable to
CVE-2025-68615, despite the fix is backported to 5.9.4, raises a false
alarm among users.

I think it's better we upgrade LTS branch NetSNMP to version 5.9.5.


Regards,
Feroz Ahmed

--000000000000491055064b9304f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I would like to know if there is a plan to upgrade n=
et-snmp to 5.9.5.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I see =
that we backporting all the vulnerabilities and important fixes to 5.9.4 in=
 LTS branch (scarthgap).</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>As per NVD, it recommends upgrading=C2=A0 to 5.9.5/5.10.pre2 to address CV=
E-2025-68615.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D=
"https://nvd.nist.gov/vuln/detail/CVE-2025-68615">https://nvd.nist.gov/vuln=
/detail/CVE-2025-68615</a></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Since vulnerable tools report, net-snmp 5.9.4 is vulnerable to CVE-2025-=
68615, despite the fix is backported to 5.9.4, raises a false alarm among u=
sers.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I think it&#39;s b=
etter we upgrade LTS branch NetSNMP to version 5.9.5.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><br></div><div data-smartmail=3D"gmail_signat=
ure">Regards,<br>Feroz Ahmed</div></div>

--000000000000491055064b9304f5--

