Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SFvGs-0007CV-1G
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 00:35:14 +0200
Received: by wgbdr12 with SMTP id dr12so1502114wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 15:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=yNowfYT78RV6O/4Yi/JYwkgaQBadqJFlktEPio2m5/w=;
	b=oomZ+U4lJIAKwkQJCTDH5ONA6u4c5/ZVvyKaGDx9D3xIPCTNQQGo6KRuaLHTrUwqR9
	dS3Kn0zFMU/uwdC4VzNV0xk+H9K4a9P5+VVZ+QBkTRof39lXB3wh0q25XSIdb2YxgLzw
	egEpl7rvOvdi/UkiE/qqO2e25bXnD93KIlqgDdibaMXj003zaetdGDK/SRWX9QOcTRVs
	Rge5M66e6jU1lV4doAntRlWoV83ebvxHMYDdgfVkFV3eMGh5XSbUJ/hmmXJ/BWqSVZ2g
	hGdfSol/3AkFRHqSbULRSRp+7f7JXEq/otunXel5SjrhYPJTtnwxPkLCvtMgNJymRYNN
	OT+g==
Received: by 10.216.139.194 with SMTP id c44mr2651329wej.112.1333664761944;
	Thu, 05 Apr 2012 15:26:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.158.16 with HTTP; Thu, 5 Apr 2012 15:25:40 -0700 (PDT)
X-Originating-IP: [79.115.103.32]
In-Reply-To: <a3c8132b29da28e7a418443a950bea1c01fa54b8.1333661428.git.dvhart@linux.intel.com>
References: <cover.1333661428.git.dvhart@linux.intel.com>
	<a3c8132b29da28e7a418443a950bea1c01fa54b8.1333661428.git.dvhart@linux.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 6 Apr 2012 01:25:40 +0300
Message-ID: <CAK18fxHxTUCQ+6vTVUx=HWMwb0xyJgYjmprZdAtuUjp5HcB00g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQke7Ju7KHEMaRXXGhvZWB2iOxDwz+VOpC5AuVlOlbp5vcpVG3caFXW7xjhkqt5RT+dtL7Ic
Subject: Re: [PATCH 1/1] create-pull-request: Assume remote branch from local branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Apr 2012 22:35:14 -0000
Content-Type: multipart/alternative; boundary=0016e6d58d786298f604bcf60696

--0016e6d58d786298f604bcf60696
Content-Type: text/plain; charset=ISO-8859-1

Good idea and good work.


*@g*



On Fri, Apr 6, 2012 at 00:31, Darren Hart <dvhart@linux.intel.com> wrote:

> It is common to use the same remote branch name as the local branch
> name. In this case, it would be nice not to have to specify the
> remote branch name.
>
> Make the -b argument optional and assume the remote branch is the same
> name as the local branch. Print a NOTE to this effect so as not to
> catch the user by surprise:
>
> NOTE: Assuming remote branch 'notthere', use -b to override.
>
> If the remote branch doesn't exist, a WARNING is displayed just as if
> the user had used -b to specify a non-existent branch:
>
> WARNING: Branch 'notthere' was not found on the contrib git tree.
>         Please check your remote and branch parameter before sending.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
>  scripts/create-pull-request |   11 ++++++++---
>  1 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index 600fa7a..9a8913d 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -34,8 +34,8 @@ RFC=0
>  usage() {
>  CMD=$(basename $0)
>  cat <<EOM
> -Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r
> relative_to] [-i commit_id] -u remote -b branch
> -  -b branch           Branch name in the specified remote
> +Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r
> relative_to] [-i commit_id] -u remote [-b branch]
> +  -b branch           Branch name in the specified remote (default:
> current branch)
>   -c                  Create an RFC (Request for Comment) patch series
>   -h                  Display this help message
>   -i commit_id        Ending commit (default: HEAD)
> @@ -120,7 +120,12 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
>        esac
>  done
>
> -if [ -z "$BRANCH" ] || [ -z "$REMOTE_URL" ]; then
> +if [ -z "$BRANCH" ]; then
> +       BRANCH=$(git branch | grep -e "^\* " | cut -d' ' -f2)
> +       echo "NOTE: Assuming remote branch '$BRANCH', use -b to override."
> +fi
> +
> +if [ -z "$REMOTE_URL" ]; then
>        usage
>        exit 1
>  fi
> --
> 1.7.6.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--0016e6d58d786298f604bcf60696
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Good idea and good work.<br clear=3D"all"><div style=3D"text-align:center">=
</div><div style=3D"text-align:center"><div align=3D"left" style=3D"font-fa=
mily:&#39;Times New Roman&#39;;font-size:medium"><font face=3D"Arial" color=
=3D"#333333" size=3D"-1"><br>

