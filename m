Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id C338D756C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 14:01:32 +0000 (UTC)
Received: by ykdz138 with SMTP id z138so80639079ykd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=E455CPWPtr5WQM/d0Q1v/dmVBnxSvk2fJ2463zf5PnE=;
	b=Bon81RLdIuZDuLRkRWAO3jyRecbfRJU5DOm0Ef7OcX1fWgF9wEMpugCHbbBnlZxYNL
	vW0mEGGmkcKHnFjyBTCQvlmKXJwd2MdebMwPgOY2vaLm8ZhbNHZzvHpUaOZAi7RU6YW2
	JSNr/bUAVzLFRGt6/CePvopVkUBXuFqXB7oQAwMS8tcasoHTw0tmPHH3A8lBB9BfjRSY
	MPpTZAgusbOuGkl6CVHYyt7UIHFh/BMHrsOE0fF3kyeNZi4nPjrH9heXcPYUUTRZn55T
	ZPujt07mvTWlR+cKZjPKLEumMhaHo+AFVA/5rwhJoiMhlgndLeLtLUZ3eERItORkpZxJ
	SZgw==
MIME-Version: 1.0
X-Received: by 10.129.73.203 with SMTP id w194mr29490017ywa.16.1443103291184; 
	Thu, 24 Sep 2015 07:01:31 -0700 (PDT)
Received: by 10.13.203.151 with HTTP; Thu, 24 Sep 2015 07:01:31 -0700 (PDT)
In-Reply-To: <CADkTA4OVo--4nCsx6-n54AYKFq9FzT0D162fqgMTqSVwGE8CQw@mail.gmail.com>
References: <BLU168-W92359AA4E562353441C3D7D6430@phx.gbl>
	<CADkTA4OVo--4nCsx6-n54AYKFq9FzT0D162fqgMTqSVwGE8CQw@mail.gmail.com>
Date: Thu, 24 Sep 2015 10:01:31 -0400
Message-ID: <CADkTA4Ni2T3wgrd8cBkd81qp-vYpOyScbgXSSLmT_6aLWQu9Tw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: LIYONG <sdliyong@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cannot apply patches out of meta bsp after applied a kern-tool patch
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
X-List-Received-Date: Thu, 24 Sep 2015 14:01:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2015 at 9:47 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Thu, Sep 24, 2015 at 4:24 AM, LIYONG <sdliyong@gmail.com> wrote:
>> Hi all,
>>
>> After applied the below patch, bitbake cannot apply these patches in my =
app layer. For example, there is a kernel patch in meta-app/recipes-kernel/=
linux-yocto/linux-yocto, I add the file in linux-yocto_%.bbappend file. bit=
bake yocto-linux will fail with "do patch error". If I revert the patch, th=
e build is okay.
>>
>> Any suggestions/comments?
>
> Raise a bug, and assign it to me. I can have a look at it. There must
> be some interaction in this configuration that I didn't test ... because =
I
> definiely did test the applcation of patches :)
>
> Make sure to add everything to the bug, the bbappend, the patch, etc,
> so I can re-create the failure on my machines.
>
> We can't revert that patch, since it actually is required to prevent patc=
hes
> from being applied multiple times .. so I'll need to incrementally fix th=
e
> issue.

I just re-ran my test suite locally, and I'm able to apply patches
from my layers,
via bbappends.

So I'll need your details, and then I can debug further.

Bruce

>
> Bruce
>
>
>>
>> commit a03c100e813b1b5041bfc17c97f5bd4e72b795ad
>> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Date:   Mon Aug 31 15:55:33 2015 -0400
>>
>>     patching: only validate user supplied patches by default
>>
>>     Previously the patching tools would consider both system and user
>>     supplied patches in the same manner .. they are simply a series of
>>     patches to be applied to a branch, and that the scripts should deter=
mine
>>     where in the series to start (based on what is already on the branch=
).
>>
>>     This detection was causing a few problems:
>>
>>       - time consuming
>>       - starting in the middle of a series when intermediate patches wer=
e
>>         merged to a branch.
>>
>>     To solve both the performance and start detection, we instead simply
>>     note the transition from system (i.e. already defined features and
>>     series) and user/recipe supplied patches. When the transition is not=
ed,
>>     the system will start pushing ALL patches without doing autoresume
>>     detection.
>>
>>     Control in keeping the series up to date is passed to the user, and
>> consistent behaviour/performance is achieved.
>>
>> Signed-off-by: Bruce Ashfield bruce.ashfield@windriver.com
>>
>>
>> Thanks,
>> Yong
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

