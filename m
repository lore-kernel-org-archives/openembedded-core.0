Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RupdN-0004Yg-MH
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 19:19:17 +0100
Received: by lahc1 with SMTP id c1so4319445lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 10:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=xySxBIpYuYX67VQmrUeZYpvJUvFKmtffgMFFAodoK40=;
	b=xNg3AyeO62K25MX9eXVakhdk8eZAfwpBS1HzV6PsMIxxM++lL9a4ouDO/LkGFFZmMn
	ejmTqiG61E5T6YdsVhvQHJHIzkTPrAM93JyHUGMuDU1ixro5Vw2nUd6UIcxVFACtdUHq
	8fC1geA3ZMGje0z5C3SO7DEngEA1UTaPN8sgk=
Received: by 10.152.114.169 with SMTP id jh9mr13160709lab.20.1328638275243;
	Tue, 07 Feb 2012 10:11:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 7 Feb 2012 10:10:45 -0800 (PST)
In-Reply-To: <4F3154CD.3000305@linux.intel.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<633b2b23bbddb8cb2b0aa1d75ee82b9826d1de55.1328510188.git.raj.khem@gmail.com>
	<4F314FA2.6060708@linux.intel.com>
	<CAMKF1sqQQLVBUarw50B33DmD9G_YNrG7QpJj8-LgtygO8j3O+w@mail.gmail.com>
	<4F3154CD.3000305@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2012 10:10:45 -0800
Message-ID: <CAMKF1spCBD9DmVVXYxSeNGOnMbRCOa5Hqcb5GvcpbNbg3T9Zuw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/20] pseudo: Wrap renameat and opendir
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
X-List-Received-Date: Tue, 07 Feb 2012 18:19:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 8:43 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/07/2012 08:31 AM, Khem Raj wrote:
>>
>> On Tue, Feb 7, 2012 at 8:21 AM, Saul Wold<sgw@linux.intel.com> =C2=A0wro=
te:
>>>
>>> On 02/05/2012 10:40 PM, Khem Raj wrote:
>>>>
>>>>
>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>> ---
>>>> =C2=A0meta/recipes-devtools/pseudo/pseudo/opendir.patch =C2=A0| =C2=A0=
 92 ++++++++
>>>> =C2=A0meta/recipes-devtools/pseudo/pseudo/renameat.patch | =C2=A0227
>>>> ++++++++++++++++++++
>>>> =C2=A0meta/recipes-devtools/pseudo/pseudo_1.2.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A06 +-
>>>> =C2=A03 files changed, 323 insertions(+), 2 deletions(-)
>>>> =C2=A0create mode 100644 meta/recipes-devtools/pseudo/pseudo/opendir.p=
atch
>>>> =C2=A0create mode 100644 meta/recipes-devtools/pseudo/pseudo/renameat.=
patch
>>>>
>>>> diff --git a/meta/recipes-devtools/pseudo/pseudo/opendir.patch
>>>> b/meta/recipes-devtools/pseudo/pseudo/opendir.patch
>>>> new file mode 100644
>>>> index 0000000..d20f717
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/pseudo/pseudo/opendir.patch
>>>> @@ -0,0 +1,92 @@
>>>> +commit 162f2692c399b93311652201a940fdaf9c9e6924
>>>> +Author: Peter Seebach<peter.seebach@windriver.com>
>>>> +Date: =C2=A0 Thu Feb 2 11:45:42 2012 -0600
>>>> +
>>>> + =C2=A0 =C2=A0Make opendir/closedir stash and forget directory names.
>>>> +
>>>> + =C2=A0 =C2=A0The dirfd(DIR *) interface allows you to get the fd for=
 a DIR *,
>>>> + =C2=A0 =C2=A0meaning you can use it with openat(), meaning you can n=
eed its
>>>> + =C2=A0 =C2=A0path. =C2=A0This causes a segfault. =C2=A0Also gonna fi=
x the base_path
>>>> + =C2=A0 =C2=A0code not to segfault in that case, but first fix the un=
derlying
>>>> + =C2=A0 =C2=A0problem.
>>>> +
>>>
>>>
>>>
>>> Missing Upstream-Status: and Signed-off-by (yes I know we have an email
>>> header).
>>
>>
>> they are backports
>>
> Please update the patch!

should be there now.


