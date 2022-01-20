Return-Path: <rudolf.streif@ibeeto.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A023C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 01:01:18 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.5530.1642640477336742597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 17:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibeeto-com.20210112.gappssmtp.com header.s=20210112
 header.b=M7T9DitW;
 spf=neutral (domain: ibeeto.com, ip: 209.85.214.179,
 mailfrom: rudolf.streif@ibeeto.com)
Received: by mail-pl1-f179.google.com with SMTP id u11so3789858plh.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 17:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ibeeto-com.20210112.gappssmtp.com; s=20210112;
        h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=7IB8ERElYcg4/Vr702NgjOm/zNx+ryl+xFjUaFsznCQ=;
        b=M7T9DitWcsjiyFO5/cbk6ips6GW36UcaK3rmNsjiEcDArUuBMzxfSBmgG487C+PWtF
         bakLPS3gJc921xoM4hVpGPg7S2tFkeAnIyp9lsmqp737dmnxe2w++hcPTUuxROSyZAJ/
         vTG0pOE9aNA1seELLAxX4weIaK8mlzC30ql8Q7q+ZcU6ykB6QPRGrn1FdTkhg1MU7cod
         /Z0SB5gWytGjo9uqSqw7hCpWU9FXvWt5B0/eeeBrjxvk7W/SSSjd5/86nWfES/CaIvfS
         tyiBK71BUo6rX0assbuxEXNbOJYju098FW21uP/7PWtIhCESrOa5IFdeiqAiN8CI43XC
         eoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=7IB8ERElYcg4/Vr702NgjOm/zNx+ryl+xFjUaFsznCQ=;
        b=IRPoZ9wtozaVmzuZi3S3M36nB+tSL8ZrCgclwUz4j9OOkf6bQEOzcq53AHZ65x9BRc
         B/k4rz0wQJszpzx4YGtL3wnXaEKVH+PF1QZTRvPmVVqsuTsjYy67OYWSYDN2nffcHUq9
         fkvikm+aee66t7/ZisXFjtHu7YINCx8mS+E0d8mLZpFtEv0GdTqmciIESWSI2nOQC3kl
         2zZQjafkZWrhM7ORX7u1QNkYHG1pCbkigGHR6cnmhaicvtg3i/TyJA7kjK9n0oLquRbL
         3NhhycIa+wqY7MJ6KIejj5/6kneQnPBoMy+610UcZu8BZfJ1fEETL4C6ebo4qIWOJI6Q
         3cwQ==
X-Gm-Message-State: AOAM530EX+bW4NpI6GVsFoWPGzLBscDMmU2oH2QT1nPoVSInDCuiin7R
	o/TwHl1mx6CwbNz2pvfGTnH3D1tLUrKyNg==
X-Google-Smtp-Source: 
 ABdhPJwoFvmXeTg8X94/Wvj81aCA8e06b79TvRVxPivZSC8hG4thhsTnCvLIc2tmcB6agInmevFtGQ==
X-Received: by 2002:a17:902:b70a:b0:149:9840:3fa1 with SMTP id
 d10-20020a170902b70a00b0014998403fa1mr35038889pls.74.1642640475952;
        Wed, 19 Jan 2022 17:01:15 -0800 (PST)
Received: from ?IPv6:2600:8801:8d2a:a304:93dc:834e:6555:ccaa?
 ([2600:8801:8d2a:a304:93dc:834e:6555:ccaa])
        by smtp.gmail.com with ESMTPSA id
 p20sm657092pgm.88.2022.01.19.17.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 17:01:14 -0800 (PST)
To: Jupiter <jupiter.hce@gmail.com>
Cc: yocto <yocto@lists.yoctoproject.org>,
 oe-core <openembedded-core@lists.openembedded.org>
References: 
 <CAA=hcWQrFmWJMPizbeug6TPYsecWHttk4gM7netpGDiFv8N+Dg@mail.gmail.com>
 <CAPxNcnfb1z4fZfGGxEkyK3Hwa2fAwEGMRKP3_PrJc9Fmd4LS+Q@mail.gmail.com>
 <CAA=hcWQM-eZicZGUt0gNQWoC0Ui5D2=08KgLyPs34Pw5Z-ZZwQ@mail.gmail.com>
