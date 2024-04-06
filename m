Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B4BC67861
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 10:15:08 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.13437.1712398502244038598
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Apr 2024 03:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GD+5R6Hq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4155819f710so22369945e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 03:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1712398500; x=1713003300; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQl4WIAgWlnRcrgtmbZCb7enESAUR0iJLWGrOCrkiZY=;
        b=GD+5R6Hq4/KHGPd4LStGpImajYfbultacZs+PIyasB/ytizIcMJ8YeK4RVduYb4Cwe
         pOkfwh4Pby+H/FpJvUJIc1dF7yKZDWAsIUa4DDdvlZMLYA6FvL8vXvcyjuwd3Ms0TXmg
         e/R0TAfsjanyFGoYi0a/uGaVkp0keENSNmrUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712398500; x=1713003300;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQl4WIAgWlnRcrgtmbZCb7enESAUR0iJLWGrOCrkiZY=;
        b=HQ02XmRY0IQErD0AEljQJKnsR/cc6TYDcg4hIJyG+bXWKVmuiVBJ4OVhan3KnGAqRq
         /6C4fhrlymFU0ksaapTxJrO6ocLuTE1gmFdKVN/U/26pNrefp/XJMYk1M9bXXcV51zQD
         CBXZl03ZDKbIxNsJgp2jhEvgdV0x2taiOkgwMiqi/qCZrFMxpQRtKQVqHre7h7cr4zQi
         fYLBuh6NMK8n/59ryaGAbrcTLhkpDvnK/Kbhr+J4DSZLUn2kvMBtkCsAZtl2BbYv00TE
         v4CS4lbWFvWbOtGGkM8rBXEH8LEE9nRId96onlK8CqShzaPn3L6VWJP4KlGESjl+gdOW
         LglA==
X-Forwarded-Encrypted: i=1; AJvYcCVAGQZr7Hi7s3z6ccpETDzrrGLZhM0plhd3z04F/yT+J6HnNHVrsm1LgZrUVyGPORSDaIbyaFfPWy9vpAazBHIHM+kP+daxrffnHb4mLu6/i/4IdKypO4tW
X-Gm-Message-State: AOJu0YzCDD20RTuDK8W0lJK/TJrmGaLy0jOFi2QjSXe1leUlvVgk1MlW
	xGJbzRezfD/KXp3KjJhlDP+UDJupXIHTTLyAcWJ8ZpPDCJEyqq7BVD6aGIrVTUdyXgCfbbyhQxs
	m
X-Google-Smtp-Source: AGHT+IEVl8iLBiVuGgK64LT4N63o6YItEuEEPX9cFowqqZBUFefldcsN66EefKILPCpbJ1tHmVqcLA==
X-Received: by 2002:a05:600c:350b:b0:415:45ee:7929 with SMTP id h11-20020a05600c350b00b0041545ee7929mr3146026wmq.23.1712398500270;
        Sat, 06 Apr 2024 03:15:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:96d:7f6f:d551:3ae9? ([2001:8b0:aba:5f3c:96d:7f6f:d551:3ae9])
        by smtp.gmail.com with ESMTPSA id dx18-20020a0560000e1200b00343d840b3f8sm4121857wrb.33.2024.04.06.03.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 03:14:59 -0700 (PDT)
Message-ID: <d8b24e684942979c7310fbd3f81d01561a45714f.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 31 Mar
 2024 01:00:01 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Sat, 06 Apr 2024 11:14:58 +0100
In-Reply-To: <20240331111857.4603F1068D9@builder.sakoman.com>
References: <20240331111857.4603F1068D9@builder.sakoman.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 10:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197992

On Sun, 2024-03-31 at 02:18 -1000, Steve Sakoman wrote:
> Branch: master
>=20
> New this week: 0 CVEs

I've been experimenting with looking directly at the cve data rather
than using the data from NVD.=C2=A0My hack only looks at the entries where
the NVD doesn't have any data and in that case looks directly at the
CVE data upstream.

I think I've spotted the following issues:

