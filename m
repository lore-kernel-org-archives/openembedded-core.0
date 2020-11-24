Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web08.1545.1606244658730767930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 11:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L3mDNnwP;
 spf=pass (domain: gmail.com, ip: 209.85.210.66, mailfrom: toertel@gmail.com)
Received: by mail-ot1-f66.google.com with SMTP id y24so14843821otk.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 11:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1BKWhGtDPdFBeh9udV+rVqVd01CPG74tA5kPA4Vhl5c=;
        b=L3mDNnwPcI5pc8AIMy+ZjPeX91KfjTVp04Kdldq3H17HxQVlRrX+1FujxQQQr1gFYt
         XpZwhTf0cxXDY6mQ0wXiTkvw4PGx2pE4T0iPTdzzTb0UBDLaSDdQOx6xWvAe3Gm+vUyI
         njwGEwT49uuzv3sMpYgbOCBLLxiiGSW1CzUdPXc5Ov8Kz02MsXxHYiSMl0vcpnILZLL1
         vP7haG6MLaawQYb2X+i7lLLyMu8bWumwkODm1JgDf1Fdb/KO+sOE8u/SB+yFev5s706O
         uLzL0WCULsygRW6dSQx+yrNxcUMMJPWMEB4et9e0su3ZaNIzTNuy8sRYy5kU8nWJ0RI7
         H+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1BKWhGtDPdFBeh9udV+rVqVd01CPG74tA5kPA4Vhl5c=;
        b=VO4Quqif2m2kx7NM7EDRx643B9eIjdBWT2L4KTJAwEYZg+dvL6OXUPJg12Bh1molWW
         G1Cd5oLBQtFpv/ys6HwpiYoY63KlxQOJJ0vh8bG5j7x2bHKUTkRYod+WqhD8olOUL/WY
         rXJPq2I47qNMBJJ8cKjpmZW9Rku/LL9v4SMUFzHXAgneIFbX63vWowH+J2wKsI8CjhuL
         2H/LeWRNUgdpIovCQqYP1K6QOch4ob1AZ/PCSWa1O1kf/PeiwJbUPc0y0w53kR10jfFS
         5QtyXh9sJl2rPPARTBcQzlpRi2oJn7z/rt7+aSi6Z4S2d09Z/gDe1+hl+KKZd9AQyDKf
         jHDA==
X-Gm-Message-State: AOAM530Ozzh4O5c+BO/p179WmC/w4OH6JnjK6NeLlczg6Tn9hH92mD3B
	aKV+sdtn7SrhPnce0LbXJ8+qsYAW7GDBVMBWX1w=
X-Google-Smtp-Source: ABdhPJzpINESI08TolYRjYktla2aWnGklLarT8DHSDS8tZt2XYUehE31KgxFp74IE5LX18bMVg6eA/q85mRKSlMWbdg=
X-Received: by 2002:a9d:3be3:: with SMTP id k90mr42573otc.50.1606244658067;
 Tue, 24 Nov 2020 11:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20201123191349.7503-1-toertel@gmail.com> <CAJ86T=URx1WJ9=+7-pQ+iUoTi5yT4jJaPdct0zOqa0gYFTF8Mg@mail.gmail.com>
 <50edf6012e58b2d75be5c013dcab19365e5e4818.camel@linuxfoundation.org>
In-Reply-To: <50edf6012e58b2d75be5c013dcab19365e5e4818.camel@linuxfoundation.org>
From: "Mark Jonas" <toertel@gmail.com>
Date: Tue, 24 Nov 2020 20:04:07 +0100
Message-ID: <CAEE5dN3i6_g_jHCm1dwfoREq-GS09dY0KRwqSWSO8azvvRx_Mg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsdl2: Add directfb to PACKAGECONFIG rdepends
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Richard and Andre,

On Tue, Nov 24, 2020 at 4:52 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2020-11-23 at 11:54 -0800, Andre McCurdy wrote:
> > On Mon, Nov 23, 2020 at 11:14 AM Mark Jonas <toertel@gmail.com>
> > wrote:
> > > When building libsdl2 with PACKAGECONFIG[directfb] then directfb is
> > > added to the DEPENDS. But the automatically generated runtime
> > > dependencies do not add the directfb package to the runtime
> > > dependencies. Most likely this happens because libsdl2 does not
> > > link
> > > against directfb but uses dlopen() or similar. Thus, the runtime
> > > dependency to directfb needs to be declared explicitly.
> > >
> > > Here, a runtime recommendation is used to allow ignoring the
> > > runtime
> > > dependency using NO_RECOMMENDATIONS.
> >
> > Why would anyone want to ignore the runtime dependency?
>
> Agreed, that does seem strange. Whichever way this goes, the patch
> shortlog needs to match the commit (it says rdepends right now).

Thank you for the feedback. I'll send a V2 of the patch.

Greetings,
Mark