From: Rudolf J Streif <rudolf.streif@ibeeto.com>
Autocrypt: addr=rudolf.streif@ibeeto.com; keydata=
 xsBNBFhQFAQBCACa5/X8dcYC25ELsL2exFTaf9QV24fFIn64+rXFqDNKuk7xed5kafscejvD
 Qpe+Co1EPSU4ybklzYlvbMvzxKfwLDADKh+HsqmUYrd/l43hbqrPLxfDUhg87WVEhjm0qyYQ
 /Qymy+7Cbh+pVNNlHULUQttkXPl3D+UOMz9se0Ook/HngDIOCyQF4rTyPnGNvd8NJmAng969
 cQD/S9LNndnK5GGrmDDOuMYwoG4qDqWvWEChncgqHfmWK/Z1AvYKdYWe9uh1N4Qb/P5AZxTM
 3sPiHrF+Y2HTdK7j7lWgtu8YzluBHdvzhC+4jUnAKjh8P/N/H6JlE3UC3dwHPOaRsnXBABEB
 AAHNKlJ1ZG9sZiBKIFN0cmVpZiA8cnVkb2xmLnN0cmVpZkBpYmVldG8uY29tPsLAdwQTAQgA
 IQUCWFAUBAIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRCNjKgpJzObdabzB/4lFMf0
 3GsVMG6C5QOLaPx6rOgj5qexCH3rfYeI3xkbGuR0a+YByzvSiCc6Ukh7YNn4UwRs6cY0fYBk
 txioE384/51QTIfCmW8ZG5X0cMC5d38LFvd/dj3KBA74HW4GoLt0cIyzy38CCOFmClTNE8xl
 lpeOfKQD3wn99w5dzXYhvajXCWwAjjpWrR84ww6xromQCDj0AubLA6xyk3t8bzFNsRCCFx+w
 Xl7keSggn6ld3f3ySIQyEK2GgZDdw+zQmgVMq4x5LZhUhGYoqbYwNy9imoBkUAZkbbViNOtX
 zaTHX/RzRHErvq56HOVqceJZIpkDnfvB1aXvfvmBhjVLmLHvzsBNBFhQFAQBCADXoLKCuF48
 5eCWhnty44o9IZJuOSiX+uVJTgVGNWkZOF61Hs2pieIOmTqk3fb9+Ao6C6IliC9ZRXyAVLD/
 RSGoLiTnWLc1uaK4P/XCM3HZfsi9ueBuNufR8yMy8/8ZqbFwRIFpPBpxHRrZnDdEd5IKsy+z
 w6QChvhpmssZy+UaKfWHILroAoS/7bKGzHo5F/dEJhxVDjgxDUDspJSHWMBh0OMKDeBik5wl
 svtV2yw7ezwWJLRsbaa8TUXd79ZJYYc3FIi0K5aXkMySh+QaQ/bE2Y5A/mCBCZ+IKhBQR36v
 tUAsTCuUAOREwSdPDVwfuoI5gfVxGyz/zrERfnXF4viHABEBAAHCwF8EGAEIAAkFAlhQFAQC
 GwwACgkQjYyoKSczm3W3fgf+NSdojthWWEqfWwym3VHK8955SeOy12xQA4ird2Ca2LYUpLNj
 s4qVFEqXSXZk4rmpGCFlMWwOjcCJOXJLR0ATfmWlvZxp1QL4res/R+SPFEyheu7TTpJ9MbyE
 fxaMSn2xRMA1V2KVJSfDoMacImVRchFclaNU31cEu6tEnNRwVcsWdTlGdA5a1ASGl4CiP8Tz
 Yf9m2KOWGjOmVgGFcIJ2QfIlMglU875YHE3W4u3YOWwUbPEr2Seyb176MvO74CUL/Nlouvce
 P41tsC5daxZnrLBQ3nw4xe4RJSzdPPkY7iF0N5R9NvBJ7WX3dwjMO4EMvdlFuNCQ2ALli/AN
 ROZj4g==
