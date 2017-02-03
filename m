Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 39A27606CA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 14:16:34 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id v73so1775432ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2017 06:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G1DQkVxk9fzhgmYlPbF543w5p3yEGslqoaCd1n0AEIo=;
	b=WaZx8LekheUNSevgliw+LAmuajPjtiob7T5uMbeyAWdDYwWaOwGx36JSjUb3W8Xuqk
	UYQNRugFQdovVaSjNz8NFyxTHbqk+1qxBXGAGjnjcFsJfEGAkPAHgqB6x+6IBTYN5QQE
	5LJ19WdRKcOgKpFbJ53DbIoAMd7JjTJfXLEZwpZztk416sV/HpIyymasBB3uafqB+Bfs
	MgDMtJbIi7ht2tNu8DNqTm/O1HgWDvavomvwfWbi2IytidxQZ9mU5q12KXTsvW+4472q
	wFXQKi61Hw/6vIBWjyILMXNwSTSblBs8pHxsaG/6nZcjoq1PAz+6Zv1TfziW7QkQsUKM
	BeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G1DQkVxk9fzhgmYlPbF543w5p3yEGslqoaCd1n0AEIo=;
	b=Yo3v12+1A4rAAaY82WcNCUO50WTR4cmbhyWJBIkxOa+6Om7RX8bZt9srXjOcSfwxT9
	1/g0JAbAfNOPzPgvy/sCjfP3xCg/GsqTw3OI21AXK4Z0vZO7Ln/5Ap7VNgC3DAJDgrrm
	fTkzoSNifCSibnA0nSK40x/lTzzNljayLVAIGDup10lAKBkWTJ1Ylt3iUkaf2Z8vOHy8
	fr+i2/V2aRbfwhCtCxUwgnKk8oSZWS4p6EBf/21DXqWvf/koM/l7gF0YZ3nRH6YikFcJ
	MNmR6D1llEs41bJ/euLUqiOGy7aDhHYbM4/mDhfcheu/7O47z7uppgznyAEaxwOZ04YT
	a17w==
X-Gm-Message-State: AMke39kc0E9TIYZ0wsX4lOJczfhelzAZFRBHQ+SCflgRePH9XM9+yRTvuw8fmW1/b468CclFtSqF3ICOGkZi7w==
X-Received: by 10.55.101.194 with SMTP id z185mr14266740qkb.318.1486131394132; 
	Fri, 03 Feb 2017 06:16:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 3 Feb 2017 06:16:33 -0800 (PST)
In-Reply-To: <1486118977-42065-1-git-send-email-awais_belal@mentor.com>
References: <1486118977-42065-1-git-send-email-awais_belal@mentor.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 3 Feb 2017 09:16:33 -0500
Message-ID: <CADkTA4PUAoTG+apRuhRYiv9xgcH++gp7QKOke5dScidVhB1d6g@mail.gmail.com>
To: Awais Belal <awais_belal@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC]kernel-yocto.bbclass: ensure repatching when HEAD is checked out
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2017 14:16:39 -0000
Content-Type: multipart/alternative; boundary=94eb2c05e1ded641440547a0ed08

--94eb2c05e1ded641440547a0ed08
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 3, 2017 at 5:49 AM, Awais Belal <awais_belal@mentor.com> wrote:

> In some cases it is seen that kernel_checkout and
> validate_branches are run again in simultaneous builds.
> During do_patch the kgit-s2q mechanism creates and
> checks for the kgit-s2q.last file inside the .git
> directory, finds a fence post and starts picking up
> patches after that. This can create trouble as
> validate_branches checks out the HEAD of the branch
> and so the patches should be reapplied rather than
> skipped due to finding of the fence post.
>

Indeed. I can see how this could happen. I added the mechanism to ensure
that multiple runs (forced or not) didn't re-patch the tree (since the
tools no
longer do an auto-resume detection).

At that time, I tried to run the paths and make sure that the sentinel file
couldn't cause this sort of problem, but clearly there is a case.

I'll grab this patch and modify it a bit so the script can clear the file
itself
(that way if the format changes again, we don't have to tweak the bbclass).

I'll float that patch by you, if that is ok, so you can add a Signed-off-by
(since the work on finding the issue deserves credit on the patch itself).

Cheers,

Bruce


>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/
> kernel-yocto.bbclass
> index 5cfd8af..131c48a 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -350,6 +350,10 @@ do_validate_branches() {
>                         current_branch=`git rev-parse --abbrev-ref HEAD`
>                         git branch "$current_branch-orig"
>                         git reset --hard ${force_srcrev}
> +                       # We've checked out HEAD, make sure we cleanup
> kgit-s2q fence post check
> +                       # so the patches are applied as expected otherwise
> no patching
> +                       # would be done in some corner cases.
> +                       rm -rf ${S}/.git/kgit-s2q.last
>                 fi
>         fi
>  }
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05e1ded641440547a0ed08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Feb 3, 2017 at 5:49 AM, Awais Belal <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:awais_belal@mentor.com" target=3D"_blank">awais_belal@mentor.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">In some cases it=
 is seen that kernel_checkout and<br>
validate_branches are run again in simultaneous builds.<br>
During do_patch the kgit-s2q mechanism creates and<br>
checks for the kgit-s2q.last file inside the .git<br>
directory, finds a fence post and starts picking up<br>
patches after that. This can create trouble as<br>
validate_branches checks out the HEAD of the branch<br>
and so the patches should be reapplied rather than<br>
skipped due to finding of the fence post.<br></blockquote><div><br></div><d=
iv>Indeed. I can see how this could happen. I added the mechanism to ensure=
<br></div><div>that multiple runs (forced or not) didn&#39;t re-patch the t=
ree (since the tools no<br></div><div>longer do an auto-resume detection).<=
br><br></div><div>At that time, I tried to run the paths and make sure that=
 the sentinel file<br></div><div>couldn&#39;t cause this sort of problem, b=
ut clearly there is a case.<br><br></div><div>I&#39;ll grab this patch and =
modify it a bit so the script can clear the file itself<br></div><div>(that=
 way if the format changes again, we don&#39;t have to tweak the bbclass).<=
br><br></div><div>I&#39;ll float that patch by you, if that is ok, so you c=
an add a Signed-off-by <br></div><div>(since the work on finding the issue =
deserves credit on the patch itself).<br><br></div><div>Cheers,<br><br></di=
v><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.com" ta=
rget=3D"_blank">awais_belal@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-yocto.bbc<wbr>lass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yocto.b=
b</a><wbr>class b/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yo=
cto.bb</a><wbr>class<br>
index 5cfd8af..131c48a 100644<br>
--- a/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yocto.bb</a><w=
br>class<br>
+++ b/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yocto.bb</a><w=
br>class<br>
@@ -350,6 +350,10 @@ do_validate_branches() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 current_branch=3D`git rev-parse --abbrev-ref HEAD`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 git branch &quot;$current_branch-orig&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 git reset --hard ${force_srcrev}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# We&#39;ve checked out HEAD, make sure we cleanup kgit-s2q fence=
 post check<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# so the patches are applied as expected otherwise no patching<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# would be done in some corner cases.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rm -rf ${S}/.git/kgit-s2q.last<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<span class=3D"m_6164858625079764098HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"m_6164858625079764098gmail_signature" data-smartmail=3D"gmail_signatur=
e">&quot;Thou shalt not follow the NULL pointer, for chaos and madness awai=
t thee at its end&quot;</div>
</div></div>

--94eb2c05e1ded641440547a0ed08--
