Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web12.1455.1620945455022642106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 15:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fpb/+HY9;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id w4so35645183ljw.9
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 15:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uCKQMHR4i5cYzVr+CbOgriWcy/CCVids3xYKo3M3Rxw=;
        b=fpb/+HY9P8Au3pcGRrz+sRJD0wmYlO82Vv4w3r//VbO84bfp17yiXzaPa58qF2brxO
         nOh6dCvGEFGZcOdYW//EktAHxzcDbb+FUlyehHEv3sMrf86cWsvGh5m/nLzfee3NBptv
         k0jSv9cg7ikz1X/TiJgO6uRdWmopwT4S1YunF1dDZaYlu5wlR+FGExmFdVKkPE5sZd1o
         P2e9NF3qSVn61kep+HPR3dO1SSC0aJOoUWZMg3w/237QRYEd+7siUNSPLA3FUX9Kykdk
         6bCtMUXnMn7OrS05j6J++9ROVrptqEK2rNJukzvjdOdzfJtY8uQqO307viD5XdguYK/3
         qB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uCKQMHR4i5cYzVr+CbOgriWcy/CCVids3xYKo3M3Rxw=;
        b=gfLS8t6GvEbrxVcpakcR3muLu3c+gFYyU2a1giSFJ7yQEvW+yNT++jNtwsoDJq0GCB
         6zdcEzcT6Gvo7YyAWHq6lbCSUFc+GqHPCWiD56Y0MnvqkCz2ngjAOsSH3VcHNpUQ6SOL
         yGmJEHSnw7iiCr9cSOfpncNPdTpWy0FZLe3cxw4DIHRfXgrNhHCfwWqSvVC+bvLiz1iW
         ZpWSEqiE8Zd/CEy1IeeR8H5am0bE9RsITv1yV0IbPGloQFliyRJ2yuX0WonPLSggjcn1
         CmD9lv+VIyDGJba/s8gzCYrzgzLcecEemwoz6r+3cngSTyFJsKNdeVMPRVEhL8Lqc5R5
         L2Kg==
X-Gm-Message-State: AOAM532061IO9UP5BS7M2ei+EodqEh6Mp7o2q6NlpEijn64DMd198tGz
	giRelcSfYQdgp0T1dB1O1IZt5+fY4fDjGrj92a0=
X-Google-Smtp-Source: ABdhPJySSPCGhFz77GUvtUGDlDHkMBR/AQCsgs8FSfFUApnWhV3qwWNjPgKAKE7iQ06DICZBoH3fSKwsIROmHz+WJsQ=
X-Received: by 2002:a2e:9251:: with SMTP id v17mr35288707ljg.507.1620945452857;
 Thu, 13 May 2021 15:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <a46364f-5fa1-f318-5ada-5aee55134312@crashcourse.ca>
In-Reply-To: <a46364f-5fa1-f318-5ada-5aee55134312@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 13 May 2021 15:37:21 -0700
Message-ID: <CAJ86T=VY5B=x2GHg7fe=ArXTMCYFGm7XWMi-T75yfaoH7Sh2fA@mail.gmail.com>
Subject: Re: [OE-core] couple questions about creating companion debug filesystem
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 13, 2021 at 3:36 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   couple colleagues asked me about the details of how the debug
> filesystem is created, and since i wasn't entirely clear on the
> mechanics of it myself, i thought i'd dig into it, so a couple
> preliminary questions to make sure i'm on the right track.
>
>   trivially, if you want that companion debugfs, you need only:
>
>   IMAGE_GEN_DEBUGFS = '1'
>
> at which point what kicks in is the current value of
> IMAGE_FSTYPES_DEBUGFS to determine what forms of the debugfs you want.
> by default, that's conditionally set to "tar.gz" in bitbake.conf so,
> unless you mess with it, the end result is a debugfs tarball under
> deploy/images. so far, so good.
>
>   now, if you (for no good reason) also set:
>
>   IMAGE_FSTYPES_DEBUGFS = ''
>
> in your local.conf, then even though you *claim* you want the debugfs,
> you're not going to get one since the build process has no idea what
> archive type you want. i believe this is the result of this snippet in
> image.bbclass in the anonymous python routine (line 369):
>
>     if d.getVar('IMAGE_GEN_DEBUGFS') == "1":
>         debugfs_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS').split()
>         for t in debugfs_fstypes:
>             alltypes.append("debugfs_" + t)
>
> which makes sense. however, even if you don't get the final debugfs
> tarball under deploy, i see that the *contents* of the debugfs are
> still generated under WORKDIR for the image (in my case,
> core-image-minimal), since i see both:
>
>   rootfs/
>   rootfs-dbg/
>
> and following the trail of bread crumbs to see where that came from, i
> ended up in meta/lib/oe/rootfs.py:
>
>     def _setup_dbg_rootfs(self, dirs):
>         gen_debugfs = self.d.getVar('IMAGE_GEN_DEBUGFS') or '0'
>         if gen_debugfs != '1':
>            return
>
>         bb.note("  Renaming the original rootfs...")
>         try:
>             shutil.rmtree(self.image_rootfs + '-orig')
>         except:
>             pass
>         bb.utils.rename(self.image_rootfs, self.image_rootfs + '-orig')
>
>         ... and so on and so on ...
>
> which clearly(?) does all that work, even if, in the end, the result
> is not packaged as a tarball, which is part of what muh colleagues
> were asking about -- where can they see *exactly* how that debugfs
> content is collected?
>
>   is all this reasonably accurate so far?

Yes, I think so. Creation of the debugfs tar file uses a lot of the
same logic as creation of the rootfs image(s) so is controlled by
similar variables (e.g. IMAGE_FSTYPES_DEBUGFS is the equivalent of
IMAGE_FSTYPES). In theory you could change IMAGE_GEN_DEBUGFS to create
(for example) a squashfs image containing the debug symbols, but since
the debug symbols are going to be used on the host (and not copied
into Flash on the target etc) it doesn't make much sense to do so. In
practice the only reason you might want to change the default value of
IMAGE_GEN_DEBUGFS would be if you prefer .tar.bz2 etc over .tar.gz.
