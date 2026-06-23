Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DACDCDB470
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 17:23:32 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26507.1782235410083215097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 10:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ReV8jQeb;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-660390acd71so1401700d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 10:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782235409; cv=none;
        d=google.com; s=arc-20260327;
        b=CC6cgToME08GKXk1SFdI5Xkyr9gzSiIlDwe5G3yb+DHEIphN7hyqPfWm67L/jN5HGe
         WF/vQjD6y7eeFd4QLEZJiDl5GaOtaYRDBaLw1gM2OaHZGvMLbCQx/tlX3P71sc9oK75j
         2vCaBlu9N3XCDpxKECbMK2R07/K2hJMjxsEUxh9+foFL4QR3c98lD6NvEMV1JLLY/Eax
         AbmcvTaxSc88U0hFFklkhE81o69pTa6yfuG0s+ArTIviUBtImGfg458i04xMj5udadu5
         Re9SeGawa/1Q9aCuu1HDcP06e5o8ACEoArnzn+08gSJOgDxynPHJ5L85jULIHLyYyuU5
         MuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bTTkpwU/ROFG3Lwk4ODg8m8ZFEo+exF/g8SwMR89mXo=;
        fh=XyBTXyYgvD4/HdLuL7cc/W7j+wglqPY/nwm2E3co1S4=;
        b=Cn335wBtAlxj4Ybf+ZbffoLiKO4u+mrFXNBRkoG/W+kdYnQAhzS8ftinvPmrjC77ih
         hroLOSTr5Uy9mMj0defArTLSZjxnv3wtArhkze7397xtnlz7ckxMnb8CC3kIn13TYyve
         DrAfxMmBFa5rVY7fumMF8gurOCdfyUmff0lxraqhwxy+0lwhBgPtYURGFvpcFr/B7cOw
         kKjttYI9UqDUsyWa3V7wc7RTI5ftsLtxEBmqXNf9fb3X8Xr4ilFaGPvElIhK+f+Aox5o
         khcQnPXmWO1FWu0in2IlXuHO3mN+imLhUK5b1Mk67+tpG6YGUfkqmPG79XS3GL5TL9Ya
         S1NQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782235409; x=1782840209; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bTTkpwU/ROFG3Lwk4ODg8m8ZFEo+exF/g8SwMR89mXo=;
        b=ReV8jQebUap4ilQ0UnKlIbEfSTB8YNQa4zHSI0RBAttiYhN4Q0e+Og/6cK2+34Gyzx
         68r5bEiotjHlqmnaLZQY08U52uBKeIaafxBFqwy4Fnu8pCZW4r/q3x6tlY7nPbHePU3h
         jCuSm3WcBIAaI7SO2e6vK3xURZFlQSObDvpQrGDm1RTgnd/O0Ndyw9Ip8ne4UzoxR/5b
         8Y0hf5b/jVrOBVzVaOw5sOJBUf9MuqGbPMWnjk8feCYrtPOOoHoCWRHKSUojcFewcx8t
         aLpNOhwJhId8vc7qt46PQixptAkkBoWiw9q+u/XcfiILbsyLMqILvmN/mEDk1ZKRP10O
         1ZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782235409; x=1782840209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTTkpwU/ROFG3Lwk4ODg8m8ZFEo+exF/g8SwMR89mXo=;
        b=cNhvim2p8WhJrnJxEuJ/ONNgYdkDQDTMJSK77Rd+LAGpMTl6eDxEpt064FYbXeWUHA
         lr/DAjgtjrcnZQZEazov61ilg9ioR3WuxBonyWt/uJeJARDpzukbtuSPa5jhrNbDBkze
         Y29IKeVFB3BNzFhrb8zw+gnJlCuhQUiBNBjevspIHcj1RUus5RHzPwskDTn1aEYW8E5M
         J37EzWNVo614RK4wFZ2I9KzV+dJighuTACtdU3hpUxBsz2HMPv9ZrF73eHvUZfQSNG6h
         GsGBOB7cLBqPZN5WKaW3ZdVXrWFy9h+7Pcq/PI9XudFr23oLydoDQwgm/9jpPNKlEUM6
         KZIg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6lX2IBt6kW8ITEO+MMxoZIrWz3aGJablwJs4DMOz5XKn0XbbEilBsNp+CU4MINTWL50JkQJ1rSwY+6lbsW7+VzA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwgIhqE5Sbn8dbIZJPV7HND6FhPG0jJoT8f987IoVFYIc5YshHv
	9GMpirVWjmmQSpW2HCfKWoT8F31nIagFjtudApVlZREWV8yCKw7DpzQxpO3x8aEAbcCpdWWBI+k
	mTJcJ089Ji3umJ+pg7OpGmjR3o/rEATw=
