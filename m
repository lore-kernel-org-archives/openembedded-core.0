Received: from mail-ob0-f179.google.com ([209.85.214.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1URipG-0007nB-Jf
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 14:48:03 +0200
Received: by mail-ob0-f179.google.com with SMTP id tb18so4042390obb.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 05:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:x-gm-message-state;
	bh=4lz3fy7ft1nA95eeiJ33zGV4kgIS4D6BrTrZKTwTCME=;
	b=NfgTBod6qu2S9FUuuTczO4wKU6bHB4jYmfJr9kMqTVOUht1gXT8zoArNVjLypdEwbK
	Z0a9HHNX6GOGlRRhwtBY33amzHvNWxiy8H042MKZnJlf15zbqAg4G+iqHwWiVqztB24B
	AGs8u4/Thi0EhA9Qw5ItbxYNzfim5lsoX3uydEJkOBuigErgtYXYnPe7SyCS43SJ456Z
	a+KIbchfOPakdx2O0+g0A5ldHOpPaXh1sar/rndEcBXS+sH1yvWoQ9ZWhZE++DQ5PGq0
	kalEpWOdOFIy5BCPlXHmlALSEqFRdJ2ly50itMXVUe1oeRLXM6R2YXD5fVo+ZZ+gqstP
	8xhg==
MIME-Version: 1.0
X-Received: by 10.60.118.131 with SMTP id km3mr7249265oeb.137.1366029033244;
	Mon, 15 Apr 2013 05:30:33 -0700 (PDT)
Received: by 10.76.167.164 with HTTP; Mon, 15 Apr 2013 05:30:33 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16224803@IRSMSX102.ger.corp.intel.com>
References: <1365518803-11025-1-git-send-email-alexandru.damian@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16224803@IRSMSX102.ger.corp.intel.com>
Date: Mon, 15 Apr 2013 15:30:33 +0300
Message-ID: <CAJ2CSBtt4kwjaOk3q87-UaO7SKJh+ePWrQsPoErckVUgzcA-hQ@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQnkCOfTiYSiu91QvvLDsFH9MkDvvScgz5TFMYYbcIpzKP3uKk+rZD45oQDVGXCXsV8nM0EX
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"tom.zanussi@linux.intel.com" <tom.zanussi@linux.intel.com>
Subject: Re: [PATCH] qemu: use default qemu CPU definition
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 12:48:03 -0000
X-List-Received-Date: Mon, 15 Apr 2013 12:48:03 -0000
Content-Type: multipart/alternative; boundary=047d7b3a9bd8479a0c04da656b43

--047d7b3a9bd8479a0c04da656b43
Content-Type: text/plain; charset=UTF-8

Hi Cristian,

Please do post comments on patch on the mailing list.

Regarding the message itself, quoted below, I am addressing your specific
concerns.
- There is no performance impact between "qemu64" and "host" CPU options.
The only thing changing is the level of private instructions that the
kernel will attempt - which should be clearly restricted to "qemu64" and
not "host" since we build Yocto for the "qemu" machine.
- I agree that there is an underlying problem in the kernel, but that is
not our primary concern, see no 1. It might be our concern if we'd build
for a specific BSP which showed the problem, but as it stands, it's KVM
folk's concern. Funny enough, they know about the problem (I tracked on
their mailing list), but they don't have a fix since it runs as it's
designed right now - that is, the faulty behavior is a result of how it
should work with the current design.

I still recommend merging this patch since it fixes the problem with the
right fix.

Cheers,
Alex

Original message:

Hi Alex,
I might be wrong, and I need more time to investigate, but I don't
agree with the fix you proposed for this issue.

What you propose is just a step back from how qemu should optimally
work, meaning exporting "-cpu host".

That's one thing.

Another thing is the described issue seems to be specific to some
kernels on the host.
For example, I checked with LaurP and AlexG and thes issue is:
- reproducible on Ubuntu 12.10 with kernel 3.5.0.27 and Fedora Core 18
with kernel 3.8.5.
- not reproducible with Ubuntu 12.04 with kernel 3.2.x (need to check
the exact details with LaurP).

This issue needs more investigation.

Regards,
Cristian



On Mon, Apr 15, 2013 at 9:58 AM, Iorga, Cristian
<cristian.iorga@intel.com>wrote:

> Hi Alex,
>
> See my comments regarding this patch at:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3908
>
> Regards,
> Cristian
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:
> openembedded-core-bounces@lists.openembedded.org] On Behalf Of Alex DAMIAN
> Sent: Tuesday, April 09, 2013 5:47 PM
> To: richard.purdie@linuxfoundation.org; tom.zanussi@linux.intel.com;
> Burton, Ross; paul.eggleton@linux.intel.com;
> openembedded-core@lists.openembedded.org
> Cc: Damian, Alexandru
> Subject: [OE-core] [PATCH] qemu: use default qemu CPU definition
>
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This fixes guest crashes when trying to use restricted instructions based
> on CPU description. Using default qemu CPU descriptions restrict faults on
> using restricted model-specific registers.
>
> [YOCTO #3908]
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  scripts/runqemu          |    2 +-
>  scripts/runqemu-internal |    6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu index 8ed1226..43d7600
> 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -261,7 +261,7 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
>          exit 1;
>      fi
>      if [ -w /dev/kvm -a -r /dev/kvm ]; then
> -        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
> +        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm "
>          KVM_ACTIVE="yes"
>      else
>          echo "You have no rights on /dev/kvm."
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal index
> e8191d1..a7813e5 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -323,10 +323,11 @@ fi
>
>  if [ "$MACHINE" = "qemux86" ]; then
>      QEMU=qemu-system-i386
> +    QEMU_CPU_OPTIONS="-cpu qemu32"
>      QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
>      if [ "$FSTYPE" = "ext2" -o "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs"
> ]; then
>          KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw
> mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
> -        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
> +        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_CPU_OPTIONS
> $QEMU_UI_OPTIONS"
>      fi
>      if [ "$FSTYPE" = "nfs" ]; then
>          if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then @@
> -347,10 +348,11 @@ fi
>
>  if [ "$MACHINE" = "qemux86-64" ]; then
>      QEMU=qemu-system-x86_64
> +    QEMU_CPU_OPTIONS="-cpu qemu64"
>      QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -vga vmware"
>      if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
>          KERNCMDLINE="vga=0 root=$DROOT rw mem=$QEMU_MEMORY
> $KERNEL_NETWORK_CMD"
> -        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
> +        QEMUOPTIONS="$QEMU_NETWORK_CMD $ROOTFS_OPTIONS $QEMU_CPU_OPTIONS
> $QEMU_UI_OPTIONS"
>      fi
>      if [ "$FSTYPE" = "nfs" ]; then
>          if [ "x$ROOTFS" = "x" ]; then
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--047d7b3a9bd8479a0c04da656b43
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Cristian,<div><br></div><div>Please do post comments on=
 patch on the mailing list.</div><div><br></div><div style>Regarding the me=
ssage itself, quoted below, I am addressing your specific concerns.</div><d=
iv style>
- There is no performance impact between &quot;qemu64&quot; and &quot;host&=
quot; CPU options. The only thing changing is the level of private instruct=
ions that the kernel will attempt - which should be clearly restricted to &=
quot;qemu64&quot; and not &quot;host&quot; since we build Yocto for the &qu=
ot;qemu&quot; machine. =C2=A0</div>
<div style>- I agree that there is an underlying problem in the kernel, but=
 that is not our primary concern, see no 1. It might be our concern if we&#=
39;d build for a specific BSP which showed the problem, but as it stands, i=
t&#39;s KVM folk&#39;s concern. Funny enough, they know about the problem (=
I tracked on their mailing list), but they don&#39;t have a fix since it ru=
ns as it&#39;s designed right now - that is, the faulty=C2=A0behavior=C2=A0=
is a result of how it should work with the current design.</div>
<div style><br></div><div style>I still recommend merging this patch since =
it fixes the problem with the right fix.</div><div style><br></div><div sty=
le>Cheers,</div><div style>Alex=C2=A0</div><div style><br></div><div style>=
Original message:</div>
<div style><pre class=3D"" style=3D"white-space:pre-wrap;width:50em;color:r=
gb(0,0,0)">Hi Alex,
I might be wrong, and I need more time to investigate, but I don&#39;t agre=
e with the fix you proposed for this issue.

