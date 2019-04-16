Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D13087D660
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 01:16:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3G1GGqM027396
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Apr 2019 18:16:27 -0700
Received: from [128.224.162.190] (128.224.162.190) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 15 Apr 2019 18:16:06 -0700
To: <adrian.freihofer@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20190414132414.18547-1-adrian.freihofer@gmail.com>
	<411ab935-ee8f-a6d3-e8f3-d6814eb7b1d4@windriver.com>
	<e00ca43559ee1f9a8c18d275a6c8370bf5d9bc00.camel@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <842c26fd-f8c8-2f04-2329-cf3413a4498b@windriver.com>
Date: Tue, 16 Apr 2019 09:26:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <e00ca43559ee1f9a8c18d275a6c8370bf5d9bc00.camel@gmail.com>
X-Originating-IP: [128.224.162.190]
Subject: Re: [meta-oe][PATCH 1/3] systemd: remove 2 obsolete useradds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2019 01:16:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/16/2019 05:49 AM, adrian.freihofer@gmail.com wrote:
> On Mon, 2019-04-15 at 09:40 +0800, ChenQi wrote:
>> On 04/14/2019 09:24 PM, Adrian Freihofer wrote:
>>> - Users systemd-journal-remote and systemd-journal-upload are not
>>> used by
>> I guess you mean 'systemd-journal-gateway'?
> You are right. I will send a V2 if I can convince you of this change
> after all.
>> Anyway, I have some concern about this change.
>>
>> Adding these users is not supposed to cause any runtime problem, as
>> if
>> the user has already exists, DynamicUser mechanism just does not try
>> to
>> create one.
>> I also can recall the systemd-timesync once had DynamicUser=yes, but
>> then removed such setting.
>> So if there is no compelling reason (security?) why we should use
>> DynamicUser, let's leave these two users there.
>>
>> Best Regards,
>> Chen Qi
> I agree with you, it works as it is. That's a strong argument.
>
> However, traditional Unix user IDs are not ideal for embedded systems.
> Especially with an image based firmware update and daemons writing to
> persistent storage, traditional Unix user IDs are problematic.
> With useradd-staticids enabled this problem can be addressed. But we
> have to maintain static user IDs manually.
> With this patch applied systemd would just generate the user IDs in any
> case (static or dynamic users) without manual interaction.
> Here we have the chance to get rid of two user IDs, which seems to me
> to be an advantage anyway.
>
> Another, weaker argument: Static user IDs are a rare ressource.
>
> Are you still against this change or should I send V2 with fixed commit
> comment of this third patch?

I'm not against this change.
I don't use journal-gateway/journal-upload, so I think you have more 
real-world experience.
V2 with the fixed commit is OK.

Best Regards,
Chen Qi


> Best Regards,
> Adrian
>>>     systemd anymore. Systemd creates dynamic users for services
>>> without
>>>     persistent data.
>>> - Fix start of journal-remote
>>>
>>> Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
>>> ---
>>>    meta/recipes-core/systemd/systemd_241.bb | 6 +-----
>>>    1 file changed, 1 insertion(+), 5 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_241.bb
>>> b/meta/recipes-core/systemd/systemd_241.bb
>>> index 3a58f44a3b..8e493d5b55 100644
>>> --- a/meta/recipes-core/systemd/systemd_241.bb
>>> +++ b/meta/recipes-core/systemd/systemd_241.bb
>>> @@ -334,9 +334,7 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKA
>>> GECONFIG', 'binfmt', '${PN}-binfm
>>>    SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
>>>    
>>>    USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
>>> -                    ${@bb.utils.contains('PACKAGECONFIG',
>>> 'microhttpd', '${PN}-journal-gateway', '', d)} \
>>>                        ${@bb.utils.contains('PACKAGECONFIG',
>>> 'microhttpd', '${PN}-journal-remote', '', d)} \
>>> -                    ${@bb.utils.contains('PACKAGECONFIG',
>>> 'journal-upload', '${PN}-journal-upload', '', d)} \
>>>    "
>>>    GROUPADD_PARAM_${PN} = "-r systemd-journal"
>>>    USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
>>> 'coredump', '--system -d / -M --shell /bin/nologin systemd-
>>> coredump;', '', d)}"
>>> @@ -345,9 +343,7 @@ USERADD_PARAM_${PN} += "${@bb.utils.contains('P
>>> ACKAGECONFIG', 'polkit', '--syste
>>>    USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
>>> 'resolved', '--system -d / -M --shell /bin/nologin systemd-
>>> resolve;', '', d)}"
>>>    USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
>>> 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-
>>> timesync;', '', d)}"
>>>    USERADD_PARAM_${PN}-extra-utils = "--system -d / -M --shell
>>> /bin/nologin systemd-bus-proxy"
>>> -USERADD_PARAM_${PN}-journal-gateway = "--system -d / -M --shell
>>> /bin/nologin systemd-journal-gateway"
>>>    USERADD_PARAM_${PN}-journal-remote = "--system -d / -M --shell
>>> /bin/nologin systemd-journal-remote"
>>> -USERADD_PARAM_${PN}-journal-upload = "--system -d / -M --shell
>>> /bin/nologin systemd-journal-upload"
>>>    
>>>    FILES_${PN}-analyze = "${bindir}/systemd-analyze"
>>>    
>>> @@ -401,7 +397,7 @@ FILES_${PN}-journal-remote =
>>> "${rootlibexecdir}/systemd/systemd-journal-remote \
>>>                                  ${systemd_system_unitdir}/systemd-
>>> journal-remote.service \
>>>                                  ${systemd_system_unitdir}/systemd-
>>> journal-remote.socket \
>>>                                 "
>>> -SYSTEMD_SERVICE_${PN}-remote = "systemd-journal-remote.socket"
>>> +SYSTEMD_SERVICE_${PN}-journal-remote = "systemd-journal-
>>> remote.socket"
>>>    
>>>    
>>>    FILES_${PN}-container = "${sysconfdir}/dbus-
>>> 1/system.d/org.freedesktop.import1.conf \
>>
>


