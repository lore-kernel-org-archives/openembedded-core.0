Return-Path: <sstncr@gmail.com>
Received: from mail-wg0-f50.google.com (unknown [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id CAD1E60E07
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 12:10:25 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x12so278921wgg.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 05:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IvJCscT6/Rz2kRLNqf9lg161D7bkiVb5hSdN0lWpkMI=;
	b=LD3MxnZxIqLyTt35l3rNPFF9h8vb+K8vOMgn7cyP8vmvB+6yq+IZ3FnQpyi01wHdwO
	z2P7cX9eU866UyBtbF5myjmtYCNHkS/oug3mzkvZWK+7HBmY7WYWj4f7WX+3jKlBJCjp
	nkLpRl/ik5mtjCSu3i32KBlmCpxTutFGpUIGWcrlUM0fi1fkZh6dt2opEakhFh4Are3K
	Bsw25m0gy17TUMBacwNj2DNvNFAHAl6oSj2aH6uefqnKfuBfs1J/xPsvUr/DeBriGt4O
	Z3N1vJSnBr4KbMeEZ+XAnjFZuPnNTxp+BYOpOC9ZZPeLl5Ij2vZHm1ir9mcQCZgt/NCo
	TAzw==
MIME-Version: 1.0
X-Received: by 10.180.19.201 with SMTP id h9mr10957650wie.17.1401364965103;
	Thu, 29 May 2014 05:02:45 -0700 (PDT)
Received: by 10.216.48.6 with HTTP; Thu, 29 May 2014 05:02:45 -0700 (PDT)
Received: by 10.216.48.6 with HTTP; Thu, 29 May 2014 05:02:45 -0700 (PDT)
In-Reply-To: <1401362158.2607.85.camel@ted>
References: <1634957.0tvEDlpPGg@chl500346>
	<1401362158.2607.85.camel@ted>
Date: Thu, 29 May 2014 15:02:45 +0300
Message-ID: <CANr+NRtFmykyNBBnT_gMG1ueDi3-b1X0K_RPbe=bzk2trFS_Wg@mail.gmail.com>
From: Stefan Stanacar <sstncr@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] runqemu-internal: add NIC to kernel parameters
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
X-List-Received-Date: Thu, 29 May 2014 12:10:32 -0000
Content-Type: multipart/alternative; boundary=bcaec53f37e3f2252404fa88b486

--bcaec53f37e3f2252404fa88b486
Content-Type: text/plain; charset=UTF-8

On May 29, 2014 2:16 PM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2014-05-27 at 12:22 +0200, Adrian Freihofer wrote:
> > Fixes [YOCTO #6356]
> >
> > Problem: If QEMU parameters are extended to emulate additional
> > network interfaces, NFS boot does not work. Example:
> > runqemu ... qemuparams="-net nic,model=virtio... -net tap, ..."
> > This is solved by extending the kernel parameters by "::eth0:on"
> > ---
> >  scripts/runqemu-internal | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> > index d317dfd..30d6514 100755
> > --- a/scripts/runqemu-internal
> > +++ b/scripts/runqemu-internal
> > @@ -249,7 +249,7 @@ else
> >          n1=$(($n0 * 2 + 1))
> >          n2=$(($n1 + 1))
> >
> > -
 KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0"
> > +
 KERNEL_NETWORK_CMD="ip=192.168.7.$n2::192.168.7.$n1:255.255.255.0::eth0:on"
> >          QEMU_TAP_CMD="-net
tap,vlan=0,ifname=$TAP,script=no,downscript=no"
> >          if [ "$KVM_ACTIVE" = "yes" ]; then
> >              QEMU_NETWORK_CMD="-net nic,model=virtio
$QEMU_TAP_CMD,vhost=on"
>
> Unfortunately this results in failures in all our automated sanity
> tests:
>

It should be noted that minimal images do have network so this might upset
connman...

Cheers,
Stefan
>
https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/94/steps/Running%20Sanity%20Tests_1/logs/stdio
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--bcaec53f37e3f2252404fa88b486
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On May 29, 2014 2:16 PM, &quot;Richard Purdie&quot; &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br>
&gt;<br>
&gt; On Tue, 2014-05-27 at 12:22 +0200, Adrian Freihofer wrote:<br>
&gt; &gt; Fixes [YOCTO #6356]<br>
&gt; &gt;<br>
&gt; &gt; Problem: If QEMU parameters are extended to emulate additional<br=
>
&gt; &gt; network interfaces, NFS boot does not work. Example:<br>
&gt; &gt; runqemu ... qemuparams=3D&quot;-net nic,model=3Dvirtio... -net ta=
p, ...&quot;<br>
&gt; &gt; This is solved by extending the kernel parameters by &quot;::eth0=
:on&quot;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0scripts/runqemu-internal | 2 +-<br>
&gt; &gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal<=
br>
&gt; &gt; index d317dfd..30d6514 100755<br>
&gt; &gt; --- a/scripts/runqemu-internal<br>
&gt; &gt; +++ b/scripts/runqemu-internal<br>
&gt; &gt; @@ -249,7 +249,7 @@ else<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n1=3D$(($n0 * 2 + 1))<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n2=3D$(($n1 + 1))<br>
&gt; &gt;<br>
&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNEL_NETWORK_CMD=3D&quot;ip=3D192.=
168.7.$n2::192.168.7.$n1:255.255.255.0&quot;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNEL_NETWORK_CMD=3D&quot;ip=3D192.=
168.7.$n2::192.168.7.$n1:255.255.255.0::eth0:on&quot;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU_TAP_CMD=3D&quot;-net tap,v=
lan=3D0,ifname=3D$TAP,script=3Dno,downscript=3Dno&quot;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$KVM_ACTIVE&quot; =
=3D &quot;yes&quot; ]; then<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU_NETWORK_CMD=
=3D&quot;-net nic,model=3Dvirtio $QEMU_TAP_CMD,vhost=3Don&quot;<br>
&gt;<br>
&gt; Unfortunately this results in failures in all our automated sanity<br>
&gt; tests:<br>
&gt;<br></p>
<p dir=3D"ltr">It should be noted that minimal images do have network so th=
is might upset connman...</p>
<p dir=3D"ltr">Cheers,<br>
Stefan<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-=
ipk/builds/94/steps/Running%20Sanity%20Tests_1/logs/stdio">https://autobuil=
der.yoctoproject.org/main/builders/nightly-ipk/builds/94/steps/Running%20Sa=
nity%20Tests_1/logs/stdio</a><br>

&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
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

--bcaec53f37e3f2252404fa88b486--
