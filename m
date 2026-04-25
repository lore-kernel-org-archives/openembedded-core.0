Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB2DFF8860
	for <webhook@archiver.kernel.org>; Sat, 25 Apr 2026 17:47:21 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2156.1777139234136846695
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2026 10:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EEqcBgVd;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7baee75f874so69401847b3.2
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2026 10:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777139233; cv=none;
        d=google.com; s=arc-20240605;
        b=ToA/P8vZePhxQFcSYtItZIwVw1U64pCMMg/faOI2tnXHb1noDVIpBye2GwR5GHiTJk
         jmkvplm0hTSWRSyx/QCG5doNMFgFeZdgyXT/8GrvIa/uihhylosB1r13f2p9x+oLpZAe
         1vsxyjbsbQ0j2bLYkxiPm+jvtUvwWJHr3xqmgym37uihsx+L1vm3vI4FLtHzT+i0YSdP
         4LMmj+WGSLgEFB1jfW4GOPa2cKfk261mBSTUmVjic78he5MCeaA+aM0q0KBxJVD4UBgr
         X1de7U+HaOx/9nrfY1u3btgwQKyw4pbIn8fY7SPc/dX4+t0FWkLIIB8GiJVL1sw/SMNn
         knaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=fi4SSB6BD5o+VmeBftjK/o4i502kk6h96LLH42Dl1dg=;
        fh=yUs6Ds/oj58jirsKMcOq01AvfcB9PCN61L8/1+ey77k=;
        b=ioUInWpOnw96G10V4UwWhZNwn8yzOvbJCsowaHbo0ZmxY5FtisJhtdyKg+5MvThCyr
         nW1N8G8Wcsud9PKK/zWvL+0QuNueeqvnx8N50sqPyV6vbWl3ne8D3A/Lw0zXkZy6jkZT
         Y0y5ypre8ySscfGw2iJYbAQA4hAdbfdQdYLXbsmgz+D8PcpcZV7Dhr4IqHUtg6t3erDd
         Fze6dxW90befHQtain3ZdNLpPE8N4EbjKAR74DEFGBLtDoy3HWdrhZJLPpTJDtHyQW8s
         5qmhHR+SQLoZOoX3m4mfLpMrtEp6z6IfhvgerCKi9s0vDPTw+GRlWVqJLNx+eOh7ijbK
         Ex4A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777139233; x=1777744033; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fi4SSB6BD5o+VmeBftjK/o4i502kk6h96LLH42Dl1dg=;
        b=EEqcBgVdk7aRCw4QcqUHgtIEe8hmlIlwh8KCXziDfxj6345CELEz+PDRQvrKROsx2H
         sxDTD4d4aESgoUfryeOVUy9PIh2srkCIYAfsOyx1UlLrGb3D4sDDT2xJ5i9vBDGv/gie
         aCnOLItnnqVyHcvSeX96WcVPUqlT5JuAWHHkncRU7mhsYVprUfJimg5iBcmsQLMtmxrl
         8uMPshDSghbTSED2njkyBHE5T4M0selq1+5xr0nIMSE862p+U/EhfiJEJqMHIKZcbnZk
         TXhUFLS+1OWllNU5zOUlZWIDOMz6LVaXt9Xn2rm7FwvnRcMRm8H/bnj4cq8fNcNwZT+G
         b0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139233; x=1777744033;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fi4SSB6BD5o+VmeBftjK/o4i502kk6h96LLH42Dl1dg=;
        b=JbVssrz4JaXysPSPyXR2VjwomdssuwzbHGHMktYMebqzsXRTYRjpdKIrxeBx0IvDaa
         n7NKCXDE5HBcCRNZHNNPy/KeuHjaGVkiKNlPHxV0ssURDgC1kLqnQNtnNu3er8Rfb1RW
         zOcAWB4lrsBk/qITxOF/PGkV3bgDOslr5ycD//oVDNQCpKl+9rtKhjScsJTNr8UaWSJL
         49lv8WU7cA02hrPmcEzKIC5fRnRJ5cRQBK16npy9/uvboNEzHLqMirU3Nqtdmc8auH8I
         v9Xl1Chw2BYeeyYIDwBOG5Chp5zEHPuU01FzpnnmRe/3U2bA2FEb1eGr+ppx7iuDbWg5
         rgtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hUAF65i1IxqYOec4ZVC2noJf8KHD0NMDI84o4F40ONy3czN3xpPH2w4u+/XqwzgQT3QMHnMW6gM1IXr0hZmtyQw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwS3WeZzB2j9XKxkpGTL718q0XRo5W7us6xEKKYx6CBRqNJmohj
	ZJW46pPbVVb4Bii4Ko73OIKKIbHlCW+JZ7wYhIIuDgExXS/NHvD3K2UWMPQQDOs9z81egJnxbYs
	qF4BvMiFIJXgacDg4jJVWxJ4J3HgA9KE=
