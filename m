Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TYS23-00019G-SV
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 02:44:50 +0100
Received: by mail-pb0-f41.google.com with SMTP id xa7so1595085pbc.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 17:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=klMQLTE6ciBhpsgGcd2MQx5vJu6PuRgRXzHalhn/gq4=;
	b=liA38tShaR5q1QFrp8XqqwCdyJHou5sfNj81XOYVVP8Zg2aJoZj8oDQ9hl+FFw4SR0
	S0r7cd9sFr+6Pm6pBo/SDn5S03YZiiGgfeFVUoDpdrZrTeN5+mpTFGFxy0rq3V+VJ+I9
	dCOUkgac3kHLB4B6FvpetOLwJKuV5qey1h7gSKtnnuspo+Kwngm8OW8S23xqYFYz/nQU
	Int5xmbzOcsQvLUV/lp5MpLlaLOw5uKZ+VBSF65O7SRFHMNHIad9rRlVN7+tn27TXsMR
	XIZXZzJ90MB7Rrp97wlnKQZydKmqZW4LgPc/dLG6Gx5STVOfEG6jv+ucDY34MaU7UWex
	21tg==
MIME-Version: 1.0
Received: by 10.68.197.9 with SMTP id iq9mr72057563pbc.130.1352856652333; Tue,
	13 Nov 2012 17:30:52 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 13 Nov 2012 17:30:52 -0800 (PST)
In-Reply-To: <1352841144-31228-1-git-send-email-radu.moisan@intel.com>
References: <1352841144-31228-1-git-send-email-radu.moisan@intel.com>
Date: Tue, 13 Nov 2012 23:30:52 -0200
X-Google-Sender-Auth: CtchOfWks0ZI6Am9im73QV7OVMo
Message-ID: <CAP9ODKoavTz3NHir+XCx9GKCZg5qQicqzTxdaQxPr0fk-9Qbfg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Radu Moisan <radu.moisan@intel.com>
Cc: Alexandru Damian <alexandru.damian@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] initrd: add recovery feature
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
X-List-Received-Date: Wed, 14 Nov 2012 01:44:50 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c85c31c38504ce6a7c90

--e89a8ff1c85c31c38504ce6a7c90
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 13, 2012 at 7:12 PM, Radu Moisan <radu.moisan@intel.com> wrote:

