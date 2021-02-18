Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.web09.4081.1613636560185672037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 00:22:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=q7C/3+Lv;
 spf=pass (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=6765223a1=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1613636560; x=1645172560;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jCXd8eb62kOrDY7z1tk5NJG+nwycLsdlVG0bY9C1FGI=;
  b=q7C/3+LvhJH8a7Akwv1a58jfjKPZOmMQuLhfu8IAOBp37MViwv1xn//6
   6Cy6AOJvVLkRPrUZuc573ra/v7RTNsmDm6SdUTF7V2CVR5TqSFj/Nl9kQ
   v7616QrOClvJZhj1lsnqA/RpxxA8h1rkb4n+lmu+YAkyoU64Nk3cF9Dba
   c=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 18 Feb 2021 09:22:37 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw1.muc with ESMTP/TLS;
 18 Feb 2021 09:22:37 +0100
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp) ([160.46.167.68])
 by esabb5.muc with ESMTP/TLS; 18 Feb 2021 09:22:37 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Thu, 18 Feb 2021 09:22:37 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Thu,
 18 Feb 2021 09:22:37 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] CVE's for linux-yocto
Thread-Topic: [OE-core] CVE's for linux-yocto
Thread-Index: AQHXBc836VkRMRGApkeh/ly8rt7V+g==
Date: Thu, 18 Feb 2021 08:22:37 +0000
Message-ID: <YC4jyxYG+qaKLZOu@korppu>
References: <CAOSpxda=kB8f8ddFh0ZV2PeHSWNGVP=zjL0in4EgBSVP3oL6UA@mail.gmail.com>
In-Reply-To: <CAOSpxda=kB8f8ddFh0ZV2PeHSWNGVP=zjL0in4EgBSVP3oL6UA@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0E53C2DA9B258E44AE38A91623A763FB@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 16, 2021 at 08:23:31AM -1000, Steve Sakoman wrote:
> The weekly cve reports for master, gatesgarth, and dunfell currently
> omit linux-yocto since the CPE database for the kernel is notoriously
> incomplete in versioning information.
>=20
> This morning at the YP technical team meeting we discussed this and
> decided to see if we might, as a team, expend some effort to update
> the CPE database to improve this situation (much as we have been doing
> for the other packages in oe-core)
>=20
> The first step in this process is to shine some light on the current
> situation, so below is a list of the current CVE hits for linux-yocto
> in all three branches.

Please check https://github.com/nluedtke/linux_kernel_cves

IMO, that information could be moved over to NVD and CPE, but AFAIK the
scripts which generate this git repo with data aren't public.

Another option would be to switch kernel CVE scans to use that git repo
to pull in data from kernel major version and which CVEs are fixed and
unfixed by given minor version release.

That is rather simple to do for anyone who has a bit of time. Though
as recommended by upstream developers, CVEs should never be patched
independently and instead upstream point releases should be merged into
product trees.

For example for dunfell linux-yocto version 5.4.87 and data from
https://github.com/nluedtke/linux_kernel_cves/blob/master/data/5.4/5.4_secu=
rity.txt
shows that the list of fixed CVEs is between lines 1 and 297 (note
that 5.4.87 point release is missing from the list but previous and followi=
ng
releases are there, not perfect but that's what it is).

Then the list of unfixed CVEs from newer point releases is:

CVEs fixed in 5.4.88:
  CVE-2020-36158: 0a49aaf4df2936bca119ee38fe5a570a7024efdc mwifiex: Fix pos=
sible buffer overflows in mwifiex_cmd_802_11_ad_hoc_start

CVEs fixed in 5.4.89:
  CVE-2020-28374: 485e21729b1e1235e6075318225c09e76b376e81 scsi: target: Fi=
x XCOPY NAA identifier lookup

CVEs fixed in 5.4.92:
  CVE-2021-3178: 4aef760c28e8bd1860a27fd78067b4ea77124987 nfsd4: readdirplu=
s shouldn't return parent of export

CVEs fixed in 5.4.94:
  CVE-2020-27825: b899d5b2a42a963d6ca7e33d51a35b2eb25f6d10 tracing: Fix rac=
e in trace_open and buffer resize call
  CVE-2021-3347: 0dae88a92596db9405fd4a341c1915cf7d8fbad4 futex: Ensure the=
 correct return value from futex_lock_pi()

CVEs fixed in 5.4.95:
  CVE-2021-3348: 587c6b75d7fdd366ad7dc615471006ce73c03a51 nbd: freeze the q=
ueue while we're adding connections

CVEs fixed in 5.4.97:
  CVE-2021-20194: 9146fffc5d2a3ec49906daf18d2e983d995b3521 bpf, cgroup: Fix=
 optlen WARN_ON_ONCE toctou

And list of CVEs for which no fix is available in 5.4 branch is the long li=
st of outstanding
(all lines after "Outstanding CVEs") CVEs, some of which do not apply to 5.=
4 because buggy
code doesn't exist there, or no-one has yet backported the patches etc.

This same process could apply to any kernel major version for which data ex=
ists in this
git tree and if the database keeps seeing updates. I've been using this man=
ually to
trigger updates and cross reference which point releases have fixes and I h=
ave not
yet found major bugs in the data. Though for updates, like I said, full mer=
ge or rebase
of the upstream kernel.org point releases must be done, as also Greg K-H. s=
ays.

Cheers,

-Mikko=
