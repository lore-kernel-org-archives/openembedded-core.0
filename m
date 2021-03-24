Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.1418.1616613142184553775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 12:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0Z1Lkp6z;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.42, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f42.google.com with SMTP id c8so12667383wrq.11
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 12:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IlPjFze8N+1BhB2JK/NO3juejom25rckeaa1fjFSzqA=;
        b=0Z1Lkp6z08/AhjA+07vqFdxYlwleEYK1aSAY8I5HJpvwDKoRVplmF0lnqix0c/hIjR
         8NKulCN4ooR6EjPouTQzCQAcLpNBokjbQheE0sVO2cgOjt3FWreK/8xcOL84x4BuAf/E
         ZukfsgNrUdFwBIZcI6uE6GuR/70/h8YOVhPVBj1UKtSENXj8Gn0sS2QV9ojkAAvl0YZh
         66eisQkpmUbEYLP7gdLfBeriOPhB9sOqUX9gtR0RG1HqIxWNJBgwIG1UCsfGB5pCeuYI
         8qZeoujTLEXOU8PEs7XyxFXyl6gfzY1aQV6JqO2S7oR1lFDg5TLhKWK8Pn+ANPO7mBko
         xoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IlPjFze8N+1BhB2JK/NO3juejom25rckeaa1fjFSzqA=;
        b=pw1ab+KXIGJk84MPLVE438f1bxgtXupAhle1VKqYacSNfbvau6rDv4C4UyDx8/ahKC
         JUvtNns86hbBvwgSPMFbbhtMOK/r6RJpc7324uT/7OnxQl7w/dbR1BXXWq6IpENBi8CI
         wlonoVETqrnj76GG7Flcv1FwCn4scEFAHdxOS0f6MQlOsZzY2sk5g32PQLEyGmEFewJb
         msvSyzwXW2WH87+6x8acwDSuKgy8JN9XymJVsmE+ysuQavl4RKzUatrL8WLE7vXABF4X
         Ox/eHKDcM0bL7P2M3ur2zpVe4xsUOTW1pwAIFExXhiFre9BEDISburB5cScfBq0QJUwd
         EmDQ==
X-Gm-Message-State: AOAM530f8Gl5CKkAhzOWmfiBprQKgXE7uLrIeMLVb6U7aZrQ0JZBXfuG
	R3hE1xDS22kamyvtaUeeqpanccYqf/ZhsKdJ1CumNg==
X-Google-Smtp-Source: ABdhPJz2ClWZc7ltdzkRMhBktuaQwS0ErrD39ffCXtMNTfBIdmITyrr9/Fkt6UmgibZC1qvP8tHhsiF4K8JpQpcozYo=
X-Received: by 2002:adf:fcc7:: with SMTP id f7mr5086187wrs.400.1616613140472;
 Wed, 24 Mar 2021 12:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210321102616.3752416-1-gmouse@google.com> <CAOSpxdaWrkdaKgnJDpPCxibMfj9y9ttQ_TCOT839RGYHBaCNdg@mail.gmail.com>
 <69556966-7994-7866-9766-2124c8e386bc@gmail.com>
In-Reply-To: <69556966-7994-7866-9766-2124c8e386bc@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 24 Mar 2021 09:12:09 -1000
Message-ID: <CAOSpxdZw3NnynyTGz+FUqyvcAuXCVERDgvht2x4Nx1h_NQnrpw@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH] run-postinsts: do not remove postinsts directory.
To: Khem Raj <raj.khem@gmail.com>
Cc: gmouse@google.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 24, 2021 at 8:28 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 3/24/21 8:09 AM, Steve Sakoman wrote:
> > On Sun, Mar 21, 2021 at 12:26 AM Anton Kachalov via
> > lists.openembedded.org <gmouse=google.com@lists.openembedded.org>
> > wrote:
> >>
> >> From: "Anton D. Kachalov" <gmouse@google.com>
> >>
> >> When running on the systems having read-only rootfs backed by overlayfs,
> >> removing the whole directory lead to create a special char device file
> >> on the upperdir to reflect directory's removal. Once it is required to
> >> upgrade the whole read-only image that might contain new postinsts scripts,
> >> it will be impossible to run such scripts with a "deletion mark" file
> >> on the overlayfs -- the whole directory will be marked as deleted regardless
> >> new files in it.
> >
> > Is this something that should be considered for backporting to
> > dunfell/gatesgarth?
> >
>
> yes seems so

I thought so too, since I need it :-)  But I didn't want to grab it
just because I liked it!

Steve

> >
> >> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> >> ---
> >>   .../run-postinsts/run-postinsts/run-postinsts          | 10 ++++------
> >>   1 file changed, 4 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> >> index f84a7e18c8..95dccb9cae 100755
> >> --- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> >> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> >> @@ -72,12 +72,12 @@ exec_postinst_scriptlets() {
> >>                  else
> >>                          echo "ERROR: postinst $i failed."
> >>                          [ "$POSTINST_LOGGING" = "1" ] && eval echo "ERROR: postinst $i failed." $append_log
> >> -                       remove_pi_dir=0
> >> +                       remove_rcsd_link=0
> >>                  fi
> >>          done
> >>   }
> >>
> >> -remove_pi_dir=1
> >> +remove_rcsd_link=1
> >>   if $pm_installed; then
> >>          case $pm in
> >>                  "ipk")
> >> @@ -92,9 +92,7 @@ else
> >>          exec_postinst_scriptlets
> >>   fi
> >>
> >> -# since all postinstalls executed successfully, remove the postinstalls directory
> >> -# and the rcS.d link
> >> -if [ $remove_pi_dir = 1 ]; then
> >> -       rm -rf $pi_dir
> >> +# since all postinstalls executed successfully, remove the rcS.d link
> >> +if [ $remove_rcsd_link = 1 ]; then
> >>          remove_rcsd_link
> >>   fi
> >> --
> >> 2.31.0.rc2.261.g7f71774620-goog
> >>
> >>
> >>
> >>
> >>
> >>
> >> 
> >>
