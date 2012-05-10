Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SSLil-0006J3-U4
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 07:15:24 +0200
Received: by qcso7 with SMTP id o7so892069qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 22:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=URIZEwcFsvW42XPJgztoICtkFgBbjUHoQt8yyL+O2Bc=;
	b=F/4dte6TixAdIDMf0XO3HgL4ph2QzC9rvrJxtIpnCMGBmuTm6HZbBFy9wvSzldjbIJ
	XSMWhEXZTj2uudwdQqz9qSpYkSIxc3I1LqmzT/wChdAJQa3kW7S8dRBtneSmZUjUvNRt
	lC74X4SvXVsFRjcaU5dAzYunguOE/SkQ5peY5AilPO+mbvz5B0MawaVQY8/newUPu2yH
	xHa4DSimfw5ifSyJMUx4kevYIyh8zoYAcsV8SO6D0DVC0OBh2r3NRi676s8xO3sLhR5m
	bHta1zjS5RrdqgP2OwmN8B4Orlbyg8KbHSSUKcSqFIu3KFOZ0RAxWAJrDl+2k9Is30Gq
	R/4w==
Received: by 10.229.135.85 with SMTP id m21mr1413062qct.121.1336626329939;
	Wed, 09 May 2012 22:05:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.214.81 with HTTP; Wed, 9 May 2012 22:05:09 -0700 (PDT)
In-Reply-To: <4FAB4C20.5050804@linux.intel.com>
References: <1336617615-25713-1-git-send-email-kergoth@gmail.com>
	<1336617615-25713-2-git-send-email-kergoth@gmail.com>
	<4FAB4C20.5050804@linux.intel.com>
From: Chris Larson <kergoth@gmail.com>
Date: Wed, 9 May 2012 22:05:09 -0700
Message-ID: <CABcZAN=yYOYN74doA3E1fmwjtKrTX46gR2c67=G=j=qp=w=4rg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] archiver.bbclass: leverage variable typing support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 05:15:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 10:03 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/09/2012 07:40 PM, Christopher Larson wrote:
>>
>> From: Christopher Larson<chris_larson@mentor.com>
>>
>> This makes use of variable typing to avoid reinventing the wheel in that
>> way
>> and adds default values for a couple of said variables. It also changes
>> PATCHES_ARCHIVE_WITH_SERIES to use ?=3D rather than =3D.
>>
>> Further, doing this fixes a single bug that occurs in many places:
>>
>> =C2=A0 =C2=A0 if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() n=
ot in
>> 'SRPM':
>>
>> This is performing a substring search. It should have done "=3D=3D 'SRPM=
'"",
>> or if
>> there *were* multiple options for that case (there aren't), it would do
>> "not
>> in ['SRPM']" or similar.
>>
>> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
>> ---
>> =C2=A0meta/classes/archiver.bbclass =C2=A0 =C2=A0| =C2=A0 45
>> +++++++++++++++++--------------------
>> =C2=A0meta/classes/package_rpm.bbclass | =C2=A0 12 +++++-----
>> =C2=A02 files changed, 27 insertions(+), 30 deletions(-)
>>
>> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbcla=
ss
>> index 59b58f4..844dbf8 100644
>> --- a/meta/classes/archiver.bbclass
>> +++ b/meta/classes/archiver.bbclass
>> @@ -2,10 +2,19 @@
>> =C2=A0# It also output building environment to xxx.dump.data and create
>> xxx.diff.gz to record
>> =C2=A0# all content in ${S} to a diff file.
>>
>> -ARCHIVE_EXCLUDE_FROM ?=3D ".pc autom4te.cache"
>> -ARCHIVE_TYPE ?=3D "TAR SRPM"
>> =C2=A0DISTRO ?=3D "poky"
>> -PATCHES_ARCHIVE_WITH_SERIES =3D 'TRUE'
>> +ARCHIVE_EXCLUDE_FROM ?=3D ".pc autom4te.cache"
>> +
>> +PATCHES_ARCHIVE_WITH_SERIES ?=3D "true"
>> +PATCHES_ARCHIVE_WITH_SERIES[type] =3D "boolean"
>> +
>> +SOURCE_ARCHIVE_PACKAGE_TYPE ?=3D "tar"
>> +SOURCE_ARCHIVE_PACKAGE_TYPE[type] =3D "choice"
>> +SOURCE_ARCHIVE_PACKAGE_TYPE[choices] =3D "tar srpm"
>> +
>
>
> Great patch! But:
>
> Moving this here results in the following error if archiver.bbclass is no=
t
> inherit'ed by default!
>
> ERROR: SOURCE_ARCHIVE_PACKAGE_TYPE: No type specified. Valid types: regex=
,
> float, list, choice, boolean, integer

Ah! Doh, I didn't think about that -- we really need to fix the
package_rpm code there to not depend on archiver.bbclass specifics.
I'll rework the patch. Thanks.
--=20
Christopher Larson


