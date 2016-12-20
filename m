Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1303F77272
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 17:45:13 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id t184so55761783qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 09:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oQiuyibKA4PzqcxJuG00aMX+DNDz3ZE+38dsFF7D46c=;
	b=Wik9oQNyZyTOI7YzKJilWK7sJraT9HeoAYtN60MA9kaIQdgpqDC5i+tL0TXMv8NLsN
	MoEbe0z0Bi2nL7kcWbZm9Z5xO1xktOgnRuUbpta866PTwL3XF62IfJhSsrlQoBsRr6GU
	eT89cl1UTkAm2Fcn+pya/FbBCtLsjcag3nVB58gVj4hL/BhIcAWZk5zfjDn5Ch7ONzvF
	T/tZpCfktHs6Hsl83dRoY2MXkM7KOG1RKCqdG8Q9huKNnYJNAq7ASrPX9wQsgHpko3H1
	SnkFCyKCIYxgvTz7lJ8ZJ5wZWO1LD9VFjRf9NJ2WBxWUiX8ztQo+EsYR1smkFNmfs+Ob
	KfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oQiuyibKA4PzqcxJuG00aMX+DNDz3ZE+38dsFF7D46c=;
	b=NxCoDS/Gjr2ON6zAPiZ3XApQU9TDl55v/3OthTEQMZ1YKvWYp7LFM6wiBAc66cTjkT
	wLBiV8//jjOE3woyLVc1+ndklrfDpETUG4Sf8ceuF6GRtY8Ttt3t/Vf/CTykIcfMpa/P
	kfqeNshJfXDZWWz1lp68zXrP8dHHk/Jag5azBxHUxUEhqjiZwz+NmFwSLhnl71YYBPXu
	2fRV7lyEBPQw3ZS2gL5qYPVI1HJMqvf8dKQB2nXjUsoh+REQFEAkFAt05LvbUHKgwA5T
	IMRnuHw5j2XldjDZozfWBeWy0UatbsnYNVqkqgso61UXH89SZf4EEkpErZp8p9okisUe
	a69Q==
X-Gm-Message-State: AIkVDXIg8+LkLcXTmLajCBPFiPMjtNP1Yli+G1IVdsS2SMyDRhfncW5/nOOuytA2buC42Kq3a3Uqthvr4mlAQPQn
X-Received: by 10.55.75.17 with SMTP id y17mr599845qka.26.1482255914882; Tue,
	20 Dec 2016 09:45:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 20 Dec 2016 09:44:54 -0800 (PST)
In-Reply-To: <20161220095122.11831-1-freesilicon@gmail.com>
References: <20161212155909.8946-1-freesilicon@gmail.com>
	<20161220095122.11831-1-freesilicon@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 17:44:54 +0000
Message-ID: <CAJTo0LY4H-09bkCySm_MajvxSqDEHpTUNTiQy4uOHxJjNQWNNA@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>
Cc: "Plascencia, Daniela" <daniela.plascencia@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5] rootfs: Modify RPM installation
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
X-List-Received-Date: Tue, 20 Dec 2016 17:45:14 -0000
Content-Type: multipart/alternative; boundary=001a114a88c846833005441a9922

--001a114a88c846833005441a9922
Content-Type: text/plain; charset=UTF-8

This breaks list_pkgs() for the RPM backend. Instead of returning a list of
packages, rpm just says "%dbpath is not defined" (or words to that effect,
as the log disappeared in 100 pages of errors).

Ross

On 20 December 2016 at 09:51, David Vincent <freesilicon@gmail.com> wrote:

