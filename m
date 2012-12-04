Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TfuJp-0006HA-HC
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 16:21:57 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2442605pad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 07:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=BhTIeNdDITRwBTCU1PHoUuMCad0cqv1B7+ORsEICoR4=;
	b=EVqIi4pxEAkhqYBuH1YAs1+z6taVkajCmWPrNzyLzIDeDDN26UWUU2GVHJ/HKEeWLK
	ROdM5Jui2pt0sjDBJjHBHLtpZXNeh7QSPtPbQbj8iKQ8cNbJw2Icgxh0MYL+djZ/iZfX
	ICI/SiBPaH+Ik/9Yjfr8pguS/QdErIWVIkpFT7SboH8ulYzdoKwEJ4IQrOtuyUyPNIHC
	eMtJeV4wUzQepxGPEXVkxmVrxXV8iLsowM0Uor9GwoCwhFxQunUGKPV2mwCcinWDo5He
	tOz06YfAGs81lweC/8pHNIbJ/Xz4ED2/qI4MDiBmOIkbhpMl+9GDZBi5T6J16qcZ4vrZ
	h4+w==
MIME-Version: 1.0
Received: by 10.68.213.33 with SMTP id np1mr39273988pbc.64.1354633654034; Tue,
	04 Dec 2012 07:07:34 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 4 Dec 2012 07:07:33 -0800 (PST)
In-Reply-To: <02baf1072c98ba7c93c92bda589a1500ebbadba6.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
	<02baf1072c98ba7c93c92bda589a1500ebbadba6.1354626535.git.laurentiu.palcu@intel.com>
Date: Tue, 4 Dec 2012 13:07:33 -0200
X-Google-Sender-Auth: MmREVM5p2KqC8mJ72brwitf4vf8
Message-ID: <CAP9ODKpZjFRF3FYWzf3BMWYuEBzbb1YrXyG3zpj5OJVdkrNEYw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] rootfs generation: export two new variables to postinst scriptlets
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
X-List-Received-Date: Tue, 04 Dec 2012 15:21:57 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c12ebfe27704d0083967

--e89a8ff1c12ebfe27704d0083967
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 4, 2012 at 11:59 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com>wrote:

> In order for the postinst scriptlets to be able to run once we need to
> export the location of the intercept scripts and also the location of
> native sysrootfs. The gdk-pixbuf binaries will need the latter because
> in order to generate the loaders.cache it will need to scan some shared
> libraries that must be native. Even though the output is a text file.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/package_rpm.bbclass |    2 ++
>  meta/classes/rootfs_deb.bbclass  |    2 ++
>  meta/classes/rootfs_ipk.bbclass  |    2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/meta/classes/package_rpm.bbclass
> b/meta/classes/package_rpm.bbclass
> index 1ff92ce..c7ac07a 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -475,6 +475,8 @@ export D="${target_rootfs}"
>  export OFFLINE_ROOT="\$D"
>  export IPKG_OFFLINE_ROOT="\$D"
>  export OPKG_OFFLINE_ROOT="\$D"
> +export INTERCEPT_DIR="${WORKDIR}/intercept_scripts"
> +export NATIVE_ROOT=${STAGING_DIR_NATIVE}
>

The NATIVE_ROOT seems a duplication, I'd prefer you to use
STAGING_DIR_NATIVE in code as this is a known variable name and makes it
easy to understand.


