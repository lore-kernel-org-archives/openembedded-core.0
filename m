Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E79AE77188
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 12:17:53 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.34810.1736684267911165125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 04:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VRmY7b7N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4368a293339so39559825e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 04:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736684266; x=1737289066; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6l6yo3hYbg4ML+zR4If0Av8zW5NbeV3yla2udS/hO4=;
        b=VRmY7b7Nl8syBuxXQpxAElYoNoeuFjQDSS1Uo8aYXzoLs0WEffjCygKz1fdTYhf/fj
         85+i9K21hZc206ervcxKeDtdQiDZ20J/JvRx+KOG7fOaw6OuRCAm4cL33Sm1E8roOQaO
         4GW//EVA6nrs7LYLvPVKZsl2sDoiYFZfduc7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736684266; x=1737289066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N6l6yo3hYbg4ML+zR4If0Av8zW5NbeV3yla2udS/hO4=;
        b=f+C/WdUh4TlJ8dRDWFv/dNKgin08/6L1jm0N857JBanT+MoqFfve/wiVGJHxtiuSRQ
         50zYEyxZO+Zg+HVmbSORgjf3e5TcOiitb/U7afOGALPIyeoKxPV3jI0U8yPgRdin/XrK
         jh43YfCgpHrKOY+0IMEZ8Qx37c0kbV2I/dgFsklYcN0DYMMrwOWhcrg6igRngLrgUF9W
         n4kIq2HS34rDc1rUzHxoMcmMJTNPzWrdRBqYm405L05tAD4e6S39NIwXm6BiqhzXPYvD
         Q2Qz2JaCtMJsLLfycH1T3zdw4IMM4ZkYry5vG9U6b42j3IsPuCpeqthSP5Y4NaTYOq6L
         B70Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsqgGwSgSBZPF8/ac2oQTonTYN1Xp1h+UGc+uFyTB1AW3vhadl2yk0Aa2WUgC5jBbtj3Y1oRUSrtOxQLuNRshhIA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzd2uSh6vCrsQqoQNkeBCudjFSqhzovi5VjXPn+l0O9Y8SpyrZN
	g2xqXcjuG6AFkxY4vSpDy7Hq7GFx6ROsPpzgNjh9J9BeFhVfNQKlmC7ykE8Ojek=
X-Gm-Gg: ASbGncu8N2FvcPKWWA8qJZBf3iHmdZlLvBgunWsUicpuV7w/YOLb2YxCZi3HeB/REEM
	TGNLQ+LoXRSDoELsgZn1x1/o0YNk55/ZsgygEOFGFKmUzXlMKjFBMhliQvuuexxVg6aiopqst9d
	56VjRNyHZ+K0yA6NvwTaZVMe1MnzRh+MwiElNRCEQluA+wTr+eRzbhtGHvGUnkvY/x+gsgcxxNZ
	5R4PNiD9LJ7LHGetqCZRwbidnKamdLykLV0Y2SXSo+uLnDD8xcKMByXbRBof4NmDzth48YQMEOn
	j9s4w9WjUEwGdTsMLoaHXuZQMjKtOevElFWQm2kvlxr9Tw==
