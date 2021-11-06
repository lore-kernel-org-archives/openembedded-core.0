Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D73DC433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 21:18:22 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web09.24080.1636233501980573915
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 14:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jFsOQbH9;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id a129so32322780yba.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 14:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Yv1jieo3trFAhBtW9c+9xEr53ajZDSdZkrALtyuLnWg=;
        b=jFsOQbH9TWHnLJWN5w+y7WK7vaQN5XmMGumBQu/YAOnxvJ9ySki5OaTe27TpSoUemc
         J3GP0/eCjQfGvVMiwpnlpVroTr9zHRK96im02/juFqBKYBSIiK1DPhfwr3UiEq3YRtbE
         yRY5KMK5RZpg3lLGiB0Dn2YE7cCwxstgf1QZjVJa+F9HmNpilEkxTrwS32Qd0nel9hd5
         N6YN+xcRbAfklhBQTEDw3vNR5k5gPfDUEquixTlV2NMxRl6Oqwd/WYfiGHyPzFmGPl9N
         zVKZGPUu6VWA75etRhUdQ7uqGMc5RKK+ExuMgC+r0pvB00tZrqKOcY6F1jElAo0Q6yDg
         sJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Yv1jieo3trFAhBtW9c+9xEr53ajZDSdZkrALtyuLnWg=;
        b=zYvHhE77OYUOITL9cgAi4IZ8XV4B+nZ6NH0HWw5GKAHDGigRCpOEFjEAmcIrm+jLEi
         JP6DMtf8IyjS8KBDDKxEUgtj+GB32hMOIlPpIYR9mhx9NjmjKosAC/mZrQR3yN7aRsdk
         JPimNJU6VRSFNgWtUslnSv0iLN/IZ/tnlv6UtqbIjm9gMU1WqoPEVpFJ1KqXAhovavdc
         OKbM2yddWXdHTRm/8SaewnehF2Fx6hQljzIaRIHYKS9Y9hdWbWUHC5yALPRw6Opy6ynv
         s9ti46hBUUAVyEoslJIHh8QWIiuj136rpWef/pUyflNTvo5foAjvp5L4HlDptCy19nmB
         AHhQ==
X-Gm-Message-State: AOAM532JzxECd0LEAO2PvzT0J9gHRTD3AiLP3QjRHpdzsHah6HPGkF5D
	l5X9a5Xl4KSRAvqStNufU53jKcl4TQeLGexdkIE=
X-Google-Smtp-Source: 
 ABdhPJyvjCSsGcGTvlTPM7tTq462fFLGWt0AiH8+ASqTDf0sTS5YEUxaUfaWDYzDyRDGjQkYbyT/IaSdbh/q+IoDkC4=
X-Received: by 2002:a25:37cb:: with SMTP id
 e194mr58348232yba.449.1636233501223;
 Sat, 06 Nov 2021 14:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <16B46DC051798307.25609@lists.openembedded.org>
 <CANPvuRkNsLegEXwZBzjx6OHSwb36RHAhN8qH2HTZgBBFrE0_TQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRkNsLegEXwZBzjx6OHSwb36RHAhN8qH2HTZgBBFrE0_TQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Sat, 6 Nov 2021 11:18:10 -1000
Message-ID: 
 <CAGDS+nmSC2FO9aOWdD39ciMn37s--kqwpWGBKg8UQpR2G-oKLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] sstate: another fix for touching files
 inside pseudo
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 21:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157946

On Sat, Nov 6, 2021 at 8:09 AM Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:
>
> Hi Steve,
>
> Can this patch be backported to dunfell branch to land in the next releas=
e 3.1.12?

This patch won't apply due to the zstd related changes in master.
Could you submit a dunfell version of the patch?

Steve

>
> Jose
>
> Jose Quaresma via lists.openembedded.org <quaresma.jose=3Dgmail.com@lists=
.openembedded.org> escreveu no dia quinta, 4/11/2021 =C3=A0(s) 19:14:
>>
>> This patch is a fixup for 676757f "sstate: fix touching files inside pse=
udo"
>>
>> running the 'id' command inside the sstate_unpack_package
>> function shows that this funcion run inside the pseudo:
>>
>>  uid=3D0(root) gid=3D0(root) groups=3D0(root)
>>
>> The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo ]
>> will always return true and the touch can fail when the real user
>> don't have permission or in readonly filesystem.
>>
>> As the documentation refers:
>> - the file test operator "-w" check if the file has write permission
>> (for the user running the test).
>> - the file test operator "-O" check if you are owner of file
>>
>> We can avoid this test running the touch and mask any return errors
>> that we have.
>>
>> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> ---
>>
>> V2: match the original code
>>
>>  meta/classes/sstate.bbclass | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>> index 8182010047..849723d4dc 100644
>> --- a/meta/classes/sstate.bbclass
>> +++ b/meta/classes/sstate.bbclass
>> @@ -900,12 +900,12 @@ sstate_unpack_package () {
>>         fi
>>
>>         tar -I "$ZSTD" -xvf ${SSTATE_PKG}
>> -       # update .siginfo atime on local/NFS mirror
>> -       [ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && =
[ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
>> -       # Use "! -w ||" to return true for read only files
>> -       [ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
>> -       [ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touc=
h --no-dereference ${SSTATE_PKG}.sig
>> -       [ ! -w ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ]=
 || touch --no-dereference ${SSTATE_PKG}.siginfo
>> +       # update .siginfo atime on local/NFS mirror if it is a symbolic =
link
>> +       [ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo=
 2>/dev/null || true
>> +       # update each symbolic link instead of any referenced file
>> +       touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
>> +       [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PK=
G}.sig 2>/dev/null || true
>> +       [ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTAT=
E_PKG}.siginfo 2>/dev/null || true
>>  }
>>
>>  BB_HASHCHECK_FUNCTION =3D "sstate_checkhashes"
>> --
>> 2.33.1
>>
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157943): https://lists.openembedded.org/g/openembedde=
d-core/message/157943
> Mute This Topic: https://lists.openembedded.org/mt/86824160/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sa=
koman@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

