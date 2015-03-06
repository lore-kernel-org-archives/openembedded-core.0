Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id E4E93738C9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 09:18:41 +0000 (UTC)
Received: by padet14 with SMTP id et14so26165395pad.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 01:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=S9fdJeRb83JYLVqo6DzPvBFQkX6CRVEWMDcEPLpoymw=;
	b=xJ6wuPNXX97tTo7zK9f6PK/P4RFSdo8EcMGCYg8NqzZNf+zFbIuJybwuEWuCyEkfSp
	brAZvPnWdwAFGuNbDLn9gjA8ytgzS+wnJy4xNGNzq0McVLeI6fFbaBQ2vqF4mYmUtHB3
	93OZphyd57+wB7eZp5NhV1ZdGhOw4Uf0FUO2L7bOB7TSwZE0YnHNjOgjXJaiUMo+94qd
	+qoKLZiXdrQ3svP0q/QlDQchXPhCpV7bqKdZCqsc0mxeo6OkpuTmxGOMRfB5rywYJTd5
	+N1FTnVxtJi+Aux8hrPyMQPTkAZYLbWyPrc/phD5tmsBK+P4eF6Qeim4WtmQUod1JwC0
	kRMQ==
X-Received: by 10.66.154.17 with SMTP id vk17mr23601774pab.5.1425633522595;
	Fri, 06 Mar 2015 01:18:42 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:c942:8a96:3860:e4e6?
	([2601:9:3580:84c:c942:8a96:3860:e4e6])
	by mx.google.com with ESMTPSA id d9sm9108571pdk.3.2015.03.06.01.18.41
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Mar 2015 01:18:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
X-Priority: 3 (Normal)
In-Reply-To: <64249.10.254.177.107.1425621678.squirrel@linux.intel.com>
Date: Fri, 6 Mar 2015 01:18:40 -0800
Message-Id: <F29A110F-58F7-4878-ACFA-B1683AEFD651@gmail.com>
References: <1425607906-21810-1-git-send-email-randy.e.witt@linux.intel.com>
	<CAMKF1soVNp5GsNKOkmZRCb9KUkzFcRW337smGBs9YNtVu3XNWQ@mail.gmail.com>
	<64249.10.254.177.107.1425621678.squirrel@linux.intel.com>
To: randy.e.witt@linux.intel.com
X-Mailer: Apple Mail (2.2070.6)
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
X-List-Received-Date: Fri, 06 Mar 2015 09:18:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


> On Mar 5, 2015, at 10:01 PM, randy.e.witt@linux.intel.com wrote:
>=20
>> On Mar 5, 2015 6:13 PM, "Randy Witt" <randy.e.witt@linux.intel.com> =
wrote:
>>>=20
>>> systemd by default tries to write the journal to /var/log/journal.
>>> But base-files has a symlink /var/log -> /var/volatile/log. And
>>> /var/volatile is a tmpfs mount in /etc/fstab.
>>>=20
>>> If the journal service started before /var/volatile was mounted =
(which
>>> was the typical scenario) then the journal would appear empty since
>>> the old location was mounted over.
>>>=20
>>> This change fixes the problem by ensuring that the journal doesn't =
start
>>> until after the mount happens.
>>>=20
>>=20
>> What happens if folks have a different fstab then default? Will it =
still
>> work
>=20
> Yes, the "After" only changes behavior if something else has caused
> var-volatile.mount to be in the set of services to be started.
>=20
> I verified that was the case by removing /var/volatile from /etc/fstab =
and
> the journal still starts with no errors.

perfect thanks. I will test it out in few hrs myself.

>=20
>>> [Yocto #7388]
>>>=20
>>> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>>> ---
>>> meta/recipes-core/systemd/systemd/journald-volatile.conf | 6 ++++++
>>> meta/recipes-core/systemd/systemd_219.bb                 | 2 ++
>>> 2 files changed, 8 insertions(+)
>>> create mode 100644
>> meta/recipes-core/systemd/systemd/journald-volatile.conf
>>>=20
>>> diff --git =
a/meta/recipes-core/systemd/systemd/journald-volatile.conf
>> b/meta/recipes-core/systemd/systemd/journald-volatile.conf
>>> new file mode 100644
>>> index 0000000..b11e160
>>> --- /dev/null
>>> +++ b/meta/recipes-core/systemd/systemd/journald-volatile.conf
>>> @@ -0,0 +1,6 @@
>>> +# If /var/volatile is a mount point then make sure to mount it =
before
>>> +# the journal starts. This is because base-files creates a symlink
>>> +# /var/log -> /var/volatile/log. And if the journal starts before =
the
>> mount
>>> +# happens, the journal will appear empty until restarted.
>>> +[Unit]
>>> +After=3Dvar-volatile.mount
>>> diff --git a/meta/recipes-core/systemd/systemd_219.bb
>> b/meta/recipes-core/systemd/systemd_219.bb
>>> index 3c4b6cf..2be66af 100644
>>> --- a/meta/recipes-core/systemd/systemd_219.bb
>>> +++ b/meta/recipes-core/systemd/systemd_219.bb
>>> @@ -48,6 +48,7 @@ SRC_URI =3D "git://
>> anongit.freedesktop.org/systemd/systemd;branch=3Dmaster;protocol=3D
>>>            file://00-create-volatile.conf \
>>>            file://init \
>>>            file://run-ptest \
>>> +           file://journald-volatile.conf \
>>>           "
>>>=20
>>> S =3D "${WORKDIR}/git"
>>> @@ -143,6 +144,7 @@ do_install() {
>>>        install -m 0644 ${WORKDIR}/*.rules
>>> ${D}${sysconfdir}/udev/rules.d/
>>>=20
>>>        install -m 0644 ${WORKDIR}/00-create-volatile.conf
>> ${D}${sysconfdir}/tmpfiles.d/
>>> +       install -D -m 0644 ${WORKDIR}/journald-volatile.conf
>> =
${D}${systemd_unitdir}/system/systemd-journald.service.d/journald-volatile=
.conf
>>>=20
>>>        if
>> ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; =
then
>>>                install -d ${D}${sysconfdir}/init.d
>>> --
>>> 1.9.3
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