X-Google-Smtp-Source: AGHT+IFiGI0YBXTCvL0wICYPh4AzyR4SvltJLWJQnY1Ksi9VZNJRb+2J6CoOYMoCz6p4aeJHbO/Fmg==
X-Received: by 2002:a05:6000:4020:b0:385:e3c1:50d5 with SMTP id ffacd0b85a97d-38a87338fa8mr17147463f8f.48.1736684266240;
        Sun, 12 Jan 2025 04:17:46 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6dec:1ecd:2f8f:23f3? ([2001:8b0:aba:5f3c:6dec:1ecd:2f8f:23f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c990sm9591136f8f.56.2025.01.12.04.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 04:17:44 -0800 (PST)
Message-ID: <d980189b3ffdedb68e0a13b78dd836318a20bde4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: colinmca242@gmail.com, openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2025 12:17:42 +0000
In-Reply-To: <20241230192224.113886-2-colinmca242@gmail.com>
References: <20241230192224.113886-1-colinmca242@gmail.com>
	 <20241230192224.113886-2-colinmca242@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 12:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209679

On Mon, 2024-12-30 at 19:22 +0000, Colin McAllister via lists.openembedded.=
org wrote:
> The cve_check functionality to parse CVE IDs from the patch filename and
> patch contents have been reworked to improve parsing and also utilize
> tests. This ensures that the parsing works as intended.
>=20
> Additionally, the new patched_cves dict has a few issues I tried to fix
> as well. If multiple patch files exist for a single CVE ID, only the
> last one will show up with the "resource" key. The value for the
> "resource" key has been updated to hold a list and return all patch
> files associated with a given CVE ID. Also, at the end of
> get_patch_cves, CVE_STATUS can overwrite an existing entry in the dict.
> This could cause an issue, for example, if a CVE has been addressed via
> a patch, but a CVE_STATUS line also exists that ignores the given CVE
> ID. A warning has been added if this ever happens.
>=20
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> ---
>=20
> I noticed that there are some patches, especially in older verisons of
> Yocto, where the "CVE: " tag was used with multiple CVE IDs in different
> formats, like "CVE-YYYY-XXXX & CVE-YYYY-XXXX" or
> "CVE-YYYY-XXXX, CVE-YYYY-XXXX". Currently, only space-delimited CVE
> IDs will be parsed, but documentation doesn't indicate that is the only
> supported format. I figured it'd be nice to update the code to be able
> to support multiple formats, that way this patch could be backported to
> fix those patches. I also wanted to add unit tests to ensure the patch
> parsing behavior is preserved.
>=20
> I'd also like to update the patch filename parsing to parse multiple CVE
> IDs from the filename, but based on the comments, it seems like there
> was a reason why only the last CVE ID is extracted from the filename.
> I'd be happy to submit a V2 patch or an additional patch to update the
> function if that sounds good for the maintainers.

I think this resulted in a few issues. The weekly CVE report gained 32
new entries this week and many of them are clearly patched.

New this week: 32 CVEs
CVE-2014-8139 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2014-8139 *
CVE-2014-8140 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2014-8140 *
CVE-2014-8141 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2014-8141 *
CVE-2014-9636 (CVSS3: N/A): unzip:unzip-native https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2014-9636 *
CVE-2014-9913 (CVSS3: 4.0 MEDIUM): unzip:unzip-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2014-9913 *
CVE-2015-7696 (CVSS3: N/A): unzip:unzip-native https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2015-7696 *
CVE-2015-7697 (CVSS3: N/A): unzip:unzip-native https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2015-7697 *
CVE-2016-9844 (CVSS3: 4.0 MEDIUM): unzip:unzip-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2016-9844 *
CVE-2018-1000035 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2018-1000035 *
CVE-2018-1000156 (CVSS3: 7.8 HIGH): patch:patch-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2018-1000156 *
CVE-2018-10195 (CVSS3: 7.1 HIGH): lrzsz https://web.nvd.nist.gov/view/vuln/=
detail?vulnId=3DCVE-2018-10195 *
CVE-2018-18384 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2018-18384 *
CVE-2018-20969 (CVSS3: 7.8 HIGH): patch:patch-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2018-20969 *
CVE-2018-6951 (CVSS3: 7.5 HIGH): patch:patch-native https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2018-6951 *
CVE-2018-6952 (CVSS3: 7.5 HIGH): patch:patch-native https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2018-6952 *
CVE-2019-13232 (CVSS3: 3.3 LOW): unzip:unzip-native https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2019-13232 *
CVE-2019-13636 (CVSS3: 5.9 MEDIUM): patch:patch-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2019-13636 *
CVE-2019-13638 (CVSS3: 7.8 HIGH): patch:patch-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2019-13638 *
CVE-2019-20633 (CVSS3: 5.5 MEDIUM): patch:patch-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2019-20633 *
CVE-2020-27748 (CVSS3: 6.5 MEDIUM): xdg-utils https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2020-27748 *
CVE-2021-3468 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln=
/detail?vulnId=3DCVE-2021-3468 *
CVE-2021-4217 (CVSS3: 3.3 LOW): unzip:unzip-native https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2021-4217 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2022-0530 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2022-33065 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2022-4055 *
CVE-2023-38469 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-38469 *
CVE-2023-38470 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-38470 *
CVE-2023-38471 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-38471 *
CVE-2023-38472 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-38472 *
CVE-2023-38473 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-38473 *
CVE-2024-50612 (CVSS3: 5.5 MEDIUM): libsndfile1 https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50612 *

meta/recipes-extended/unzip/unzip has:

0001-unzip-fix-CVE-2018-1000035.patch
09-cve-2014-8139-crc-overflow.patch
10-cve-2014-8140-test-compr-eb.patch
11-cve-2014-8141-getzip64data.patch
18-cve-2014-9913-unzip-buffer-overflow.patch
19-cve-2016-9844-zipinfo-buffer-overflow.patch
cve-2014-9636.patch
CVE-2015-7696.patch
CVE-2015-7697.patch
CVE-2018-18384.patch
CVE-2019-13232_p1.patch
CVE-2019-13232_p2.patch
CVE-2019-13232_p3.patch
CVE-2021-4217.patch
CVE-2022-0529.patch
CVE-2022-0530.patch

which cover some of the above.

Cheers,

Richard