X-Gm-Gg: AfdE7cnESdJC2fzMnldvFRyF+ixB50xQh7QjBkDdVyzJ/YyCMI2M6D61fXHC5rAL0qO
	MA4Lr+Gsr87Dgi5Zwf5bjKGSfU9PnRj7v/CMp/K5to8zMGsf14IBtdNtxHdIX4zOWcjkAFiSFlA
	oD0Qi0DfcbQsE3fZN6OFxoiBhIV4ohkgrHyJbtqGekfA/KkcJc1/4mclDxXwe4CNiOHiLH8NQTZ
	9RDW2XIzwjTpW/W92h24X7oh7Y1yGUxZLZJCq+QCbLyZLhryEa5340CnNZ36o120cp5hNrZqji5
	ESIGAwl4NPhfE7Lp834UqaJuzSIQlzhZs/reiuu0K6Xe+214EGDZIzTMtOrkhPcQEk+7ezL/KSn
	7ytLPiWlrLi9ZpPI=
X-Received: by 2002:a05:690e:4403:b0:662:b795:953b with SMTP id
 956f58d0204a3-66355446c95mr3343995d50.9.1782235408996; Tue, 23 Jun 2026
 10:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
 <20260610165008.1870552-2-bruce.ashfield@gmail.com> <DJGKEQF8GRU1.RF7JY64COTAA@smile.fr>
 <CADkTA4NoRbT1FkgdiYoM2d+qLavqR5TGthMm5bUyiWJ-V=3fpQ@mail.gmail.com> <CAMSfU+7EMOGNeEs-Ta=-0dXHcfgFh06nL3mD5kCRDhRddPiu-Q@mail.gmail.com>
In-Reply-To: <CAMSfU+7EMOGNeEs-Ta=-0dXHcfgFh06nL3mD5kCRDhRddPiu-Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Jun 2026 13:23:14 -0400
X-Gm-Features: AVVi8Cdy_DpUZDCgRoZytWO1jk6dCReoJEutVSO9GOT0yAZlVEUJQSK1KtKFQeY
Message-ID: <CADkTA4Pj-W-J8sRW9Dc3V0LDqVzsY3sn7aGZW7_ABE9cE685LQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][scarthgap][PATCH 02/11] linux-yocto/6.6: update
 to v6.6.130
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000759c4f0654ef0490"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 17:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239414

--000000000000759c4f0654ef0490
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 1:11=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:

