Return-Path: <alexandru.damian@intel.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5068761634
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 09:25:09 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id uz6so14065556obc.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jan 2014 01:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=StZw3rRfgu24dZRRVolzfqgLnsgKu96mInFxgn6NOq4=;
	b=O7dODGh2idiNKvpz8nt8w0q4YgwMtA/uau8QGKxRkJzrdhMkEBHzjYkqXuh3h+ELND
	T0OBIUI/P6ebifXCp0GzE2+YEP42F2oJERufUNLpOP2APu04uG5DRusoWBhdU9KdGEkX
	1/okidJh/Prg1KPxWvXlw9+TCPh8ZD8daneXttbUUMe7CyMDMo9UtLxR6TY9jzkWQM2w
	magZjYYzowhwH3mVDwBCLYSxJi8y73fcBz/gefEBRPc0MxmDvDyNTscJ5ZrSF6xoQpQW
	6qDXBiHZQJEzd5WwLQMtM+duE+gB7pOEaG0GYWDMcek/YzZmV1uZtPex0brBqhdd4vFe
	hOFA==
X-Gm-Message-State: ALoCoQls2gkWktTZ2MqviuPcEK+qIxOC2+Hd3WYUayMN2zlwuLfxQ6W+8LxSqimKdOomZigVe8Xg
X-Received: by 10.182.103.133 with SMTP id fw5mr30071166obb.43.1388654710046; 
	Thu, 02 Jan 2014 01:25:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.86.193 with HTTP; Thu, 2 Jan 2014 01:24:49 -0800 (PST)
In-Reply-To: <1387394687-23669-1-git-send-email-alexandru.damian@intel.com>
References: <1387394687-23669-1-git-send-email-alexandru.damian@intel.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
Date: Thu, 2 Jan 2014 09:24:49 +0000
Message-ID: <CAJ2CSBto4_4pXfPksQOdaJkK5hwYFwXRy_SQc3yurjEuPHdghQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: Re: [PATCH 03/10] toaster.bbclass: fix crash on buildstats collection
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
X-List-Received-Date: Thu, 02 Jan 2014 09:25:09 -0000
Content-Type: multipart/alternative; boundary=089e01184702b55e5e04eef95e69

--089e01184702b55e5e04eef95e69
Content-Type: text/plain; charset=UTF-8

Just a heads-up, this is a stand-alone patch, not a series, despite the
subject line :(

Alex


On Wed, Dec 18, 2013 at 7:24 PM, Alex DAMIAN <alexandru.damian@intel.com>wrote:

> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> Toaster needs buildstats to be enabled in order to
> collect task statistics. The toaster.bbclass didn't
> have a guard to stop task data collection if the buildstats
> weren't enabled, leading to a crash.
>
> This patch verifies that the task variables are defined before
> trying to use them.
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  meta/classes/toaster.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
> index e1a93b5..08c7bfa 100644
> --- a/meta/classes/toaster.bbclass
> +++ b/meta/classes/toaster.bbclass
> @@ -165,6 +165,9 @@ python toaster_collect_task_stats() {
>      import bb.utils
>      import os
>
> +    if None == e.data.getVar('BUILDSTATS_BASE', True):
> +        return  # if we don't have buildstats, we cannot collect stats
> +
>      def _append_read_list(v):
>          lock = bb.utils.lockfile(e.data.expand("${TOPDIR}/toaster.lock"),
> False, True)
>
> --
> 1.8.3.2
>
>


-- 
Alex Damian
Yocto Project
SSG / OTC

--089e01184702b55e5e04eef95e69
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just a heads-up, this is a stand-alone patch, not a series=
, despite the subject line :(<div><br></div><div>Alex</div></div><div class=
=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, Dec 18, 2013 at=
 7:24 PM, Alex DAMIAN <span dir=3D"ltr">&lt;<a href=3D"mailto:alexandru.dam=
ian@intel.com" target=3D"_blank">alexandru.damian@intel.com</a>&gt;</span> =
wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Alexandru DAMIAN &lt;<a href=3D"mailto=
:alexandru.damian@intel.com">alexandru.damian@intel.com</a>&gt;<br>
<br>
Toaster needs buildstats to be enabled in order to<br>
collect task statistics. The toaster.bbclass didn&#39;t<br>
have a guard to stop task data collection if the buildstats<br>
weren&#39;t enabled, leading to a crash.<br>
<br>
This patch verifies that the task variables are defined before<br>
trying to use them.<br>
<br>
Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@inte=
l.com">alexandru.damian@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/toaster.bbclass | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass<br=
>
index e1a93b5..08c7bfa 100644<br>
--- a/meta/classes/toaster.bbclass<br>
+++ b/meta/classes/toaster.bbclass<br>
@@ -165,6 +165,9 @@ python toaster_collect_task_stats() {<br>
=C2=A0 =C2=A0 =C2=A0import bb.utils<br>
=C2=A0 =C2=A0 =C2=A0import os<br>
<br>
+ =C2=A0 =C2=A0if None =3D=3D e.data.getVar(&#39;BUILDSTATS_BASE&#39;, True=
):<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return =C2=A0# if we don&#39;t have buildstats=
, we cannot collect stats<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def _append_read_list(v):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lock =3D bb.utils.lockfile(e.data.expand(=
&quot;${TOPDIR}/toaster.lock&quot;), False, True)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.8.3.2<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div dir=3D"ltr">Alex Damian<div>Yocto Project<br></div><div>SSG / OTC=C2=
=A0</div></div>
</div>

--089e01184702b55e5e04eef95e69--