Subject: Re: [yocto] Honister broken WiFi communication
Message-ID: <253a4247-8314-be3f-afa0-0d604c81ba77@ibeeto.com>
Date: Wed, 19 Jan 2022 17:01:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: 
 <CAA=hcWQM-eZicZGUt0gNQWoC0Ui5D2=08KgLyPs34Pw5Z-ZZwQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sT9a84Xmsyr1L6V8aOJrLctkaVQ5quHvu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 01:01:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160747

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sT9a84Xmsyr1L6V8aOJrLctkaVQ5quHvu
Content-Type: multipart/mixed; boundary="Sgx5HWNRaY3XiPxYy6sFcIdOW0R25TX4V";
 protected-headers="v1"
From: Rudolf J Streif <rudolf.streif@ibeeto.com>
To: Jupiter <jupiter.hce@gmail.com>
Cc: yocto <yocto@lists.yoctoproject.org>,
 oe-core <openembedded-core@lists.openembedded.org>
Message-ID: <253a4247-8314-be3f-afa0-0d604c81ba77@ibeeto.com>
Subject: Re: [yocto] Honister broken WiFi communication
References: <CAA=hcWQrFmWJMPizbeug6TPYsecWHttk4gM7netpGDiFv8N+Dg@mail.gmail.com>
 <CAPxNcnfb1z4fZfGGxEkyK3Hwa2fAwEGMRKP3_PrJc9Fmd4LS+Q@mail.gmail.com>
 <CAA=hcWQM-eZicZGUt0gNQWoC0Ui5D2=08KgLyPs34Pw5Z-ZZwQ@mail.gmail.com>
In-Reply-To: <CAA=hcWQM-eZicZGUt0gNQWoC0Ui5D2=08KgLyPs34Pw5Z-ZZwQ@mail.gmail.com>

--Sgx5HWNRaY3XiPxYy6sFcIdOW0R25TX4V
Content-Type: multipart/mixed;
 boundary="------------2CC34A4E6A93E060BE6503F2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2CC34A4E6A93E060BE6503F2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi JH,

On 1/18/22 5:45 PM, Jupiter wrote:
> Hi Rudolf,
>
> Thanks for your response and comments.
>
>> If you run ifconfig -a does your WiFi interface show up? If not there =
is an
>> issue with the driver. Use dmesg and filter for the driver. Often a dr=
iver
>> cannot load the firmware. What is your WiFi hardware?
> Not that bad, the WiFi interfaces was fine, but it could not get dhcp
> response and IP address so an automatic private IP address 169.254 was
> assigned
>
> mlan0     Link encap:Ethernet  HWaddr D4:CA:6E:A4:E8:B4
>            inet addr:169.254.193.101  Bcast:169.254.255.255  Mask:255.2=
55.0.0
>            UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>            RX packets:2 errors:0 dropped:0 overruns:0 frame:0
>            TX packets:56 errors:0 dropped:0 overruns:0 carrier:0
>            collisions:0 txqueuelen:1000
>            RX bytes:330 (330.0 B)  TX bytes:16392 (16.0 KiB)

This would typically mean that you are actually connected to a wifi=20
network but the interface did not receive a DHCP lease for the IP=20
address. the 169.254. is local IPv4 IP address which the interface would =

typically get if the DHCP client times out.

> I could see WiFi information well, it is not a major problem, but the
> subtle issues are connman and wpa_supplicant did not set up the WiFi
> driver correctly.
>
> Connected to 34:08:04:12:b1:a2 (on mlan0)
>          SSID: JupiterIoT
>          freq: 2437
>          RX: 660 bytes (4 packets)
>          TX: 46622 bytes (129 packets)
>          signal: -57 dBm
>          rx bitrate: 1.0 MBit/s
>          tx bitrate: 72.2 MBit/s MCS 7 short GI
>
>          bss flags:      short-slot-time
>          dtim period:    1
>          beacon int:     100

