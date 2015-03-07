Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 32E25738FA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2015 19:38:11 +0000 (UTC)
Received: by iecrl12 with SMTP id rl12so11072054iec.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2015 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=d9jBjFlmCtbV0MeKJ53BNZC1TWfI7V3uyxsQf05wro8=;
	b=aPAQlRwTiVgNRax/84hHHhvpIv8xm1h4J9io8MbAhNWYxIh4nASCFts2v0enZfwRnu
	hzO14//w6s7r+DFe9HwElFR+3Dg+2n0hx99iZw1/zvxjab7Pezdsu+0OBgfI16ZVznlt
	sPI9tV5TYiTK/Rkjg51DKCHhzY1qvsoc16Ztf+aQczFOnaUgAG/uriSGNMbpWUTeUj4x
	zD/ZC6OketBNBQC0TcoF6IOoESVxULS3q5VOjsaKUaOxV4noyZ0yq9YAu9gWFL59Rr99
	M6SEnenNH4ldHEEaZu+dvuY16X3L9ZNxD1kb/BVrc0WOC7fFWJxmpHjmSoTHhzdctrch
	VjxQ==
X-Received: by 10.50.28.8 with SMTP id x8mr36455938igg.19.1425757093115; Sat,
	07 Mar 2015 11:38:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Sat, 7 Mar 2015 11:37:42 -0800 (PST)
In-Reply-To: <F29A110F-58F7-4878-ACFA-B1683AEFD651@gmail.com>
References: <1425607906-21810-1-git-send-email-randy.e.witt@linux.intel.com>
	<CAMKF1soVNp5GsNKOkmZRCb9KUkzFcRW337smGBs9YNtVu3XNWQ@mail.gmail.com>
	<64249.10.254.177.107.1425621678.squirrel@linux.intel.com>
	<F29A110F-58F7-4878-ACFA-B1683AEFD651@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Mar 2015 11:37:42 -0800
Message-ID: <CAMKF1srpq6+Z_S6dZSwZvJ3Xg9W_fvqHPVbKpHw9VM4KBTxckw@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Fix the problem of an empty journal on boot
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
X-List-Received-Date: Sat, 07 Mar 2015 19:38:17 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 6, 2015 at 1:18 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mar 5, 2015, at 10:01 PM, randy.e.witt@linux.intel.com wrote:
>>
>>> On Mar 5, 2015 6:13 PM, "Randy Witt" <randy.e.witt@linux.intel.com> wrote:
>>>>
>>>> systemd by default tries to write the journal to /var/log/journal.
>>>> But base-files has a symlink /var/log -> /var/volatile/log. And
>>>> /var/volatile is a tmpfs mount in /etc/fstab.
>>>>
>>>> If the journal service started before /var/volatile was mounted (which
>>>> was the typical scenario) then the journal would appear empty since
>>>> the old location was mounted over.
>>>>
>>>> This change fixes the problem by ensuring that the journal doesn't start
>>>> until after the mount happens.
>>>>
>>>
>>> What happens if folks have a different fstab then default? Will it still
>>> work
>>
>> Yes, the "After" only changes behavior if something else has caused
>> var-volatile.mount to be in the set of services to be started.
>>
>> I verified that was the case by removing /var/volatile from /etc/fstab and
>> the journal still starts with no errors.
>
> perfect thanks. I will test it out in few hrs myself.

for some reason, my console never comes up now. I am not sure if this
is the patch causing it. I will try to single it out.

>
>>
>>>> [Yocto #7388]
>>>>
>>>> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>>>> ---
>>>> meta/recipes-core/systemd/systemd/journald-volatile.conf | 6 ++++++
>>>> meta/recipes-core/systemd/systemd_219.bb                 | 2 ++
>>>> 2 files changed, 8 insertions(+)
>>>> create mode 100644
>>> meta/recipes-core/systemd/systemd/journald-volatile.conf
>>>>
>>>> diff --git a/meta/recipes-core/systemd/systemd/journald-volatile.conf
>>> b/meta/recipes-core/systemd/systemd/journald-volatile.conf
>>>> new file mode 100644
>>>> index 0000000..b11e160
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/systemd/systemd/journald-volatile.conf
>>>> @@ -0,0 +1,6 @@
>>>> +# If /var/volatile is a mount point then make sure to mount it before
>>>> +# the journal starts. This is because base-files creates a symlink
>>>> +# /var/log -> /var/volatile/log. And if the journal starts before the
>>> mount
>>>> +# happens, the journal will appear empty until restarted.
>>>> +[Unit]
>>>> +After=var-volatile.mount
>>>> diff --git a/meta/recipes-core/systemd/systemd_219.bb
>>> b/meta/recipes-core/systemd/systemd_219.bb
>>>> index 3c4b6cf..2be66af 100644
>>>> --- a/meta/recipes-core/systemd/systemd_219.bb
>>>> +++ b/meta/recipes-core/systemd/systemd_219.bb
>>>> @@ -48,6 +48,7 @@ SRC_URI = "git://
>>> anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
>>>>            file://00-create-volatile.conf \
>>>>            file://init \
>>>>            file://run-ptest \
>>>> +           file://journald-volatile.conf \
>>>>           "
>>>>
>>>> S = "${WORKDIR}/git"
>>>> @@ -143,6 +144,7 @@ do_install() {
>>>>        install -m 0644 ${WORKDIR}/*.rules
>>>> ${D}${sysconfdir}/udev/rules.d/
>>>>
>>>>        install -m 0644 ${WORKDIR}/00-create-volatile.conf
>>> ${D}${sysconfdir}/tmpfiles.d/
>>>> +       install -D -m 0644 ${WORKDIR}/journald-volatile.conf
>>> ${D}${systemd_unitdir}/system/systemd-journald.service.d/journald-volatile.conf
>>>>
>>>>        if
>>> ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
>>>>                install -d ${D}${sysconfdir}/init.d
>>>> --
>>>> 1.9.3
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

