Return-Path: <sstncr@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0556FC2D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jun 2014 10:54:45 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so3863621wes.38
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jun 2014 03:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/76lYGqoVKFrb14y/+TI02YsmUeQlvtcUfkDJymrk10=;
	b=MWjs8Kt6T8xjfpnjJHLhoKgtLI4FjFytzuyVcMFpYB2tEtsdQjmrn7WA0Jvv+Gw6xe
	DwTeoVnhVvQKHRBKT8AMv0AC0E5BtVyA3MHfrXQBue47xxGcIbONeZI2F03QIxh+BmWu
	6w8vUem31tioTjKtavqNt+O2c6Wfss5UKrUbOB0Cbra/msFjsj4JdiGU0hmHawGDtblt
	N9R4IN4UALemY2WiNWmdQJpHbB/LchXVt6ZCrp/yygWW7Pxwk6gymBqyvTpw/KjlFBkx
	6ZXMxZzPtL45yytMyLN43a7VIyqC12gAAMUalTb6NesiaVt/V/+YdcL34hA2Y+sN8M8Q
	Z+iA==
MIME-Version: 1.0
X-Received: by 10.180.160.205 with SMTP id xm13mr15617033wib.13.1402138485967; 
	Sat, 07 Jun 2014 03:54:45 -0700 (PDT)
Received: by 10.216.48.6 with HTTP; Sat, 7 Jun 2014 03:54:45 -0700 (PDT)
Received: by 10.216.48.6 with HTTP; Sat, 7 Jun 2014 03:54:45 -0700 (PDT)
In-Reply-To: <1402082078-10826-7-git-send-email-corneliux.stoicescu@intel.com>
References: <1402082078-10826-1-git-send-email-corneliux.stoicescu@intel.com>
	<1402082078-10826-7-git-send-email-corneliux.stoicescu@intel.com>
Date: Sat, 7 Jun 2014 13:54:45 +0300
Message-ID: <CANr+NRtrdE5Rn7LEkPTUrJxRXmYRazcZzzscCawu8r=ERbxLyA@mail.gmail.com>
From: Stefan Stanacar <sstncr@gmail.com>
To: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 6/7] controllers/masterimage.py: Make testimage kernel naming pattern universal
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
X-List-Received-Date: Sat, 07 Jun 2014 10:54:46 -0000
Content-Type: multipart/alternative; boundary=047d7b62494e61d04204fb3ccebd

--047d7b62494e61d04204fb3ccebd
Content-Type: text/plain; charset=UTF-8

On Jun 6, 2014 8:11 PM, "Corneliu Stoicescu" <corneliux.stoicescu@intel.com>
wrote:
>
> YB: #6254
>
> The QemuTargetControl class does not specify any kernel naming but the
runqemu script it uses uses the " KERNEL_IMAGETYPE + MACHINE + '.bin' "
naming scheme.
> Modifying the other major target controller class,
MasterImageHardwareTarget, to use the same kernel naming scheme.
>

You can't do that because not all targets (bbb, nuc, etc) use a bin
kernel...

> This is usefull also to outside scripts that want to anticipate the
kernel file name for all target controllers.

And what's wrong with the link? Bitbake will always take care of that and
point to the real file why can't the script dereference that?

Cheers,
Stefan

>
> Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
> ---
>  meta/lib/oeqa/controllers/masterimage.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/controllers/masterimage.py
b/meta/lib/oeqa/controllers/masterimage.py
> index b03c5bf..311f0cf 100644
> --- a/meta/lib/oeqa/controllers/masterimage.py
> +++ b/meta/lib/oeqa/controllers/masterimage.py
> @@ -52,7 +52,7 @@ class
MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
>          # test rootfs + kernel
>          self.image_fstype = self.get_image_fstype(d)
>          self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),
d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
> -        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),
d.getVar("KERNEL_IMAGETYPE"))
> +        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),
d.getVar("KERNEL_IMAGETYPE") + '-' + d.getVar('MACHINE') + '.bin')
>          if not os.path.isfile(self.rootfs):
>              # we could've checked that IMAGE_FSTYPES contains tar.gz but
the config for running testimage might not be
>              # the same as the config with which the image was build, ie
> --
> 1.8.3.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--047d7b62494e61d04204fb3ccebd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jun 6, 2014 8:11 PM, &quot;Corneliu Stoicescu&quot; &lt;<a href=3D"mailt=
o:corneliux.stoicescu@intel.com">corneliux.stoicescu@intel.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; YB: #6254<br>
&gt;<br>
&gt; The QemuTargetControl class does not specify any kernel naming but the=
 runqemu script it uses uses the &quot; KERNEL_IMAGETYPE + MACHINE + &#39;.=
bin&#39; &quot; naming scheme.<br>
&gt; Modifying the other major target controller class, MasterImageHardware=
Target, to use the same kernel naming scheme.<br>
&gt;</p>
<p dir=3D"ltr">You can&#39;t do that because not all targets (bbb, nuc, etc=
) use a bin kernel...</p>
<p dir=3D"ltr">&gt; This is usefull also to outside scripts that want to an=
ticipate the kernel file name for all target controllers.</p>
<p dir=3D"ltr">And what&#39;s wrong with the link? Bitbake will always take=
 care of that and point to the real file why can&#39;t the script dereferen=
ce that?</p>
<p dir=3D"ltr">Cheers,<br>
Stefan<br></p>
<p dir=3D"ltr">&gt;<br>
&gt; Signed-off-by: Corneliu Stoicescu &lt;<a href=3D"mailto:corneliux.stoi=
cescu@intel.com">corneliux.stoicescu@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oeqa/controllers/masterimage.py | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/=
controllers/masterimage.py<br>
&gt; index b03c5bf..311f0cf 100644<br>
&gt; --- a/meta/lib/oeqa/controllers/masterimage.py<br>
&gt; +++ b/meta/lib/oeqa/controllers/masterimage.py<br>
&gt; @@ -52,7 +52,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.B=
aseTarget):<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# test rootfs + kernel<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.image_fstype =3D self.get_image=
_fstype(d)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.rootfs =3D os.path.join(d.getVa=
r(&quot;DEPLOY_DIR_IMAGE&quot;, True), d.getVar(&quot;IMAGE_LINK_NAME&quot;=
, True) + &#39;.&#39; + self.image_fstype)<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel =3D os.path.join(d.getVar(&qu=
ot;DEPLOY_DIR_IMAGE&quot;, True), d.getVar(&quot;KERNEL_IMAGETYPE&quot;))<b=
r>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel =3D os.path.join(d.getVar(&qu=
ot;DEPLOY_DIR_IMAGE&quot;, True), d.getVar(&quot;KERNEL_IMAGETYPE&quot;) + =
&#39;-&#39; + d.getVar(&#39;MACHINE&#39;) + &#39;.bin&#39;)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.isfile(self.rootfs):<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# we could&#39;ve chec=
ked that IMAGE_FSTYPES contains tar.gz but the config for running testimage=
 might not be<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# the same as the conf=
ig with which the image was build, ie<br>
&gt; --<br>
&gt; 1.8.3.2<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--047d7b62494e61d04204fb3ccebd--
