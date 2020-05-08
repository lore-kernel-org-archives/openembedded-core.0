Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.1846.1588965288188821661
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 12:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Oyuaj9Sw;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id h9so3177050wrt.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2020 12:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dto1hgqy72jrGpxKO35wpbDOTYB8RRfwi2jkr/jtvEU=;
        b=Oyuaj9Swq90NoYohcPFPDEA6Cx5kWfyqiC3eaep+61ZwMA0TZ3KAyxhWmijmtn8lId
         XVuX58UoBr3dP1Io6c/8wG8pmwoTgjt5MV2fTml7Jh3YnXCquA3fwxIVpuyquF6e91PS
         rFIVWML1N+da60xfuzUhvO0Hc7QBFz9TMJeSrkgtvzEso1d/Iide/X64xmM2KLqfJ6Yd
         /o0U6w/y6vIuSt6uHjfzq2RJ3ayuPrTI5F53Mwl/Ho54oB9PU26uCsyiiideN0QhR8aO
         kTk0QAZLe98Q0aqnXg8gvsDqh+ZPCCMAPftJoptenFO+Kec7IB3n/RkyTod1w8v4oFrG
         ba1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dto1hgqy72jrGpxKO35wpbDOTYB8RRfwi2jkr/jtvEU=;
        b=EjdZehtQ8jkjQk3YUp/7RQTWsNjD2b3rRu+DVnxTlXJNYq9OQfxb+iHgU32Nwtymnj
         4GtRZj1O44vuNDFZHx2kVC5iGR/qGxoLkre7lvu1hM4Q+LnnptxWgJ1ZWsIvHLErwIif
         151MhSHjE73FkFoqO7Kc+JTD7vX6Mo/h1JM4+avIiv8oCZ1iGD8RMXfpLwl2kPUWXYKG
         nkVXIW6PT5TUrRruivmTG0hHw5+kZSKyDqFKWejsUYQXbn64FheixtoLxybt+LP1P47X
         DMXG6YtnZ4+BnXZvnJovB3bLt/zmox7pBU2f8EqtBqgenBUAUR/kPH7zWyOOwiCwvOdh
         4btQ==
X-Gm-Message-State: AGi0PuYNbg5163ug36EGuOxv56OF8f2eIFmf3mr4k5pb5HW6udaHXPU4
	Rs2Tzu7qTDK1lH9MipTm1sYQenmbkIrRTDi/QV0=
X-Google-Smtp-Source: APiQypJiahFYrc5v8KTuiMk45ODbZOFRxh7PMTyzfV3znccLKgSOOhX5/dsMtjNbiU8O92VqOwEslGtXPgHXVNKlwwk=
X-Received: by 2002:a05:6000:12cf:: with SMTP id l15mr4454557wrx.348.1588965286497;
 Fri, 08 May 2020 12:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200505130133.24930-1-alex.kanavin@gmail.com> <20200505130133.24930-5-alex.kanavin@gmail.com>
In-Reply-To: <20200505130133.24930-5-alex.kanavin@gmail.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Fri, 8 May 2020 14:14:35 -0500
Message-ID: <CAJdd5Gb7RSYrDe7jCoD37376JmMt1ss-ZZmger5xMet2uBrYUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] testsdkext/devtool: initialize the test component's git repo
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007651d305a527cfc0"

--0000000000007651d305a527cfc0
Content-Type: text/plain; charset="UTF-8"

On Tue, May 5, 2020, 8:02 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

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

I recently sent a patch to set GIT_CEILING_DIRECTORIES when building, could
we do something like that here also?



> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/lib/oeqa/sdkext/cases/devtool.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py
> b/meta/lib/oeqa/sdkext/cases/devtool.py
> index 8e92bf8064..a5c6a76e02 100644
> --- a/meta/lib/oeqa/sdkext/cases/devtool.py
> +++ b/meta/lib/oeqa/sdkext/cases/devtool.py
> @@ -20,10 +20,16 @@ class DevtoolTest(OESDKExtTestCase):
>          myapp_src = os.path.join(cls.tc.esdk_files_dir, "myapp")
>          cls.myapp_dst = os.path.join(cls.tc.sdk_dir, "myapp")
>          shutil.copytree(myapp_src, cls.myapp_dst)
> +        subprocess.check_output(['git', 'init', '.'], cwd=cls.myapp_dst)
> +        subprocess.check_output(['git', 'add', '.'], cwd=cls.myapp_dst)
> +        subprocess.check_output(['git', 'commit', '-m', "'test commit'"],
> cwd=cls.myapp_dst)
>
>          myapp_cmake_src = os.path.join(cls.tc.esdk_files_dir,
> "myapp_cmake")
>          cls.myapp_cmake_dst = os.path.join(cls.tc.sdk_dir, "myapp_cmake")
>          shutil.copytree(myapp_cmake_src, cls.myapp_cmake_dst)
> +        subprocess.check_output(['git', 'init', '.'],
> cwd=cls.myapp_cmake_dst)
> +        subprocess.check_output(['git', 'add', '.'],
> cwd=cls.myapp_cmake_dst)
> +        subprocess.check_output(['git', 'commit', '-m', "'test commit'"],
> cwd=cls.myapp_cmake_dst)
>
>      @classmethod
>      def tearDownClass(cls):
> --
> 2.26.1
>
> 
>

--0000000000007651d305a527cfc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, May 5, 2020, 8:02 AM Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Devtool is relying on externalsrc=
 class, which, in order to determine<br>
if a rebuild is needed, relies on git to checksum files (if the<br>
component tree is a git repo), or sets a flag to always rebuild if<br>
the component tree is not a git repo.<br>
<br>
This is problematic in testsdkext scenario, where the test component<br>
is inside a build directory, which itself is inside the poky repo<br>
checkout, and listed in .gitignore. What happens is that git walks<br>
up the tree and uses the index of the poky repo. This works okay<br>
with older versions of git, but git 2.26 complains that we&#39;re inside<b=
r>
a directory that is ignored, and returns an error.<br>
<br>
To fix the issue, the git repository is initialized directly in the<br>
component directory, just prior to running the tests.<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">I recently sent a pat=
ch to set=C2=A0GIT_CEILING_DIRECTORIES when building, could we do something=
 like that here also?</div><div dir=3D"auto"><span style=3D"font-family:san=
s-serif;font-size:12.8px"><br></span></div><div dir=3D"auto"><span style=3D=
"font-family:sans-serif;font-size:12.8px"><br></span></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</a>&gt;<br=
>
---<br>
=C2=A0meta/lib/oeqa/sdkext/cases/devtool.py | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/=
cases/devtool.py<br>
index 8e92bf8064..a5c6a76e02 100644<br>
--- a/meta/lib/oeqa/sdkext/cases/devtool.py<br>
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py<br>
@@ -20,10 +20,16 @@ class DevtoolTest(OESDKExtTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0myapp_src =3D os.path.join(cls.tc.esdk_f=
iles_dir, &quot;myapp&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cls.myapp_dst =3D os.path.join(cls.tc.sd=
k_dir, &quot;myapp&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copytree(myapp_src, cls.myapp_dst=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output([&#39;git&#39;, &#39;=
init&#39;, &#39;.&#39;], cwd=3Dcls.myapp_dst)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output([&#39;git&#39;, &#39;=
add&#39;, &#39;.&#39;], cwd=3Dcls.myapp_dst)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output([&#39;git&#39;, &#39;=
commit&#39;, &#39;-m&#39;, &quot;&#39;test commit&#39;&quot;], cwd=3Dcls.my=
app_dst)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0myapp_cmake_src =3D os.path.join(cls.tc.=
esdk_files_dir, &quot;myapp_cmake&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cls.myapp_cmake_dst =3D os.path.join(cls=
.tc.sdk_dir, &quot;myapp_cmake&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copytree(myapp_cmake_src, cls.mya=
pp_cmake_dst)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output([&#39;git&#39;, &#39;=
init&#39;, &#39;.&#39;], cwd=3Dcls.myapp_cmake_dst)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output([&#39;git&#39;, &#39;=
add&#39;, &#39;.&#39;], cwd=3Dcls.myapp_cmake_dst)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output([&#39;git&#39;, &#39;=
commit&#39;, &#39;-m&#39;, &quot;&#39;test commit&#39;&quot;], cwd=3Dcls.my=
app_cmake_dst)<br>
<br>
=C2=A0 =C2=A0 =C2=A0@classmethod<br>
=C2=A0 =C2=A0 =C2=A0def tearDownClass(cls):<br>
-- <br>
2.26.1<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000007651d305a527cfc0--
