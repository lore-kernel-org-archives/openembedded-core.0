Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.216.1588958573897729953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 10:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dnhZSPVM;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: sakoman@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id h4so10958907wmb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2020 10:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wtUzwag3pke6VpyOS5ulIxsWVT1yP/rHpqEAKVODkCE=;
        b=dnhZSPVMx6jLcVvHmh/M/y+dnSWDPML1svMwKuNq5j7ngIZBhr9qt1zv9bXSZeV3aM
         198eyaxJ9GFWxpxnq21pX8VYJwh0NP+s0i8TCb9GKo3bBcPiJcNzy/PqdqmU566L6nl5
         /SOVAArUw/gsPnL8bthq79zTdrT1D2R/0mh73OnJGMybxErbb4ls6DEupAMwsOGa4n/2
         q6+rueSjUgvuWQljkSii5IjQuPpiSkqTiirejEnnVKONyyJxhjXFWRvvafrzej+neIQ+
         wPOjSnUSRKOJ9dm44KQhuyYB0gPEC1I6pfX/kMHkm8GiSxKDMGMTDF0ydrCyeCWw/c4d
         Snsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wtUzwag3pke6VpyOS5ulIxsWVT1yP/rHpqEAKVODkCE=;
        b=mf43FuAfA9HkK09usTiaVkqZFE1fadS1ZKFswaMzmTBw44X4g8ELC33i2N2Dzm+Ofx
         jlBbzbc7hQJlSwa+uDPk2evyzGPwYzRCBQUSw2KULkkyjLei9C4uMWjqDih6Xuj+PGeo
         E5fHT7LHfznK5RNi2VFfqa0AjkD15dpeD+NrIHOWUQfrEA14sguROVEJo8NsJ3JBGLsy
         oeMoylmh9UQJsJlZbu9TBeJ/sYN+OIGFjGPl+Lssjy5vjVgOOq1HPfgBs20DvHnGDQFo
         AOi/BNDkjhMJdKjd0rLRk04ap2uUuXfZzqIDIpStP630ll07m+wXc/AWBDOGoLOPsbRo
         +ETw==
X-Gm-Message-State: AGi0PubA4+V+i1OYp+LHXo5U/sOE9yuqv/Lzwu6sG1xZOj97P9tedqRs
	+e2OOtAo7qoo9HimxarSqqoAbciv/vSh8OA2SgQ=
X-Google-Smtp-Source: APiQypK/8+YEJy/tODLY+GlTZ78C+n6gn3VSL94WE8mss/rxAug2EVXfvhuj/SVvkLWdvtJc00sseqznCm4PADvGEFI=
X-Received: by 2002:a1c:2289:: with SMTP id i131mr3415663wmi.111.1588958572442;
 Fri, 08 May 2020 10:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
 <20200505130133.24930-5-alex.kanavin@gmail.com> <CAGDS+nmZzgcVLdhxSo-+V4SAvjmoq_fsDurw6M4JUjwi+9AjAQ@mail.gmail.com>
In-Reply-To: <CAGDS+nmZzgcVLdhxSo-+V4SAvjmoq_fsDurw6M4JUjwi+9AjAQ@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 8 May 2020 07:22:41 -1000
Message-ID: <CAGDS+n=SSR9EJaTRx4_hRZNFyUa542KSyirZkVdprhdZ=ag0Yw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] testsdkext/devtool: initialize the test component's git repo
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 8, 2020 at 7:20 AM Steve Sakoman <sakoman@gmail.com> wrote:
>
> Is this patch suitable for dunfell?

Ah, probably not since we aren't bumping the git version in dunfell :-)

Steve

> On Tue, May 5, 2020 at 3:02 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > Devtool is relying on externalsrc class, which, in order to determine
> > if a rebuild is needed, relies on git to checksum files (if the
> > component tree is a git repo), or sets a flag to always rebuild if
> > the component tree is not a git repo.
> >
> > This is problematic in testsdkext scenario, where the test component
> > is inside a build directory, which itself is inside the poky repo
> > checkout, and listed in .gitignore. What happens is that git walks
> > up the tree and uses the index of the poky repo. This works okay
> > with older versions of git, but git 2.26 complains that we're inside
> > a directory that is ignored, and returns an error.
> >
> > To fix the issue, the git repository is initialized directly in the
> > component directory, just prior to running the tests.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/lib/oeqa/sdkext/cases/devtool.py | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
> > index 8e92bf8064..a5c6a76e02 100644
> > --- a/meta/lib/oeqa/sdkext/cases/devtool.py
> > +++ b/meta/lib/oeqa/sdkext/cases/devtool.py
> > @@ -20,10 +20,16 @@ class DevtoolTest(OESDKExtTestCase):
> >          myapp_src = os.path.join(cls.tc.esdk_files_dir, "myapp")
> >          cls.myapp_dst = os.path.join(cls.tc.sdk_dir, "myapp")
> >          shutil.copytree(myapp_src, cls.myapp_dst)
> > +        subprocess.check_output(['git', 'init', '.'], cwd=cls.myapp_dst)
> > +        subprocess.check_output(['git', 'add', '.'], cwd=cls.myapp_dst)
> > +        subprocess.check_output(['git', 'commit', '-m', "'test commit'"], cwd=cls.myapp_dst)
> >
> >          myapp_cmake_src = os.path.join(cls.tc.esdk_files_dir, "myapp_cmake")
> >          cls.myapp_cmake_dst = os.path.join(cls.tc.sdk_dir, "myapp_cmake")
> >          shutil.copytree(myapp_cmake_src, cls.myapp_cmake_dst)
> > +        subprocess.check_output(['git', 'init', '.'], cwd=cls.myapp_cmake_dst)
> > +        subprocess.check_output(['git', 'add', '.'], cwd=cls.myapp_cmake_dst)
> > +        subprocess.check_output(['git', 'commit', '-m', "'test commit'"], cwd=cls.myapp_cmake_dst)
> >
> >      @classmethod
> >      def tearDownClass(cls):
> > --
> > 2.26.1
> >
> > 
