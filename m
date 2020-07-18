Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web12.12923.1595086182717825415
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2020 08:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YwnBShg6;
 spf=pass (domain: konsulko.com, ip: 209.85.210.66, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f66.google.com with SMTP id n24so9028378otr.13
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2020 08:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yUZqCmyrAlIsSvbnoxLuMxmvGWklY5MyBv4ELMx4oAc=;
        b=YwnBShg6QMlfYfNa5ho49MeRouLBaHjnxKOkkDHGP5kYrZAMIBoXBDJ9flyaDkNiWC
         GMMqBUXBvh8g+mhIKzwoXDmMHrwN/6iUbRuhGuZqfofTlFlGouK9KVRJJY7u3apBH2u+
         GAL7zKkOqqi1u2lO96pD+m+i5CvX94nXwqrTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yUZqCmyrAlIsSvbnoxLuMxmvGWklY5MyBv4ELMx4oAc=;
        b=KnAP84xezsO0o1KVHBiYRWxPUt7tWJ/3dPNYc3hYZSYNxFdGKIZoeLaL5O7oJylcnv
         WLiFShWwjvg6T8UfzsgQ87wYMhZZiSl7Bh2URKPF58wxLcXxcEJawMmlVucZVPsr+Hpr
         Nz9lFHvVMYdb5f15A7tHXDl5vKms2HciHjwZ/2VgFLdKZToHjp1icS+nZxiyQcVvon/2
         ivRUIku5z2JXPB2xG0N99Q3VQUuGvVAt+VDJAD1FP7iQq7w2DRha8Eb84wN6ArGQUNlb
         7FlyoKDA97aRm/B4vGvzcNnzsffBOJOd2uCVbTWgAM6uF6prQQnuNgCzoZgxEv4kNGz6
         gOnA==
X-Gm-Message-State: AOAM533sro+eZYD7Hke5JFmu8umyNjJPHWgaAbr8LWYYa9EVASfk/wza
	qegmLDTVyz/3EoUqxpvNlhi4HXjw5vCxrlh234Iwfw==
X-Google-Smtp-Source: ABdhPJwIAGheOdXlYkUN97TotiXa8qcni5HQxcuSmXjNxiVedAWd1sAtaQjHtysJBlv4xUNlz+CDZlH+RL+OXRdbSok=
X-Received: by 2002:a9d:640b:: with SMTP id h11mr13576810otl.92.1595086181872;
 Sat, 18 Jul 2020 08:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200703114402.8850-1-fredrigu@axis.com> <20200703114402.8850-2-fredrigu@axis.com>
 <1594291329382.85415@axis.com> <CAM9ZRVtH5m14PHydagC1k9XnaEu=USX2oFRraGUvCh=911scxg@mail.gmail.com>
 <1594710174328.5614@axis.com>
In-Reply-To: <1594710174328.5614@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Sat, 18 Jul 2020 16:29:31 +0100
Message-ID: <CAM9ZRVs_KNN4pqA7k1YmQkThsDdDAJbTdyiVY=2uAdnPmaFz5Q@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] Move rpm manifest to its own subdir
To: Fredrik Gustafsson <Fredrik.Gustafsson@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2020 at 08:02, Fredrik Gustafsson
<Fredrik.Gustafsson@axis.com> wrote:
>
> Thank you, just let me know if I can make it any easier to review this,
> I know it's a big patch.

Hi Fredrik,

Sorry for the delays here, I've been unable to get back to this until
today due to other commitments and a few health issues.

Here's my feedback on the series as a whole. Overall I think it's
excellent, I much prefer the result where the code is grouped by
package manager (opkg, dpkg or rpm) to the existing code where it's
spread across package_manager.py, rootfs.py, manifest.py and sdk.py.

1) Please edit the first line of each commit message to follow the
style guide at https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines.

2) Please also fix the following whitespace errors reported when
applying these patches:

$ git am ../v4-Move-rpm-manifest-to-its-...-and-11-more.mbox
Applying: Move rpm manifest to its own subdir
.git/rebase-apply/patch:148: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: Move ipk manifest to its own subdir
.git/rebase-apply/patch:187: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: Move deb manifest to its own subdir
Applying: Move rpm rootfs to its own dir
.git/rebase-apply/patch:161: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: Move ipk rootfs to its own dir
Applying: Move deb rootfs to its own dir
.git/rebase-apply/patch:222: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: Move rpm sdk to its own dir
.git/rebase-apply/patch:127: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: Move ipk sdk to its own dir
.git/rebase-apply/patch:42: trailing whitespace.
self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"),
.git/rebase-apply/patch:109: new blank line at EOF.
+
warning: 2 lines add whitespace errors.
Applying: Move deb sdk to its own dir
.git/rebase-apply/patch:108: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: Move rpm package manager to its own dir
.git/rebase-apply/patch:840: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: Move ipk package manager to its own dir
.git/rebase-apply/patch:951: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: Move deb package manager to its own dir
.git/rebase-apply/patch:1042: new blank line at EOF.
+
warning: 1 line adds whitespace errors.

3) I'd recommend the new module keeps the name package_manager. You
can do this by moving the existing code into
package_manager/__init__.py and then splitting it up inside that
directory. Imports and wrappers in the __init__.py file can be used to
ensure no other bit of the code needs to worry about the changes.

4) Please avoid unnecessarily using imports inside functions. In
rootfs.py, manifest.py and sdk.py you can import the required classes
at the top level. Functions like create_rootfs(), populate_sdk(), etc
should not require any changes as part of this patch series.

I'll run as much of the selftest suite as I can on this series as-is
to see if there are any other issues.

Thanks,

-- 
Paul Barker
Konsulko Group
