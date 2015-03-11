Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 23840739CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 04:48:45 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so7969928pdj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 21:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=/5s/xQwflE8ioLh4mD5AqwzwAbysrRwl4F7U3A6f7Uc=;
	b=Bx4tBHgSaw77smeesSzLRu2h+G9xNneoWtrJ1bYnGZl6raBVnNt2ZX+gi4faHUgsee
	VgWQHCv1lzaX4+dKTDs+sVLtF4yQGDwdlVjDF9nsySQoVPnmOa3JDOm11QcVybZv03jn
	okljis38x0iwDaOXXUu1RAVEVkmcUwaZQCm45VB/KNViPvsFrqQZy8dcQzSQOt00YzPf
	6D9VxXT9bsOH8ayAAcKZ7sGmFGLkjUOkGPIlCyfDpsUt4p7ciUdbeRiE8X49JMjlCZrv
	eaAGlRL3tQI+V6LGdsDJnbFpyoEDslhhl8M/0Q+gsk8/9MOVDAiWmDMOb9poLP5ucP7L
	hGqA==
X-Received: by 10.66.66.166 with SMTP id g6mr74326216pat.88.1426049327367;
	Tue, 10 Mar 2015 21:48:47 -0700 (PDT)
Received: from 10.25.113.106-ra01.pleasanton.ca.sfba.comcast.net
	([69.241.124.150])
	by mx.google.com with ESMTPSA id qv9sm3642690pab.27.2015.03.10.21.48.45
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Mar 2015 21:48:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1srpq6+Z_S6dZSwZvJ3Xg9W_fvqHPVbKpHw9VM4KBTxckw@mail.gmail.com>
Date: Tue, 10 Mar 2015 21:48:45 -0700
Message-Id: <F6AE3B74-9753-4302-AB1A-12BEFBC2D2DA@gmail.com>
References: <1425607906-21810-1-git-send-email-randy.e.witt@linux.intel.com>
	<CAMKF1soVNp5GsNKOkmZRCb9KUkzFcRW337smGBs9YNtVu3XNWQ@mail.gmail.com>
	<64249.10.254.177.107.1425621678.squirrel@linux.intel.com>
	<F29A110F-58F7-4878-ACFA-B1683AEFD651@gmail.com>
	<CAMKF1srpq6+Z_S6dZSwZvJ3Xg9W_fvqHPVbKpHw9VM4KBTxckw@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
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
X-List-Received-Date: Wed, 11 Mar 2015 04:48:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 7, 2015, at 11:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> On Fri, Mar 6, 2015 at 1:18 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Mar 5, 2015, at 10:01 PM, randy.e.witt@linux.intel.com wrote:
>>>=20
>>>> On Mar 5, 2015 6:13 PM, "Randy Witt" <randy.e.witt@linux.intel.com> =
wrote:
>>>>>=20
>>>>> systemd by default tries to write the journal to /var/log/journal.
>>>>> But base-files has a symlink /var/log -> /var/volatile/log. And
>>>>> /var/volatile is a tmpfs mount in /etc/fstab.
>>>>>=20
>>>>> If the journal service started before /var/volatile was mounted =
(which
>>>>> was the typical scenario) then the journal would appear empty =
since
>>>>> the old location was mounted over.
>>>>>=20
>>>>> This change fixes the problem by ensuring that the journal doesn't =
start
>>>>> until after the mount happens.
>>>>>=20
>>>>=20
>>>> What happens if folks have a different fstab then default? Will it =
still
>>>> work
>>>=20
>>> Yes, the "After" only changes behavior if something else has caused
>>> var-volatile.mount to be in the set of services to be started.
>>>=20
>>> I verified that was the case by removing /var/volatile from =
/etc/fstab and
>>> the journal still starts with no errors.
>>=20
>> perfect thanks. I will test it out in few hrs myself.
>=20
> for some reason, my console never comes up now. I am not sure if this
> is the patch causing it. I will try to single it out.

This patch should not be applied, but I see it has been applied anyway =
meanwhile, So we might have to solve this issue differently.=20