> Allows you to use as root a partition instead of the rootfs.img
> for recovering an old install, and fails safe when no rootfs is
> found, dropping the user to a shell if something goes wrong.
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> Signed-off-by: Alexandru Damian <alexandru.damian@intel.com>
> ---
>  meta/recipes-core/initrdscripts/files/init-live.sh |   44
> +++++++++++++++++++-
>  1 file changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh
> b/meta/recipes-core/initrdscripts/files/init-live.sh
> index 5682fd1..81686b9 100644
> --- a/meta/recipes-core/initrdscripts/files/init-live.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
> @@ -68,13 +68,49 @@ fatal() {
>
>  early_setup
>
> +# wait for the udevd to settle
> +echo "Waiting for udev to settle..."
> +udevadm settle --timeout=3
>

I think if we take a timeout it needs to be about 10s or 20s. I have some
slow machines that take way more time then 3s.


>  [ -z "$CONSOLE" ] && CONSOLE="/dev/console"
>
>  read_args
>
> -echo "Waiting for removable media..."
> -while true
> +# boot partiton menu, if one or more bootable partitions exist
> +BOOTMENU=`ls /media/sd*/sbin/init 2>/dev/null | wc -l`
> +if [ $BOOTMENU -gt 0 ]; then
> +   choice=0
> +   while [ $choice -le 0 ]; do
> +       echo "1). boot live ramfs image"
> +       count=2
> +       for i in `ls /media/sd*/sbin/init 2>/dev/null | cut -d "/" -f 3`;
> do
> +           echo $count"). boot /dev/"$i
> +           choicecmd[$count]=$i
> +           count=$(( count + 1))
> +       done
> +       echo
> +       echo -n "Your choice: "
> +       read choice
> +   done
> +
> +   if [ $choice -gt 1 ]; then
> +       #ROOT_MOUNT=/media/${choicecmd[${choice}]}
> +       ROOT_MOUNT=none #testing
> +       echo "Booting local root ... $ROOT_MOUNT"
> +       if [ -d $ROOT_MOUNT ]; then
> +           boot_live_root
> +       else
> +           fatal "Rootfs partition not mounted"
> +       fi
> +   fi
> +fi
> +
> +echo -n "Waiting for removable media... "
> +CNT=0
> +while [ $CNT -le 3 ];
>  do
> +  echo -n "$CNT "
> +  CNT=$(( $CNT + 1 ))
>    for i in `ls /media 2>/dev/null`; do
>        if [ -f /media/$i/$ROOT_IMAGE ] ; then
>                 found="yes"
> @@ -91,6 +127,10 @@ do
>    sleep 1
>  done
>
> +if [ "$found" != "yes" ]; then
> +   fatal "...could not mount removable media, drop to shell"
> +fi
> +
>  case $label in
>      boot)
>         mkdir $ROOT_MOUNT
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c85c31c38504ce6a7c90
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Tue, Nov 13, 2012 at 7:12 PM, Radu Mo=
isan <span dir=3D"ltr">&lt;<a href=3D"mailto:radu.moisan@intel.com" target=
=3D"_blank">radu.moisan@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
Allows you to use as root a partition instead of the rootfs.img<br>
for recovering an old install, and fails safe when no rootfs is<br>
found, dropping the user to a shell if something goes wrong.<br>
<br>
Signed-off-by: Radu Moisan &lt;<a href=3D"mailto:radu.moisan@intel.com">rad=
u.moisan@intel.com</a>&gt;<br>
Signed-off-by: Alexandru Damian &lt;<a href=3D"mailto:alexandru.damian@inte=
l.com">alexandru.damian@intel.com</a>&gt;<br>
---<br>
=A0meta/recipes-core/initrdscripts/files/init-live.sh | =A0 44 ++++++++++++=
+++++++-<br>
=A01 file changed, 42 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/reci=
pes-core/initrdscripts/files/init-live.sh<br>
index 5682fd1..81686b9 100644<br>
--- a/meta/recipes-core/initrdscripts/files/init-live.sh<br>
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh<br>
@@ -68,13 +68,49 @@ fatal() {<br>
<br>
=A0early_setup<br>
<br>
+# wait for the udevd to settle<br>
+echo &quot;Waiting for udev to settle...&quot;<br>
+udevadm settle --timeout=3D3<br></blockquote><div><br></div><div>I think i=
f we take a timeout it needs to be about 10s or 20s. I have some slow machi=
nes that take way more time then 3s.</div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

=A0[ -z &quot;$CONSOLE&quot; ] &amp;&amp; CONSOLE=3D&quot;/dev/console&quot=
;<br>
<br>
=A0read_args<br>
<br>
-echo &quot;Waiting for removable media...&quot;<br>
-while true<br>
+# boot partiton menu, if one or more bootable partitions exist<br>
+BOOTMENU=3D`ls /media/sd*/sbin/init 2&gt;/dev/null | wc -l`<br>
+if [ $BOOTMENU -gt 0 ]; then<br>
+ =A0 choice=3D0<br>
+ =A0 while [ $choice -le 0 ]; do<br>
+ =A0 =A0 =A0 echo &quot;1). boot live ramfs image&quot;<br>
+ =A0 =A0 =A0 count=3D2<br>
+ =A0 =A0 =A0 for i in `ls /media/sd*/sbin/init 2&gt;/dev/null | cut -d &qu=
ot;/&quot; -f 3`; do<br>
+ =A0 =A0 =A0 =A0 =A0 echo $count&quot;). boot /dev/&quot;$i<br>
+ =A0 =A0 =A0 =A0 =A0 choicecmd[$count]=3D$i<br>
+ =A0 =A0 =A0 =A0 =A0 count=3D$(( count + 1))<br>
+ =A0 =A0 =A0 done<br>
+ =A0 =A0 =A0 echo<br>
+ =A0 =A0 =A0 echo -n &quot;Your choice: &quot;<br>
+ =A0 =A0 =A0 read choice<br>
+ =A0 done<br>
+<br>
+ =A0 if [ $choice -gt 1 ]; then<br>
+ =A0 =A0 =A0 #ROOT_MOUNT=3D/media/${choicecmd[${choice}]}<br>
+ =A0 =A0 =A0 ROOT_MOUNT=3Dnone #testing<br>
+ =A0 =A0 =A0 echo &quot;Booting local root ... $ROOT_MOUNT&quot;<br>
+ =A0 =A0 =A0 if [ -d $ROOT_MOUNT ]; then<br>
+ =A0 =A0 =A0 =A0 =A0 boot_live_root<br>
+ =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 =A0 =A0 fatal &quot;Rootfs partition not mounted&quot;<br>
+ =A0 =A0 =A0 fi<br>
+ =A0 fi<br>
+fi<br>
+<br>
+echo -n &quot;Waiting for removable media... &quot;<br>
+CNT=3D0<br>
+while [ $CNT -le 3 ];<br>
=A0do<br>
+ =A0echo -n &quot;$CNT &quot;<br>
+ =A0CNT=3D$(( $CNT + 1 ))<br>
=A0 =A0for i in `ls /media 2&gt;/dev/null`; do<br>
=A0 =A0 =A0 =A0if [ -f /media/$i/$ROOT_IMAGE ] ; then<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found=3D&quot;yes&quot;<br>
@@ -91,6 +127,10 @@ do<br>
=A0 =A0sleep 1<br>
=A0done<br>
<br>
+if [ &quot;$found&quot; !=3D &quot;yes&quot; ]; then<br>
+ =A0 fatal &quot;...could not mount removable media, drop to shell&quot;<b=
r>
+fi<br>
+<br>
=A0case $label in<br>
=A0 =A0 =A0boot)<br>
=A0 =A0 =A0 =A0 mkdir $ROOT_MOUNT<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e89a8ff1c85c31c38504ce6a7c90--
