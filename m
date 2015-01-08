Return-Path: <raj.khem@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id C44DB72916
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 02:10:19 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id w7so51182qcr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 18:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=43CyvF1G5DfJ83MfhCPmbCZGeDXuOD4mtl6zW3Y4mD0=;
	b=G83XlmzaHXbiXdXm+PbnKHryRgENR8o1Xv7lHEgPTpohX7m/GVqlzw2VwBXqIMAqYT
	QxS/YipG24nbE+6lh2cowDGvDgbXxsKD2bBChVSt+teFdb9E0UtLLPkhj1UsCoVj0/CY
	6HGV8iiKxV9t9pfLh+b7F4+aXQ/RoVHhqaO/CyNZ8b7k7AMpHJ8DHQ87XtF8+GCSsJJh
	i+EYBzaOzQW9Pa3CLbkSsBVMYyvpOn5FcLeX51aeNz535FmvOYgtWVkfTHugzyrytv8z
	JUbYR3gOaydTosfxsPwcYUtUxCzLje+1mLVYzsHc2Duu1rHZJ0NpGa7MGiRiCsz3Xxe0
	3rwA==
X-Received: by 10.224.96.129 with SMTP id h1mr10645788qan.46.1420683019778;
	Wed, 07 Jan 2015 18:10:19 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:309d:3246:9ece:a635?
	([2601:9:3580:84c:309d:3246:9ece:a635])
	by mx.google.com with ESMTPSA id c80sm2826777qge.5.2015.01.07.18.10.18
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Jan 2015 18:10:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <54ADE5D2.1010200@windriver.com>
Date: Wed, 7 Jan 2015 18:10:17 -0800
Message-Id: <796F80B8-679B-4E8F-867C-522A3CFBF88A@gmail.com>
References: <54ADE119.6060008@windriver.com>
	<06BCD4D4-D179-401A-A39C-1881F2F69B65@gmail.com>
	<54ADE5D2.1010200@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.1993)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: About update binutils (2.24 to 2.25)
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
X-List-Received-Date: Thu, 08 Jan 2015 02:10:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jan 7, 2015, at 6:05 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
>=20
>=20
> On 01/08/2015 09:55 AM, Khem Raj wrote:
>>=20
>>> On Jan 7, 2015, at 5:44 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>>>=20
>>>=20
>>> Hi Khem,
>>>=20
>>> I'm trying to upgrade binutils from 2.24 to 2.25, there is
>>> a patch binutils/libtool-2.4-update.patch which has 19317
>>> lines, do you have any ideas on how did we make it in the past,
>>> please ?
>>=20
>> what conflicts are you seeing ? if they are just in configure files =
then you
>> need to autoteconf them manually one by one using the appropriate =
version of auototools as recommended
>> for bintutils 2.25 usually gcc/binutils don=E2=80=99t use latest auto =
tools.
>=20
> Conflicts in ld/configure, I fixed it manually, I was curious how we =
made this
> patch, and now you have explained, thanks.

some portions are written and others are generated. since we do not =
autoreconf binutils, we do have to regenerate configure scripts
so its a special case. Usually that would not be needed for autotooled =
recipes

>=20
> // Robert
>=20
>>=20
>> but if they are reporting changes in other files then its a different =
problem needs to be looked at.
>>=20
>>=20
>>>=20
>>> $ diffstat ./binutils/libtool-2.4-update.patch
>>> bfd/configure        | 1314 +++++++++++++++++-----
>>> bfd/configure.in     |    2
>>> binutils/configure   | 1312 +++++++++++++++++-----
>>> configure            |    2
>>> gas/configure        | 1312 +++++++++++++++++-----
>>> gprof/configure      | 1317 +++++++++++++++++-----
>>> ld/configure         | 1693 ++++++++++++++++++++++-------
>>> libtool.m4           | 1094 +++++++++++++------
>>> ltmain.sh            | 2925 =
++++++++++++++++++++++++++++++++++-----------------
>>> ltoptions.m4         |    2
>>> ltversion.m4         |   12
>>> lt~obsolete.m4       |    2
>>> opcodes/configure    | 1314 +++++++++++++++++-----
>>> opcodes/configure.in |    2
>>> 14 files changed, 8937 insertions(+), 3366 deletions(-)
>>>=20
>>> --
>>> Thanks
>>>=20
>>> Robert
>>=20
>>=20
>>=20