<br><b>@g</b></font></div></div><br>
<br><br><div class=3D"gmail_quote">On Fri, Apr 6, 2012 at 00:31, Darren Har=
t <span dir=3D"ltr">&lt;<a href=3D"mailto:dvhart@linux.intel.com">dvhart@li=
nux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

It is common to use the same remote branch name as the local branch<br>
name. In this case, it would be nice not to have to specify the<br>
remote branch name.<br>
<br>
Make the -b argument optional and assume the remote branch is the same<br>
name as the local branch. Print a NOTE to this effect so as not to<br>
catch the user by surprise:<br>
<br>
NOTE: Assuming remote branch &#39;notthere&#39;, use -b to override.<br>
<br>
If the remote branch doesn&#39;t exist, a WARNING is displayed just as if<b=
r>
the user had used -b to specify a non-existent branch:<br>
<br>
WARNING: Branch &#39;notthere&#39; was not found on the contrib git tree.<b=
r>
 =A0 =A0 =A0 =A0 Please check your remote and branch parameter before sendi=
ng.<br>
<br>
Signed-off-by: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.intel.com">dv=
hart@linux.intel.com</a>&gt;<br>
---<br>
<div class=3D"im">=A0scripts/create-pull-request | =A0 11 ++++++++---<br>
=A01 files changed, 8 insertions(+), 3 deletions(-)<br>
<br>
</div>diff --git a/scripts/create-pull-request b/scripts/create-pull-reques=
t<br>
index 600fa7a..9a8913d 100755<br>
--- a/scripts/create-pull-request<br>
+++ b/scripts/create-pull-request<br>
@@ -34,8 +34,8 @@ RFC=3D0<br>
=A0usage() {<br>
=A0CMD=3D$(basename $0)<br>
=A0cat &lt;&lt;EOM<br>
-Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relat=
ive_to] [-i commit_id] -u remote -b branch<br>
- =A0-b branch =A0 =A0 =A0 =A0 =A0 Branch name in the specified remote<br>
+Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relat=
ive_to] [-i commit_id] -u remote [-b branch]<br>
+ =A0-b branch =A0 =A0 =A0 =A0 =A0 Branch name in the specified remote (def=
ault: current branch)<br>
 =A0 -c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Create an RFC (Request for Comme=
nt) patch series<br>
 =A0 -h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Display this help message<br>
 =A0 -i commit_id =A0 =A0 =A0 =A0Ending commit (default: HEAD)<br>
@@ -120,7 +120,12 @@ while getopts &quot;b:chi:m:o:p:r:s:u:&quot; OPT; do<b=
r>
 =A0 =A0 =A0 =A0esac<br>
=A0done<br>
<br>
-if [ -z &quot;$BRANCH&quot; ] || [ -z &quot;$REMOTE_URL&quot; ]; then<br>
+if [ -z &quot;$BRANCH&quot; ]; then<br>
+ =A0 =A0 =A0 BRANCH=3D$(git branch | grep -e &quot;^\* &quot; | cut -d&#39=
; &#39; -f2)<br>
+ =A0 =A0 =A0 echo &quot;NOTE: Assuming remote branch &#39;$BRANCH&#39;, us=
e -b to override.&quot;<br>
+fi<br>
+<br>
+if [ -z &quot;$REMOTE_URL&quot; ]; then<br>
 =A0 =A0 =A0 =A0usage<br>
 =A0 =A0 =A0 =A0exit 1<br>
=A0fi<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
1.7.6.5<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br>

--0016e6d58d786298f604bcf60696--