This is actually the cause of my console not coming up. It was coming up =
after 15 minutes
systemd-analyse blame said systemd-tmpfiles-setup-dev.service is taking =
14 mins to come up.
I then traced through it and the problem is evident that its trying to =
write journal when creating /dev entries but we have delayed the =
journald starting point and caused a use-before-define situation.
I deleted /var/volatile symlinks and let /var/log be proper directory =
and same for /var/tmp. All worked fine, without this patch. We should =
probably stop doing /var/volatile thing anyway its not in FHS standard =
either, for ro-rfs do something else ( may be copy-binds into /tmp/) and =
for general case just leave it alone.=20

00:04:23 read(4, "#  This file is part of systemd."..., 4096) =3D 1244
00:04:23 sendmsg(3, {msg_name(0)=3DNULL, =
msg_iov(4)=3D[{"PRIORITY=3D7\nSYSLOG_FACILITY=3D3\nCOD"..., 284}, =
{"MESSAGE=3D", 8}, {"Entry \"/run/user\" does not match"..., 62}, {"\n", =
1}], msg_controllen=3D0, msg_flags=3D0}, MSG_NOSIGNAL) =3D -1 EAGAIN =
(Reso
urce temporarily unavailable)
00:04:33 writev(5, [{"<31>", 4}, {"systemd-tmpfiles", 16}, {"[114]: ", =
7}, {"Entry \"/run/user\" does not match"..., 62}, {"\n", 1}], 5) =3D 90
00:04:33 sendmsg(3, {msg_name(0)=3DNULL, =
msg_iov(4)=3D[{"PRIORITY=3D7\nSYSLOG_FACILITY=3D3\nCOD"..., 284}, =
{"MESSAGE=3D", 8}, {"Entry \"/run/utmp\" does not match"..., 62}, {"\n", =
1}], msg_controllen=3D0, msg_flags=3D0}, MSG_NOSIGNAL) =3D -1 EAGAIN =
(Reso
urce temporarily unavailable)
00:04:43 writev(5, [{"<31>", 4}, {"systemd-tmpfiles", 16}, {"[114]: ", =
7}, {"Entry \"/run/utmp\" does not match"..., 62}, {"\n", 1}], 5) =3D 90
00:04:43 sendmsg(3, {msg_name(0)=3DNULL, =
msg_iov(4)=3D[{"PRIORITY=3D7\nSYSLOG_FACILITY=3D3\nCOD"..., 284}, =
{"MESSAGE=3D", 8}, {"Entry \"/run/systemd/ask-password"..., 78}, {"\n", =
1}], msg_controllen=3D0, msg_flags=3D0}, MSG_NOSIGNAL) =3D -1 EAGAIN =
(Resou
rce temporarily unavailable)
00:04:53 writev(5, [{"<31>", 4}, {"systemd-tmpfiles", 16}, {"[114]: ", =
7}, {"Entry \"/run/systemd/ask-password"..., 78}, {"\n", 1}], 5) =3D 106
00:04:53 sendmsg(3, {msg_name(0)=3DNULL, =
msg_iov(4)=3D[{"PRIORITY=3D7\nSYSLOG_FACILITY=3D3\nCOD"..., 284}, =
{"MESSAGE=3D", 8}, {"Entry \"/run/systemd/seats\" does "..., 71}, {"\n", =
1}], msg_controllen=3D0, msg_flags=3D0}, MSG_NOSIGNAL) =3D -1 EAGAIN =
(Reso
urce temporarily unavailable)
00:05:03 writev(5, [{"<31>", 4}, {"systemd-tmpfiles", 16}, {"[114]: ", =
7}, {"Entry \"/run/systemd/seats\" does "..., 71}, {"\n", 1}], 5) =3D 99
00:05:03 sendmsg(3, {msg_name(0)=3DNULL, =
msg_iov(4)=3D[{"PRIORITY=3D7\nSYSLOG_FACILITY=3D3\nCOD"..., 284}, =
{"MESSAGE=3D", 8}, {"Entry \"/run/systemd/sessions\" do"..., 74}, {"\n", =
1}], msg_controllen=3D0, msg_flags=3D0}, MSG_NOSIGNAL) =3D -1 EAGAIN =
(Reso
urce temporarily unavailable)
00:05:13 writev(5, [{"<31>", 4}, {"systemd-tmpfiles", 16}, {"[114]: ", =
7}, {"Entry \"/run/systemd/sessions\" do"..., 74}, {"\n", 1}], 5) =3D =
102
00:05:13 sendmsg(3, {msg_name(0)=3DNULL, =
msg_iov(4)=3D[{"PRIORITY=3D7\nSYSLOG_FACILITY=3D3\nCOD"..., 284}, =
{"MESSAGE=3D", 8}, {"Entry \"/run/systemd/users\" does "..., 71}, {"\n", =
1}], msg_controllen=3D0, msg_flags=3D0}, MSG_NOSIGNAL) =3D -1 EAGAIN =
(Reso
urce temporarily unavailable)
00:05:23 writev(5, [{"<31>", 4}, {"systemd-tmpfiles", 16}, {"[114]: ", =
7}, {"Entry \"/run/systemd/users\" does "..., 71}, {"\n", 1}], 5) =3D 99
00:05:23 sendmsg(3, {msg_name(0)=3DNULL, =
msg_iov(4)=3D[{"PRIORITY=3D7\nSYSLOG_FACILITY=3D3\nCOD"..., 284}, =
{"MESSAGE=3D", 8}, {"Entry \"/run/systemd/machines\" do"..., 74}, {"\n", =
1}], msg_controllen=3D0, msg_flags=3D0}, MSG_NOSIGNAL) =3D -1 EAGAIN =
(Reso
urce temporarily unavailable)
00:05:33 writev(5, [{"<31>", 4}, {"systemd-tmpfiles", 16}, {"[114]: ", =
7}, {"Entry \"/run/systemd/machines\" do"..., 74}, {"\n", 1}], 5) =3D =
102
00:05:33 sendmsg(3, {msg_name(0)=3DNULL, =
msg_iov(4)=3D[{"PRIORITY=3D7\nSYSLOG_FACILITY=3D3\nCOD"..., 284}, =
{"MESSAGE=3D", 8}, {"Entry \"/run/systemd/shutdown\" do"..., 74}, {"\n", =
1}], msg_controllen=3D0, msg_flags=3D0}, MSG_NOSIGNAL) =3D -1 EAGAIN =
(Reso
urce temporarily unavailable)
00:05:43 writev(5, [{"<31>", 4}, {"systemd-tmpfiles", 16}, {"[114]: ", =
7}, {"Entry \"/run/systemd/shutdown\" do"..., 74}, {"\n", 1}], 5) =3D =
102
00:05:43 sendmsg(3, {msg_name(0)=3DNULL, =
msg_iov(4)=3D[{"PRIORITY=3D7\nSYSLOG_FACILITY=3D3\nCOD"..., 284}, =
{"MESSAGE=3D", 8}, {"Entry \"/run/log\" does not match "..., 61}, {"\n", =
1}], msg_controllen=3D0, msg_flags=3D0}, MSG_NOSIGNAL) =3D -1 EAGAIN =
(Reso
urce temporarily unavailable)
00:05:53 writev(5, [{"<31>", 4}, {"systemd-tmpfiles", 16}, {"[114]: ", =
7}, {"Entry \"/run/log\" does not match "..., 61}, {"\n", 1}], 5) =3D 89
00:05:53 sendmsg(3, {msg_name(0)=3DNULL, =
msg_iov(4)=3D[{"PRIORITY=3D7\nSYSLOG_FACILITY=3D3\nCOD"..., 284}, =
{"MESSAGE=3D", 8}, {"Entry \"/run/log/journal\" does no"..., 69}, {"\n", =
1}], msg_controllen=3D0, msg_flags=3D0}, MSG_NOSIGNAL) =3D -1 EAGAIN =
(Reso
urce temporarily unavailable)
00:06:03 writev(5, [{"<31>", 4}, {"systemd-tmpfiles", 16}, {"[114]: ", =
7}, {"Entry \"/run/log/journal\" does no"..., 69}, {"\n", 1}], 5) =3D 97
00:06:03 open("/etc/machine-id", =
O_RDONLY|O_NOCTTY|O_LARGEFILE|O_CLOEXEC) =3D 6



