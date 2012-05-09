Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SS9Hk-0002kZ-55
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 17:58:40 +0200
Received: by yenm3 with SMTP id m3so419183yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 08:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Db7U+34OX3xi3uCQH4vQzsznnYObdDU5rC/UX9SqMpM=;
	b=CGpTRjyK+gb7yCx7yRVi0vIlzODwZkeRz1BEnbxaz37kfRRbssP5/md5T20T3W5BAM
	NR1eoOJoehhP+yzNDNs3fayYYlfniH2zOyPE9tfLvAXWAwPtvER7U2vPXbYGeeENoS3Z
	XCwwEMoYOmby7MwYcJfm9NYkkbfezFdLWPikmzrCcnre+5otPM65eJoEeHkwQNa5Vesz
	ykdDGVgR/ZkCEF/WAGc/h2zL8LlQ0LZHmESmwZPkcLsC3j3arR7BqrvFdcTY0FVZb4eg
	bZSHtsRC/G2YrTO3Jke5poS14XPkgRridTr7+CSxaeZjRbbW+Gdny7blaQ/hlOGuRtuw
	CZ6A==
MIME-Version: 1.0
Received: by 10.68.195.106 with SMTP id id10mr258811pbc.146.1336578526345;
	Wed, 09 May 2012 08:48:46 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Wed, 9 May 2012 08:48:46 -0700 (PDT)
In-Reply-To: <4FAA8FEF.9050702@linux.intel.com>
References: <cover.1336535085.git.bruce.ashfield@windriver.com>
	<893d8018c655f70ada731eaf5f03b178f4dfe2b3.1336535085.git.bruce.ashfield@windriver.com>
	<4FAA8FEF.9050702@linux.intel.com>
Date: Wed, 9 May 2012 11:48:46 -0400
Message-ID: <CADkTA4PQbCqC6SrTA-v7vZ70ruqSSzxKObFudvMiYaXpCLMT1g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: poky@yoctoproject.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] kern-tools: checkpoint restoration for reset branches
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
X-List-Received-Date: Wed, 09 May 2012 15:58:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 11:40 AM, Darren Hart <dvhart@linux.intel.com> wrote=
:
>
>
> On 05/08/2012 08:48 PM, Bruce Ashfield wrote:
>> Updating the SRCREV to pickup the following fix:
>>
>> =A0 =A0 createme: fix checkpoint restoration for reset branches
>>
>> =A0 =A0 The meta branch can optionally be merged out to BSP branches. Th=
is removes
>> =A0 =A0 the need to restore the checkpoint when working with the tree. =
=A0The way
>> =A0 =A0 it detects the merge is by checking to see how many branches con=
tain the
>> =A0 =A0 meta data. If there's more than one, the branch was was merged o=
ut.
>>
>> =A0 =A0 Unless you are a BSP that isn't tracking the latest meta, and yo=
u get
>> =A0 =A0 meta and meta-orig created. That's two branches and the code opt=
s to not
>> =A0 =A0 restore the checkpoint, which leads to configuration errors.
>>
>> =A0 =A0 The fix is simple. We allow for 2 or less branches with meta, an=
d will
>> =A0 =A0 still restore the checkpoint. Three and up, we won't.
>>
>
> Uhm... am I the only one for whom this language is really confusing?
> "merged out" ?
> "restore the checkpoint" ?

I could be more verbose, but it's like reading a kernel -mm commit. I
don't grok everything they write, but they aren't writing it for me as a
-mm newbie.

> Why does a BSP using a different meta SRCREV get two meta branches?
>
> The fix of incrementing the allowed count of meta branches honestly
> feels like a bandaid. Why do we create two in the first place?

do_validate_branches() has to check if the HEAD of meta matches the meta
SRCREV that the BSP defines. If they don't match, it saves the old branch
as $branch-orig. So you have two branches, with the base meta commit
(which is what is tested).  I don't want to destroy any branches, since the=
re
is value in keeping them around.

The tools are actually separate to the bitbake bindings, so they don't expe=
ct
this to happen. I could destroy the old branch in do_validate_branches, but
that's not a solution I particularly liked. It was easier to add some
flexibility to
the tools.

Cheers,

Bruce

>
> Regardless, this is a blocker for working with meta-intel, so we need
> this in. But it does seem to me that a more direct solution may be
> needed. Bruce, can you help fill me in re. the above?
>
> --
> Darren
>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>> =A0.../kern-tools/kern-tools-native_git.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/m=
eta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> index b6fab39..b5e203e 100644
>> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://git/tools/kgit;beginline=3D=
5;endline=3D9;md5=3De2bf4415f3d8
>>
>> =A0DEPENDS =3D "git-native guilt-native"
>>
>> -SRCREV =3D "9bb704df0a86578b8ae1f4c85e45089bef28e026"
>> +SRCREV =3D "de3649840e8e3ca25bc79d2444f04a1b158a1769"
>> =A0PR =3D "r12"
>> =A0PV =3D "0.1+git${SRCPV}"
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


