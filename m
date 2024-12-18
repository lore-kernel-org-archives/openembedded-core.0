Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643F8E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 21:22:18 +0000 (UTC)
Subject: Re: cve sqlite database 'malformed' issues are back
To: openembedded-core@lists.openembedded.org
From: "Colin McAllister" <colin.mcallister@garmin.com>
X-Originating-Location: US (204.77.163.55)
X-Originating-Platform: Linux Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 13:22:13 -0800
References: <d3df2bbe890a456a7d967d27ad0821067fa492ee.camel@linuxfoundation.org>
In-Reply-To: <d3df2bbe890a456a7d967d27ad0821067fa492ee.camel@linuxfoundation.org>
Message-ID: <13203.1734556933388258298@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7mZmj3volJcnoRYz8VlD"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 21:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208878

--7mZmj3volJcnoRYz8VlD
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

Hello,

Sorry, I've been away from a computer for the last week and am getting caug=
ht back up on cve-check developments.

One of the ideas I've been mulling over since the cve-check discussion in t=
he engineering sync last Tuesday is why there's a local global CVE database=
 to begin with? If the solution is to move to having something JSON-based i=
n DL_DIR, couldn't there just be a smaller database specific to each recipe=
?

Instead of downloading a whole database, each recipe could run something li=
ke "do_cve_fetch" to download the CVE data associated with that recipe's pa=
ckages. Based on the NIST NVD 2.0 API, this could be done fairly trivially,=
 where the CPE is passed with the API call.

The major downside I see is that each recipe would have to make a NIST API =
call, which could make builds slower. I also don't see a way to specify the=
 CPE in the CVE change history API, which I believe is leveraged to do incr=
emental updates to the current sqlite database. So I'm not sure how a recip=
e-specific CVE database could be incrementally updated without just re-down=
loading all the CVE data. If the CVE change history API were to add the abi=
lity to specify a CPE, that would make this much more realistic, I think.

The advantages with this idea is that the CVE data will be more tailored to=
 a specific build, where the whole database isn't needed to be downloaded. =
I'm guessing that this would reduce disk space, especially compared to the =
whole JSON dataset being saved in the DL_DIR. If the API were to become fas=
ter and more reliable, I think the overall network throughput would be less=
 too.

I wanted to share these ideas with an email thread raising this issue with =
downloading the NIST database. Once again, I'd be happy to lend some time a=
nd what little experience I have to help address this issue, no matter what=
 the best agreed-upon solution is. :)

Thanks,
Colin

--7mZmj3volJcnoRYz8VlD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hello,</p>

<p>Sorry, I've been away from a computer for the last week and am getting c=
aught back up on cve-check developments.</p>

<p>One of the ideas I've been mulling over since the cve-check discussion i=
n the engineering sync last Tuesday is why there's a local global CVE datab=
ase to begin with? If the solution is to move to having something JSON-base=
d in DL_DIR, couldn't there just be a smaller database specific to each rec=
ipe?</p>

<p>Instead of downloading a whole database, each recipe could run something=
 like &quot;do_cve_fetch&quot; to download the CVE data associated with tha=
t recipe's packages. Based on the NIST NVD 2.0 API, this could be done fair=
ly trivially, where the CPE is passed with the API call.</p>

<p>The major downside I see is that each recipe would have to make a NIST A=
PI call, which could make builds slower. I also don't see a way to specify =
the CPE in the CVE change history API, which I believe is leveraged to do i=
ncremental updates to the current sqlite database. So I'm not sure how a re=
cipe-specific CVE database could be incrementally updated without just re-d=
ownloading all the CVE data. If the CVE change history API were to add the =
ability to specify a CPE, that would make this much more realistic, I think=
.</p>

<p>The advantages with this idea is that the CVE data will be more tailored=
 to a specific build, where the whole database isn't needed to be downloade=
d. I'm guessing that this would reduce disk space, especially compared to t=
he whole JSON dataset being saved in the DL_DIR. If the API were to become =
faster and more reliable, I think the overall network throughput would be l=
ess too.</p>

<p>I wanted to share these ideas with an email thread raising this issue wi=
th downloading the NIST database. Once again, I'd be happy to lend some tim=
e and what little experience I have to help address this issue, no matter w=
hat the best agreed-upon solution is. :)</p>

<p>Thanks,
Colin</p>

--7mZmj3volJcnoRYz8VlD--

