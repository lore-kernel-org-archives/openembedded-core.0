Return-Path: <martin@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 39CB77D2AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 10:46:34 +0000 (UTC)
Received: from [10.0.0.10] (unknown [85.184.147.232])
	by first.geanix.com (Postfix) with ESMTPSA id 723C4949;
	Fri, 10 May 2019 10:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1557485140; bh=ZUbshL+9FQNPWn/WUsQWssTR3Xc29uU751nmEzBgbNs=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Z4o7ePiLalnW0Mwu9VT9Unshu6ilHEqt/ycAwKzCpP+skmawmeAUb0vQOK4nnTDWn
	bMKHE5ADL40+5dzYizr1bRoiWWLYn5o3rxOTwB96UWvBAl42YFBuwKnghejUvDQOAp
	rYUqSoNAGtJnVMCSCpDtfaSSBrgK2fe3Ak06qqlcj15KjlW2d+y3zbpZNvhGcgjbJw
	+GCN+yrp9odq9t16KsO/ssy1AwwqvwG1JQaeTcnyiuqiwoAJKz8XPyyMUEulKYZarT
	QvMRsIAQagIYwewihj29idYfbS7OW+rWk1knPLusxjy8CQUXnrfbcI9OURjs8Wo2+g
	CXoysp6+wpWdA==
To: Luca Boccassi <luca.boccassi@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190509214007.13927-1-luca.boccassi@gmail.com>
	<f2b0a420-ed6c-91e2-dd88-399169363349@geanix.com>
	<8c442a101d981e309ce28c8c74ec64fbc849bd6c.camel@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <9fcbc179-921d-177f-63f6-05aa37b4bddd@geanix.com>
Date: Fri, 10 May 2019 12:46:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8c442a101d981e309ce28c8c74ec64fbc849bd6c.camel@gmail.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on 9cf0eadf640b
Subject: Re: [PATCH] systemd: enable portabled by default and install utilities in systemd-container
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
X-List-Received-Date: Fri, 10 May 2019 10:46:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

Hi Luca,

On 10/05/2019 12.45, Luca Boccassi wrote:
> On Fri, 2019-05-10 at 07:23 +0200, Martin Hundebøll wrote:
>> Hi Luca,
>>
>> On 09/05/2019 23.40,
>> luca.boccassi@gmail.com
>>   wrote:
>>> From: Luca Boccassi <
>>> luca.boccassi@microsoft.com
>>>>
>>>
>>> portable services have been declared production ready with v241, so
>>> enable
>>> by default and install the files in the container package.
>>
>> The systemd portables feature is not really related to
>> containers/VM's,
>> so I think it should stay in the primary package; or alternatively in
>> a
>> separate package.
>>
>> // Martin
> 
> Hello Martin,
> 
> IMHO if VM tools and containers tool can go together in this package,
> then portable services utilities can too - they are at different
> positions on the same scale after all :-)
> 
> But I've got no strong opinion, so I'll send a v2 with them moved to
> the main package.

I am planning to use portable services instead of going full container, 
so I would prefer not having the container/vm utils on target :)

// Martin

>>> Signed-off-by: Luca Boccassi <
>>> luca.boccassi@microsoft.com
>>>>
>>> ---
>>>    meta/recipes-core/systemd/systemd_242.bb | 10 ++++++++++
>>>    1 file changed, 10 insertions(+)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_242.bb
>>> b/meta/recipes-core/systemd/systemd_242.bb
>>> index 73e03c7a77..83b00ba785 100644
>>> --- a/meta/recipes-core/systemd/systemd_242.bb
>>> +++ b/meta/recipes-core/systemd/systemd_242.bb
>>> @@ -81,6 +81,7 @@ PACKAGECONFIG ??= " \
>>>        nss \
>>>        nss-mymachines \
>>>        nss-resolve \
>>> +    portabled \
>>>        quotacheck \
>>>        randomseed \
>>>        resolved \
>>> @@ -403,8 +404,10 @@ SYSTEMD_SERVICE_${PN}-remote = "systemd-
>>> journal-remote.socket"
>>>    
>>>    FILES_${PN}-container = "${sysconfdir}/dbus-
>>> 1/system.d/org.freedesktop.import1.conf \
>>>                             ${sysconfdir}/dbus-
>>> 1/system.d/org.freedesktop.machine1.conf \
>>> +                         ${sysconfdir}/dbus-
>>> 1/system.d/org.freedesktop.portable1.conf \
>>>                             ${sysconfdir}/systemd/system/multi-
>>> user.target.wants/machines.target \
>>>                             ${base_bindir}/machinectl \
>>> +                         ${base_bindir}/portablectl \
>>>                             ${bindir}/systemd-nspawn \
>>>                             ${nonarch_libdir}/systemd/import-
>>> pubring.gpg \
>>>                             ${systemd_system_unitdir}/busnames.targe
>>> t.wants/org.freedesktop.import1.busname \
>>> @@ -418,21 +421,28 @@ FILES_${PN}-container = "${sysconfdir}/dbus-
>>> 1/system.d/org.freedesktop.import1.c
>>>                             ${systemd_system_unitdir}/org.freedeskto
>>> p.machine1.busname \
>>>                             ${systemd_system_unitdir}/systemd-
>>> importd.service \
>>>                             ${systemd_system_unitdir}/systemd-
>>> machined.service \
>>> +                         ${systemd_system_unitdir}/systemd-
>>> portabled.service \
>>>                             ${systemd_system_unitdir}/dbus-
>>> org.freedesktop.machine1.service \
>>> +                         ${systemd_system_unitdir}/dbus-
>>> org.freedesktop.portable1.service \
>>>                             ${systemd_system_unitdir}/var-lib-
>>> machines.mount \
>>>                             ${rootlibexecdir}/systemd/systemd-import
>>> \
>>>                             ${rootlibexecdir}/systemd/systemd-
>>> importd \
>>>                             ${rootlibexecdir}/systemd/systemd-
>>> machined \
>>> +                         ${rootlibexecdir}/systemd/systemd-
>>> portabled \
>>>                             ${rootlibexecdir}/systemd/systemd-pull \
>>> +                         ${exec_prefix}/lib/tmpfiles.d/portables.c
>>> onf \
>>>                             ${exec_prefix}/lib/tmpfiles.d/systemd-
>>> nspawn.conf \
>>>                             ${systemd_system_unitdir}/systemd-
>>> nspawn@.service \
>>>                             ${libdir}/libnss_mymachines.so.2 \
>>>                             ${datadir}/dbus-1/system-
>>> services/org.freedesktop.import1.service \
>>>                             ${datadir}/dbus-1/system-
>>> services/org.freedesktop.machine1.service \
>>> +                         ${datadir}/dbus-1/system-
>>> services/org.freedesktop.portable1.service \
>>>                             ${datadir}/dbus-
>>> 1/system.d/org.freedesktop.import1.conf \
>>>                             ${datadir}/dbus-
>>> 1/system.d/org.freedesktop.machine1.conf \
>>> +                         ${datadir}/dbus-
>>> 1/system.d/org.freedesktop.portable1.conf \
>>>                             ${datadir}/polkit-
>>> 1/actions/org.freedesktop.import1.policy \
>>>                             ${datadir}/polkit-
>>> 1/actions/org.freedesktop.machine1.policy \
>>> +                         ${datadir}/polkit-
>>> 1/actions/org.freedesktop.portable1.policy \
>>>                            "
>>>    
>>>    RRECOMMENDS_${PN}-container += "\
>>>
>>
>>

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix ApS
https://geanix.com
DK39600706

