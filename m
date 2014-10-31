Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3A67F65D3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 07:22:19 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so515771wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 00:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=GO6NyJFTXU53Nr0CP+b30+8hKgju9ydsUrHmgVkBqyU=;
	b=HCIaUNV+FsFh3m39fcEH6qpVHb6cGxGVR7UcepSejn1e1jdZL+1l9/8Jlsx76W3upO
	H+uxv1WEwhxv1UhyCZxosLzAYhqmnjVpvjNH+uvKhrnJ3eLX8kXUDY2zArHrsRQfzkcG
	tz0uYQVbx/0UjtZ7/gqG3l2kdFrhL4rynRzA4REJ6fdyAeZaYyIw+8EkJGKJ2utT3NKr
	nPBu6QYRrn6H/LSDQ7eDwNiwBniuYOn24DHqb2uFNkU6lWe0pn78nGmWbLAPu2xb59L1
	BFEc4W7LinIEI2bEKl4aMlnFGEYpMLBVoEzaG3J6fCbfQWOehacn3SN3Wfe8vZHif71n
	8u2w==
X-Gm-Message-State: ALoCoQl2Lugas6BrlXNJU58dihmdq090yI+H9vGQFAmXfz381BHO9FLdQiPmubWVRqYfaPcosXSR
X-Received: by 10.194.104.170 with SMTP id gf10mr26407455wjb.88.1414740140030; 
	Fri, 31 Oct 2014 00:22:20 -0700 (PDT)
Received: from ?IPv6:2001:610:612::6db5:d436:8f57:324a?
	([2001:610:612:0:6db5:d436:8f57:324a])
	by mx.google.com with ESMTPSA id t9sm11086558wjf.41.2014.10.31.00.22.18
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Oct 2014 00:22:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5452FB02.4040206@windriver.com>
Date: Fri, 31 Oct 2014 08:22:17 +0100
Message-Id: <5119E558-0182-4F53-80DC-F4E62FA2E42A@dominion.thruhere.net>
References: <cover.1414659743.git.Qi.Chen@windriver.com>
	<33a3b945ec946aa6f0fba68afe7242c3cf8c0fc9.1414659743.git.Qi.Chen@windriver.com>
	<6DFFE445-39DB-47D1-97F2-04CA26866DEC@dominion.thruhere.net>
	<5452FB02.4040206@windriver.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libpam: add system-auth in case of systemd
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
X-List-Received-Date: Fri, 31 Oct 2014 07:22:28 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


> Op 31 okt. 2014, om 03:59 heeft ChenQi <Qi.Chen@windriver.com> het =
volgende geschreven:
>=20
> On 10/30/2014 09:27 PM, Koen Kooi wrote:
>>> Op 30 okt. 2014, om 10:08 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:
>>>=20
>>> systemd needs this file to be there because one of its configuration =
file
>>> in pam.d, systemd-user, requires it. Otherwise, we would have errors =
like
>>> below.
>>>=20
>>>    systemd: PAM _pam_load_conf_file: unable to open =
/etc/pam.d/system-auth
>> Isn't it the same as 'common-auth'? ISTR this is due to debian vs =
fedora naming of PAM stuff. I think it would make more sense to check =
what systemd actually wants and then see if a symlink to common-auth or =
patching systemd to use common-auth is the right answer instead of =
blindly adding system-auth.
>>=20
>> regards,
>>=20
>> Koen
>>=20
>=20
> Hi Koen,
>=20
> An alternative is to patch systemd's source code to change the =
systemd-user configuration file.
>=20
> In fact, I have seen patches in OE whose purpose is merely changing =
'system-auth' to 'common-auth' in the pam configuration files of the =
packages.
>=20
> So we have two options here:
> 1. Provide system-auth
> 2. Patch packages that make use of system-auth and maintain those =
patches.
>=20
> I think solution 1 is more reasonable but if you and other people in =
community think that solution 2 can bring us more benefits, I can send =
out a patch using solution 2.

Solution 1) introduces a new PAM file that seems to do the same as one =
of the common-<foo> files we have. So from a reuse and maintainability =
standpoint 2) would be better.

regards,

Koen



>=20
> Best Regards,
> Chen Qi
>=20
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>> meta/recipes-extended/pam/libpam/pam.d/system-auth | 12 ++++++++++++
>>> meta/recipes-extended/pam/libpam_1.1.6.bb          |  1 +
>>> 2 files changed, 13 insertions(+)
>>> create mode 100644 =
meta/recipes-extended/pam/libpam/pam.d/system-auth
>>>=20
>>> diff --git a/meta/recipes-extended/pam/libpam/pam.d/system-auth =
b/meta/recipes-extended/pam/libpam/pam.d/system-auth
>>> new file mode 100644
>>> index 0000000..ffb08ab
>>> --- /dev/null
>>> +++ b/meta/recipes-extended/pam/libpam/pam.d/system-auth
>>> @@ -0,0 +1,12 @@
>>> +# This file comes from systemd.
>>> +
>>> +auth     sufficient pam_unix.so nullok try_first_pass
>>> +
>>> +account  required   pam_nologin.so
>>> +account  sufficient pam_unix.so
>>> +
>>> +password sufficient pam_unix.so nullok sha512 shadow try_first_pass =
try_authtok
>>> +
>>> +-session optional   pam_loginuid.so
>>> +-session optional   pam_systemd.so
>>> +session  sufficient pam_unix.so
>>> diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb =
b/meta/recipes-extended/pam/libpam_1.1.6.bb
>>> index a84e51e..0910b6f 100644
>>> --- a/meta/recipes-extended/pam/libpam_1.1.6.bb
>>> +++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
>>> @@ -17,6 +17,7 @@ SRC_URI =3D =
"http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
>>>            file://pam.d/common-session \
>>>            file://pam.d/common-session-noninteractive \
>>>            file://pam.d/other \
>>> +           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'file://pam.d/system-auth', '', d)} \
>>>            file://libpam-xtests.patch \
>>>            file://destdirfix.patch \
>>>            file://fixsepbuild.patch \
>>> --=20
>>> 1.9.1
>>>=20
>>> --=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>=20
>>=20
>=20
>=20