>
>
>
> Le mar. 23 juin 2026, 19:00, Bruce Ashfield <bruce.ashfield@gmail.com> a
> =C3=A9crit :
>
>>
>>
>> On Tue, Jun 23, 2026 at 12:21=E2=80=AFPM Yoann Congal <yoann.congal@smil=
e.fr>
>> wrote:
>>
>>> On Wed Jun 10, 2026 at 6:49 PM CEST, Bruce Ashfield via
>>> lists.openembedded.org wrote:
>>> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> >
>>> > Updating linux-yocto/6.6 to the latest korg -stable release that
>>> comprises
>>> > the following commits:
>>> >
>>> >     c09fbcd31ae6 Linux 6.6.130
>>> > [...]
>>> >     dc7c9b9d03a5 ext4: drop extent cache when splitting extent fails
>>> >     f0931a5c1700 ext4: drop extent cache after doing PARTIAL_VALID1
>>> zeroout
>>> >     67cdb7bd7442 ext4: don't set EXT4_GET_BLOCKS_CONVERT when
>>> splitting before submitting I/O
>>> >     11406eb96a19 ext4: correct the comments place for
>>> EXT4_EXT_MAY_ZEROOUT
>>>
>>> Hello Bruce,
>>>
>>> >     ed0096fc86b2 ext4: get rid of ppath in
>>> ext4_ext_handle_unwritten_extents()
>>> >     d7b04ea31c6e ext4: get rid of ppath in
>>> ext4_ext_convert_to_initialized()
>>> >     c24ce099bea9 ext4: get rid of ppath in
>>> ext4_convert_unwritten_extents_endio()
>>> >     147a6a2725b1 ext4: get rid of ppath in ext4_split_convert_extents=
()
>>> >     cda8a34348d7 ext4: get rid of ppath in ext4_split_extent()
>>> >     58ddae5d77b1 ext4: don't zero the entire extent if
>>> EXT4_EXT_DATA_PARTIAL_VALID1
>>> >     e766534911b3 ext4: subdivide EXT4_EXT_DATA_VALID1
>>> >     ffb68fc57207 ext4: get rid of ppath in ext4_split_extent_at()
>>> >     fb138df7d886 ext4: get rid of ppath in ext4_ext_insert_extent()
>>> >     8f6e910852d8 ext4: get rid of ppath in ext4_ext_create_new_leaf()
>>> >     cafb151eb180 ext4: get rid of ppath in ext4_find_extent()
>>>
>>> (The following was found by Gemini, but I've checked it)
>>>
>>> Looks like these commits introduced a bug causing an intermittent LTP
>>> regression:
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/98/builds/3837
>>> ->
>>> https://valkyrie.yocto.io/pub/non-release/20260622-121/testresults/qemu=
arm64-ltp/core-image-sato/qemu_boot_log.20260623002740
>>>
>>> [ 6952.500858] Unable to handle kernel paging request at virtual addres=
s
>>> ffffffffffffffec
>>> [ 6952.503768] Mem abort info:
>>> [ 6952.504431]   ESR =3D 0x0000000096000005
>>> [ 6952.505333]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>>> [ 6952.506541]   SET =3D 0, FnV =3D 0
>>> [ 6952.507354]   EA =3D 0, S1PTW =3D 0
>>> [ 6952.508154]   FSC =3D 0x05: level 1 translation fault
>>> [ 6952.509208] Data abort info:
>>> [ 6952.509849]   ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
>>> [ 6952.511175]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>>> [ 6952.512372]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
>>> [ 6952.513667] swapper pgtable: 4k pages, 39-bit VAs,
>>> pgdp=3D0000000041250000
>>> [ 6952.514909] [ffffffffffffffec] pgd=3D0000000000000000,
>>> p4d=3D0000000000000000, pud=3D0000000000000000
>>> [ 6952.516423] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
>>> [ 6952.517503] Modules linked in: x_tables tun loop [last unloaded:
>>> ip6_tables]
>>> [ 6952.518691] CPU: 1 PID: 1078 Comm: kworker/u12:1 Tainted: G        W
>>>         6.6.142-yocto-standard #1
>>> [ 6952.520269] Hardware name: linux,dummy-virt (DT)
>>> [ 6952.521094] Workqueue: writeback wb_workfn (flush-7:0)
>>> [ 6952.521985] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
>>> BTYPE=3D--)
>>> [ 6952.523184] pc : ext4_ext_map_blocks+0x260/0x1860
>>> [ 6952.524011] lr : ext4_ext_map_blocks+0xdb8/0x1860
>>> [ 6952.524851] sp : ffffffc086a3b620
>>> [ 6952.525421] x29: ffffffc086a3b740 x28: ffffffffffffffe4 x27:
>>> 000000000000808c
>>> [ 6952.526624] x26: ffffff8017dd9000 x25: 000000000000808c x24:
>>> 0000000000000002
>>> [ 6952.527849] x23: ffffff8035e766c8 x22: ffffff802e589690 x21:
>>> 000000000000042f
>>> [ 6952.529087] x20: ffffffc086a3b948 x19: ffffff8035e767f0 x18:
>>> 0000000000000000
>>> [ 6952.530310] x17: ffffffc081691310 x16: fffffffe001ab548 x15:
>>> 0000005564d4cb48
>>> [ 6952.531519] x14: 00000000ffffffff x13: 0000000000000000 x12:
>>> ffffffffffffffc0
>>> [ 6952.532683] x11: 0000000000000040 x10: ffffff8005d81d80 x9 :
>>> ffffffc0803cce14
>>> [ 6952.533886] x8 : 00000000bab647bc x7 : 0000000000000000 x6 :
>>> 000000000000d847
>>> [ 6952.535065] x5 : 0000000000000000 x4 : 0000000000316019 x3 :
>>> 0000000000000000
>>> [ 6952.536264] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
>>> ffffff803deec880
>>> [ 6952.537425] Call trace:
>>> [ 6952.537860]  ext4_ext_map_blocks+0x260/0x1860
>>> [ 6952.538589]  ext4_map_blocks+0x19c/0x598
>>> [ 6952.539258]  ext4_do_writepages+0x5a4/0xbe0
>>> [ 6952.539977]  ext4_writepages+0x84/0x110
>>> [ 6952.540624]  do_writepages+0x94/0x1e0
>>> [ 6952.541240]  __writeback_single_inode+0x60/0x4d8
>>> [ 6952.542086]  writeback_sb_inodes+0x208/0x4b0
>>> [ 6952.542812]  __writeback_inodes_wb+0x58/0x118
>>> [ 6952.543578]  wb_writeback+0x274/0x440
>>> [ 6952.544198]  wb_workfn+0x3b0/0x5c8
>>> [ 6952.544788]  process_one_work+0x16c/0x3e0
>>> [ 6952.545434]  worker_thread+0x1b4/0x378
>>> [ 6952.546059]  kthread+0x118/0x128
>>> [ 6952.546599]  ret_from_fork+0x10/0x20
>>> [ 6952.547197] Code: 2a0103f9 b9009fe1 b9000e99 b40055fc (79401398)
>>> [ 6952.548170] ---[ end trace 0000000000000000 ]---
>>> [ 6952.551090] ------------[ cut here ]------------
>>>
>>> Reading the resulting code in 6.6.142:
>>> fs/ext4/extents.c:
>>> int ext4_ext_map_blocks(handle_t *handle, struct inode *inode,
>>>                         struct ext4_map_blocks *map, int flags)
>>> {
>>>         struct ext4_ext_path *path =3D NULL;
>>>         // ...
>>>
>>> got_allocated_blocks:
>>>         path =3D ext4_ext_insert_extent(handle, inode, path, &newex,
>>> flags);
>>>         if (IS_ERR(path)) {
>>>                 err =3D PTR_ERR(path);
>>>                 /*
>>>                  * Gracefully handle out of space conditions. If the
>>> filesystem
>>>                  * is inconsistent, we'll just leak allocated blocks to
>>> avoid
>>>                  * causing even more damage.
>>>                  */
>>>                 // ...
>>>                 goto out;
>>>         }
>>>
>>>         // ...
>>> out:
>>>         ext4_free_ext_path(path);
>>>
>>>         trace_ext4_ext_map_blocks_exit(inode, flags, map,
>>>                                        err ? err : allocated);
>>>         return err ? err : allocated;
>>> }
>>>
>>> =3D> Under out of space condition (what LTP does a *LOT*): path is give=
n
>>> unmodified to
>>> ext4_free_ext_path() that only does a NULL check (no IS_ERR) before
>>> dereferencing it. And that produces the oops and then, the LTP failure.
>>>
>>> Notably, master commit 6b854d552711 ("ext4: get rid of ppath in
>>> get_ext_path()")
>>> never got backported to 6.6.y. But does add the IS_ERR_OR_NULL() check
>>> to ext4_free_ext_path:
>>>  void ext4_free_ext_path(struct ext4_ext_path *path)
>>>  {
>>> +       if (IS_ERR_OR_NULL(path))
>>> +               return;
>>>
>>> Bruce, what do you think? Should we backport
>>> 6b854d552711=C2=B7("ext4:=C2=B7get=C2=B7rid=C2=B7of=C2=B7ppath=C2=B7in=
=C2=B7get_ext_path()")? Ask for it to
>>> be backported?
>>>
>>
>> It's possible. But without being able to reproduce the issues locally,
>> I'm just
>> guessing.
>>
>> I wouldn't just backport it, I'd suggest that -stable pick it up as well=
,
>> but then
>> I'm back to not being able to see any issues locally.  I wouldn't ask fo=
r
>> a
>> backport without knowing it does fix the issues.
>>
>> I'm happy to cherry-pick it as a shot in the dark, but that's all it
>> would be :)
>>
>
> I could setup AB to repeatedly test with/without the cherry-pick (only th=
e
> fs section of ltp). I suspect the frequency of the bug triggering is quit=
e
> high and that would prove the fix, enough to convince you and -stable?
>
>
Even enough runs with no failure is probably enough, given that you've
already been seeing it on the AB. That could be our "before" sample set.

I can cherry-pick it and send SRCREV bump to the 6.6 recipes in the
scenario I'm suggesting that should be all you need.

Bruce



>
>> Bruce
>>
>>
>>
>>>
>>> Thanks for your help!
>>> --
>>> Yoann Congal
>>> Smile ECS
>>>
>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000759c4f0654ef0490
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 23, 2026 at 1:11=
=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann=
.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Le mar. 23 juin 2026, 19:00, Bruce=
 Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank"=
>bruce.ashfield@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><di=
v style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 23, 2026 at 12:21=E2=80=
=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" rel=3D"nore=
ferrer" target=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Wed Jun 10, 2026 at 6:49 =
PM CEST, Bruce Ashfield via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" r=
el=3D"noreferrer" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Updating linux-yocto/6.6 to the latest korg -stable release that compr=
ises<br>
&gt; the following commits:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0c09fbcd31ae6 Linux 6.6.130<br>
&gt; [...]<br>
&gt;=C2=A0 =C2=A0 =C2=A0dc7c9b9d03a5 ext4: drop extent cache when splitting=
 extent fails<br>
&gt;=C2=A0 =C2=A0 =C2=A0f0931a5c1700 ext4: drop extent cache after doing PA=
RTIAL_VALID1 zeroout<br>
&gt;=C2=A0 =C2=A0 =C2=A067cdb7bd7442 ext4: don&#39;t set EXT4_GET_BLOCKS_CO=
NVERT when splitting before submitting I/O<br>
&gt;=C2=A0 =C2=A0 =C2=A011406eb96a19 ext4: correct the comments place for E=
XT4_EXT_MAY_ZEROOUT<br>
<br>
Hello Bruce,<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0ed0096fc86b2 ext4: get rid of ppath in ext4_ext_han=
dle_unwritten_extents()<br>
&gt;=C2=A0 =C2=A0 =C2=A0d7b04ea31c6e ext4: get rid of ppath in ext4_ext_con=
vert_to_initialized()<br>
&gt;=C2=A0 =C2=A0 =C2=A0c24ce099bea9 ext4: get rid of ppath in ext4_convert=
_unwritten_extents_endio()<br>
&gt;=C2=A0 =C2=A0 =C2=A0147a6a2725b1 ext4: get rid of ppath in ext4_split_c=
onvert_extents()<br>
&gt;=C2=A0 =C2=A0 =C2=A0cda8a34348d7 ext4: get rid of ppath in ext4_split_e=
xtent()<br>
&gt;=C2=A0 =C2=A0 =C2=A058ddae5d77b1 ext4: don&#39;t zero the entire extent=
 if EXT4_EXT_DATA_PARTIAL_VALID1<br>
&gt;=C2=A0 =C2=A0 =C2=A0e766534911b3 ext4: subdivide EXT4_EXT_DATA_VALID1<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0ffb68fc57207 ext4: get rid of ppath in ext4_split_e=
xtent_at()<br>
&gt;=C2=A0 =C2=A0 =C2=A0fb138df7d886 ext4: get rid of ppath in ext4_ext_ins=
ert_extent()<br>
&gt;=C2=A0 =C2=A0 =C2=A08f6e910852d8 ext4: get rid of ppath in ext4_ext_cre=
ate_new_leaf()<br>
&gt;=C2=A0 =C2=A0 =C2=A0cafb151eb180 ext4: get rid of ppath in ext4_find_ex=
tent()<br>
<br>
(The following was found by Gemini, but I&#39;ve checked it)<br>
<br>
Looks like these commits introduced a bug causing an intermittent LTP regre=
ssion:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/98/buil=
ds/3837" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/98/builds/3837</a><br>
-&gt; <a href=3D"https://valkyrie.yocto.io/pub/non-release/20260622-121/tes=
tresults/qemuarm64-ltp/core-image-sato/qemu_boot_log.20260623002740" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://valkyrie.yocto.io/pub/non=
-release/20260622-121/testresults/qemuarm64-ltp/core-image-sato/qemu_boot_l=
og.20260623002740</a><br>
<br>
[ 6952.500858] Unable to handle kernel paging request at virtual address ff=
ffffffffffffec<br>
[ 6952.503768] Mem abort info:<br>
[ 6952.504431]=C2=A0 =C2=A0ESR =3D 0x0000000096000005<br>
[ 6952.505333]=C2=A0 =C2=A0EC =3D 0x25: DABT (current EL), IL =3D 32 bits<b=
r>
[ 6952.506541]=C2=A0 =C2=A0SET =3D 0, FnV =3D 0<br>
[ 6952.507354]=C2=A0 =C2=A0EA =3D 0, S1PTW =3D 0<br>
[ 6952.508154]=C2=A0 =C2=A0FSC =3D 0x05: level 1 translation fault<br>
[ 6952.509208] Data abort info:<br>
[ 6952.509849]=C2=A0 =C2=A0ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x000000=
00<br>
[ 6952.511175]=C2=A0 =C2=A0CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0<=
br>
[ 6952.512372]=C2=A0 =C2=A0GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D=
 0<br>
[ 6952.513667] swapper pgtable: 4k pages, 39-bit VAs, pgdp=3D00000000412500=
00<br>
[ 6952.514909] [ffffffffffffffec] pgd=3D0000000000000000, p4d=3D00000000000=
00000, pud=3D0000000000000000<br>
[ 6952.516423] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP<br>
[ 6952.517503] Modules linked in: x_tables tun loop [last unloaded: ip6_tab=
les]<br>
[ 6952.518691] CPU: 1 PID: 1078 Comm: kworker/u12:1 Tainted: G=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 W=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6.6.142-yocto-standard #=
1<br>
[ 6952.520269] Hardware name: linux,dummy-virt (DT)<br>
[ 6952.521094] Workqueue: writeback wb_workfn (flush-7:0)<br>
[ 6952.521985] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)<br>
[ 6952.523184] pc : ext4_ext_map_blocks+0x260/0x1860<br>
[ 6952.524011] lr : ext4_ext_map_blocks+0xdb8/0x1860<br>
[ 6952.524851] sp : ffffffc086a3b620<br>
[ 6952.525421] x29: ffffffc086a3b740 x28: ffffffffffffffe4 x27: 00000000000=
0808c<br>
[ 6952.526624] x26: ffffff8017dd9000 x25: 000000000000808c x24: 00000000000=
00002<br>
[ 6952.527849] x23: ffffff8035e766c8 x22: ffffff802e589690 x21: 00000000000=
0042f<br>
[ 6952.529087] x20: ffffffc086a3b948 x19: ffffff8035e767f0 x18: 00000000000=
00000<br>
[ 6952.530310] x17: ffffffc081691310 x16: fffffffe001ab548 x15: 0000005564d=
4cb48<br>
[ 6952.531519] x14: 00000000ffffffff x13: 0000000000000000 x12: fffffffffff=
fffc0<br>
[ 6952.532683] x11: 0000000000000040 x10: ffffff8005d81d80 x9 : ffffffc0803=
cce14<br>
[ 6952.533886] x8 : 00000000bab647bc x7 : 0000000000000000 x6 : 00000000000=
0d847<br>
[ 6952.535065] x5 : 0000000000000000 x4 : 0000000000316019 x3 : 00000000000=
00000<br>
[ 6952.536264] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff803de=
ec880<br>
[ 6952.537425] Call trace:<br>
[ 6952.537860]=C2=A0 ext4_ext_map_blocks+0x260/0x1860<br>
[ 6952.538589]=C2=A0 ext4_map_blocks+0x19c/0x598<br>
[ 6952.539258]=C2=A0 ext4_do_writepages+0x5a4/0xbe0<br>
[ 6952.539977]=C2=A0 ext4_writepages+0x84/0x110<br>
[ 6952.540624]=C2=A0 do_writepages+0x94/0x1e0<br>
[ 6952.541240]=C2=A0 __writeback_single_inode+0x60/0x4d8<br>
[ 6952.542086]=C2=A0 writeback_sb_inodes+0x208/0x4b0<br>
[ 6952.542812]=C2=A0 __writeback_inodes_wb+0x58/0x118<br>
[ 6952.543578]=C2=A0 wb_writeback+0x274/0x440<br>
[ 6952.544198]=C2=A0 wb_workfn+0x3b0/0x5c8<br>
[ 6952.544788]=C2=A0 process_one_work+0x16c/0x3e0<br>
[ 6952.545434]=C2=A0 worker_thread+0x1b4/0x378<br>
[ 6952.546059]=C2=A0 kthread+0x118/0x128<br>
[ 6952.546599]=C2=A0 ret_from_fork+0x10/0x20<br>
[ 6952.547197] Code: 2a0103f9 b9009fe1 b9000e99 b40055fc (79401398)<br>
[ 6952.548170] ---[ end trace 0000000000000000 ]---<br>
[ 6952.551090] ------------[ cut here ]------------<br>
<br>
Reading the resulting code in 6.6.142:<br>
fs/ext4/extents.c:<br>
int ext4_ext_map_blocks(handle_t *handle, struct inode *inode,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct ext4_map_blocks *map, int flags)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ext4_ext_path *path =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // ...<br>
<br>
got_allocated_blocks:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D ext4_ext_insert_extent(handle, inode, =
path, &amp;newex, flags);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(path)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D PTR_ERR(pat=
h);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Gracefully =
handle out of space conditions. If the filesystem<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* is inconsis=
tent, we&#39;ll just leak allocated blocks to avoid<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* causing eve=
n more damage.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // ...<br>
out:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ext4_free_ext_path(path);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_ext4_ext_map_blocks_exit(inode, flags, ma=
p,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err ? err=
 : allocated);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return err ? err : allocated;<br>
}<br>
<br>
=3D&gt; Under out of space condition (what LTP does a *LOT*): path is given=
 unmodified to<br>
ext4_free_ext_path() that only does a NULL check (no IS_ERR) before<br>
dereferencing it. And that produces the oops and then, the LTP failure.<br>
<br>
Notably, master commit 6b854d552711 (&quot;ext4: get rid of ppath in get_ex=
t_path()&quot;)<br>
never got backported to 6.6.y. But does add the IS_ERR_OR_NULL() check<br>
to ext4_free_ext_path:<br>
=C2=A0void ext4_free_ext_path(struct ext4_ext_path *path)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR_OR_NULL(path))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
<br>
Bruce, what do you think? Should we backport<br>
6b854d552711=C2=B7(&quot;ext4:=C2=B7get=C2=B7rid=C2=B7of=C2=B7ppath=C2=B7in=
=C2=B7get_ext_path()&quot;)? Ask for it to<br>
be backported?<br></blockquote><div><br></div><div><div style=3D"font-size:=
small">It&#39;s possible. But without being able to reproduce the issues lo=
cally, I&#39;m just</div><div style=3D"font-size:small">guessing.</div><div=
 style=3D"font-size:small"><br></div><div style=3D"font-size:small">I would=
