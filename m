Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RftnA-0002cE-VL
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 14:43:41 +0100
Received: by vbbfc21 with SMTP id fc21so9813501vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 05:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yTDGA8dDwYS20yBgL0uVJlMuweuZSV/O4mvz68n/JEs=;
	b=C5+bBFMHGOlt38xJMZ4E/yBjdh/z2N3AKvZn0njVCDsHJLbhvRslpDwfjh+t6GEFpw
	OEx7Yu7SCTqDC8ZTj9wJ/tqqY795Qx5Gnu4swRW/2A9+uD6WUIhXBzzKsbOdR9ta+Atk
	g8l44iHp0cWdbNZCXXgb4UcJP81Iv8GD8a+3A=
MIME-Version: 1.0
Received: by 10.52.22.12 with SMTP id z12mr15580820vde.54.1325079386851; Wed,
	28 Dec 2011 05:36:26 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Wed, 28 Dec 2011 05:36:26 -0800 (PST)
In-Reply-To: <38A62FB9-6B22-4DC6-AC66-23F5806ED8BA@chargestorm.se>
References: <1325018118-30223-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1325018118-30223-2-git-send-email-fransmeulenbroeks@gmail.com>
	<38A62FB9-6B22-4DC6-AC66-23F5806ED8BA@chargestorm.se>
Date: Wed, 28 Dec 2011 14:36:26 +0100
Message-ID: <CACW_hTZ=5dzL6g2BOUnjjbWr+_kjU3RDjAGfMDs0NaMTpUffHg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Anders Darander <anders@chargestorm.se>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] u-boot: added generating the env utils (fixes bug 1800)
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
X-List-Received-Date: Wed, 28 Dec 2011 13:43:41 -0000
Content-Type: multipart/alternative; boundary=bcaec50165ed270aeb04b5271623

--bcaec50165ed270aeb04b5271623
Content-Type: text/plain; charset=ISO-8859-1

2011/12/28 Anders Darander <anders@chargestorm.se>

>
> On 27 dec 2011, at 21:35, "Frans Meulenbroeks" <
> fransmeulenbroeks@gmail.com> wrote:
>
> > This adds building the u-boot tools for target.
> > (fw_printenv, fw_setenv).
> > They are put into a separate package
> > With these files it becomes possible to modify
> > the u-boot environment when linux is booted
> >
> > The #ifdef's in fw_env.h were needed to avoid compilation issues
> > The constants have been changed to more meaningful defaults
> > (as 128k flash pages are much more common than 4k pages)
> > but can be overridden using a configuration file.
> >
> > This resolves bug 1800
> >
> > Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> >
> > ---
> > Note: development and testing was done under openembedded classic.
> > I've tested it there quite heavily (for mpc8313 if that matters).
> > I was requested to provide a patch for oe-core too (to resolve bug 1800)
> > so here it is, although at the moment I am unable to test the patch for
> oe-core.
> > I suggest that this is carefully reviewed and tested before being merged.
>
>
> > create mode 100644 meta/recipes-bsp/u-boot/files/tools_fwenv.patch
> >
> > diff --git a/meta/recipes-bsp/u-boot/files/tools_fwenv.patch
> b/meta/recipes-bsp/u-boot/files/tools_fwenv.patch
> > new file mode 100644
> > index 0000000..8e87800
> > --- /dev/null
> > +++ b/meta/recipes-bsp/u-boot/files/tools_fwenv.patch
> > @@ -0,0 +1,48 @@
> > +Index: u-boot-2011.03/tools/env/fw_env.h
> > +===================================================================
> > +--- u-boot-2011.03.orig/tools/env/fw_env.h    2011-03-31
> 23:45:36.000000000 +0200++++ u-boot-2011.03/tools/env/fw_env.h
>  2011-12-02 13:55:24.667278362 +0100
> > +@@ -27,25 +27,35 @@
> > +  * See included "fw_env.config" sample file (TRAB board)
> > +  * for notes on configuration.
> > +  */
> > +-#define CONFIG_FILE     "/etc/fw_env.config"
> > ++//#define CONFIG_FILE     "/etc/fw_env.config"
>
> Why do you remove the default for CONFIG_FILE?
> I haven't the u-boot code here, but isn't there a check for the
> configuration file in the code? Thus, you would still get compiled in
> defaults if no config file is found?
>

Good catch.
This was based on work I did for a project a while ago.
Didn't have time to submit a patch then and decided the Xmas holiday was a
good point in time to upstream this, but apparently I overlooked this local
change.

I peeked into the code (tools/env/fw_env.c). If config file is used it does
uses the values in it, otherwise it fails. It does not use the built-in
values in that case (which imho would be preferable)
Anyway, for this specific project it was decided to use hardcoded values,
and that crept in.
I'll see if I can come up with a patch to use the default values if the
config file cannot be opened.


