Return-Path: <w.egorov@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B8EC52D71
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 07:02:01 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web10.87647.1722582113523377152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 00:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=a4 header.b=PTmFlMVL;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: w.egorov@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1722582111; x=1725174111;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vN3KmQNCruqst0Xlfc4SOJ8r810yYbPKBA/fuunSD6E=;
	b=PTmFlMVLErB/ihzsDBXoSm44yild8TCQVzrETD+21PAz3wJu+g5yREMm8dGBUQZ7
	I59K1kTQDB8ZjFWsvXWxLEZJ7oOA7CUY5dey4JyDoZ72Ut44AuSXQ/RxNH1dcfZ+
	+AefbpWUdIzGBmkTfEaqwmSaIHTwYXGxBOMJXeHuDqE=;
X-AuditID: ac14000a-03e52700000021bc-1b-66ac845fc467
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 17.70.08636.F548CA66; Fri,  2 Aug 2024 09:01:51 +0200 (CEST)
Received: from [172.25.39.28] (172.25.0.11) by Berlix.phytec.de (172.25.0.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 2 Aug 2024
 09:01:50 +0200
Message-ID: <af058e4a-7464-4308-97d0-26f9fcd24539@phytec.de>
Date: Fri, 2 Aug 2024 09:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap+][PATCH] watchdog: Set watchdog_module in
 default config
To: Steve Sakoman <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>
References: <CAOSpxda3332UEOtH2ypoeJnpt4ehZpjFbaq4er_25PdT_caV7w@mail.gmail.com>
 <31107.1721628558851428697@lists.openembedded.org>
 <CAOSpxdanafDpHWHb4n8MZzoW9kojmXqM6coNGjh4G6_PzpMnLw@mail.gmail.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <CAOSpxdanafDpHWHb4n8MZzoW9kojmXqM6coNGjh4G6_PzpMnLw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWyRpKBRze+ZU2awea3fBZ3fr5jtzi9TcaB
	yePcxhWMHlsev2YLYIrisklJzcksSy3St0vgyvi23a9gnWDFhMkX2RoY7/F1MXJySAiYSDz+
	douti5GLQ0hgCZPEiQu7mSCcO4wSb/fdZASp4hWwkZjef5kdxGYRUJH40LuLHSIuKHFy5hMW
	EFtUQF7i/q0ZYHFhgRiJcz+7wXpFBFQlni86CxZnFtCTeL9sPQvEgjOMEsf/zWaDSIhL3Hoy
	nwnEZhNQl7iz4RsriM0pECgxa+tiJogaC4nFbw5CDZKXaN46mxnEFgKyX1xazgLxjrzEtHOv
	mSHsUIkjm1YzTWAUnoXk1llI1s1CMnYWkrELGFlWMQrlZiZnpxZlZusVZFSWpCbrpaRuYgQF
	vAgD1w7GvjkehxiZOBgPMUpwMCuJ8AqdXJkmxJuSWFmVWpQfX1Sak1p8iFGag0VJnHd1R3Cq
	kEB6YklqdmpqQWoRTJaJg1OqgXH7HDVvYaZy06svnlY/XcZ0ouDhtUcVey6v+fyGQ/8Nd5ky
	y/dy+5bd+Uaa+wJfMjE+jjbXmSfzSm/BzpnrxOxfH3tz/i3Djo9vVB8ej37+Jn1dRuqCBwGR
	30w3L5RKTLobFPK8pewCy/9vb7ldDHvbgv+cm6uww6KvvbM+75XwxHUiTvecv95VYinOSDTU
	Yi4qTgQAKKWE4GYCAAA=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 07:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202888



Am 22.07.24 um 17:25 schrieb Steve Sakoman:
> On Sun, Jul 21, 2024 at 11:09=E2=80=AFPM Wadim Egorov via
> lists.openembedded.org <w.egorov=3Dphytec.de@lists.openembedded.org>
> wrote:
>>
>> On Fri, Jul 19, 2024 at 06:00 AM, Steve Sakoman wrote:
>>
>> Is this also an issue in master=3F If so, then this will need to be
>> submitted first for master and then I can backport.
>>
>> Yes, do you want me to resend without the scarthgap tag=3F
>> This patch also applies to master.
> 
> I see you sent it for master, thanks!  I'll backport when it hits master.

FYI: Just made it into master,

7a824eded561 ("watchdog: Set watchdog_module in default config")

> 
> Steve
> 
>> On Thu, Jul 18, 2024 at 11:21=E2=80=AFPM Wadim Egorov via
>> lists.openembedded.org <w.egorov=3Dphytec.de@lists.openembedded.org>
>> wrote:
>>
>> systemd started to warn about used but unset environment variables.
>> Let us set watchdog_module=3Dnone which is used by the watchdog.service to get
>> rid of the following warning:
>>
>> watchdog.service: Referenced but unset environment variable evaluates to an empty string: watchdog_module
>>
>> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
>> ---
>> meta/recipes-extended/watchdog/watchdog-config/watchdog.default | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
>> index 647d5abca5bd..cee5fdc2b6f7 100644
>> --- a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
>> +++ b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
>> @@ -1,2 +1,3 @@
>> # Start watchdog at boot time=3F 0 or 1
>> run_watchdog=3D1
>> +watchdog_module=3Dnone
>> --
>> 2.25.1
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#202305): https://lists.openembedded.org/g/openembedded-core/message/202305
>> Mute This Topic: https://lists.openembedded.org/mt/107430686/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

