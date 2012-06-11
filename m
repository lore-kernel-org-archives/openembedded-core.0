Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SeAtE-0007qb-Jm
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 22:07:04 +0200
Received: by eekd49 with SMTP id d49so2148004eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 12:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=NF2REbloaqpwCVrfxdW+jvdiTZSG/SZ8H0X/GvzUyEg=;
	b=paqKemOrG9swwIP77FNSfPSSNFCO9GOlJRhhnhKFm+8VcYxZMkBSrN+g5z7olpa5Fo
	ODi8EJQP+KavKiVBxm6MAt+v0kOgC4S9lgRwOPlPzJqLgEi+QeO8lYDcaS+xuHqtrrGN
	OrNBR6br6QtlTljNV7sIdu52AuHHALgbZOoUUJKjv8cFnaUM3KzrcY7kiG0KbEBq9NVl
	TRtsLQBWEzH2z4rwj7jPjvXBFYy6xw4eZx4cz+p/kref7L3tjAZrr/hT7tz+umLzZ2nL
	pWLqGaRNixYXHgQH36twVC4fJCHHZKynUvixLU1v0Ej5MiIWw0uVNPDya3zBsNmT+A2/
	sAsA==
MIME-Version: 1.0
Received: by 10.14.119.197 with SMTP id n45mr6132851eeh.180.1339444590836;
	Mon, 11 Jun 2012 12:56:30 -0700 (PDT)
Received: by 10.14.188.11 with HTTP; Mon, 11 Jun 2012 12:56:30 -0700 (PDT)
In-Reply-To: <7b19e16d773a44ace72ee2f7e3561b393bdaf7b3.1339438568.git.mark.hatle@windriver.com>
References: <cover.1339438568.git.mark.hatle@windriver.com>
	<7b19e16d773a44ace72ee2f7e3561b393bdaf7b3.1339438568.git.mark.hatle@windriver.com>
Date: Mon, 11 Jun 2012 12:56:30 -0700
Message-ID: <CAMKF1soazUaEhoLAm6_kxfFRALL78CKV1dhzXMBy5nq1AyjSvw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] package_rpm: Verify that the package manifests are not empty
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
X-List-Received-Date: Mon, 11 Jun 2012 20:07:04 -0000
Content-Type: multipart/alternative; boundary=90e6ba539f38087cb904c237bfa9

--90e6ba539f38087cb904c237bfa9
Content-Type: text/plain; charset=UTF-8

