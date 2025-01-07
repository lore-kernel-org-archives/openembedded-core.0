Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6B5E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:35:07 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.16750.1736242500031534011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:35:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=Ktm4+I1S;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.48, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3862f11a13dso1825905f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 01:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1736242498; x=1736847298; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+eUmCMg/Evfw/4qqEBesmBHvOqeQo8/7dJx8Z4zyb1s=;
        b=Ktm4+I1SdqirqjeAJUvcEnbRlEGNkHYWhp8QMbvijW6j4xea82Px78XnAtFkFnSVqY
         Yhy/oiX92lTvFkMtnuvs+TUB7u798tfC6S9nIVm+HQzmM+z/i1o1nZwqO4HsS8qPVZ8Q
         P8udhlpLNiFjcVZfVY1/GbIydhRBQFz0FhvmYYDBAJmQG5pYLV2FSvZCeNSI7UCvqxD9
         BRA4tbHEq31DQkhqEsAIJqRiol8VDizcI40J1rAWenyv43SE0vzK7ec/CqE3DHuM+IAF
         fgXVwgIIlhpjmFjUchpyYgwYhpm8t7u2VU99zAdjEpaBpUAqhDn8JQbW6R6qSKzCr7Ts
         606g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242498; x=1736847298;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+eUmCMg/Evfw/4qqEBesmBHvOqeQo8/7dJx8Z4zyb1s=;
        b=dxpX5lwZwUVM4GeScUFnPpnTb9nHMnTx/TRabPOsxMN4ni0vRQ/SebgP0SuGYKJmg6
         +BA2e1KX+sa5PJduR2T9pFjF1/3Prht9UVSTtvkaM3i/nrAV2vYYWc5prNEwn2ZQzFBP
         Jnl5LvyadAoRnb11YO2Y6/lv0/TtZjRzNjmdFS4xElqAAEYB8G0TDu9xDd/7xhTEoWac
         gS6S+MIK3Ru7gNRVnPpxgvpNCAVu7el640MOZGbu13xuJp0dlx7LhKqeSeHXL1yh4+Kp
         EK//y1Kn8HwClZg+ygio6os6Z/uRXT7cBDC8pFpE9faou3tLDkyuwp3BrgNL3m5ZbJGp
         iEIw==
X-Gm-Message-State: AOJu0YzdenW5cPTJfj8Pj/GjQrU3CkUKqhrhj59mWuW8UBFSPZHBiXGR
	kUS2LUbiCwJcqObVF8qRVBAzCPMlL5DCNHj5pFbyKb4fuLNhxxaottDsrBmYoABzOi/1jALUFZG
	pi4yYk/JvWcDq3mNsyhPpNfGpOA3O3Cphk5/ZbsVz7P7CgbN33ahxrIHBv1qqZYIIbFU+poQ=
X-Gm-Gg: ASbGnct6D9eNLReZEiZqWmNJSEs82NJNUz2lQk5dZpscCm4G1SQ0NPhBNImwX3/2URv
	rVUkRYkuRN9ujMrgRxS3IY8A9s4vihYmEL+px8a+MB7XR1JexmeZuynK+3w7H9z9t7cFtuxXcPc
	zrzxLUNsPu+/T/cyljdEtTeaIkwrCj6MkKY06OtWL1y8ACEnnsYHkQ9i9M2nkc1agb4oriI6e7G
	vBggHvCDZFAyNyc4StwU+LkyhYOyaRuFm+jQCXE/9qM9yS8msPm8pmw+dDZ01Y=
X-Google-Smtp-Source: AGHT+IHgZGg9zqUlYbOMW0cPVzdlVkOt+hSuaRG8llHCnBqQzNlAoZgteocYa8BQ+3XMEmchbtFXjA==
X-Received: by 2002:a05:6000:1a89:b0:385:fc70:829 with SMTP id ffacd0b85a97d-38a221f7726mr21129820f8f.6.1736242498020;
        Tue, 07 Jan 2025 01:34:58 -0800 (PST)
