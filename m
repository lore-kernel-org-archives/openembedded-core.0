Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14D187E169
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 07:52:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4L7qIK1001192
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 May 2019 00:52:19 -0700 (PDT)
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 21 May 2019 00:52:18 -0700
Message-ID: <5CE3AE31.9050909@windriver.com>
Date: Tue, 21 May 2019 15:52:17 +0800
From: Liwei Song <liwei.song@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1557974500-224120-1-git-send-email-liwei.song@windriver.com>
	<9ad65fe0-8a88-9413-7f2d-0cc855395721@gmail.com>
	<5CE360A2.10907@windriver.com>
	<CAMKF1srS9Dh2D+ufQhgNKkEV5zP7=moVe1R83B811bTQHe4A+A@mail.gmail.com>
In-Reply-To: <CAMKF1srS9Dh2D+ufQhgNKkEV5zP7=moVe1R83B811bTQHe4A+A@mail.gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mdadm: install the systemd service through Makefile
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
X-List-Received-Date: Tue, 21 May 2019 07:52:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 05/21/2019 02:43 PM, Khem Raj wrote:
> On Mon, May 20, 2019 at 7:21 PM Liwei Song <liwei.song@windriver.com> wrote:
>>
>>
>>
>> On 05/21/2019 05:18 AM, Khem Raj wrote:
>>>
>>>
>>> On 5/15/19 7:41 PM, Liwei Song wrote:
>>>> The original mdadm service may include variable like BINDIR,
>>>> It should use the real value of it, since the install method
>>>> "install-systemd" in Makefile can easily do such work, so don't
>>>> install it in bb file manually, use "make install-systemd" to
>>>> install all the service of mdadm.
>>>>
>>>> Signed-off-by: Liwei Song <liwei.song@windriver.com>
>>>> ---
>>>>   meta/recipes-extended/mdadm/mdadm_4.1.bb | 10 +++++++---
>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
>>>> index 4168ce4d0cb8..a4b9ef94799f 100644
>>>> --- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
>>>> +++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
>>>> @@ -55,13 +55,15 @@ do_install() {
>>>>   do_install_append() {
>>>>           install -d ${D}/${sysconfdir}/
>>>>           install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
>>>> -        install -d ${D}/${systemd_unitdir}/system
>>>> -        install -m 644 ${WORKDIR}/mdmonitor.service ${D}/${systemd_unitdir}/system
>>>> -        install -m 644 ${S}/systemd/mdmon@.service ${D}/${systemd_unitdir}/system
>>>>           install -d ${D}/${sysconfdir}/init.d
>>>>           install -m 755 ${WORKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
>>>>   }
>>>>   +do_install_append() {
>>>> +        oe_runmake install-systemd DESTDIR=${D}
>>>> +}
>>>
>>> perhaps this should be guarded with systemd being in DISTRO_FEATURES check.
>>
>> Hi Khem,
>>
>> Do you mean all the service file need to be added to SYSTEMD_SERVICE_${PN} ?
>>
> 
> I mean to check for systemd in DISTRO_FEATURE like
> if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> ...
> else
> ...
> fi

Understand, thanks.

Liwei.


> 
>> Thanks,
>> Liwei.
>>
>>
>>>
>>>> +
>>>> +
>>>>   do_compile_ptest() {
>>>>       oe_runmake test
>>>>   }
>>>> @@ -88,3 +90,5 @@ RRECOMMENDS_${PN}-ptest += " \
>>>>       kernel-module-raid10 \
>>>>       kernel-module-raid456 \
>>>>   "
>>>> +
>>>> +FILES_${PN} += "/lib/systemd/*"
>>>>
>>>
>>>
> 
> 