n&#39;t just backport it, I&#39;d suggest that -stable pick it up as well, =
but then</div><div style=3D"font-size:small">I&#39;m back to not being able=
 to see any issues locally.=C2=A0 I wouldn&#39;t ask for a</div><div style=
=3D"font-size:small">backport without knowing it does fix the issues.</div>=
<div style=3D"font-size:small"><br></div><div style=3D"font-size:small"><di=
v>I&#39;m happy to cherry-pick it as a shot in the dark, but that&#39;s all=
 it would be :)</div></div></div></div></div></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">I could setup AB to repeatedly tes=
t with/without the cherry-pick (only the fs section of ltp). I suspect the =
frequency of the bug triggering is quite high and that would prove the fix,=
 enough to convince you and -stable?</div><div dir=3D"auto"><br></div></div=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Even enough runs with no failure is probably enough, given th=
at you&#39;ve</div><div class=3D"gmail_default" style=3D"font-size:small">a=
lready been seeing it on the AB. That could be our &quot;before&quot; sampl=
e set.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">I can cherry-pick =
it and send SRCREV bump to the 6.6 recipes in the</div><div class=3D"gmail_=
default" style=3D"font-size:small">scenario I&#39;m suggesting that should =
be all you need.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"auto"><div dir=3D"auto"></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"font-size:small"><di=
v><br></div></div><div style=3D"font-size:small">Bruce</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks for your help!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</blockquote></div></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000759c4f0654ef0490--

