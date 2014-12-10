Return-Path: <alexandru.damian@intel.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 03A3A70A8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:58:21 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id e131so2094865oig.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 06:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xs87kUsWoJ+gTCFaMz2jWjHJv3YnFPexAvP+RqqoVNc=;
	b=XZvEzr60T+b9PrcVnIkMU3G1y7/6Xv3sjxEZrsq83vCC/6uh0Oyb6l88U9MHax0NW3
	eDj7FvBPFvNv7ll2dCnFHVIzAew7/8LyB9wY62kuAuLk4KxpED+LaP70owPcZ7YlwDeK
	zZ2qgwqL2SbibzvidxmCB3p9861lmXceFenQaCVbdc73noPvFQ9FfQqSdMkJ6ax9/nhp
	w3qUTSpyhi5qYKaSfLQJuLq2tmucZfaz2WZkKtldfyzm0e3qsiH9cMp/+P6LdK4fmiUH
	XUfzsLpgcTSyp3LdYnLkfq5iuo2xaQWYmqJMW74HmNAR/Ew+3iKhcn9qBUskjXwpDd55
	hkaw==
X-Gm-Message-State: ALoCoQk8de03s6wPmxCPDpSdErlbjklLLnQjc8TS9Fs2t/LZEa+S3uXf+npuIg6zmJVmKHWD5Ff6
X-Received: by 10.202.228.136 with SMTP id b130mr2772641oih.128.1418223502201; 
	Wed, 10 Dec 2014 06:58:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.134.71 with HTTP; Wed, 10 Dec 2014 06:58:01 -0800 (PST)
In-Reply-To: <1418222699-17402-1-git-send-email-alexandru.damian@intel.com>
References: <1418222699-17402-1-git-send-email-alexandru.damian@intel.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
Date: Wed, 10 Dec 2014 14:58:01 +0000
Message-ID: <CAJ2CSBtKKNd3SvARDy7boRk_jLE_zAgJa3V28MdxKh1rJtyH+A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: Re: [PATCH 01/13] toaster.bbclass: trigger event for other image files
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
X-List-Received-Date: Wed, 10 Dec 2014 14:58:29 -0000
Content-Type: multipart/alternative; boundary=001a114038b80fa9540509dde46c

--001a114038b80fa9540509dde46c
Content-Type: text/plain; charset=UTF-8

Despite the header, this is the single patch in this submission.

Thank you,
Alex

On Wed, Dec 10, 2014 at 2:44 PM, Alex DAMIAN <alexandru.damian@intel.com>
wrote:

> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> Toaster will log all the files that it can find in the
> deploy images directory, and list them, considering that
> they may be artifacts of the current build not logged
> anywhere else.
>
> [YOCTO #6836]
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  meta/classes/toaster.bbclass | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
> index a7dd0aa..55d0d28 100644
> --- a/meta/classes/toaster.bbclass
> +++ b/meta/classes/toaster.bbclass
> @@ -149,14 +149,26 @@ python toaster_image_dumpdata() {
>      image_name = d.getVar('IMAGE_NAME', True);
>
>      image_info_data = {}
> +    artifact_info_data = {}
>
> +    # collect all artifacts
>      for dirpath, dirnames, filenames in os.walk(deploy_dir_image):
>          for fn in filenames:
> -            if fn.startswith(image_name):
> -                image_output = os.path.join(dirpath, fn)
> -                image_info_data[image_output] =
> os.stat(image_output).st_size
> +            try:
> +                if fn.startswith(image_name):
> +                    image_output = os.path.join(dirpath, fn)
> +                    image_info_data[image_output] =
> os.stat(image_output).st_size
> +                else:
> +                    import stat
> +                    artifact_path = os.path.join(dirpath, fn)
> +                    filestat = os.stat(artifact_path)
> +                    if stat.S_ISREG(filestat.st_mode):
> +                        artifact_info_data[artifact_path] =
> filestat.st_size
> +            except OSError as e:
> +                bb.event.fire(bb.event.MetadataEvent("OSErrorException",
> e), d)
>
>
>  bb.event.fire(bb.event.MetadataEvent("ImageFileSize",image_info_data), d)
> +
> bb.event.fire(bb.event.MetadataEvent("ArtifactFileSize",artifact_info_data),
> d)
>  }
>
>
> --
> 1.9.1
>
>


-- 
Alex Damian
Yocto Project
SSG / OTC

--001a114038b80fa9540509dde46c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif">Despite the header, this is the single patch in this submission.=
<br><br></div><div class=3D"gmail_default" style=3D"font-family:tahoma,sans=
-serif">Thank you,<br>Alex<br></div></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Wed, Dec 10, 2014 at 2:44 PM, Alex DAMIAN <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:alexandru.damian@intel.com" target=3D"_b=
lank">alexandru.damian@intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian=
@intel.com">alexandru.damian@intel.com</a>&gt;<br>
<br>
Toaster will log all the files that it can find in the<br>
deploy images directory, and list them, considering that<br>
they may be artifacts of the current build not logged<br>
anywhere else.<br>
<br>
[YOCTO #6836]<br>
<br>
Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@inte=
l.com">alexandru.damian@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/toaster.bbclass | 18 +++++++++++++++---<br>
=C2=A01 file changed, 15 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass<br=
>
index a7dd0aa..55d0d28 100644<br>
--- a/meta/classes/toaster.bbclass<br>
+++ b/meta/classes/toaster.bbclass<br>
@@ -149,14 +149,26 @@ python toaster_image_dumpdata() {<br>
=C2=A0 =C2=A0 =C2=A0image_name =3D d.getVar(&#39;IMAGE_NAME&#39;, True);<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0image_info_data =3D {}<br>
+=C2=A0 =C2=A0 artifact_info_data =3D {}<br>
<br>
+=C2=A0 =C2=A0 # collect all artifacts<br>
=C2=A0 =C2=A0 =C2=A0for dirpath, dirnames, filenames in os.walk(deploy_dir_=
image):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for fn in filenames:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if fn.startswith(image_name):<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image_output =3D o=
s.path.join(dirpath, fn)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image_info_data[im=
age_output] =3D os.stat(image_output).st_size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if fn.startswith(i=
mage_name):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imag=
e_output =3D os.path.join(dirpath, fn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imag=
e_info_data[image_output] =3D os.stat(image_output).st_size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 impo=
rt stat<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arti=
fact_path =3D os.path.join(dirpath, fn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
stat =3D os.stat(artifact_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if s=
tat.S_ISREG(filestat.st_mode):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 artifact_info_data[artifact_path] =3D filestat.st_size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.event.fire(bb.e=
vent.MetadataEvent(&quot;OSErrorException&quot;, e), d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0bb.event.fire(bb.event.MetadataEvent(&quot;ImageFileSiz=
e&quot;,image_info_data), d)<br>
+=C2=A0 =C2=A0 bb.event.fire(bb.event.MetadataEvent(&quot;ArtifactFileSize&=
quot;,artifact_info_data), d)<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature"><div dir=3D"ltr">Alex Damian<div>Yocto Project<br></d=
iv><div>SSG / OTC=C2=A0</div></div></div>
</div>

--001a114038b80fa9540509dde46c--
