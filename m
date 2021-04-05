Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web09.42.1617638358097162954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 08:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=Tc+dBYkj;
 spf=pass (domain: google.com, ip: 209.85.166.181, mailfrom: gmouse@google.com)
Received: by mail-il1-f181.google.com with SMTP id l9so4415352ils.6
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FM2T1Ku+06TfJqx5r6tZlpUlWgjbWmP1bqHQsCfcFUo=;
        b=Tc+dBYkj5OdJC4y9+YDh5bWxjGD4yNLGap4EzBhOKfQ2WNfMNzOj0PAB4Yz0GgR5zo
         NgE6IkeGlzLy04aA4ndW9AmbNPz/WePPl6xvCZbe2NH8YxRUw8U0+d4J3J3OBOKUXF+s
         NSCdzv1X5KLk92IYjtXNPUWfjkgvcIK0Nn+HGXOC3QXnzZ6aWlAI0Rtbnh9seiGb+kHs
         iXgH6CtQkczcLr4btarAA6bzwbBCCCtjWHgnZTs5mnLLq4KZXJ9Y2hDt/tg57WEP8LEV
         nrhzhWPNeKky/43UDoOUfW3+8GqbJ8kwADC9/CXGuWgCZ2Lkikv2BBY8TZUF7Itqvnas
         HkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FM2T1Ku+06TfJqx5r6tZlpUlWgjbWmP1bqHQsCfcFUo=;
        b=JTM2W+BodLNaqKhpuRtk8Gj6ntDc4w4ShcEyOP8DOfJQCxkcn27Wt+YfMfjRLer2NN
         3I9x+3isdSPIFPcO2kiHAYnCQZqIdIFLMg35B6vF6m3VOatTq/XerU+BAHLfUKk6sjYl
         euxKUxAOrqUmuybqRe/i4NYhLSP4hA0M91x53xYqfFQqmGWJTEYpiBG4kYpDQHhoiODG
         2O2p6Q8wCjoFF20vzLLsjYtQh7fwY9inVy8okT1gz7XmJYrQF7HCHnPwBTQBTsBHB1eJ
         h7uaTcf/W7r34iqiJMsmO6wZaJiaUVjlwt6J67+/0wYEERSeQ8Z2TBhw3QSzhzcs0PJg
         8poA==
X-Gm-Message-State: AOAM533Hje6dWEBI6A3kcm7mR38yphY9JGYYurEglbpkSitDLkjo931O
	iIrBwLupsEoA/FCD5yp7RMx37cMydRRPcYRql9rmGA==
X-Google-Smtp-Source: ABdhPJze7FrKFACwrOe5UOmLMIzxb79O123bENIV/Nk2VHXHaPTLeN7a+yWjp56MlnyCs0pJdePdx6xr14ol6+Yzt4U=
X-Received: by 2002:a05:6e02:198f:: with SMTP id g15mr20267546ilf.200.1617638357274;
 Mon, 05 Apr 2021 08:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210321102616.3752416-1-gmouse@google.com> <CAOSpxdaWrkdaKgnJDpPCxibMfj9y9ttQ_TCOT839RGYHBaCNdg@mail.gmail.com>
 <69556966-7994-7866-9766-2124c8e386bc@gmail.com> <CAOSpxdZw3NnynyTGz+FUqyvcAuXCVERDgvht2x4Nx1h_NQnrpw@mail.gmail.com>
In-Reply-To: <CAOSpxdZw3NnynyTGz+FUqyvcAuXCVERDgvht2x4Nx1h_NQnrpw@mail.gmail.com>
From: "Anton Kachalov" <gmouse@google.com>
Date: Mon, 5 Apr 2021 17:59:05 +0200
Message-ID: <CADVsX8_hseB43ff+Jn=RwSvM=tUkF+cA=K-Y12Ty+iKcSGWL_Q@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH] run-postinsts: do not remove postinsts directory.
To: Steve Sakoman <steve@sakoman.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Mar 2021 at 20:12, Steve Sakoman <steve@sakoman.com> wrote:
>
> On Wed, Mar 24, 2021 at 8:28 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On 3/24/21 8:09 AM, Steve Sakoman wrote:
> > > On Sun, Mar 21, 2021 at 12:26 AM Anton Kachalov via
> > > lists.openembedded.org <gmouse=google.com@lists.openembedded.org>
> > > wrote:
> > >>
> > >> From: "Anton D. Kachalov" <gmouse@google.com>
> > >>
> > >> When running on the systems having read-only rootfs backed by overlayfs,
> > >> removing the whole directory lead to create a special char device file
> > >> on the upperdir to reflect directory's removal. Once it is required to
> > >> upgrade the whole read-only image that might contain new postinsts scripts,
> > >> it will be impossible to run such scripts with a "deletion mark" file
> > >> on the overlayfs -- the whole directory will be marked as deleted regardless
> > >> new files in it.
> > >
> > > Is this something that should be considered for backporting to
> > > dunfell/gatesgarth?
> > >
> >
> > yes seems so

I think so.
I'm unsure which version does OpenBMC use:

https://github.com/openbmc/openbmc/tree/master/poky

They sync it from time to time from Poky upstream.

>
> I thought so too, since I need it :-)  But I didn't want to grab it
> just because I liked it!
>
> Steve
>
> > >
> > >> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> > >> ---
> > >>   .../run-postinsts/run-postinsts/run-postinsts          | 10 ++++------
> > >>   1 file changed, 4 insertions(+), 6 deletions(-)
> > >>
> > >> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> > >> index f84a7e18c8..95dccb9cae 100755
> > >> --- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> > >> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> > >> @@ -72,12 +72,12 @@ exec_postinst_scriptlets() {
> > >>                  else
> > >>                          echo "ERROR: postinst $i failed."
> > >>                          [ "$POSTINST_LOGGING" = "1" ] && eval echo "ERROR: postinst $i failed." $append_log
> > >> -                       remove_pi_dir=0
> > >> +                       remove_rcsd_link=0
> > >>                  fi
> > >>          done
> > >>   }
> > >>
> > >> -remove_pi_dir=1
> > >> +remove_rcsd_link=1
> > >>   if $pm_installed; then
> > >>          case $pm in
> > >>                  "ipk")
> > >> @@ -92,9 +92,7 @@ else
> > >>          exec_postinst_scriptlets
> > >>   fi
> > >>
> > >> -# since all postinstalls executed successfully, remove the postinstalls directory
> > >> -# and the rcS.d link
> > >> -if [ $remove_pi_dir = 1 ]; then
> > >> -       rm -rf $pi_dir
> > >> +# since all postinstalls executed successfully, remove the rcS.d link
> > >> +if [ $remove_rcsd_link = 1 ]; then
> > >>          remove_rcsd_link
> > >>   fi
> > >> --
> > >> 2.31.0.rc2.261.g7f71774620-goog
> > >>
> > >>
> > >>
> > >>
> > >>
> > >>
> > >> 
> > >>