>
> > ++
> > ++#include "config.h"
> > +
> > + #define HAVE_REDUND /* For systems with 2 env sectors */
> > +-#define DEVICE1_NAME      "/dev/mtd1"
> > +-#define DEVICE2_NAME      "/dev/mtd2"
> > ++#define DEVICE1_NAME      "/dev/mtd0"
> > ++#define DEVICE2_NAME      "/dev/mtd0"
>
> Would this really be a more comman case than he original defines?
> (Personally, I'm usually using the config file, so this doesn't really
> matter. But I'd still question changing these to mtd0...)
>
I can live with either value. This was what was used in our project.
Personally I'm somewhat inclined to keep the # of partitions small, so I am
less inclined to make two partitions for the env.

>
> > + #define DEVICE1_OFFSET    0x0000
> > +-#define ENV1_SIZE         0x4000
> > +-#define DEVICE1_ESIZE     0x4000
> > +-#define DEVICE2_OFFSET    0x0000
> > +-#define ENV2_SIZE         0x4000
> > +-#define DEVICE2_ESIZE     0x4000
> > ++#define ENV1_SIZE         0x2000
> > ++#define DEVICE1_ESIZE     0x20000
> > ++#define DEVICE1_ENVSECTORS     1
> > ++#define DEVICE2_OFFSET    0x20000
> > ++#define ENV2_SIZE         0x2000
> > ++#define DEVICE2_ESIZE     0x20000
> > ++#define DEVICE2_ENVSECTORS     1
>
> Ok, I can agree with you that 128k pages are more common, thus that could
> be a sensible default.
>
> I can also see a few reasons for changing the size of the environments,
> ENV1_SIZE and ENV2_SIZE, but there is no reason given in the commit log.
>
> Again probably a personal preference that crept in.
I did a quick grep: in u-boot/include/configs 146 boards have a size of
0x2000, and 78 have a size of 0x4000, so it seems 0x2000 is more used.
THen again perhaps the code should be modified to make use of whatever
config/include says.

I'll see if I can come up with an update.
But actually the most important part of this patch is to add the code in
.inc and .bb to compile the tools.

Best regards, Frans

PS: it could also be decided to make a separate u-boot-env recipe.
PPS: if interested in why fw_prntenv is compiled with HOSTCC: see this
thread:
http://old.nabble.com/-U-Boot---PATCH-1-4--tools%3A-enable-img2srec-for-%22all%22-target-td29440508.html#a29440510
discussion starts somewhere halfway the thread.

--bcaec50165ed270aeb04b5271623
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/12/28 Anders Darander <span dir=3D"=
ltr">&lt;<a href=3D"mailto:anders@chargestorm.se" target=3D"_blank">anders@=
chargestorm.se</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div><br>
On 27 dec 2011, at 21:35, &quot;Frans Meulenbroeks&quot; &lt;<a href=3D"mai=
lto:fransmeulenbroeks@gmail.com" target=3D"_blank">fransmeulenbroeks@gmail.=
com</a>&gt; wrote:<br>
<br>
&gt; This adds building the u-boot tools for target.<br>
&gt; (fw_printenv, fw_setenv).<br>
&gt; They are put into a separate package<br>
&gt; With these files it becomes possible to modify<br>
&gt; the u-boot environment when linux is booted<br>
&gt;<br>
&gt; The #ifdef&#39;s in fw_env.h were needed to avoid compilation issues<b=
r>
&gt; The constants have been changed to more meaningful defaults<br>
&gt; (as 128k flash pages are much more common than 4k pages)<br>
&gt; but can be overridden using a configuration file.<br>
&gt;<br>
&gt; This resolves bug 1800<br>
&gt;<br>
&gt; Signed-off-by: Frans Meulenbroeks &lt;<a href=3D"mailto:fransmeulenbro=
eks@gmail.com" target=3D"_blank">fransmeulenbroeks@gmail.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt; Note: development and testing was done under openembedded classic.<br>
&gt; I&#39;ve tested it there quite heavily (for mpc8313 if that matters).<=
br>
&gt; I was requested to provide a patch for oe-core too (to resolve bug 180=
0)<br>
&gt; so here it is, although at the moment I am unable to test the patch fo=
r oe-core.<br>
&gt; I suggest that this is carefully reviewed and tested before being merg=
ed.<br>
<br>
<br>
</div><div>&gt; create mode 100644 meta/recipes-bsp/u-boot/files/tools_fwen=
v.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-bsp/u-boot/files/tools_fwenv.patch b/meta/re=
cipes-bsp/u-boot/files/tools_fwenv.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..8e87800<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-bsp/u-boot/files/tools_fwenv.patch<br>
&gt; @@ -0,0 +1,48 @@<br>
&gt; +Index: u-boot-2011.03/tools/env/fw_env.h<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
</div>&gt; +--- u-boot-2011.03.orig/tools/env/fw_env.h =A0 =A02011-03-31 23=
:45:36.000000000 +0200++++ u-boot-2011.03/tools/env/fw_env.h =A0 =A02011-12=
-02 13:55:24.667278362 +0100<br>
<div>&gt; +@@ -27,25 +27,35 @@<br>
&gt; + =A0* See included &quot;fw_env.config&quot; sample file (TRAB board)=
<br>
&gt; + =A0* for notes on configuration.<br>
&gt; + =A0*/<br>
&gt; +-#define CONFIG_FILE =A0 =A0 &quot;/etc/fw_env.config&quot;<br>
&gt; ++//#define CONFIG_FILE =A0 =A0 &quot;/etc/fw_env.config&quot;<br>
<br>
</div>Why do you remove the default for CONFIG_FILE?<br>
I haven&#39;t the u-boot code here, but isn&#39;t there a check for the con=
figuration file in the code? Thus, you would still get compiled in defaults=
 if no config file is found?<br></blockquote><div><br>Good catch.<br>This w=
as based on work I did for a project a while ago.<br>

Didn&#39;t have time to submit a patch then and decided the Xmas holiday wa=
s a good point in time to upstream this, but apparently I overlooked this l=
ocal change.<br><br>I peeked into the code (tools/env/fw_env.c). If config =
file is used it does uses the values in it, otherwise it fails. It does not=
 use the built-in values in that case (which imho would be preferable)<br>

Anyway, for this specific project it was decided to use hardcoded values, a=
nd that crept in.<br>I&#39;ll see if I can come up with a patch to use the =
default values if the config file cannot be opened.<br>=A0<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">


<div><br>
&gt; ++<br>
&gt; ++#include &quot;config.h&quot;<br>
&gt; +<br>
&gt; + #define HAVE_REDUND /* For systems with 2 env sectors */<br>
&gt; +-#define DEVICE1_NAME =A0 =A0 =A0&quot;/dev/mtd1&quot;<br>
&gt; +-#define DEVICE2_NAME =A0 =A0 =A0&quot;/dev/mtd2&quot;<br>
&gt; ++#define DEVICE1_NAME =A0 =A0 =A0&quot;/dev/mtd0&quot;<br>
&gt; ++#define DEVICE2_NAME =A0 =A0 =A0&quot;/dev/mtd0&quot;<br>
<br>
</div>Would this really be a more comman case than he original defines? (Pe=
rsonally, I&#39;m usually using the config file, so this doesn&#39;t really=
 matter. But I&#39;d still question changing these to mtd0...)<br></blockqu=
ote>

<div>I can live with either value. This was what was used in our project. <=
br>Personally I&#39;m somewhat inclined to keep the # of partitions small, =
so I am less inclined to make two partitions for the env.<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">


<div><br>
&gt; + #define DEVICE1_OFFSET =A0 =A00x0000<br>
&gt; +-#define ENV1_SIZE =A0 =A0 =A0 =A0 0x4000<br>
&gt; +-#define DEVICE1_ESIZE =A0 =A0 0x4000<br>
&gt; +-#define DEVICE2_OFFSET =A0 =A00x0000<br>
&gt; +-#define ENV2_SIZE =A0 =A0 =A0 =A0 0x4000<br>
&gt; +-#define DEVICE2_ESIZE =A0 =A0 0x4000<br>
&gt; ++#define ENV1_SIZE =A0 =A0 =A0 =A0 0x2000<br>
&gt; ++#define DEVICE1_ESIZE =A0 =A0 0x20000<br>
&gt; ++#define DEVICE1_ENVSECTORS =A0 =A0 1<br>
&gt; ++#define DEVICE2_OFFSET =A0 =A00x20000<br>
&gt; ++#define ENV2_SIZE =A0 =A0 =A0 =A0 0x2000<br>
&gt; ++#define DEVICE2_ESIZE =A0 =A0 0x20000<br>
&gt; ++#define DEVICE2_ENVSECTORS =A0 =A0 1<br>
<br>
</div>Ok, I can agree with you that 128k pages are more common, thus that c=
ould be a sensible default.<br>
<br>
I can also see a few reasons for changing the size of the environments, ENV=
1_SIZE and ENV2_SIZE, but there is no reason given in the commit log.<br>
<br></blockquote><div>Again probably a personal preference that crept in. <=
br>I did a quick grep: in u-boot/include/configs 146 boards have a size of =
0x2000, and 78 have a size of 0x4000, so it seems 0x2000 is more used.<br>

THen again perhaps the code should be modified to make use of whatever conf=
ig/include says.<br></div></div><br>I&#39;ll see if I can come up with an u=
pdate.<br>But actually the most important part of this patch is to add the =
code in .inc and .bb to compile the tools.<br>
<br>Best regards, Frans<br><br>PS: it could also be decided to make a separ=
ate u-boot-env recipe.<br>PPS: if interested in why fw_prntenv is compiled =
with HOSTCC: see this thread: <a href=3D"http://old.nabble.com/-U-Boot---PA=
TCH-1-4--tools%3A-enable-img2srec-for-%22all%22-target-td29440508.html#a294=
40510">http://old.nabble.com/-U-Boot---PATCH-1-4--tools%3A-enable-img2srec-=
for-%22all%22-target-td29440508.html#a29440510</a><br>
discussion starts somewhere halfway the thread.<br><br>

--bcaec50165ed270aeb04b5271623--
