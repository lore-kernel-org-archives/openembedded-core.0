Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id EB7266CBA5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 13:10:15 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id b8so4393495lan.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=HfLIvKkhZ1vDvzFmf0Pg7x/reqps6q3S1H1SLlUdo7o=;
	b=XPpTFJiLwHmjXIAauL2UBXBmEV3sz1FcP9TIY4MLma1OY6IZP2G/QmaYEAv1pwP5CL
	RJODTKZy25o8u40XSQj5uhLiektNatAcT76FI7r9wk0bFNqg9pOzMAQaUDC69Spa/TQc
	FUlAF+4cKcJqUY0bR5lrFKKamhrxpxGDTU6iuZHU+PuBAWFiKLs3tRhEhob+IaFUDxlR
	gF+hJbr9tgTSI8w75l6q0dp1XO37/C80IiFYUms1h2RXqUDGHvmkw9nBNg0i5pxWNEIM
	fMVuI8/Hl2W7cNDv4LA2Kq0VjUQGH9AhMnAcgBj59tgrg6eeS/27ybDxrCbZMbHYWV0J
	fPHQ==
MIME-Version: 1.0
X-Received: by 10.112.148.70 with SMTP id tq6mr960830lbb.40.1390050615636;
	Sat, 18 Jan 2014 05:10:15 -0800 (PST)
Received: by 10.112.145.6 with HTTP; Sat, 18 Jan 2014 05:10:15 -0800 (PST)
Date: Sat, 18 Jan 2014 14:10:15 +0100
Message-ID: <CAPbeDCk26BE-b_ckrR7TEOSC5Y16Vh6DVEGEzdCjG0m1BtkwUQ@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Getting rid of warning when running perl from the SDK
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
X-List-Received-Date: Sat, 18 Jan 2014 13:10:17 -0000
Content-Type: multipart/alternative; boundary=047d7b3a88722a38c104f03e614e

--047d7b3a88722a38c104f03e614e
Content-Type: text/plain; charset=ISO-8859-1

Hi,
When running perl from the SDK created by OE I get this warning:

perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
    LANGUAGE = (unset),
    LC_ALL = (unset),
    LANG = "en_US.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").

The following change sets LC_ALL to "C" in the SDK setup script.

 diff --git a/meta/classes/toolchain-scripts.bbclass
b/meta/classes/toolchain-scripts.bbclass
index b9f2aea9..0737253 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -13,6 +13,7 @@ toolchain_create_sdk_env_script () {

script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-$multimach_target_sys}
     rm -f $script
     touch $script
+    echo 'export LC_ALL=C' >> $script
     echo 'export SDKTARGETSYSROOT='"$sysroot" >> $script
     echo 'export
PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}:$PATH'
>> $script
     echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script

and gets rid of the perl warning.

Is this change something that would be appropriate for upstream OE-Core ?

  -- Jacob

--047d7b3a88722a38c104f03e614e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div>When running perl from the SDK created by OE I=
 get this warning:<br><br>perl: warning: Setting locale failed.<br>perl: wa=
rning: Please check that your locale settings:<br>=A0=A0=A0 LANGUAGE =3D (u=
nset),<br>
=A0=A0=A0 LC_ALL =3D (unset),<br>=A0=A0=A0 LANG =3D &quot;en_US.UTF-8&quot;=
<br>=A0=A0=A0 are supported and installed on your system.<br>perl: warning:=
 Falling back to the standard locale (&quot;C&quot;).<br><br></div><div>The=
 following change sets LC_ALL to &quot;C&quot; in the SDK setup script.<br>
<br>=A0diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/t=
oolchain-scripts.bbclass<br>index b9f2aea9..0737253 100644<br>--- a/meta/cl=
asses/toolchain-scripts.bbclass<br>+++ b/meta/classes/toolchain-scripts.bbc=
lass<br>
@@ -13,6 +13,7 @@ toolchain_create_sdk_env_script () {<br>=A0=A0=A0=A0 scri=
pt=3D${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-$multimach_target_sys}=
<br>=A0=A0=A0=A0 rm -f $script<br>=A0=A0=A0=A0 touch $script<br>+=A0=A0=A0 =
echo &#39;export LC_ALL=3DC&#39; &gt;&gt; $script<br>
=A0=A0=A0=A0 echo &#39;export SDKTARGETSYSROOT=3D&#39;&quot;$sysroot&quot; =
&gt;&gt; $script<br>=A0=A0=A0=A0 echo &#39;export PATH=3D${SDKPATHNATIVE}${=
bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}:$PATH&#=
39; &gt;&gt; $script<br>
=A0=A0=A0=A0 echo &#39;export PKG_CONFIG_SYSROOT_DIR=3D$SDKTARGETSYSROOT&#3=
9; &gt;&gt; $script<br><br></div><div>and gets rid of the perl warning.<br>=
<br></div><div>Is this change something that would be appropriate for upstr=
eam OE-Core ?<br>
<br></div><div>=A0 -- Jacob
</div></div>

--047d7b3a88722a38c104f03e614e--