X-Gm-Gg: AeBDieszcJkZMmpWCS6exdVp7JfQz4o8+y229RexxMwjTWNrOs1OQJma67X3U2mFpl3
	Y+0UlgRB0oo7n+pPR4wzHrEsza/Vth5G+i8jSvkovuIblMKeuvrWVQbvewpQHo0LbAbISohMrPp
	FQkxE25FJsuxLvB9heQbU/Qf1/qC55FRIS5Pg3BM5NuGddZcK3fv7Y+XdZZC2NfNT2KbWXLCwvl
	lh5jEgGvOwl21X+cqkqWRJ7aa8i1WE1eOXkYy3sLDv5drzCWvaxBVlYPqXxA/P0uUMmVeIhmfCQ
	hNJEodQQsjjtqiEs83u5ofThIWYshYfhyIjpf6IN0Xe7Jy5Sn37sTp7iK6rhayDX1tIc7VHTFkj
	Q/rGGqJwm6vuijBewyTFjto015vgMa+D5CL1kPZnoeQvgjuBcKoyXLgFfMpX+ghSsm6lLRNJt7E
	KyvoWlpDZrZMDJLZw=
X-Received: by 2002:a05:690e:1b60:b0:650:12eb:16db with SMTP id
 956f58d0204a3-65310a790a8mr23274404d50.50.1777139233168; Sat, 25 Apr 2026
 10:47:13 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Apr 2026 10:46:46 -0700
X-Gm-Features: AQROBzALZRJt5_B-FQyfWLs4On42Ep8YyH_EcqsX_HUPWcZPSGA4UXgnvRxLg9s
Message-ID: <CAMKF1so=iKQvzr8Hr=6ZxxBcgMU_nocduK3YNTOksqg-qLgQuw@mail.gmail.com>
Subject: meta-openembedded 'wrynose' release
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b5a3bb06504c78ef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2026 17:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235945

--000000000000b5a3bb06504c78ef
Content-Type: text/plain; charset="UTF-8"

Hello All,

'wrynose' ( yocto 6.0 LTS )  branch for meta-openembedded layers has been
created.

Anuj Mittal has kindly agreed to maintain the wrynose stable branch.

I would like to see the mbedtls 4.x in there but it still needs some work.
At this point, it is not part of the branch but we will see if it makes the
cut.

Please send any patches you would like to see in wrynose release with
appropriate subject prefix '[wrynose]' so help maintainers.

Report any issues and with patches to fix them would be even better  :)

Thank you
-Khem

--000000000000b5a3bb06504c78ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>&#39;wrynose&#39; ( yocto 6.=
0 LTS )=C2=A0 branch for meta-openembedded layers has been created.</div><d=
iv><br></div><div>Anuj Mittal has kindly agreed to maintain the wrynose sta=
ble branch.</div><div><br></div><div>I would like to see the mbedtls 4.x in=
 there but it still needs some work. At this point, it is not part of the b=
ranch but we will see if it makes the cut.</div><div><br></div><div>Please =
send any patches you=C2=A0would like to see in wrynose release with</div><d=
iv>appropriate subject prefix &#39;[wrynose]&#39; so help maintainers.</div=
><div><br></div><div>Report any issues and with patches to fix them would b=
e even better=C2=A0 :)</div><div><br></div><div>Thank you</div><div>-Khem</=
div><div><br></div></div>

--000000000000b5a3bb06504c78ef--