I don't think that this is a wpa_supplicant issue. However, you can use=20
connmanctl to manually connect to a wifi network:

$ connmanctl
connmanctl> enable wifi
connmanctl> scan wifi
San completed for wifi
connmanctl> services
[service list follows]
connmanctl> agent on
Agent registered
connmanctl> connect wifi_xxxxxx
Agent RequestInput wifi_xxxxx
 =C2=A0=C2=A0 Passphrase =3D [ Type=3Dpsk, Requirement=3Dmandatory ]
Passphrase? ********
Connected wifi_xxxxxx
conmanctl> quit

If that works the wifi authentication is OK.

>> Did you install the regulatory database?
> Did you mean to enable CONFIG_CFG80211_INTERNAL_REGDB? No, I did not
> install it in the Zeus version either so I don't see that could be an
> issue.
Only a wag on my side. Should be ok since the wifi driver is working.
>> What error messages are you seeing when attempting to connect to a WiF=
i
>> network? Did you look at the connman logs?
> No error in connman, I don't think it is connman or wpa_supplicant
> issue, my suspicion is something missing in Honister built image to
> prevent connman and wpa_supplicant to set up the WiFi driver
> correctly.
>
> It is not the first time I have the WiFi setup trouble to get WiFi
> 169.254 address, when I upgraded from Thud to Zeus, I got the exactly
> the same problem that WiFi was assigned by a 169.254 address, no dhcp
> response, at time, I was totally convinced it was connman issue, I
> spend several months to debug connman and wpa_supplicant without any
> results, then after waiting several months to pull updated Zeus again,
> that problem was disappeared miraculous, that is why I suspect the
> same problem in oe-core and bitbake in Honister as well.

Well, ok then it looks like a dhcp issue. Did you attempt to set a=20
static IP to test connectivity?

Eventually it could be a router issue. Maybe the router blocks unknown=20
devices?

> Are there anyone in oe-core and bitbake tested connman, wpa_supplicant
> for the current Honister branch? I can help to test and to debug it if
> more advanced people in oe-core, bitbake, kernel, WiFi driver mwifiex
> can provide me more information.
Honestly, I don't think the issue is related to connman or=20
wpa_supplicant at all but on the dhcp level.
> Thank you.
>
> Kind regards,
>
> - jupiter

--=20
Rudolf J Streif
CEO/CTO ibeeto
+1.855.442.3386 x700


--------------2CC34A4E6A93E060BE6503F2
Content-Type: application/pgp-keys;
 name="OpenPGP_0x8D8CA82927339B75.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0x8D8CA82927339B75.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFhQFAQBCACa5/X8dcYC25ELsL2exFTaf9QV24fFIn64+rXFqDNKuk7xed5kafscejvDQ=
