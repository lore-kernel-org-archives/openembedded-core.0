Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.186.1588958440398907435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 10:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jSlrJWJ9;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: sakoman@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id k12so10929630wmj.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2020 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZGYgSjK099Bti6HE/vEtBPgfkPF/KJrBQvEwsy95a+w=;
        b=jSlrJWJ9AbeXQZ6zc7BZinp/YzFIGDF+dX7j0CFRZrg7qDNKP4Ho1v22xiutXO6zOs
         ryM6iG+/n7eZoU6aKaX8W7iWwgdavM0Iljx8BnlmfZ3mYxMHqtfvkWa2q5OX4N0ykUAP
         smRUSXgW2qV2S7yXTlZhK6Sa8It2j/s+PTTJcZrMN/RnDk3wSnaZPMsFV8RM8j1m4iXS
         uyQiHyQTX9ls8lmO8j6JHLzipFO+dhjAcH1nDxAZp9sZcHQKRm8CNfuCej84lJ7i5nUY
         MGh4K85GZaOz4UpQmre4xVASybCHMtaAHG1UWbVWsNeRAjnvCMuLrl3Fvaz2z7uqM4yF
         M3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZGYgSjK099Bti6HE/vEtBPgfkPF/KJrBQvEwsy95a+w=;
        b=lC4uC3rX9e/pIcRFZ+9F1EMMNKUJnJOn5Mth0TFeE2gqn6RTdjP/GAIHxI4cT4P5yh
         C9kV7J/Jo8w4fXEFZwl9Mu8F9EoXPHjbC9PyUxnbAK9b3hVS+rFTFjpToJkvRmc+vqdf
         QBtLpUq/kmAR7L+Betg7j+ZKDXy4gao5s6nfrE5FzVllNe5c+CziWnXdqC8dYBOnoLac
         umngydzaIAr3OAKmvYi2+V8CMkK3b4uEPqymw8O0Ubft3C3qG61RQz4TKMrgjCiZVBT+
         YNleXjCbT8WGqesgyR32K3UlFbLR+lPckdFxcoWbVWvmub1SQQ53swlYAYTNPsKIz16C
         wJ1w==
X-Gm-Message-State: AGi0PuYkgQIn7OVAlOc/u76KOo5ju+wOoilhiP+5AMkMe+XDgh1GHM8B
	T2Eo7dFmgCN6Y4DAXLxpFHF5i1HnyCFRAXTwhe0=
X-Google-Smtp-Source: APiQypI53osjxyWG4uyq9Ot6TF7XRdRXJFr35GOg8LuyHt5SeBVhNTDqpR8ANo6gaMUpHX3xGATd0OzKdtGOVbEy/H4=
X-Received: by 2002:a1c:5446:: with SMTP id p6mr16869310wmi.172.1588958438851;
 Fri, 08 May 2020 10:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200505130133.24930-1-alex.kanavin@gmail.com> <20200505130133.24930-5-alex.kanavin@gmail.com>
In-Reply-To: <20200505130133.24930-5-alex.kanavin@gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 8 May 2020 07:20:27 -1000
Message-ID: <CAGDS+nmZzgcVLdhxSo-+V4SAvjmoq_fsDurw6M4JUjwi+9AjAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] testsdkext/devtool: initialize the test component's git repo
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Is this patch suitable for dunfell?

Thanks,

Steve

On Tue, May 5, 2020 at 3:02 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Devtool is relying on externalsrc class, which, in order to determine
> if a rebuild is needed, relies on git to checksum files (if the
> component tree is a git repo), or sets a flag to always rebuild if
> the component tree is not a git repo.
>
> This is problematic in testsdkext scenario, where the test component
> is inside a build directory, which itself is inside the poky repo
> checkout, and listed in .gitignore. What happens is that git walks
> up the tree and uses the index of the poky repo. This works okay
> with older versions of git, but git 2.26 complains that we're inside
> a directory that is ignored, and returns an error.
>
> To fix the issue, the git repository is initialized directly in the
> component directory, just prior to running the tests.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/lib/oeqa/sdkext/cases/devtool.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
> index 8e92bf8064..a5c6a76e02 100644
> --- a/meta/lib/oeqa/sdkext/cases/devtool.py
> +++ b/meta/lib/oeqa/sdkext/cases/devtool.py
> @@ -20,10 +20,16 @@ class DevtoolTest(OESDKExtTestCase):
>          myapp_src = os.path.join(cls.tc.esdk_files_dir, "myapp")
>          cls.myapp_dst = os.path.join(cls.tc.sdk_dir, "myapp")
>          shutil.copytree(myapp_src, cls.myapp_dst)
> +        subprocess.check_output(['git', 'init', '.'], cwd=cls.myapp_dst)
> +        subprocess.check_output(['git', 'add', '.'], cwd=cls.myapp_dst)
> +        subprocess.check_output(['git', 'commit', '-m', "'test commit'"], cwd=cls.myapp_dst)
>
>          myapp_cmake_src = os.path.join(cls.tc.esdk_files_dir, "myapp_cmake")
>          cls.myapp_cmake_dst = os.path.join(cls.tc.sdk_dir, "myapp_cmake")
>          shutil.copytree(myapp_cmake_src, cls.myapp_cmake_dst)
> +        subprocess.check_output(['git', 'init', '.'], cwd=cls.myapp_cmake_dst)
> +        subprocess.check_output(['git', 'add', '.'], cwd=cls.myapp_cmake_dst)
> +        subprocess.check_output(['git', 'commit', '-m', "'test commit'"], cwd=cls.myapp_cmake_dst)
>
>      @classmethod
>      def tearDownClass(cls):
> --
> 2.26.1
>
> 