What you propose is just a step back from how qemu should optimally work, m=
eaning exporting &quot;-cpu host&quot;.

That&#39;s one thing.

Another thing is the described issue seems to be specific to some kernels o=
n the host.
For example, I checked with LaurP and AlexG and thes issue is:
- reproducible on Ubuntu 12.10 with kernel 3.5.0.27 and Fedora Core 18 with=
 kernel 3.8.5.
- not reproducible with Ubuntu 12.04 with kernel 3.2.x (need to check the e=
xact details with LaurP).

This issue needs more investigation.

Regards,
Cristian</pre></div></div><div class=3D"gmail_extra"><br><br><div class=3D"=
gmail_quote">On Mon, Apr 15, 2013 at 9:58 AM, Iorga, Cristian <span dir=3D"=
ltr">&lt;<a href=3D"mailto:cristian.iorga@intel.com" target=3D"_blank">cris=
tian.iorga@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Alex,<br>
<br>
See my comments regarding this patch at:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3908" target=
=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3908</a><br=
>
<br>
Regards,<br>
Cristian<br>
<div><div class=3D"h5"><br>
-----Original Message-----<br>
From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.org">o=
penembedded-core-bounces@lists.openembedded.org</a> [mailto:<a href=3D"mail=
to:openembedded-core-bounces@lists.openembedded.org">openembedded-core-boun=
ces@lists.openembedded.org</a>] On Behalf Of Alex DAMIAN<br>

