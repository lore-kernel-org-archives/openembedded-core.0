Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05AAF73810
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 07:35:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2C7ZhsA019252
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Mar 2015 00:35:43 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 12 Mar 2015 00:35:43 -0700
Message-ID: <550141DC.5050704@windriver.com>
Date: Thu, 12 Mar 2015 15:35:56 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1425957930-8061-1-git-send-email-net147@gmail.com>
	<55013CDD.3050708@windriver.com>
	<1C1D4049-981D-4FA6-AC57-7F1AA5B45125@gmail.com>
In-Reply-To: <1C1D4049-981D-4FA6-AC57-7F1AA5B45125@gmail.com>
X-Originating-IP: [128.224.162.236]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: fix /var/log/journal ownership
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
X-List-Received-Date: Thu, 12 Mar 2015 07:35:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2015 03:21 PM, Khem Raj wrote:
>> On Mar 12, 2015, at 12:14 AM, ChenQi <Qi.Chen@windriver.com> wrote:
>>
>> On 03/10/2015 11:25 AM, Jonathan Liu wrote:
>>> The ownership needs to be explicitly set otherwise it inherits the user
>>> and group id of the build user.
>>>
>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>> ---
>>>   meta/recipes-core/systemd/systemd_219.bb | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
>>> index 24486f1..6a4f4e8 100644
>>> --- a/meta/recipes-core/systemd/systemd_219.bb
>>> +++ b/meta/recipes-core/systemd/systemd_219.bb
>>> @@ -147,6 +147,8 @@ do_install() {
>>>   		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
>>>   	fi
>>>   +	chown root:root ${D}/${localstatedir}/log/journal
>>> +
>>>           # Delete journal README, as log can be symlinked inside volatile.
>>>           rm -f ${D}/${localstatedir}/log/README
>>>   
>> I think it should be root:systemd-journal.
>> What do you think?
>>
>> And this patch would also fix the following bug.
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7293
> /var/log is symlinked (its not a copy-bind) into /var/volatile/log and /var/volatile  is mounted as tmpfs on runtime as of now
> so how is this patch helping out with anything ?

Hmm... You are right. I think we should just delete the directory.

//Chen Qi

>> Regards,
>> Chen Qi
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


