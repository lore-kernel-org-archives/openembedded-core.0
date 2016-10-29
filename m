Return-Path: <linus.wallgren@scypho.com>
Received: from mx-out01.mykolab.com (mx.kolabnow.com [95.128.36.1])
	by mail.openembedded.org (Postfix) with ESMTP id 800EC6FFED
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 23:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kolabnow.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-10 required=6.31
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham
Received: from mx05.mykolab.com (mx05.mykolab.com [10.20.7.161])
	by mx-out01.mykolab.com (Postfix) with ESMTPS id 5013761634;
	Sun, 30 Oct 2016 01:01:29 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>
References: <20161028143627.15891-1-linus.wallgren@scypho.com>
	<D2F9E708-19E4-4967-AAF5-5D9C1D9941EA@gmail.com>
	<deb371d6-ee5c-8730-e235-f37b13f6cc9d@scypho.com>
	<CAMKF1so_4pLL+Ou9982Fvi4okEv+0EB80k6Qsvhf5GtYe8e1ww@mail.gmail.com>
From: Linus <linus.wallgren@scypho.com>
Message-ID: <65d1d2be-e538-d821-1a59-27f22b9d2c4b@scypho.com>
Date: Sun, 30 Oct 2016 01:01:28 +0200
MIME-Version: 1.0
In-Reply-To: <CAMKF1so_4pLL+Ou9982Fvi4okEv+0EB80k6Qsvhf5GtYe8e1ww@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Reload configuration on package install
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
X-List-Received-Date: Sat, 29 Oct 2016 23:01:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

This has also been discussed previously:

https://patchwork.openembedded.org/patch/47727/

On 2016-10-29 23:15, Khem Raj wrote:
> On Sat, Oct 29, 2016 at 12:52 PM, Linus <linus.wallgren@scypho.com> wrote:
>> I do believe so, quickly looking through a debian stretch package I found
>> that it uses deb-systemd-helper, as part of the init-system-helpers package,
>> which does reload things if anything changes:
>>
>> https://sources.debian.net/src/init-system-helpers/1.45/script/deb-systemd-helper/#L588
>
> thanks. Seems ok to me.
>
>>
>> On 2016-10-28 20:00, Khem Raj wrote:
>>>
>>>
>>>> On Oct 28, 2016, at 7:36 AM, Linus Wallgren <linus.wallgren@scypho.com>
>>>> wrote:
>>>>
>>>> When a systemd service file has changed it is required to reload
>>>> systemd's configuration. Otherwise changes to a service file will not be
>>>> picked up during package upgrade.
>>>
>>>
>>> while this seems reasonable. Does that happen on other distros using
>>> systemd
>>> too ?
>>>
>>>> ---
>>>> meta/classes/systemd.bbclass | 4 ++++
>>>> 1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
>>>> index d56c760..7e51ed6 100644
>>>> --- a/meta/classes/systemd.bbclass
>>>> +++ b/meta/classes/systemd.bbclass
>>>> @@ -29,6 +29,10 @@ if [ -n "$D" ]; then
>>>> fi
>>>>
>>>> if type systemctl >/dev/null 2>/dev/null; then
>>>> +       if [ -z "$D" ]; then
>>>> +               systemctl daemon-reload
>>>> +       fi
>>>> +
>>>>         systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>>>>
>>>>         if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
>>>> --
>>>> 2.9.3
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

