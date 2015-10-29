Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8132B763F2;
	Thu, 29 Oct 2015 20:15:09 +0000 (UTC)
Received: by igdg1 with SMTP id g1so140881565igd.1;
	Thu, 29 Oct 2015 13:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=1sRvjTNO9r/9JHEsZVFuRa8kMPyz+LATCp1erNHblgE=;
	b=isBF5y/lPnZeWm4sQerimVQpE0ZGgiV27JApNJOq4Zo3zmO06u6yg10+9/1Uj49Ao/
	kiXQeTtWTE75yEhHffu+4xRx5eGAITAVyvquNypc095lRgQ0/DOl3s4+QZbAqFGSQXxA
	z211AyUSJdgmDOw4UDCN53YVUKFHmYtPhL2F4+5eNc+8luf6PQAbodirYkMJZ/UvtYrb
	3EhS+HEaL579J1GGZtvvNvwiYjLgSGkDKdvShv2vM7fz+5i9fXMjojeuWec2SbPLEww7
	pXoN6sxuQvSiITbdfDB6X0Jzlr+QftVhOz9D4zClicjztjCUo0/Q+gA0ulGN/kRVfyMU
	s9MQ==
X-Received: by 10.50.142.8 with SMTP id rs8mr6393234igb.77.1446149710186; Thu,
	29 Oct 2015 13:15:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Thu, 29 Oct 2015 13:14:40 -0700 (PDT)
In-Reply-To: <56327C86.60202@windriver.com>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
	<56327C86.60202@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Oct 2015 13:14:40 -0700
Message-ID: <CAMKF1soy5s8iwBBP21cVS=o2ynkKBmoijStH3MjEoYz8uu4yaA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of libcs in OE-Core glibc/uclibc/musl
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
X-List-Received-Date: Thu, 29 Oct 2015 20:15:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2015 at 1:07 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 10/29/15 10:42 AM, Khem Raj wrote:
>> Hi All,
>>
>> I would like to get everyone=E2=80=99s opinion on the libcs we maintain =
in OE-Core, as of now, we have
>>
>> glibc + cross localedef + kconfig patches which are left overs from egli=
bc days
>
> I do find the above useful -- include the kconfig part.
>
>> uclibc - which is more of less unmaintained
>
> I've never used uclibc with the Yocto Project framework.  I think musl is=
 a lot
> more compelling moving forward.
>
>> Its a significant effort to keep forward porting the kconfig changes sin=
ce it touches everywhere in glibc, (I do it in my local glibc tree)
>> almost every week there is a commit in upstream glibc which breaks the k=
config patches, I know there are distribution profiles
>> like poky-tiny which uses glibc in this capacity, and may be then their =
are other custom one=E2=80=99s made on top, I would like us to not carry ma=
jor
>> patches which almost makes our component a fork due to obvious maintenan=
ce cost. I think there is viable alternatives to tiny libcs in musl now.
>>
>> I would like to make a proposal for 2.1 release where
>>
>> 1. Drop kconfig support in glibc and we become inline with upstream
>
> I really would like to keep kconfig support still.  It's definitely usefu=
l, but
> it's of course not the main workflow.

its a lot of work and upstream is not so keen on supporting it either,
so even if we spend time to clean it up
and send upstream it might need dedicated maintenance which is going
to be quite frequent breakages
since no one will test all kconfig combos. At this point this is the
biggest drag to take glibc forward I spend lot of time on keeping
these
patches moving forward. so we want
to avoid needless effort if there is so little userbase for it. Cross
localedef and others we still will keep.

>
>> 2. Move musl support to OE-Core from meta-musl
>
> I wouldn't object to his.
>
>> 3. Drop uclibc or leave it in current broken state, I would like to pull=
 it out into a layer in meta-openembedded and we can leave the core plumbin=
g as it is in OE-Core
>
> I definitely wouldn't object to this.  I do think keeping the uclibc hook=
s and
> such in oe-core for the time being does make sense.  It would be interest=
ing to
> know how often it is still being used... (and I do think musl is a better
> replacement for this use-case.)
>
>> 4. Poky-tiny switches to use musl
>
> I think there are two usages here.. one is a small 'glibc' interface wher=
e the
> API is glibc compatible, but restricted..
>
> And a "don't care about the libc, as long as it works and is small" use c=
ase
> which was traditionally uclibc, but now can be fulfilled by musl.
>
> I do still think a 'tiny' glibc is useful -- however with musl being a lo=
t more
> capable of working then uclibc was, the usefulness may be diminishing.
>
>> may other disto=E2=80=99s have moved to using musl as system C library e=
.g. alpine linux, openwrt, and I am also deploying it in  real products
>> its pretty mature and well maintained with very healthy community around=
 it. Right now meta-musl is capable of building and running
>> core-image-sato/core-image-weston for all supported Qemu arches in OE-Co=
re, the amount of software it can build is no less than uclibc
>> support in OE-Core.
>
> This certainly makes it worthwhile to consider putting into oe-core prope=
r.
> Again, I have no objections to introducing musl.
>
> --Mark
>
>> if collectively we think, this is a good move then I can work on all of =
above items in early phases of 2.1 so we can settle any
>> outstanding issues, due to the shuffle especially in poky-tiny
>>
>> Thoughts ?
>>
>> -Khem
>>
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