Received: from [172.16.103.202] ([62.80.99.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a2432e587sm46094793f8f.95.2025.01.07.01.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 01:34:57 -0800 (PST)
Message-ID: <e1827189-ee59-4230-9cf4-8c33728219ff@bisdn.de>
Date: Tue, 7 Jan 2025 10:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH kirkstone 6/6] base-passwd: Add the sgx group
To: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
Cc: openembedded-core@lists.openembedded.org,
 Alex Kiernan <alex.kiernan@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20241217111229.60698-1-jonas.gorski@bisdn.de>
 <20241217111229.60698-7-jonas.gorski@bisdn.de>
 <obkmgyinjqp2pxooemqfisqsuumlmj6nulyz7sgg4re5nt5ijg@ocixo3sk3skk>
From: Jonas Gorski <jonas.gorski@bisdn.de>
Autocrypt: addr=jonas.gorski@bisdn.de; keydata=
 xjMEZxdk5BYJKwYBBAHaRw8BAQdAPu67BaIt3vpOuFNykN1bTGnMCt3SfaTAdTgdx7x3aM3N
 JEpvbmFzIEdvcnNraSA8am9uYXMuZ29yc2tpQGJpc2RuLmRlPsKPBBMWCAA3FiEEFDg1Kr+u
 iVjQpdfy5Kt7/8+fcMYFAmcXZOQFCQWjmoACGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDkq3v/
 z59wxkUZAP4uDlkfv1WhuDjPUaeL9uL33RUo4mUwIYQLAR8gKQk5lgEAiQvKbFvrB2Zz8Tbs
 anWvhWddIu1L9D4KMdoayMpCqQrOOARnF2TkEgorBgEEAZdVAQUBAQdAQSvRRbcsAY5GLbFn
 qnD2JZ3hGcjOviBjgQpPQV48MSMDAQgHwn4EGBYIACYWIQQUODUqv66JWNCl1/Lkq3v/z59w
 xgUCZxdk5AUJBaOagAIbDAAKCRDkq3v/z59wxuVgAP9D6DwrhASXLN8c5uy/BYuaMznIfqf5
 6R95DltdAG2xigD/TCGATSNdLFd253kU+qiZPLWwcqNouB2cTa1ItM1N/AU=
In-Reply-To: <obkmgyinjqp2pxooemqfisqsuumlmj6nulyz7sgg4re5nt5ijg@ocixo3sk3skk>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:35:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209449

Hi J=C3=B6rg,

sorry for the late response, I was on vacation.

On 02.01.25 22:14, J=C3=B6rg Sommer wrote:
> Jonas Gorski via lists.openembedded.org schrieb am Di 17. Dez, 12:12 (+01=
00):
>> From: Alex Kiernan <alex.kiernan@gmail.com>
>>
>> To avoid errors from eudev/udev we need an sgx group, but if we add it
>> via groupadd that causes shadow login to be brought into an image,
>=20
> Does this work for useradd-staticids.bbclass? I still have to provide an
> entry for sgx in my group list:
>=20
> ERROR: Nothing RPROVIDES 'systemd-analyze' (but /build/../repo/meta-distr=
o/recipes-core/images/image.bb, /build/../repo/meta-distro/recipes-core/sys=
-tools/sys-tools_10.0.bb RDEPENDS on or otherwise requires it)
> systemd RPROVIDES systemd-analyze but was skipped: Recipe systemd, packag=
e udev: system groupname "sgx" does not have a static ID defined. Add sgx t=
o one of these files: /build/../repo/meta-distro/files/groups
> ERROR: Required build target image' has no buildable providers.

AFAIU, useradd-staticids does not currently have any insight in the=20
base-passwd provided groups and users or vice versa, so you will still=20
need to define them in your files/users and files/groups (with identical=20
UID/GID).

Best Regards,
Jonas

--=20
BISDN GmbH
K=C3=B6rnerstra=C3=9Fe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=C2=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=C3=B6psel


Commercial register:=C2=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=C2=A0DE283257294


