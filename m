Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D54C54ED1
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 04:51:12 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.1924.1748062271123477403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 21:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KRr3Ki2c;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72c16e658f4so250767a34.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 21:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748062270; x=1748667070; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMI+QnN+dp+1CvNT+JOkCMsC728Wcwzj9Yx19MavsE4=;
        b=KRr3Ki2cAHP0sghShqbvb8r3UYb1LIFKhE2u88qyYpN63/31aBJlpyWAFyg/Qlmqz3
         rwdsKG66qzN+vbq1V3Ayw/U9Ksxetj4J261XXMZ0v5qZbUz0r7gAtM2dZRHvnyOeIuSS
         /PbE4fGzBIrcv+RRjvtz+9SWfrFiBJFRNWAWgDE+koTEtdEeCfy/oAJ6A+UeAV3n3WLW
         cnX/2tkCEm5HkJ5C/MonWic9R+2VkldvhCcAaGz1HQ/PDlJHmmxcfmh8UauofhCLFopN
         fW2FVwaaiq2uFs44Cy8Km2t+iZNQB2Teq9LlNkTIdtuiFUkdGT8YpcPFT/J3RNkVTaYg
         kmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748062270; x=1748667070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMI+QnN+dp+1CvNT+JOkCMsC728Wcwzj9Yx19MavsE4=;
        b=vGakOGCE8Q9/y+KbPCLUMjNSQDsQjfHGfzH8M325nN3J+nG/5CER8oU5jdzOeeT/jo
         mfT/iCGabGe34boz5OVhgWWfIZnDayv7R8rSNqGbBKWAeidnzR+LduMxoMBaptkf3svF
         R6LBxIP1rSOwoK6Nu2PxQ2p+i9wPmisNAj4V6U/AbtoLygBNR7EQQ2zH53Y6JjkJArRC
         FbQ8WjhiJjM9crskVhcmUOUk7M4I09oH44WOQd7JCH8YhvtgNINbuy0wPvxXmQcRs5dg
         Q/2V4pJUdEar86Ib+JwwjpI/meMpSf8R/gdZZCdPDZ8PvJhX2WZMQx5DY38Z77QW7bqJ
         g+7w==
X-Gm-Message-State: AOJu0YxwwtjLoi2fhVriXdgiEKWrQ1H2wxVte5WkGhW97ioVtJUN4TpW
	++/vMdiS3UwJR/NPnWp4mUMM5H5eK7+YjWLgZfvUhlnhtgS5LS6qy2xQ0/AMruUt7M3E9NBuFz8
	nKbZe/kB8tNZ/4X2SPricV1ZCVpaETrs=
X-Gm-Gg: ASbGncvf4iPXh6E/OaF8C0N3xndkgSp/VwZHZEXNtCGg0wziVFTe2O//iIKYqnvMHWa
	pRLofvj+fNMXAAbfHSkq9mKZpg20JPOISuylYKoQ44ag+ViXn+C7teFe3WRkoFU6R4KVG2d4t/H
	PXRu6zpbeoCIHO3q9TV2Ck4ilJdvBfkpyv
X-Google-Smtp-Source: AGHT+IFkVUMCsruZ3fxhQXyOAdn/KoMWzj/jfPgTnY9QNdTgYoyoJeR5wqFq7OlOKkGZubh+QH9z+mK6iVyAqhnYfq4=
X-Received: by 2002:a05:6808:80c3:b0:404:a28c:ca4b with SMTP id
 5614622812f47-4064682c405mr1003130b6e.20.1748062269903; Fri, 23 May 2025
 21:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250524035958.3809327-1-raj.khem@gmail.com> <CADkTA4Ok10vyyr7hPK75=vj-GF47zf_J+RW1LKM+t2dS4_LioQ@mail.gmail.com>
In-Reply-To: <CADkTA4Ok10vyyr7hPK75=vj-GF47zf_J+RW1LKM+t2dS4_LioQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 May 2025 21:50:44 -0700
X-Gm-Features: AX0GCFse1msk7RPNnElQqZwkA6dm7wNYP8Rhlzp0F6DkYnQEVCzFJKWI98RhYf4
Message-ID: <CAMKF1so7kadvSTZuS5UpV42H2ra2NakAH4ToQNxaD8QM=ohMhg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: Remove debug-kernel.scc for
 riscv32 kernels
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 04:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217222

On Fri, May 23, 2025 at 9:12=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
>
>
> On Sat, May 24, 2025 at 12:00=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
>>
>> modpost fails to process the debug location lists for riscv32
>>
>> | ERROR: modpost: vmlinux: local symbol '__asm_copy_to_user' was exporte=
d
>> | ERROR: modpost: vmlinux: local symbol '__asm_copy_from_user' was expor=
ted
>> | ERROR: modpost: vmlinux: local symbol '__clear_user' was exported
>> | ERROR: modpost: vmlinux: local symbol 'xor_regs_2_' was exported
>> | ERROR: modpost: vmlinux: local symbol 'xor_regs_3_' was exported
>> | ERROR: modpost: vmlinux: local symbol 'xor_regs_4_' was exported
>> | ERROR: modpost: vmlinux: local symbol 'xor_regs_5_' was exported
>> | WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (sect=
ion: __ex_table) -> .LASF464 (section: .debug_str)
>> | ERROR: modpost: __ex_table+0x1560 references non-executable section '.=
debug_str'
>>
>> poky adds features/debug/debug-kernel.scc via distro policy and hence
>> the builds are failing for qemuriscv32 on AB. While this should be
>> fixed in kernel build system or tools, this makes us proceed until
>> then
>
> The question is .. how will we ever know to revisit this ? Can we raise a=
 bug
> To track that this needs to be reenabled later ?
>

I plan to open a tracker on - https://bugzilla.yoctoproject.org/
once its back online, but more importantly I am going to raise it in
riscv kernel community once
I have narrowed it a bit down.

> Bruce
>
>>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto_6.12.bb | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipe=
s-kernel/linux/linux-yocto_6.12.bb
>> index fefed8c9c53..83be9fed428 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
>> @@ -72,5 +72,8 @@ KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DIS=
TRO_FEATURES", "ptest", " cg
>>  KERNEL_FEATURES:append:powerpc =3D " arch/powerpc/powerpc-debug.scc"
>>  KERNEL_FEATURES:append:powerpc64 =3D " arch/powerpc/powerpc-debug.scc"
>>  KERNEL_FEATURES:append:powerpc64le =3D " arch/powerpc/powerpc-debug.scc=
"
>> -
>> +# Do not add debug info for riscv32, it fails during depmod
>> +# ERROR: modpost: __ex_table+0x17a4 references non-executable section '=
.debug_loclists'
>> +# Check again during next major version upgrade
>> +KERNEL_FEATURES:remove:riscv32 =3D "features/debug/debug-kernel.scc"
>>  INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217221): https://lists.openembedded.org/g/openembedde=
d-core/message/217221
> Mute This Topic: https://lists.openembedded.org/mt/113276800/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