WARNING: nghttp2-1.60.0-r0 do_cve_check: Match for CVE-2024-28182
WARNING: nghttp2-1.60.0-r0 do_cve_check: {'vendor': 'nghttp2', 'product': '=
nghttp2', 'versions': [{'version': '< 1.61.0', 'status': 'affected'}]}

WARNING: libyaml-0.2.5-r0 do_cve_check: Match for CVE-2024-3205
WARNING: libyaml-0.2.5-r0 do_cve_check: {'vendor': 'yaml', 'product': 'liby=
aml', 'versions': [{'version': '0.2.0', 'status': 'affected'}, {'version': =
'0.2.1', 'status': 'affected'}, {'version': '0.2.2', 'status': 'affected'},=
 {'version': '0.2.3', 'status': 'affected'}, {'version': '0.2.4', 'status':=
 'affected'}, {'version': '0.2.5', 'status': 'affected'}]}

WARNING: curl-8.6.0-r0 do_cve_check: Match for CVE-2024-2004
WARNING: curl-8.6.0-r0 do_cve_check: {'vendor': 'curl', 'product': 'curl', =
'versions': [{'version': '8.6.0', 'status': 'affected', 'lessThanOrEqual': =
'8.6.0', 'versionType': 'semver'}, {'version': '8.5.0', 'status': 'affected=
', 'lessThanOrEqual': '8.5.0', 'versionType': 'semver'}, {'version': '8.4.0=
', 'status': 'affected', 'lessThanOrEqual': '8.4.0', 'versionType': 'semver=
'}, {'version': '8.3.0', 'status': 'affected', 'lessThanOrEqual': '8.3.0', =
'versionType': 'semver'}, {'version': '8.2.1', 'status': 'affected', 'lessT=
hanOrEqual': '8.2.1', 'versionType': 'semver'}, {'version': '8.2.0', 'statu=
s': 'affected', 'lessThanOrEqual': '8.2.0', 'versionType': 'semver'}, {'ver=
sion': '8.1.2', 'status': 'affected', 'lessThanOrEqual': '8.1.2', 'versionT=
ype': 'semver'}, {'version': '8.1.1', 'status': 'affected', 'lessThanOrEqua=
l': '8.1.1', 'versionType': 'semver'}, {'version': '8.1.0', 'status': 'affe=
cted', 'lessThanOrEqual': '8.1.0', 'versionType': 'semver'}, {'version': '8=
.0.1', 'status': 'affected', 'lessThanOrEqual': '8.0.1', 'versionType': 'se=
mver'}, {'version': '8.0.0', 'status': 'affected', 'lessThanOrEqual': '8.0.=
0', 'versionType': 'semver'}, {'version': '7.88.1', 'status': 'affected', '=
lessThanOrEqual': '7.88.1', 'versionType': 'semver'}, {'version': '7.88.0',=
 'status': 'affected', 'lessThanOrEqual': '7.88.0', 'versionType': 'semver'=
}, {'version': '7.87.0', 'status': 'affected', 'lessThanOrEqual': '7.87.0',=
 'versionType': 'semver'}, {'version': '7.86.0', 'status': 'affected', 'les=
sThanOrEqual': '7.86.0', 'versionType': 'semver'}, {'version': '7.85.0', 's=
tatus': 'affected', 'lessThanOrEqual': '7.85.0', 'versionType': 'semver'}],=
 'defaultStatus': 'unaffected'}
WARNING: curl-8.6.0-r0 do_cve_check: Match for CVE-2024-2379
WARNING: curl-8.6.0-r0 do_cve_check: {'vendor': 'curl', 'product': 'curl', =
'versions': [{'version': '8.6.0', 'status': 'affected', 'lessThanOrEqual': =
'8.6.0', 'versionType': 'semver'}], 'defaultStatus': 'unaffected'}
WARNING: curl-8.6.0-r0 do_cve_check: Match for CVE-2024-2398
WARNING: curl-8.6.0-r0 do_cve_check: {'vendor': 'curl', 'product': 'curl', =
'versions': [{'version': '8.6.0', 'status': 'affected', 'lessThanOrEqual': =
'8.6.0', 'versionType': 'semver'}, {'version': '8.5.0', 'status': 'affected=
', 'lessThanOrEqual': '8.5.0', 'versionType': 'semver'}, {'version': '8.4.0=
', 'status': 'affected', 'lessThanOrEqual': '8.4.0', 'versionType': 'semver=
'}, {'version': '8.3.0', 'status': 'affected', 'lessThanOrEqual': '8.3.0', =
'versionType': 'semver'}, {'version': '8.2.1', 'status': 'affected', 'lessT=
hanOrEqual': '8.2.1', 'versionType': 'semver'}, {'version': '8.2.0', 'statu=
s': 'affected', 'lessThanOrEqual': '8.2.0', 'versionType': 'semver'}, {'ver=
sion': '8.1.2', 'status': 'affected', 'lessThanOrEqual': '8.1.2', 'versionT=
ype': 'semver'}, {'version': '8.1.1', 'status': 'affected', 'lessThanOrEqua=
l': '8.1.1', 'versionType': 'semver'}, {'version': '8.1.0', 'status': 'affe=
cted', 'lessThanOrEqual': '8.1.0', 'versionType': 'semver'}, {'version': '8=
.0.1', 'status': 'affected', 'lessThanOrEqual': '8.0.1', 'versionType': 'se=
mver'}, {'version': '8.0.0', 'status': 'affected', 'lessThanOrEqual': '8.0.=
0', 'versionType': 'semver'}, {'version': '7.88.1', 'status': 'affected', '=
lessThanOrEqual': '7.88.1', 'versionType': 'semver'}, {'version': '7.88.0',=
 'status': 'affected', 'lessThanOrEqual': '7.88.0', 'versionType': 'semver'=
}, {'version': '7.87.0', 'status': 'affected', 'lessThanOrEqual': '7.87.0',=
 'versionType': 'semver'}, {'version': '7.86.0', 'status': 'affected', 'les=
sThanOrEqual': '7.86.0', 'versionType': 'semver'}, {'version': '7.85.0', 's=
tatus': 'affected', 'lessThanOrEqual': '7.85.0', 'versionType': 'semver'}, =
{'version': '7.84.0', 'status': 'affected', 'lessThanOrEqual': '7.84.0', 'v=
ersionType': 'semver'}, {'version': '7.83.1', 'status': 'affected', 'lessTh=
anOrEqual': '7.83.1', 'versionType': 'semver'}, {'version': '7.83.0', 'stat=
us': 'affected', 'lessThanOrEqual': '7.83.0', 'versionType': 'semver'}, {'v=
ersion': '7.82.0', 'status': 'affected', 'lessThanOrEqual': '7.82.0', 'vers=
ionType': 'semver'}, {'version': '7.81.0', 'status': 'affected', 'lessThanO=
rEqual': '7.81.0', 'versionType': 'semver'}, {'version': '7.80.0', 'status'=
: 'affected', 'lessThanOrEqual': '7.80.0', 'versionType': 'semver'}, {'vers=
ion': '7.79.1', 'status': 'affected', 'lessThanOrEqual': '7.79.1', 'version=
Type': 'semver'}, {'version': '7.79.0', 'status': 'affected', 'lessThanOrEq=
ual': '7.79.0', 'versionType': 'semver'}, {'version': '7.78.0', 'status': '=
affected', 'lessThanOrEqual': '7.78.0', 'versionType': 'semver'}, {'version=
': '7.77.0', 'status': 'affected', 'lessThanOrEqual': '7.77.0', 'versionTyp=
e': 'semver'}, {'version': '7.76.1', 'status': 'affected', 'lessThanOrEqual=
': '7.76.1', 'versionType': 'semver'}, {'version': '7.76.0', 'status': 'aff=
ected', 'lessThanOrEqual': '7.76.0', 'versionType': 'semver'}, {'version': =
'7.75.0', 'status': 'affected', 'lessThanOrEqual': '7.75.0', 'versionType':=
 'semver'}, {'version': '7.74.0', 'status': 'affected', 'lessThanOrEqual': =
'7.74.0', 'versionType': 'semver'}, {'version': '7.73.0', 'status': 'affect=
ed', 'lessThanOrEqual': '7.73.0', 'versionType': 'semver'}, {'version': '7.=
72.0', 'status': 'affected', 'lessThanOrEqual': '7.72.0', 'versionType': 's=
emver'}, {'version': '7.71.1', 'status': 'affected', 'lessThanOrEqual': '7.=
71.1', 'versionType': 'semver'}, {'version': '7.71.0', 'status': 'affected'=
, 'lessThanOrEqual': '7.71.0', 'versionType': 'semver'}, {'version': '7.70.=
0', 'status': 'affected', 'lessThanOrEqual': '7.70.0', 'versionType': 'semv=
er'}, {'version': '7.69.1', 'status': 'affected', 'lessThanOrEqual': '7.69.=
1', 'versionType': 'semver'}, {'version': '7.69.0', 'status': 'affected', '=
lessThanOrEqual': '7.69.0', 'versionType': 'semver'}, {'version': '7.68.0',=
 'status': 'affected', 'lessThanOrEqual': '7.68.0', 'versionType': 'semver'=
}, {'version': '7.67.0', 'status': 'affected', 'lessThanOrEqual': '7.67.0',=
 'versionType': 'semver'}, {'version': '7.66.0', 'status': 'affected', 'les=
sThanOrEqual': '7.66.0', 'versionType': 'semver'}, {'version': '7.65.3', 's=
tatus': 'affected', 'lessThanOrEqual': '7.65.3', 'versionType': 'semver'}, =
{'version': '7.65.2', 'status': 'affected', 'lessThanOrEqual': '7.65.2', 'v=
ersionType': 'semver'}, {'version': '7.65.1', 'status': 'affected', 'lessTh=
anOrEqual': '7.65.1', 'versionType': 'semver'}, {'version': '7.65.0', 'stat=
us': 'affected', 'lessThanOrEqual': '7.65.0', 'versionType': 'semver'}, {'v=
ersion': '7.64.1', 'status': 'affected', 'lessThanOrEqual': '7.64.1', 'vers=
ionType': 'semver'}, {'version': '7.64.0', 'status': 'affected', 'lessThanO=
rEqual': '7.64.0', 'versionType': 'semver'}, {'version': '7.63.0', 'status'=
: 'affected', 'lessThanOrEqual': '7.63.0', 'versionType': 'semver'}, {'vers=
ion': '7.62.0', 'status': 'affected', 'lessThanOrEqual': '7.62.0', 'version=
Type': 'semver'}, {'version': '7.61.1', 'status': 'affected', 'lessThanOrEq=
ual': '7.61.1', 'versionType': 'semver'}, {'version': '7.61.0', 'status': '=
affected', 'lessThanOrEqual': '7.61.0', 'versionType': 'semver'}, {'version=
': '7.60.0', 'status': 'affected', 'lessThanOrEqual': '7.60.0', 'versionTyp=
e': 'semver'}, {'version': '7.59.0', 'status': 'affected', 'lessThanOrEqual=
': '7.59.0', 'versionType': 'semver'}, {'version': '7.58.0', 'status': 'aff=
ected', 'lessThanOrEqual': '7.58.0', 'versionType': 'semver'}, {'version': =
'7.57.0', 'status': 'affected', 'lessThanOrEqual': '7.57.0', 'versionType':=
 'semver'}, {'version': '7.56.1', 'status': 'affected', 'lessThanOrEqual': =
'7.56.1', 'versionType': 'semver'}, {'version': '7.56.0', 'status': 'affect=
ed', 'lessThanOrEqual': '7.56.0', 'versionType': 'semver'}, {'version': '7.=
55.1', 'status': 'affected', 'lessThanOrEqual': '7.55.1', 'versionType': 's=
emver'}, {'version': '7.55.0', 'status': 'affected', 'lessThanOrEqual': '7.=
55.0', 'versionType': 'semver'}, {'version': '7.54.1', 'status': 'affected'=
, 'lessThanOrEqual': '7.54.1', 'versionType': 'semver'}, {'version': '7.54.=
0', 'status': 'affected', 'lessThanOrEqual': '7.54.0', 'versionType': 'semv=
er'}, {'version': '7.53.1', 'status': 'affected', 'lessThanOrEqual': '7.53.=
1', 'versionType': 'semver'}, {'version': '7.53.0', 'status': 'affected', '=
lessThanOrEqual': '7.53.0', 'versionType': 'semver'}, {'version': '7.52.1',=
 'status': 'affected', 'lessThanOrEqual': '7.52.1', 'versionType': 'semver'=
}, {'version': '7.52.0', 'status': 'affected', 'lessThanOrEqual': '7.52.0',=
 'versionType': 'semver'}, {'version': '7.51.0', 'status': 'affected', 'les=
sThanOrEqual': '7.51.0', 'versionType': 'semver'}, {'version': '7.50.3', 's=
tatus': 'affected', 'lessThanOrEqual': '7.50.3', 'versionType': 'semver'}, =
{'version': '7.50.2', 'status': 'affected', 'lessThanOrEqual': '7.50.2', 'v=
ersionType': 'semver'}, {'version': '7.50.1', 'status': 'affected', 'lessTh=
anOrEqual': '7.50.1', 'versionType': 'semver'}, {'version': '7.50.0', 'stat=
us': 'affected', 'lessThanOrEqual': '7.50.0', 'versionType': 'semver'}, {'v=
ersion': '7.49.1', 'status': 'affected', 'lessThanOrEqual': '7.49.1', 'vers=
ionType': 'semver'}, {'version': '7.49.0', 'status': 'affected', 'lessThanO=
rEqual': '7.49.0', 'versionType': 'semver'}, {'version': '7.48.0', 'status'=
: 'affected', 'lessThanOrEqual': '7.48.0', 'versionType': 'semver'}, {'vers=
ion': '7.47.1', 'status': 'affected', 'lessThanOrEqual': '7.47.1', 'version=
Type': 'semver'}, {'version': '7.47.0', 'status': 'affected', 'lessThanOrEq=
ual': '7.47.0', 'versionType': 'semver'}, {'version': '7.46.0', 'status': '=
affected', 'lessThanOrEqual': '7.46.0', 'versionType': 'semver'}, {'version=
': '7.45.0', 'status': 'affected', 'lessThanOrEqual': '7.45.0', 'versionTyp=
e': 'semver'}, {'version': '7.44.0', 'status': 'affected', 'lessThanOrEqual=
': '7.44.0', 'versionType': 'semver'}], 'defaultStatus': 'unaffected'}
WARNING: curl-8.6.0-r0 do_cve_check: Match for CVE-2024-2466
WARNING: curl-8.6.0-r0 do_cve_check: {'vendor': 'curl', 'product': 'curl', =
'versions': [{'version': '8.6.0', 'status': 'affected', 'lessThanOrEqual': =
'8.6.0', 'versionType': 'semver'}, {'version': '8.5.0', 'status': 'affected=
', 'lessThanOrEqual': '8.5.0', 'versionType': 'semver'}], 'defaultStatus': =
'unaffected'}

so three things we should look at upgrading, libyaml, curl and nghttp2
(as mentioned by Marta recently).

The ones it flagged where we don't have issues were:

WARNING: python3-cryptography-42.0.5-r0 do_cve_check: Match for CVE-2024-26=
130
WARNING: python3-cryptography-42.0.5-r0 do_cve_check: {'vendor': 'pyca', 'p=
roduct': 'cryptography', 'versions': [{'version': '>=3D 38.0.0, < 42.0.4', =
'status': 'affected'}]}
WARNING: xwayland-23.2.4-r0 do_cve_check: Match for CVE-2024-0229
WARNING: xwayland-23.2.4-r0 do_cve_check: {'product': 'xwayland', 'vendor':=
 'n/a', 'versions': [{'version': '23.2.4', 'status': 'unaffected'}]}
WARNING: xwayland-23.2.4-r0 do_cve_check: Match for CVE-2024-21885
WARNING: xwayland-23.2.4-r0 do_cve_check: {'product': 'xwayland', 'vendor':=
 'n/a', 'versions': [{'version': '23.2.4', 'status': 'unaffected'}]}
WARNING: xwayland-23.2.4-r0 do_cve_check: Match for CVE-2024-21886
WARNING: xwayland-23.2.4-r0 do_cve_check: {'product': 'xwayland', 'vendor':=
 'n/a', 'versions': [{'version': '23.2.4', 'status': 'unaffected'}]}
WARNING: xwayland-23.2.4-r0 do_cve_check: Match for CVE-2024-31080
WARNING: xwayland-23.2.4-r0 do_cve_check: {'product': 'xwayland', 'vendor':=
 'n/a', 'versions': [{'version': '23.2.5', 'status': 'unaffected'}]}
WARNING: xwayland-23.2.4-r0 do_cve_check: Match for CVE-2024-31081
WARNING: xwayland-23.2.4-r0 do_cve_check: {'product': 'xwayland', 'vendor':=
 'n/a', 'versions': [{'version': '23.2.5', 'status': 'unaffected'}]}
WARNING: xwayland-23.2.4-r0 do_cve_check: Match for CVE-2024-31083
WARNING: xwayland-23.2.4-r0 do_cve_check: {'product': 'xwayland', 'vendor':=
 'n/a', 'versions': [{'version': '23.2.5', 'status': 'unaffected'}]}
WARNING: gnutls-3.8.4-r0 do_cve_check: Match for CVE-2024-28834
WARNING: gnutls-3.8.4-r0 do_cve_check: {'product': 'gnutls', 'vendor': 'n/a=
', 'versions': [{'version': '3.8.4', 'status': 'unaffected'}]}
WARNING: gnutls-3.8.4-r0 do_cve_check: Match for CVE-2024-28835
WARNING: gnutls-3.8.4-r0 do_cve_check: {'product': 'gnutls', 'vendor': 'n/a=
', 'versions': [{'version': '3.8.4', 'status': 'unaffected'}]}
WARNING: python3-3.12.2-r0 do_cve_check: Match for CVE-2023-6597
WARNING: python3-3.12.2-r0 do_cve_check: {'defaultStatus': 'unaffected', 'p=
roduct': 'CPython', 'repo': 'https://github.com/python/cpython', 'vendor': =
'Python Software Foundation', 'versions': [{'lessThanOrEqual': '3.12.1', 's=
tatus': 'affected', 'version': '3.12.0', 'versionType': 'python'}, {'lessTh=
anOrEqual': '3.11.7', 'status': 'affected', 'version': '3.11.0', 'versionTy=
pe': 'python'}, {'lessThanOrEqual': '3.10.13', 'status': 'affected', 'versi=
on': '3.10.0', 'versionType': 'python'}, {'lessThanOrEqual': '3.9.18', 'sta=
tus': 'affected', 'version': '3.9.0', 'versionType': 'python'}, {'lessThanO=
rEqual': '3.8.18', 'status': 'affected', 'version': '0', 'versionType': 'py=
thon'}]}
WARNING: python3-3.12.2-r0 do_cve_check: Match for CVE-2024-0450
WARNING: python3-3.12.2-r0 do_cve_check: {'defaultStatus': 'unaffected', 'p=
roduct': 'CPython', 'repo': 'https://github.com/python/cpython', 'vendor': =
'Python Software Foundation', 'versions': [{'lessThanOrEqual': '3.12.1', 's=
tatus': 'affected', 'version': '3.12.0', 'versionType': 'python'}, {'lessTh=
anOrEqual': '3.11.7', 'status': 'affected', 'version': '3.11.0', 'versionTy=
pe': 'python'}, {'lessThanOrEqual': '3.10.13', 'status': 'affected', 'versi=
on': '3.10.0', 'versionType': 'python'}, {'lessThanOrEqual': '3.9.18', 'sta=
tus': 'affected', 'version': '3.9.0', 'versionType': 'python'}, {'lessThanO=
rEqual': '3.8.18', 'status': 'affected', 'version': '0', 'versionType': 'py=
thon'}]}

This is far from complete and there are probably a ton of cases I could
map components but even finding three issues is a start.

Cheers,

Richard