On Monday, June 11, 2012, Mark Hatle <mark.hatle@windriver.com> wrote:
> An empty manifest will cause a failure condition.  We ensure that any
install
> actions occur only with a manifest larger then size 0.  Also ensure that
padding
> is added to the end of the manifest, instead of the beginning to enable
this
> size check.  (Padding is required for very small manifest files..)
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package_rpm.bbclass |   59
++++++++++++++++++++++----------------
>  1 files changed, 34 insertions(+), 25 deletions(-)
>
> diff --git a/meta/classes/package_rpm.bbclass
b/meta/classes/package_rpm.bbclass
> index b84c044..bb9aa1a 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -182,6 +182,7 @@ rpm_update_pkg () {
>         # been run by now, so don't have to run them(preun, postun, etc.)
when
>         # erase the pkg
>         if [ -s ${target_rootfs}/install/remove.manifest ]; then
> +            echo "# Removal manifest padding...." >>
${target_rootfs}/install/remove.manifest

Should this be just 'remove'

>             rpm_common_comand --noscripts --nodeps \
>                 -e `cat ${target_rootfs}/install/remove.manifest`
>         fi
> @@ -249,7 +250,7 @@ package_install_internal_rpm () {
>
>        # Setup manifest of packages to install...
>        mkdir -p ${target_rootfs}/install
> -       echo "# Install manifest" >
${target_rootfs}/install/install.manifest
> +       rm -f ${target_rootfs}/install/install.manifest
>
>        # Uclibc builds don't provide this stuff...
>        if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} =
"xlinux-gnueabi" ] ; then
> @@ -309,12 +310,15 @@ package_install_internal_rpm () {
>
>        # Generate an install solution by doing a --justdb install, then
recreate it with
>        # an actual package install!
> -       ${RPM} --predefine "_rpmds_sysinfo_path
${target_rootfs}/etc/rpm/sysinfo" \
> -               --predefine "_rpmrc_platform_path
${target_rootfs}/etc/rpm/platform" \
> -               -D "_dbpath ${target_rootfs}/install" -D "`cat
${confbase}-base_archs.macro`" \
> -               -D "__dbi_txn create nofsync" \
> -               -U --justdb --noscripts --notriggers --noparentdirs
--nolinktos --ignoresize \
> -               ${target_rootfs}/install/install.manifest
> +       if [ -s ${target_rootfs}/install/install.manifest ]; then
> +               echo "# Install manifest padding" >>
${target_rootfs}/install/install.manifest
> +               ${RPM} --predefine "_rpmds_sysinfo_path
${target_rootfs}/etc/rpm/sysinfo" \
> +                       --predefine "_rpmrc_platform_path
${target_rootfs}/etc/rpm/platform" \
> +                       -D "_dbpath ${target_rootfs}/install" -D "`cat
${confbase}-base_archs.macro`" \
> +                       -D "__dbi_txn create nofsync" \
> +                       -U --justdb --noscripts --notriggers
--noparentdirs --nolinktos --ignoresize \
> +                       ${target_rootfs}/install/install.manifest
> +       fi
>
>        if [ ! -z "${package_attemptonly}" ]; then
>                echo "Adding attempt only packages..."
> @@ -407,8 +411,9 @@ package_install_internal_rpm () {
>
>        touch ${target_rootfs}/install/install_multilib_solution.manifest
>
> -       if [ -e "${target_rootfs}/install/install_multilib.manifest" ];
then
> +       if [ -s "${target_rootfs}/install/install_multilib.manifest" ];
then
>                # multilib package installation
> +               echo "# Install multilib manifest padding" >>
${target_rootfs}/install/install_multilib.manifest
>
>                # Generate an install solution by doing a --justdb
install, then recreate it with
>                # an actual package install!
> @@ -493,33 +498,37 @@ EOF
>        if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f "$pre_btmanifest" ]; then
>                echo "Skipping pre install due to exisitng image"
>        else
> -               echo "# Initial Install manifest" >
${target_rootfs}/install/initial_install.manifest
> +               rm -f ${target_rootfs}/install/initial_install.manifest
>                echo "Installing base dependencies first (base-passwd,
base-files and shadow) since rpm is special"
>                grep /base-passwd-[0-9]
${target_rootfs}/install/total_solution.manifest >>
${target_rootfs}/install/initial_install.manifest || true
>                grep /base-files-[0-9]
${target_rootfs}/install/total_solution.manifest >>
${target_rootfs}/install/initial_install.manifest || true
>                grep /shadow-[0-9]
${target_rootfs}/install/total_solution.manifest >>
${target_rootfs}/install/initial_install.manifest || true
>
> -               # Generate an install solution by doing a --justdb
install, then recreate it with
> -               # an actual package install!
> -               mkdir -p ${target_rootfs}/initial
> +               if [ -s ${target_rootfs}/install/initial_install.manifest
]; then
> +                       echo "# Initial Install manifest padding..." >>
${target_rootfs}/install/initial_install.manifest
>
> -               ${RPM} --predefine "_rpmds_sysinfo_path
${target_rootfs}/etc/rpm/sysinfo" \
> -                       --predefine "_rpmrc_platform_path
${target_rootfs}/etc/rpm/platform" \
> -                       -D "_dbpath ${target_rootfs}/initial" -D "`cat
${confbase}.macro`" \
> -                       -D "__dbi_txn create nofsync" \
> -                       -U --justdb --noscripts --notriggers
--noparentdirs --nolinktos --ignoresize \
> -                       ${target_rootfs}/install/initial_install.manifest
> +                       # Generate an install solution by doing a
--justdb install, then recreate it with
> +                       # an actual package install!
> +                       mkdir -p ${target_rootfs}/initial
>
> -               ${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --qf
"%{packageorigin}\n" \
> -                       -D "__dbi_txn create nofsync private" \
> -                       >
${target_rootfs}/install/initial_solution.manifest
> +                       ${RPM} --predefine "_rpmds_sysinfo_path
${target_rootfs}/etc/rpm/sysinfo" \
> +                               --predefine "_rpmrc_platform_path
${target_rootfs}/etc/rpm/platform" \
> +                               -D "_dbpath ${target_rootfs}/initial" -D
"`cat ${confbase}.macro`" \
> +                               -D "__dbi_txn create nofsync" \
> +                               -U --justdb --noscripts --notriggers
--noparentdirs --nolinktos --ignoresize \
> +
${target_rootfs}/install/initial_install.manifest
> +
> +                       ${RPM} -D "_dbpath ${target_rootfs}/initial" -qa
--qf "%{packageorigin}\n" \
> +                               -D "__dbi_txn create nofsync private" \
> +                               >
${target_rootfs}/install/initial_solution.manifest
>
> -               rpm_update_pkg
${target_rootfs}/install/initial_solution.manifest
> +                       rpm_update_pkg
${target_rootfs}/install/initial_solution.manifest
>
> -               grep -Fv -f
${target_rootfs}/install/initial_solution.manifest
${target_rootfs}/install/total_solution.manifest >
${target_rootfs}/install/total_solution.manifest.new
> -               mv ${target_rootfs}/install/total_solution.manifest.new
${target_rootfs}/install/total_solution.manifest
> +                       grep -Fv -f
${target_rootfs}/install/initial_solution.manifest
${target_rootfs}/install/total_solution.manifest >
${target_rootfs}/install/total_solution.manifest.new
> +                       mv
${target_rootfs}/install/total_solution.manifest.new
${target_rootfs}/install/total_solution.manifest
>
> -               rm -rf ${target_rootfs}/initial
> +                       rm -rf ${target_rootfs}/initial
> +               fi
>        fi
>
>        echo "Installing main solution manifest
(${target_rootfs}/install/total_solution.manifest)"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--90e6ba539f38087cb904c237bfa9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, June 11, 2012, Mark Hatle &lt;<a href=3D"mailto:mark.hat=
le@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>&gt; An empty =
manifest will cause a failure condition. =C2=A0We ensure that any install<b=
r>&gt; actions occur only with a manifest larger then size 0. =C2=A0Also en=
sure that padding<br>
&gt; is added to the end of the manifest, instead of the beginning to enabl=
e this<br>&gt; size check. =C2=A0(Padding is required for very small manife=
st files..)<br>&gt;<br>&gt; Signed-off-by: Mark Hatle &lt;<a href=3D"mailto=
:mark.hatle@windriver.com">mark.hatle@windriver.com</a>&gt;<br>
&gt; ---<br>&gt; =C2=A0meta/classes/package_rpm.bbclass | =C2=A0 59 +++++++=
+++++++++++++++----------------<br>&gt; =C2=A01 files changed, 34 insertion=
s(+), 25 deletions(-)<br>&gt;<br>&gt; diff --git a/meta/classes/package_rpm=
.bbclass b/meta/classes/package_rpm.bbclass<br>
&gt; index b84c044..bb9aa1a 100644<br>&gt; --- a/meta/classes/package_rpm.b=
bclass<br>&gt; +++ b/meta/classes/package_rpm.bbclass<br>&gt; @@ -182,6 +18=
2,7 @@ rpm_update_pkg () {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 # been run b=
y now, so don&#39;t have to run them(preun, postun, etc.) when<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 # erase the pkg<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ -s ${target_rootfs}/install/remove.manifest ]; then<br>&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;# Removal manifest p=
adding....&quot; &gt;&gt; ${target_rootfs}/install/remove.manifest<br>
<br>Should this be just &#39;remove&#39;<br><br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rpm_common_comand --noscripts --nodeps \<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e `cat ${target_rootf=
s}/install/remove.manifest`<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>&gt; =
@@ -249,7 +250,7 @@ package_install_internal_rpm () {<br>
&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0# Setup manifest of packages to ins=
tall...<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${target_rootfs}/instal=
l<br>&gt; - =C2=A0 =C2=A0 =C2=A0 echo &quot;# Install manifest&quot; &gt; $=
{target_rootfs}/install/install.manifest<br>&gt; + =C2=A0 =C2=A0 =C2=A0 rm =
-f ${target_rootfs}/install/install.manifest<br>
&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0# Uclibc builds don&#39;t provide t=
his stuff...<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ x${TARGET_OS} =3D &quo=
t;xlinux&quot; ] || [ x${TARGET_OS} =3D &quot;xlinux-gnueabi&quot; ] ; then=
<br>&gt; @@ -309,12 +310,15 @@ package_install_internal_rpm () {<br>
&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0# Generate an install solution by d=
oing a --justdb install, then recreate it with<br>&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0# an actual package install!<br>&gt; - =C2=A0 =C2=A0 =C2=A0 ${RPM} -=
-predefine &quot;_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo&quot;=
 \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --predefine &quot;_=
rpmrc_platform_path ${target_rootfs}/etc/rpm/platform&quot; \<br>&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -D &quot;_dbpath ${target_roo=
tfs}/install&quot; -D &quot;`cat ${confbase}-base_archs.macro`&quot; \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -D &quot;__dbi_txn =
create nofsync&quot; \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ig=
noresize \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${tar=
get_rootfs}/install/install.manifest<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if [ -s ${target_rootfs}/install/install.manife=
st ]; then<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo =
&quot;# Install manifest padding&quot; &gt;&gt; ${target_rootfs}/install/in=
stall.manifest<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $=
{RPM} --predefine &quot;_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinf=
o&quot; \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 --predefine &quot;_rpmrc_platform_path ${target_rootfs}/etc/rpm/=
platform&quot; \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -D &quot;_dbpath ${target_rootfs}/install&quot=
; -D &quot;`cat ${confbase}-base_archs.macro`&quot; \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -D &quot;__dbi_txn create nofsync&quot; \<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -U --jus=
tdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ${target_rootfs}/install/install.manifest<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 fi<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f [ ! -z &quot;${package_attemptonly}&quot; ]; then<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Adding attempt only pac=
kages...&quot;<br>&gt; @@ -407,8 +411,9 @@ package_install_internal_rpm () =
{<br>
&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${target_rootfs}/install/inst=
all_multilib_solution.manifest<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 if [ =
-e &quot;${target_rootfs}/install/install_multilib.manifest&quot; ]; then<b=
r>&gt; + =C2=A0 =C2=A0 =C2=A0 if [ -s &quot;${target_rootfs}/install/instal=
l_multilib.manifest&quot; ]; then<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# multilib pack=
age installation<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 echo &quot;# Install multilib manifest padding&quot; &gt;&gt; ${target_roo=
tfs}/install/install_multilib.manifest<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Generate an install solution by doing =
a --justdb install, then recreate it with<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# an actual pac=
kage install!<br>&gt; @@ -493,33 +498,37 @@ EOF<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ &quot;${INC_RPM_IMAGE_GEN}&quot; =3D &quot;1&quot; -a -f &qu=
ot;$pre_btmanifest&quot; ]; then<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0echo &quot;Skipping pre install due to exisitng image&=
quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 echo &quot;# Initial Install manifest&quot; &gt; ${tar=
get_rootfs}/install/initial_install.manifest<br>&gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${target_rootfs}/install/initial_install=
.manifest<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Inst=
alling base dependencies first (base-passwd, base-files and shadow) since r=
pm is special&quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0grep /base-passwd-[0-9] ${target_rootfs}/install/total_solution.m=
anifest &gt;&gt; ${target_rootfs}/install/initial_install.manifest || true<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grep /base-file=
s-[0-9] ${target_rootfs}/install/total_solution.manifest &gt;&gt; ${target_=
rootfs}/install/initial_install.manifest || true<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grep /shadow-[0-9] ${target_rootfs}/i=
nstall/total_solution.manifest &gt;&gt; ${target_rootfs}/install/initial_in=
stall.manifest || true<br>
&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Generate =
an install solution by doing a --justdb install, then recreate it with<br>&=
gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # an actual package =
install!<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -=
p ${target_rootfs}/initial<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -s ${target_ro=
otfs}/install/initial_install.manifest ]; then<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;# In=
itial Install manifest padding...&quot; &gt;&gt; ${target_rootfs}/install/i=
nitial_install.manifest<br>
&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${RPM} --pr=
edefine &quot;_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo&quot; \<=
br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 --predefine &quot;_rpmrc_platform_path ${target_rootfs}/etc/r=
pm/platform&quot; \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -D &quot;_dbpath ${target_rootfs}/initial&quot; -D &quot;`cat ${=
confbase}.macro`&quot; \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -D &quot;__dbi_txn create nofsync&qu=
ot; \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -U --justdb --noscripts --notriggers --noparentdirs --nol=
inktos --ignoresize \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${target_rootfs}/install/initial_install.manifest<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=
 Generate an install solution by doing a --justdb install, then recreate it=
 with<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 # an actual package install!<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mkdir -p ${target_rootfs}/initial<br>&gt;<br>&gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${RPM} -D &quot;_dbpath ${target_roo=
tfs}/initial&quot; -qa --qf &quot;%{packageorigin}\n&quot; \<br>&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
D &quot;__dbi_txn create nofsync private&quot; \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &gt; ${target_rootfs}/install/initial_solution.manifest<br>&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${RPM} --predefine &quot;_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/s=
ysinfo&quot; \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --predefine &quot;_=
rpmrc_platform_path ${target_rootfs}/etc/rpm/platform&quot; \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -D &quot;_dbpath ${target_rootfs}/in=
itial&quot; -D &quot;`cat ${confbase}.macro`&quot; \<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -D &quot;__dbi_txn create nofsync&quot; \<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -U --justdb --noscripts --notriggers --nopa=
rentdirs --nolinktos --ignoresize \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${target_rootfs}/install/initial_ins=
tall.manifest<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${RPM} -D &quot;_dbpath ${target_rootfs=
}/initial&quot; -qa --qf &quot;%{packageorigin}\n&quot; \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -D &quot;__dbi_txn create nofsync pr=
ivate&quot; \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; ${target_rootf=
s}/install/initial_solution.manifest<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpm_update_pkg ${target_rootfs}/install/initia=
l_solution.manifest<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rpm_update_pkg ${target_rootfs}/install/initial_solution.manifes=
t<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grep -=
Fv -f ${target_rootfs}/install/initial_solution.manifest ${target_rootfs}/i=
nstall/total_solution.manifest &gt; ${target_rootfs}/install/total_solution=
.manifest.new<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${target_rootfs}=
/install/total_solution.manifest.new ${target_rootfs}/install/total_solutio=
n.manifest<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 grep -Fv -f ${target_rootfs}/install/initial_solut=
ion.manifest ${target_rootfs}/install/total_solution.manifest &gt; ${target=
_rootfs}/install/total_solution.manifest.new<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mv ${target_rootfs}/install/total_solution.manifest.new ${target=
_rootfs}/install/total_solution.manifest<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${target_rootfs}/initial<br>&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rm -rf ${target_rootfs}/initial<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0fi<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quo=
t;Installing main solution manifest (${target_rootfs}/install/total_solutio=
n.manifest)&quot;<br>&gt; --<br>&gt; 1.7.3.4<br>&gt;<br>&gt;<br>&gt; ______=
_________________________________________<br>
&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-=
core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><b=
r>&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/opene=
mbedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembed=
ded-core</a><br>
&gt;

--90e6ba539f38087cb904c237bfa9--