Sent: Tuesday, April 09, 2013 5:47 PM<br>
To: <a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@li=
nuxfoundation.org</a>; <a href=3D"mailto:tom.zanussi@linux.intel.com">tom.z=
anussi@linux.intel.com</a>; Burton, Ross; <a href=3D"mailto:paul.eggleton@l=
inux.intel.com">paul.eggleton@linux.intel.com</a>; <a href=3D"mailto:openem=
bedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.or=
g</a><br>

Cc: Damian, Alexandru<br>
Subject: [OE-core] [PATCH] qemu: use default qemu CPU definition<br>
<br>
From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@intel.com">al=
exandru.damian@intel.com</a>&gt;<br>
<br>
This fixes guest crashes when trying to use restricted instructions based o=
n CPU description. Using default qemu CPU descriptions restrict faults on u=
sing restricted model-specific registers.<br>
<br>
[YOCTO #3908]<br>
<br>
Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@inte=
l.com">alexandru.damian@intel.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-=
<br>
=C2=A0scripts/runqemu-internal | =C2=A0 =C2=A06 ++++--<br>
=C2=A02 files changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu index 8ed1226..43d7600 10075=
5<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -261,7 +261,7 @@ if [ &quot;x$KVM_ENABLED&quot; =3D &quot;xyes&quot; ]; =
then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0if [ -w /dev/kvm -a -r /dev/kvm ]; then<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0SCRIPT_QEMU_OPT=3D&quot;$SCRIPT_QEMU_OPT -enab=
le-kvm -cpu host&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0SCRIPT_QEMU_OPT=3D&quot;$SCRIPT_QEMU_OPT -enab=
le-kvm &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KVM_ACTIVE=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;You have no rights on /dev/kvm=
.&quot;<br>
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal index e819=
1d1..a7813e5 100755<br>
--- a/scripts/runqemu-internal<br>
+++ b/scripts/runqemu-internal<br>
@@ -323,10 +323,11 @@ fi<br>
<br>
=C2=A0if [ &quot;$MACHINE&quot; =3D &quot;qemux86&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0QEMU=3Dqemu-system-i386<br>
+ =C2=A0 =C2=A0QEMU_CPU_OPTIONS=3D&quot;-cpu qemu32&quot;<br>
=C2=A0 =C2=A0 =C2=A0QEMU_UI_OPTIONS=3D&quot;$QEMU_UI_OPTIONS -vga vmware&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;$FSTYPE&quot; =3D &quot;ext2&quot; -o &quot;=
$FSTYPE&quot; =3D &quot;ext3&quot; -o &quot;$FSTYPE&quot; =3D &quot;btrfs&q=
uot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNCMDLINE=3D&quot;vga=3D0 uvesafb.mode_=
option=3D640x480-32 root=3D$DROOT rw mem=3D$QEMU_MEMORY $KERNEL_NETWORK_CMD=
&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D&quot;$QEMU_NETWORK_CMD $ROOTFS_=
OPTIONS $QEMU_UI_OPTIONS&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D&quot;$QEMU_NETWORK_CMD $ROOTFS_=
OPTIONS $QEMU_CPU_OPTIONS $QEMU_UI_OPTIONS&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;$FSTYPE&quot; =3D &quot;nfs&quot; ]; then<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$NFS_SERVER&quot; =3D &quot;19=
2.168.7.1&quot; -a ! -d &quot;$NFS_DIR&quot; ]; then @@ -347,10 +348,11 @@ =
fi<br>
<br>
=C2=A0if [ &quot;$MACHINE&quot; =3D &quot;qemux86-64&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0QEMU=3Dqemu-system-x86_64<br>
+ =C2=A0 =C2=A0QEMU_CPU_OPTIONS=3D&quot;-cpu qemu64&quot;<br>
=C2=A0 =C2=A0 =C2=A0QEMU_UI_OPTIONS=3D&quot;$QEMU_UI_OPTIONS -vga vmware&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;$FSTYPE&quot; =3D &quot;ext3&quot; -o &quot;=
$FSTYPE&quot; =3D &quot;btrfs&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNCMDLINE=3D&quot;vga=3D0 root=3D$DROOT=
 rw mem=3D$QEMU_MEMORY $KERNEL_NETWORK_CMD&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D&quot;$QEMU_NETWORK_CMD $ROOTFS_=
OPTIONS $QEMU_UI_OPTIONS&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUOPTIONS=3D&quot;$QEMU_NETWORK_CMD $ROOTFS_=
OPTIONS $QEMU_CPU_OPTIONS $QEMU_UI_OPTIONS&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;$FSTYPE&quot; =3D &quot;nfs&quot; ]; then<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;x$ROOTFS&quot; =3D &quot;x&quo=
t; ]; then<br>
--<br>
1.7.10.4<br>
<br>
<br>
</div></div>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br></div>

--047d7b3a9bd8479a0c04da656b43--
