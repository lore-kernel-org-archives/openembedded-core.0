Received: from mail-ob0-f171.google.com ([209.85.214.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UN2GC-0000o0-RA
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 16:32:29 +0200
Received: by mail-ob0-f171.google.com with SMTP id x4so397235obh.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Ya2xNJD86dbgHsMyFwCxfEjEKiNfIVL6aRXNlZMacw0=;
	b=WQ/Tp4Z4CVKX7oa8nyr1QxsXogweqB8bEfxC5I93PtaUlPX9aGBEIlq3Lmcg0QBWl/
	b/OT1jKPT2wCZje+i7ckpdk+t3LKnmGSIqHz3IKu/zBSK0dsP0tdmeJWed+uCBxK2en2
	C78psMLOFhtmNnyIX3+NH0hTza9Mia3oKphWyibh3cv/qEp+SEeEzhPmxG3J2XkQt/GF
	JoQdDP2dpp/BnsNy3GRR2NecmKYQgvQgC1YaFJ9clO7vxskNs1oTrNDpUY6s+0BXGJ8k
	DkmtLGguL1faThhRT17hHiSbyQJnMSnGYmBACT0YXqHoGK6VrV4LetQFQ5VYZR3zU3Jd
	YIfg==
MIME-Version: 1.0
X-Received: by 10.182.72.5 with SMTP id z5mr5621217obu.24.1364912118422; Tue,
	02 Apr 2013 07:15:18 -0700 (PDT)
Received: by 10.60.46.69 with HTTP; Tue, 2 Apr 2013 07:15:18 -0700 (PDT)
In-Reply-To: <515ADEA3.5030800@intel.com>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
Date: Tue, 2 Apr 2013 16:15:18 +0200
Message-ID: <CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2013 14:32:29 -0000
Content-Type: text/plain; charset=UTF-8

2013/4/2 Radu Moisan <radu.moisan@intel.com>:
>
> On 04/02/2013 04:02 PM, Samuel Stirtzel wrote:
>>
>> 2013/4/2 Radu Moisan <radu.moisan@intel.com>:
>>>
>>> This fixes a service dependency issue;
>>> While graphical.target is the default mode, systemd
>>> will try to start display-manager.service which is not
>>> available.
>>>
>>> For xserver-nodm-init we would then have something like:
>>> inherit update-alternatives
>>> ALTERNATIVE_${PN} = "systemd-def-target"
>>> ALTERNATIVE_TARGET[systemd-def-target] =
>>> "${systemd_unitdir}/system/graphical.target"
>>> ALTERNATIVE_LINK_NAME[systemd-def-target] =
>>> "${systemd_unitdir}/system/default.target"
>>> ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"
>>>
>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>> ---
>>>   meta/recipes-core/systemd/systemd_199.bb |    2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_199.bb
>>> b/meta/recipes-core/systemd/systemd_199.bb
>>> index ba1d133..bf1eb39 100644
>>> --- a/meta/recipes-core/systemd/systemd_199.bb
>>> +++ b/meta/recipes-core/systemd/systemd_199.bb
>>> @@ -248,6 +248,7 @@ update-alternatives --install ${base_sbindir}/halt
>>> halt ${base_bindir}/systemctl
>>>   update-alternatives --install ${base_sbindir}/reboot reboot
>>> ${base_bindir}/systemctl 300
>>>   update-alternatives --install ${base_sbindir}/shutdown shutdown
>>> ${base_bindir}/systemctl 300
>>>   update-alternatives --install ${base_sbindir}/poweroff poweroff
>>> ${base_bindir}/systemctl 300
>>> +update-alternatives --install ${systemd_unitdir}/system/default.target
>>> systemd-def-target ${systemd_unitdir}/system/multi-user.target 1
>>>   }
>>>
>>>   pkg_prerm_systemd () {
>>> @@ -256,6 +257,7 @@ update-alternatives --remove halt
>>> ${base_bindir}/systemctl
>>>   update-alternatives --remove reboot ${base_bindir}/systemctl
>>>   update-alternatives --remove shutdown ${base_bindir}/systemctl
>>>   update-alternatives --remove poweroff ${base_bindir}/systemctl
>>> +update-alternatives --remove systemd-def-target
>>> ${systemd_unitdir}/system/multi-user.target
>>>   }
>>>
>>>   pkg_postinst_udev-hwdb () {
>>> --
>>> 1.7.9.5
>>>
>> Reliving a dejavu?
>>
>> This was already rejected before see [1], hope you remember this.
>>
>> [1]
>> http://lists.linuxtogo.org/pipermail/openembedded-core/2013-January/034806.html
>
> It was not rejected, have you seen a nack from Ross? Actually I just checked
> a few days ago with Ross and the reason it didn't merge was because it
> didn't apply anymore. And because systemd upgrade to v199 was pending I
> waited for that one to get pulled in. So now with systemd_199 in, here is my
> rebased v3 as well.
>
> There is a bug filled for this problem Bug#3816, do you have a better
> solution in mind?

Sorry, my terminology may be different.
For me rejected means that the community did not agree with a change,
otherwise I would have stated that it was NACKed previously.


To comment on this change:
A developer would expect that a system (hardware or software) behaves
in a specific matter (the default behavior).
By changing the default, the system behavior is undefined (as the
default behavior was changed).

Every developer who designed a component for (or based upon) the
system assumed that it is using the default behavior.
But this patch breaks this behavior for incoherent reasons.

With this change all other modules have to be adapted for this
behavior instead of just "let it work as it was designed".


As alternative of changing the default I would propose that a
specialization overrides this symlink where needed, and the
generalization stays unchanged (like OOP inheritance).
Therefore a specialization would be image configurations or
postinstall appends for images that have no need for the graphical
user target.


PS: I really hope that this statement is plausible enough to not jump
into the abyss of changing software in a way it was not designed.
PPS: If you would have sent this yesterday I would have taken it for
an "April Fools' Day" hoax [1]


[1] For people unaware of this "informal holiday"
http://en.wikipedia.org/wiki/April_Fools%27_Day

--
Regards
Samuel


