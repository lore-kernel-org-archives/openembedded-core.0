Return-Path: <raj.khem@gmail.com>
Received: from mail-qe0-f51.google.com (mail-qe0-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 42C6B610DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 14:26:59 +0000 (UTC)
Received: by mail-qe0-f51.google.com with SMTP id ne12so4160149qeb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 07:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LNY4SQwfh5JtxjuABedBWZDXz3MYOMXA5WfAO6uqQMc=;
	b=0Du95tKvYgb+DnVO5cc2Lu8zcDcWntt6gyUYOurnJYCzzC2MQcOgS1R38g9+UM1XRA
	s/vUqab3KIX7ZVCvzax8e35LkKfQw+mmwwumVIN21z5PPV522SpP3YM3olSRvi2aNlkh
	piFKt35XNUVNQMXocRKZ6g7bIHLQUtYOoEWTqj5ao1Ehwvn7wu4fdZlfQSWdeZbvHeUa
	1rg7ARvmmFL6CLsfMzgWztWSBUWv4HOXtgT2lSwbDKPBXNnqsxgmiePper+YhHN56ShL
	jdAGn8AcPU2BvfUVEa/krwpkoj5baTTL/kAEnZ1f1TtDMnrkEkFxEQPGOQbhZvtmpL/+
	6aGg==
MIME-Version: 1.0
X-Received: by 10.224.92.201 with SMTP id s9mr212612qam.85.1380119220817; Wed,
	25 Sep 2013 07:27:00 -0700 (PDT)
Received: by 10.224.10.201 with HTTP; Wed, 25 Sep 2013 07:27:00 -0700 (PDT)
In-Reply-To: <1380088716-12512-1-git-send-email-rongqing.li@windriver.com>
References: <1380088716-12512-1-git-send-email-rongqing.li@windriver.com>
Date: Wed, 25 Sep 2013 07:27:00 -0700
Message-ID: <CAMKF1srAiBKPz15vALjs-X+pZojUq=y=zGeoAj1zj-s-oHQW6w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] makedevs: rectify the exit codes and handle the invalid parameter
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
X-List-Received-Date: Wed, 25 Sep 2013 14:27:00 -0000
Content-Type: multipart/alternative; boundary=089e0149d26ee7948604e7360bc8

--089e0149d26ee7948604e7360bc8
Content-Type: text/plain; charset=UTF-8

On Tuesday, September 24, 2013, wrote:

> From: Roy Li <rongqing.li@windriver.com <javascript:;>>
>
> It is correct behaviours to output help and version information,
> and should return 0;
> When input parameter is invalid, print help information and exit.


This can cause gripes for systems who have scripted the old behavior
And since it's a user visible change I would suggest to get it accepted
upstream before
It's applied in openembedded


> Signed-off-by: Roy Li <rongqing.li@windriver.com <javascript:;>>
> ---
>  meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
> b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
> index cc3707b..5d2c45b 100644
> --- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
> +++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
> @@ -465,8 +465,8 @@ int main(int argc, char **argv)
>                                 error_msg_and_die("%s: not a proper device
> table file", optarg);
>                         break;
>                 case 'h':
> -                       fprintf(stderr, helptext);
> -                       exit(1);
> +                       printf(helptext);
> +                       exit(0);
>                 case 'r':
>                 case 'd':                               /* for
> compatibility with mkfs.jffs, genext2fs, etc... */
>                         if (rootdir != default_rootdir) {
> @@ -476,8 +476,11 @@ int main(int argc, char **argv)
>                         break;
>
>                 case 'v':
> -                       fprintf(stderr, "makedevs revision %.*s\n",
> +                       printf("makedevs revision %.*s\n",
>                                         (int) strlen(revtext) - 13,
> revtext + 11);
> +                       exit(0);
> +               default:
> +                       fprintf(stderr, helptext);
>                         exit(1);
>                 }
>         }
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0149d26ee7948604e7360bc8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, September 24, 2013,   wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">From: Roy Li &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#39=
;cvml&#39;, &#39;rongqing.li@windriver.com&#39;)">rongqing.li@windriver.com=
</a>&gt;<br>

<br>
It is correct behaviours to output help and version information,<br>
and should return 0;<br>
When input parameter is invalid, print help information and exit.</blockquo=
te><div><br></div><div>This can cause gripes for systems who have scripted =
the old=C2=A0behavior</div><div>And since it&#39;s a user visible change I =
would suggest to get it accepted upstream before=C2=A0</div>
<div>It&#39;s applied in openembedded=C2=A0</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
<br>
Signed-off-by: Roy Li &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#3=
9;cvml&#39;, &#39;rongqing.li@windriver.com&#39;)">rongqing.li@windriver.co=
m</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c | =C2=A0 =C2=
=A09 ++++++---<br>
=C2=A01 file changed, 6 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/met=
a/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c<br>
index cc3707b..5d2c45b 100644<br>
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c<br>
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c<br>
@@ -465,8 +465,8 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_msg_and_die(&quot;%s: not a pr=
oper device table file&quot;, optarg);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;h&#39;:<b=
r>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fprintf(stderr, helptext);<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(1);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(helptext);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;r&#39;:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;d&#39;: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* for compatibility with mkfs.jffs, genext=
2fs, etc... */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (rootdir !=3D default_rootdir) {<br>
@@ -476,8 +476,11 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;v&#39;:<b=
r>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fprintf(stderr, &quot;makedevs revision %.*s\n&quot;,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;makedevs revision %.*s\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (int) st=
rlen(revtext) - 13, revtext + 11);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(0);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fprintf(stderr, helptext);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 exit(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
1.7.10.4<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote>

--089e0149d26ee7948604e7360bc8--
