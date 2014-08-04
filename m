Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id A47CB65CB2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 14:03:17 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f51so8818766qge.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=f6yI/V1X2Rm+c1EX1nVt8qtjYOwRGqnzm52sqRzJ4io=;
	b=xy+srU+pL85JelUUPArSvrmmi0PLgUg3Qx/okxeYFfwaTyzUce52qgh65jp/PEPG0+
	QKAs9nshNvoITG11L6p+3S/5GdWYY4Duz6c7DZ4yOCOIe5rR6JdOI1frZeRRAzXd1Cm7
	/EQDcwbygD524TTxzYKsLKTGM2OFOBL1E2i/2petobuBQ9wEoyCx1tjgNIgqDs+Uxqex
	8kW/Pz6olMAkSLpL0NUWJIab0kfoo3FBQLbjkfWiPO99rT5NSNydCZx83r56EdrEkUNs
	dKlLutjuplAxq1y3DR6lhR62y0xbo6Jc79c5/RiD1ueeDcVUbR8SFJR8yUyMnofAltKW
	AaTg==
X-Received: by 10.224.166.138 with SMTP id m10mr38039982qay.69.1407160998128; 
	Mon, 04 Aug 2014 07:03:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Mon, 4 Aug 2014 07:02:58 -0700 (PDT)
In-Reply-To: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
References: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 4 Aug 2014 19:32:58 +0530
Message-ID: <CADyYWLkkpyMTWcrpD0W2eS0fkRH8EGu1RLHY5Uq7OiCGFmR1LQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: Re: [PATCH] image.bbclass: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Mon, 04 Aug 2014 14:03:23 -0000
Content-Type: multipart/alternative; boundary=001a11c2394c6f754f04ffce339b

--001a11c2394c6f754f04ffce339b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Let me know if any more changes have to be made to make this patch look
better.



On Mon, Aug 4, 2014 at 7:27 PM, Sujith H <sujith.h@gmail.com> wrote:

> From: Sujith H <Sujith_Haridasan@mentor.com>
>
> If hostname is not added to /etc/hosts file then rpcinfo
> command fails when hostname is passed as argument. This was
> observed when rpcinfo command was tested on freescale target.
> Below was the output observed without this change.
>
> root@mx6q:~# rpcinfo -s mx6q
> rpcinfo: can't contact rpcbind: RPC: (unknown error code)
>
> Below is the output after this change:
> root@mx6q:~# rpcinfo -s mx6q
>    program version(s) netid(s)                         service     owner
>     100000  2,3,4     local,udp,tcp,udp6,tcp6          portmapper
>  superuser
> root@mx6q:~#
>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>  meta/classes/image.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 82605f2..7a5a5c1 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -341,6 +341,14 @@ ssh_disable_dns_lookup () {
>         fi
>  }
>
> +ROOTFS_POSTPROCESS_COMMAND +=3D "add_machine_name_loop_back;"
> +
> +add_machine_name_loop_back() {
> +    if [ -n ${MACHINE} ]; then
> +         echo 127.0.1.1 "       "${MACHINE} >>
> ${IMAGE_ROOTFS}${sysconfdir}/hosts
> +    fi
> +}
> +
>  # Enable postinst logging if debug-tweaks is enabled
>  postinst_enable_logging () {
>         mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/default
> --
> 1.8.4
>
>
Thanks,
Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a11c2394c6f754f04ffce339b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>Let me know if any more ch=
anges have to be made to make this patch look better.<br><br></div></div><d=
iv class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, Aug 4, =
2014 at 7:27 PM, Sujith H <span dir=3D"ltr">&lt;<a href=3D"mailto:sujith.h@=
gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">From: Sujith H &lt;<a hre=
f=3D"mailto:Sujith_Haridasan@mentor.com">Sujith_Haridasan@mentor.com</a>&gt=
;<br>


<br>
If hostname is not added to /etc/hosts file then rpcinfo<br>
command fails when hostname is passed as argument. This was<br>
observed when rpcinfo command was tested on freescale target.<br>
Below was the output observed without this change.<br>
<br>
root@mx6q:~# rpcinfo -s mx6q<br>
rpcinfo: can&#39;t contact rpcbind: RPC: (unknown error code)<br>
<br>
Below is the output after this change:<br>
root@mx6q:~# rpcinfo -s mx6q<br>
=C2=A0 =C2=A0program version(s) netid(s) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 service =C2=A0 =C2=A0 own=
er<br>
=C2=A0 =C2=A0 100000 =C2=A02,3,4 =C2=A0 =C2=A0 local,udp,tcp,udp6,tcp6 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0portmapper =C2=A0superuser<br>
root@mx6q:~#<br>
<br>
Signed-off-by: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com">=
Sujith_Haridasan@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image.bbclass | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 82605f2..7a5a5c1 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -341,6 +341,14 @@ ssh_disable_dns_lookup () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
+ROOTFS_POSTPROCESS_COMMAND +=3D &quot;add_machine_name_loop_back;&quot;<br=
>
+<br>
+add_machine_name_loop_back() {<br>
+ =C2=A0 =C2=A0if [ -n ${MACHINE} ]; then<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 127.0.1.1 &quot; =C2=A0 =C2=A0 =C2=A0 &q=
uot;${MACHINE} &gt;&gt; ${IMAGE_ROOTFS}${sysconfdir}/hosts<br>
+ =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
=C2=A0# Enable postinst logging if debug-tweaks is enabled<br>
=C2=A0postinst_enable_logging () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/default<b=
r>
<span class=3D""><font color=3D"#888888">--<br>
1.8.4<br>
<br>
</font></span></blockquote></div><br>Thanks,<br>Sujith H<br clear=3D"all"><=
br>-- <br>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=
=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalor=
e<br>&lt;Project&gt;Contributor to KDE project<br><a href=3D"http://fci.wik=
ia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/=
Anti-DRM-Campaign</a><br>

&lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujit=
hh.info</a><br>
</div></div>

--001a11c2394c6f754f04ffce339b--