pe+
Co1EPSU4ybklzYlvbMvzxKfwLDADKh+HsqmUYrd/l43hbqrPLxfDUhg87WVEhjm0qyYQ/Qymy=
+7C
bh+pVNNlHULUQttkXPl3D+UOMz9se0Ook/HngDIOCyQF4rTyPnGNvd8NJmAng969cQD/S9LNn=
dnK
5GGrmDDOuMYwoG4qDqWvWEChncgqHfmWK/Z1AvYKdYWe9uh1N4Qb/P5AZxTM3sPiHrF+Y2HTd=
K7j
7lWgtu8YzluBHdvzhC+4jUnAKjh8P/N/H6JlE3UC3dwHPOaRsnXBABEBAAHNKlJ1ZG9sZiBKI=
FN0
cmVpZiA8cnVkb2xmLnN0cmVpZkBpYmVldG8uY29tPsLAdwQTAQgAIQUCWFAUBAIbAwULCQgHA=
gYV
CAkKCwIEFgIDAQIeAQIXgAAKCRCNjKgpJzObdabzB/4lFMf03GsVMG6C5QOLaPx6rOgj5qexC=
H3r
fYeI3xkbGuR0a+YByzvSiCc6Ukh7YNn4UwRs6cY0fYBktxioE384/51QTIfCmW8ZG5X0cMC5d=
38L
Fvd/dj3KBA74HW4GoLt0cIyzy38CCOFmClTNE8xllpeOfKQD3wn99w5dzXYhvajXCWwAjjpWr=
R84
ww6xromQCDj0AubLA6xyk3t8bzFNsRCCFx+wXl7keSggn6ld3f3ySIQyEK2GgZDdw+zQmgVMq=
4x5
LZhUhGYoqbYwNy9imoBkUAZkbbViNOtXzaTHX/RzRHErvq56HOVqceJZIpkDnfvB1aXvfvmBh=
jVL
mLHvzsBNBFhQFAQBCADXoLKCuF485eCWhnty44o9IZJuOSiX+uVJTgVGNWkZOF61Hs2pieIOm=
Tqk
3fb9+Ao6C6IliC9ZRXyAVLD/RSGoLiTnWLc1uaK4P/XCM3HZfsi9ueBuNufR8yMy8/8ZqbFwR=
IFp
PBpxHRrZnDdEd5IKsy+zw6QChvhpmssZy+UaKfWHILroAoS/7bKGzHo5F/dEJhxVDjgxDUDsp=
JSH
WMBh0OMKDeBik5wlsvtV2yw7ezwWJLRsbaa8TUXd79ZJYYc3FIi0K5aXkMySh+QaQ/bE2Y5A/=
mCB
CZ+IKhBQR36vtUAsTCuUAOREwSdPDVwfuoI5gfVxGyz/zrERfnXF4viHABEBAAHCwF8EGAEIA=
AkF
AlhQFAQCGwwACgkQjYyoKSczm3W3fgf+NSdojthWWEqfWwym3VHK8955SeOy12xQA4ird2Ca2=
LYU
pLNjs4qVFEqXSXZk4rmpGCFlMWwOjcCJOXJLR0ATfmWlvZxp1QL4res/R+SPFEyheu7TTpJ9M=
byE
fxaMSn2xRMA1V2KVJSfDoMacImVRchFclaNU31cEu6tEnNRwVcsWdTlGdA5a1ASGl4CiP8TzY=
f9m
2KOWGjOmVgGFcIJ2QfIlMglU875YHE3W4u3YOWwUbPEr2Seyb176MvO74CUL/NlouvceP41ts=
C5d
axZnrLBQ3nw4xe4RJSzdPPkY7iF0N5R9NvBJ7WX3dwjMO4EMvdlFuNCQ2ALli/ANROZj4g=3D=
=3D
=3DLHwf
-----END PGP PUBLIC KEY BLOCK-----

--------------2CC34A4E6A93E060BE6503F2--

--Sgx5HWNRaY3XiPxYy6sFcIdOW0R25TX4V--

--sT9a84Xmsyr1L6V8aOJrLctkaVQ5quHvu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEVg4uKeQrdCNuC2kVjYyoKSczm3UFAmHotFkFAwAAAAAACgkQjYyoKSczm3U6
4Af/bUVv6IrWnQfzc9wp5ZCMbaCVxw7BH9B2/oFPwAIJN6Ru74iNblQ1m7J4jvIm6q9KbYHwWudC
dx+WAEz6xugFLFHL7zJDzLWkUZSWbnwCa8mFKeh1itD3xTlkKTyQFplHU83//kf/2fISudtg/rm3
tVBMpeBinl8vOKKjCnYUK+YfXgYkjpnij2JCK3zk6Ew+isdGTSGx6uHKTRyAC22462q5wc4CXfLe
cAvgdrIb8BrzJZY/zS1/RrZBlb0v4WO/k+NtjlZFhF1LPcDGtAxUSAj5HYWSG5gOiFyYXAOqLnop
Vv/VzZOxvse0ve/zIaFZL7AwzpDZjXys/o8L6crE2g==
=4A6X
-----END PGP SIGNATURE-----

--sT9a84Xmsyr1L6V8aOJrLctkaVQ5quHvu--