>  \$2 \$1/\$3 \$4
>  if [ \$? -ne 0 ]; then
> diff --git a/meta/classes/rootfs_deb.bbclass
> b/meta/classes/rootfs_deb.bbclass
> index 881fdbd..955382f 100644
> --- a/meta/classes/rootfs_deb.bbclass
> +++ b/meta/classes/rootfs_deb.bbclass
> @@ -48,6 +48,8 @@ fakeroot rootfs_deb_do_rootfs () {
>         export OFFLINE_ROOT=${IMAGE_ROOTFS}
>         export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
>         export OPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
> +       export INTERCEPT_DIR=${WORKDIR}/intercept_scripts
> +       export NATIVE_ROOT=${STAGING_DIR_NATIVE}
>
>         # Attempt to run preinsts
>         # Mark packages with preinst failures as unpacked
> diff --git a/meta/classes/rootfs_ipk.bbclass
> b/meta/classes/rootfs_ipk.bbclass
> index fc69b7e..8766d24 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -69,6 +69,8 @@ fakeroot rootfs_ipk_do_rootfs () {
>         export OFFLINE_ROOT=${IMAGE_ROOTFS}
>         export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
>         export OPKG_OFFLINE_ROOT=${IPKG_OFFLINE_ROOT}
> +       export INTERCEPT_DIR=${WORKDIR}/intercept_scripts
> +       export NATIVE_ROOT=${STAGING_DIR_NATIVE}
>
>         package_install_internal_ipk
>
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

--e89a8ff1c12ebfe27704d0083967
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, D=
ec 4, 2012 at 11:59 AM, Laurentiu Palcu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:laurentiu.palcu@intel.com" target=3D"_blank">laurentiu.palcu@intel.com=
</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">In order for the postinst scriptlets to be a=
ble to run once we need to<br>
export the location of the intercept scripts and also the location of<br>
native sysrootfs. The gdk-pixbuf binaries will need the latter because<br>
in order to generate the loaders.cache it will need to scan some shared<br>
libraries that must be native. Even though the output is a text file.<br>
<br>
Signed-off-by: Laurentiu Palcu &lt;<a href=3D"mailto:laurentiu.palcu@intel.=
com">laurentiu.palcu@intel.com</a>&gt;<br>
---<br>
=A0meta/classes/package_rpm.bbclass | =A0 =A02 ++<br>
=A0meta/classes/rootfs_deb.bbclass =A0| =A0 =A02 ++<br>
=A0meta/classes/rootfs_ipk.bbclass =A0| =A0 =A02 ++<br>
=A03 files changed, 6 insertions(+)<br>
<br>
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bb=
class<br>
index 1ff92ce..c7ac07a 100644<br>
--- a/meta/classes/package_rpm.bbclass<br>
+++ b/meta/classes/package_rpm.bbclass<br>
@@ -475,6 +475,8 @@ export D=3D&quot;${target_rootfs}&quot;<br>
=A0export OFFLINE_ROOT=3D&quot;\$D&quot;<br>
=A0export IPKG_OFFLINE_ROOT=3D&quot;\$D&quot;<br>
=A0export OPKG_OFFLINE_ROOT=3D&quot;\$D&quot;<br>
+export INTERCEPT_DIR=3D&quot;${WORKDIR}/intercept_scripts&quot;<br>
+export NATIVE_ROOT=3D${STAGING_DIR_NATIVE}<br></blockquote><div><br></div>=
<div>The NATIVE_ROOT seems a duplication, I&#39;d prefer you to use STAGING=
_DIR_NATIVE in code as this is a known variable name and makes it easy to u=
nderstand.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
=A0\$2 \$1/\$3 \$4<br>
=A0if [ \$? -ne 0 ]; then<br>
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbcl=
ass<br>
index 881fdbd..955382f 100644<br>
--- a/meta/classes/rootfs_deb.bbclass<br>
+++ b/meta/classes/rootfs_deb.bbclass<br>
@@ -48,6 +48,8 @@ fakeroot rootfs_deb_do_rootfs () {<br>
=A0 =A0 =A0 =A0 export OFFLINE_ROOT=3D${IMAGE_ROOTFS}<br>
=A0 =A0 =A0 =A0 export IPKG_OFFLINE_ROOT=3D${IMAGE_ROOTFS}<br>
=A0 =A0 =A0 =A0 export OPKG_OFFLINE_ROOT=3D${IMAGE_ROOTFS}<br>
+ =A0 =A0 =A0 export INTERCEPT_DIR=3D${WORKDIR}/intercept_scripts<br>
+ =A0 =A0 =A0 export NATIVE_ROOT=3D${STAGING_DIR_NATIVE}<br>
<br>
=A0 =A0 =A0 =A0 # Attempt to run preinsts<br>
=A0 =A0 =A0 =A0 # Mark packages with preinst failures as unpacked<br>
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbcl=
ass<br>
index fc69b7e..8766d24 100644<br>
--- a/meta/classes/rootfs_ipk.bbclass<br>
+++ b/meta/classes/rootfs_ipk.bbclass<br>
@@ -69,6 +69,8 @@ fakeroot rootfs_ipk_do_rootfs () {<br>
=A0 =A0 =A0 =A0 export OFFLINE_ROOT=3D${IMAGE_ROOTFS}<br>
=A0 =A0 =A0 =A0 export IPKG_OFFLINE_ROOT=3D${IMAGE_ROOTFS}<br>
=A0 =A0 =A0 =A0 export OPKG_OFFLINE_ROOT=3D${IPKG_OFFLINE_ROOT}<br>
+ =A0 =A0 =A0 export INTERCEPT_DIR=3D${WORKDIR}/intercept_scripts<br>
+ =A0 =A0 =A0 export NATIVE_ROOT=3D${STAGING_DIR_NATIVE}<br>
<br>
=A0 =A0 =A0 =A0 package_install_internal_ipk<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
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
</div>

--e89a8ff1c12ebfe27704d0083967--