> When using a custom RPM data directory instead of the default dir
> '/var/lib/rpm', the final image did not contain any of the database
> files in the expected location. This commit takes into account the
> 'rpmlibdir' variable set into 'rootfs_rpm.bbclass'.
>
> Changes since v4:
>     - Remove boolean in d.getVar() calls.
>
> Signed-off-by: David Vincent <freesilicon@gmail.com>
> ---
>  meta/lib/oe/package_manager.py | 23 +++++++++++++----------
>  meta/lib/oe/rootfs.py          |  3 ++-
>  2 files changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.
> py
> index e557473999..4299220eec 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -356,7 +356,8 @@ class RpmPkgsList(PkgsList):
>          super(RpmPkgsList, self).__init__(d, rootfs_dir)
>
>          self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
> -        self.image_rpmlib = os.path.join(self.rootfs_dir, 'var/lib/rpm')
> +        self.rpm_libdir = self.d.getVar('rpmlibdir')
> +        self.image_rpmlib = os.path.join(self.rootfs_dir,
> self.rpm_libdir[1:])
>
>          self.ml_prefix_list, self.ml_os_list = \
>              RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var,
> os_var)
> @@ -416,7 +417,7 @@ class RpmPkgsList(PkgsList):
>
>      def list_pkgs(self):
>          cmd = [self.rpm_cmd, '--root', self.rootfs_dir]
> -        cmd.extend(['-D', '_dbpath /var/lib/rpm'])
> +        cmd.extend(['-D', '_dbpath', self.rpm_libdir])
>          cmd.extend(['-qa', '--qf', '[%{NAME} %{ARCH} %{VERSION}
> %{PACKAGEORIGIN}\n]'])
>
>          try:
> @@ -683,7 +684,8 @@ class RpmPM(PackageManager):
>          self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
>                                                 self.task_name)
>          self.saved_rpmlib = self.d.expand('${T}/saved/%s' %
> self.task_name)
> -        self.image_rpmlib = os.path.join(self.target_rootfs,
> 'var/lib/rpm')
> +        self.rpm_libdir = self.d.getVar('rpmlibdir')
> +        self.image_rpmlib = os.path.join(self.target_rootfs,
> self.rpm_libdir[1:])
>
>          if not os.path.exists(self.d.expand('${T}/saved')):
>              bb.utils.mkdirhier(self.d.expand('${T}/saved'))
> @@ -954,7 +956,7 @@ class RpmPM(PackageManager):
>              open(db_config_dir, 'w+').write(DB_CONFIG_CONTENT)
>
>          # Create database so that smart doesn't complain (lazy init)
> -        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath',
> '/var/lib/rpm', '-qa']
> +        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath',
> self.rpm_libdir, '-qa']
>          try:
>              subprocess.check_output(cmd, stderr=subprocess.STDOUT)
>          except subprocess.CalledProcessError as e:
> @@ -963,20 +965,19 @@ class RpmPM(PackageManager):
>          # Import GPG key to RPM database of the target system
>          if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
>              pubkey_path = self.d.getVar('RPM_GPG_PUBKEY')
> -            cmd = [self.rpm_cmd, '--root', self.target_rootfs,
> '--dbpath', '/var/lib/rpm', '--import', pubkey_path]
> +            cmd = [self.rpm_cmd, '--root', self.target_rootfs,
> '--dbpath', self.rpm_libdir, '--import', pubkey_path]
>              try:
>                  subprocess.check_output(cmd, stderr=subprocess.STDOUT)
>              except subprocess.CalledProcessError as e:
>                  bb.fatal("Import GPG key failed. Command '%s' "
>                          "returned %d:\n%s" % (' '.join(cmd),
> e.returncode, e.output.decode("utf-8")))
>
> -
>          # Configure smart
>          bb.note("configuring Smart settings")
>          bb.utils.remove(os.path.join(self.target_rootfs,
> 'var/lib/smart'),
>                          True)
>          self._invoke_smart(['config', '--set', 'rpm-root=%s' %
> self.target_rootfs])
> -        self._invoke_smart(['config', '--set', 'rpm-dbpath=/var/lib/rpm'])
> +        self._invoke_smart(['config', '--set', 'rpm-dbpath=%s' %
> self.rpm_libdir])
>          self._invoke_smart(['config', '--set', 'rpm-extra-macros._var=%s'
> %
>                             self.d.getVar('localstatedir')])
>          cmd = ["config", "--set", "rpm-extra-macros._tmppath=/%s/tmp" %
> self.install_dir_name]
> @@ -1236,7 +1237,7 @@ class RpmPM(PackageManager):
>
>          if not with_dependencies:
>              cmd = [self.rpm_cmd] + ["-e", "--nodeps", "--root=%s" %
> -                    self.target_rootfs, "--dbpath=/var/lib/rpm",
> +                    self.target_rootfs, "--dbpath=%s" % self.rpm_libdir,
>                      "--define='_cross_scriptlet_wrapper %s'" %
>                      self.scriptlet_wrapper,
>                      "--define='_tmppath /%s/tmp'" %
> self.install_dir_name] + pkgs
> @@ -1384,7 +1385,8 @@ class RpmPM(PackageManager):
>          saved_dir = self.target_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/')
> + new_pkg
>
>          cmd = self.rpm_cmd + ' -q --scripts --root ' + self.target_rootfs
> -        cmd += ' --dbpath=/var/lib/rpm ' + new_pkg
> +        cmd += ' --dbpath=%s ' %  self.rpm_libdir
> +        cmd += new_pkg
>          cmd += ' | sed -n -e "/^postinstall scriptlet (using .*):$/,/^.*
> scriptlet (using .*):$/ {/.*/p}"'
>          cmd += ' | sed -e "/postinstall scriptlet (using \(.*\)):$/d"'
>          cmd += ' -e "/^.* scriptlet (using .*):$/d" > %s' % saved_dir
> @@ -1416,7 +1418,8 @@ class RpmPM(PackageManager):
>      '''
>      def unlock_rpm_db(self):
>          # Remove rpm db lock files
> -        rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' %
> self.target_rootfs)
> +        rpm_db_locks = glob.glob('%s%s/__db.*' % (self.target_rootfs,
> +            self.rpm_libdir))
>          for f in rpm_db_locks:
>              bb.utils.remove(f, True)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index d9a473006a..8730025816 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -429,6 +429,7 @@ class RpmRootfs(Rootfs):
>
>      def _create(self):
>          pkgs_to_install = self.manifest.parse_initial_manifest()
> +        rpm_libdir = self.d.getVar('rpmlibdir')
>          rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS')
>          rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS')
>
> @@ -476,7 +477,7 @@ class RpmRootfs(Rootfs):
>          if self.progress_reporter:
>              self.progress_reporter.next_stage()
>
> -        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm',
> '/var/lib/smart'])
> +        self._setup_dbg_rootfs(['/etc/rpm', rpm_libdir,
> '/var/lib/smart'])
>
>          execute_pre_post_process(self.d, rpm_post_process_cmds)
>
> --
> 2.11.0
>
>

--001a114a88c846833005441a9922
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks list_pkgs() for the RPM backend. Instead of re=
turning a list of packages, rpm just says &quot;%dbpath is not defined&quot=
; (or words to that effect, as the log disappeared in 100 pages of errors).=
<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On 20 December 2016 at 09:51, David Vincent <span dir=3D=
"ltr">&lt;<a href=3D"mailto:freesilicon@gmail.com" target=3D"_blank">freesi=
licon@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">When using a custom RPM data directory instead of the default=
 dir<br>
&#39;/var/lib/rpm&#39;, the final image did not contain any of the database=
<br>
files in the expected location. This commit takes into account the<br>
&#39;rpmlibdir&#39; variable set into &#39;rootfs_rpm.bbclass&#39;.<br>
<br>
</span>Changes since v4:<br>
=C2=A0 =C2=A0 - Remove boolean in d.getVar() calls.<br>
<span class=3D""><br>
Signed-off-by: David Vincent &lt;<a href=3D"mailto:freesilicon@gmail.com">f=
reesilicon@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/package_manager.py | 23 +++++++++++++----------<br>
=C2=A0meta/lib/oe/rootfs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-=
<br>
=C2=A02 files changed, 15 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/package_manager.<wbr>py b/meta/lib/oe/package_mana=
ger.<wbr>py<br>
</span>index e557473999..4299220eec 100644<br>
--- a/meta/lib/oe/package_manager.<wbr>py<br>
+++ b/meta/lib/oe/package_manager.<wbr>py<br>
@@ -356,7 +356,8 @@ class RpmPkgsList(PkgsList):<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(RpmPkgsList, self)=
.__init__(d, rootfs_dir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.rpm_cmd =3D bb.utils.which(os.getenv=
(&#39;<wbr>PATH&#39;), &quot;rpm&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.image_rpmlib =3D os.path.join(self.rootfs=
_dir, &#39;var/lib/rpm&#39;)<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.rpm_libdir =3D self.d.getVar(&#39;=
rpmlibdir&#39;)<br>
<span class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.image_rpmlib =3D os.path=
.join(self.rootfs_dir, self.rpm_libdir[1:])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.ml_prefix_list, self.ml_os_list =3D =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RpmIndexer(d, rootfs_dir).g=
et_ml_prefix_and_<wbr>os_list(arch_var, os_var)<br>
</span>@@ -416,7 +417,7 @@ class RpmPkgsList(PkgsList):<br>
<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0def list_pkgs(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D [self.rpm_cmd, &#39;--root&#39;, =
self.rootfs_dir]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.extend([&#39;-D&#39;, &#39;_dbpath /var/li=
b/rpm&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.extend([&#39;-D&#39;, &#39;_dbpath&#39;, s=
elf.rpm_libdir])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.extend([&#39;-qa&#39;, &#39;--qf&#39;=
, &#39;[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]&#39;])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
</span>@@ -683,7 +684,8 @@ class RpmPM(PackageManager):<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.solution_manifest =
=3D self.d.expand(&#39;${T}/saved/%s_<wbr>solution&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 self.task_name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.saved_rpmlib =3D self.d.expand(&#39;=
${T}/saved/%s&#39; % self.task_name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.image_rpmlib =3D os.path.join(self.target=
_<wbr>rootfs, &#39;var/lib/rpm&#39;)<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.rpm_libdir =3D self.d.getVar(&#39;=
rpmlibdir&#39;)<br>
<span class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.image_rpmlib =3D os.path=
.join(self.target_<wbr>rootfs, self.rpm_libdir[1:])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(self.d.expand(&#39;=
<wbr>${T}/saved&#39;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(self.d.<=
wbr>expand(&#39;${T}/saved&#39;))<br>
</span>@@ -954,7 +956,7 @@ class RpmPM(PackageManager):<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0open(db_co=
nfig_dir, &#39;w+&#39;).write(DB_CONFIG_CONTENT)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Create database so that smart doesn&#39=
;t complain (lazy init)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D [self.rpm_cmd, &#39;--root&#39;, self.=
target_rootfs, &#39;--dbpath&#39;, &#39;/var/lib/rpm&#39;, &#39;-qa&#39;]<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D [self.rpm_cmd, &#39;--root&#39;, self.=
target_rootfs, &#39;--dbpath&#39;, self.rpm_libdir, &#39;-qa&#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output(cmd=
, stderr=3Dsubprocess.STDOUT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError as e=
:<br>
</span>@@ -963,20 +965,19 @@ class RpmPM(PackageManager):<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Import GPG key to RPM =
database of the target system<br>
</span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.d.getVar(&#39;RPM_SIGN_<wb=
r>PACKAGES&#39;) =3D=3D &#39;1&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pubkey_path =3D self.d.getV=
ar(&#39;RPM_GPG_PUBKEY&#39;<wbr>)<br>
<span class=3D"">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D [self.r=
pm_cmd, &#39;--root&#39;, self.target_rootfs, &#39;--dbpath&#39;, &#39;/var=
/lib/rpm&#39;, &#39;--import&#39;, pubkey_path]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D [self.rpm_cmd, &#39;--ro=
ot&#39;, self.target_rootfs, &#39;--dbpath&#39;, self.rpm_libdir, &#39;--im=
port&#39;, pubkey_path]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.ch=
eck_output(cmd, stderr=3Dsubprocess.STDOUT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except subprocess.CalledPro=
cessError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(&quo=
t;Import GPG key failed. Command &#39;%s&#39; &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;returned %d:\n%s&quot; % (&#39; &#39;.join(cmd), e.r=
eturncode, e.output.decode(&quot;utf-8&quot;)))<br>
<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Configure smart<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;configuring Smart settings&=
quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(os.path.join(<wbr>self.ta=
rget_rootfs, &#39;var/lib/smart&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._invoke_smart([&#39;config&#39;, &#3=
9;--set&#39;, &#39;rpm-root=3D%s&#39; % self.target_rootfs])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._invoke_smart([&#39;config&#39;, &#39;--s=
et&#39;, &#39;rpm-dbpath=3D/var/lib/rpm&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._invoke_smart([&#39;config&#39;, &#39;--s=
et&#39;, &#39;rpm-dbpath=3D%s&#39; % self.rpm_libdir])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._invoke_smart([&#39;config&#39;, &#3=
9;--set&#39;, &#39;rpm-extra-macros._var=3D%s&#39; %<br>
</span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.d.getVar(&#39;localstatedir&#39;)<wbr>=
])<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D [&quot;config&qu=
ot;, &quot;--set&quot;, &quot;rpm-extra-macros._tmppath=3D/%<wbr>s/tmp&quot=
; % self.install_dir_name]<br>
</span>@@ -1236,7 +1237,7 @@ class RpmPM(PackageManager):<br>
<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not with_dependencies:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D [self.rpm_cmd] + [&=
quot;-e&quot;, &quot;--nodeps&quot;, &quot;--root=3D%s&quot; %<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.target_rootfs, &quot;--dbpath=3D/var/lib/rpm&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.target_rootfs, &quot;--dbpath=3D%s&quot; % self.rpm_libdir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;--define=3D&#39;_cross_scriptlet_<wbr>wrapper %s&#39;&quot; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.scriptlet_wrapper,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;--define=3D&#39;_tmppath /%s/tmp&#39;&quot; % self.install_dir_nam=
e] + pkgs<br>
</span>@@ -1384,7 +1385,8 @@ class RpmPM(PackageManager):<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saved_dir =3D self.targe=
t_rootfs + self.d.expand(&#39;${sysconfdir}/<wbr>rpm-postinsts/&#39;) + new=
_pkg<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D self.rpm_cmd + &#39; -q --scripts=
 --root &#39; + self.target_rootfs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D &#39; --dbpath=3D/var/lib/rpm &#39; +=
 new_pkg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D &#39; --dbpath=3D%s &#39; %=C2=A0 sel=
f.rpm_libdir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D new_pkg<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd +=3D &#39; | sed -n -e &quot;/^postin=
stall scriptlet (using .*):$/,/^.* scriptlet (using .*):$/ {/.*/p}&quot;&#3=
9;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd +=3D &#39; | sed -e &quot;/postinstal=
l scriptlet (using \(.*\)):$/d&quot;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd +=3D &#39; -e &quot;/^.* scriptlet (u=
sing .*):$/d&quot; &gt; %s&#39; % saved_dir<br>
</span>@@ -1416,7 +1418,8 @@ class RpmPM(PackageManager):<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0def unlock_rpm_db(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove rpm db lock files<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpm_db_locks =3D glob.glob(&#39;%s/var/lib/rpm=
/__<wbr>db.*&#39; % self.target_rootfs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpm_db_locks =3D glob.glob(&#39;%s%s/__db.*&#3=
9; % (self.target_rootfs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.rpm_libdir))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for f in rpm_db_locks:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(f, True)<br=
>
<br>
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py<br>
</span>index d9a473006a..8730025816 100644<br>
--- a/meta/lib/oe/rootfs.py<br>
+++ b/meta/lib/oe/rootfs.py<br>
@@ -429,6 +429,7 @@ class RpmRootfs(Rootfs):<br>
<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0def _create(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgs_to_install =3D self.manifest.parse_i=
nitial_<wbr>manifest()<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpm_libdir =3D self.d.getVar(&#39;rpmli=
bdir&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpm_pre_process_cmds =3D self.d.getVar(&#=
39;RPM_PREPROCESS_<wbr>COMMANDS&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpm_post_process_cmds =3D self.d.getVar(&=
#39;RPM_<wbr>POSTPROCESS_COMMANDS&#39;)<br>
<br>
@@ -476,7 +477,7 @@ class RpmRootfs(Rootfs):<br>
<div class=3D"HOEnZb"><div class=3D"h5">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f self.progress_reporter:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.progress_reporter.next=
_<wbr>stage()<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._setup_dbg_rootfs([&#39;/etc/<wbr>rpm&#39=
;, &#39;/var/lib/rpm&#39;, &#39;/var/lib/smart&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._setup_dbg_rootfs([&#39;/etc/<wbr>rpm&#39=
;, rpm_libdir, &#39;/var/lib/smart&#39;])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execute_pre_post_process(self.<wbr>d, rpm=
_post_process_cmds)<br>
<br>
--<br>
2.11.0<br>
<br>
</div></div></blockquote></div><br></div>

--001a114a88c846833005441a9922--
