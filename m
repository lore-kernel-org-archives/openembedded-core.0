Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE4D75B17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 16:06:49 +0000 (UTC)
Received: by qcmc1 with SMTP id c1so30656630qcm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 09:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+aVsQiX2DkZ4c5XWA8PpI2GyvWIM9jBeB73uHH57w1g=;
	b=UW3sqc2ksrd5XcaumQEjz2OYyAXYwuSOJYcQK3UOrvgmQFMqeJc0ljLGZUxRGD8yW9
	bTplcXpdxwTiOORzEONGpjVTPqN0w8sICkX8FBXfOCZy/yyqdOQqAByLqos6wBi3N7x0
	0h2pob41PN6rPVw3nZ5lH7XJUiQk1y7NGLiRQ+fQRAJKM508U6LBMQf8VPixh7OzO2BT
	bKX0Z3trxyZ26xEFqsGBX4Li1YzX2Y2ja1ptE9yUptyI/RbpCMyqjx5NNFmRaRBFtvd5
	PZbOl9IQ5Uah94/eeCsxc5MfQZGGKUoS4OOHpJCrSgZrh9kCOo6qglU6P+8sCS1oqnBP
	BmeQ==
X-Gm-Message-State: ALoCoQnCLxCgSoeh7BRH//3vnRH2aszKjB5LasQUXzwjO2kQ9Qyaq5d8Haz2SMwpoATYPjPzeocv
X-Received: by 10.140.89.104 with SMTP id u95mr3289009qgd.15.1435334810167;
	Fri, 26 Jun 2015 09:06:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 26 Jun 2015 09:06:30 -0700 (PDT)
In-Reply-To: <1435331227-25862-2-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1435331227-25862-1-git-send-email-daniel.alexandrux.istrate@intel.com>
	<1435331227-25862-2-git-send-email-daniel.alexandrux.istrate@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jun 2015 17:06:30 +0100
Message-ID: <CAJTo0LZEvJE19yxoW91_4msNYAwr4u1TsAoGq9kjSPkZdy=UGQ@mail.gmail.com>
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] Added methods for manipulating bblayer.conf file in the same manner as local.conf file: - write_bblayers_config - append_bblayers_config - remove_bblayers_config
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
X-List-Received-Date: Fri, 26 Jun 2015 16:06:51 -0000
Content-Type: multipart/alternative; boundary=001a11c135f67e9edd05196ded33

--001a11c135f67e9edd05196ded33
Content-Type: text/plain; charset=UTF-8

Hi Daniel,

Unfortunately this series doesn't apply to the current master, can you
rebase and resubmit?

Also, patches 2 and 3 have bad commit messages still.  Please keep the
first line as a *short* summary (say, 70 characters), start it with the
recipe/class/subsystem that is modified, and end with a signed-off-by
line.  Something like this:

"""
oe-selftest: add methods to manipulate bblayer.conf

Add methods to manipulate bblayer.conf in the same manner as local.conf:
- write_bblayers_config
- append_bblayers_config
- remove_bblayers_config

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
"""

Ross

On 26 June 2015 at 16:07, Daniel Istrate <
daniel.alexandrux.istrate@intel.com> wrote:

> ---
>  meta/lib/oeqa/selftest/base.py | 22 ++++++++++++++++++++++
>  scripts/oe-selftest            | 16 +++++++++++++++-
>  2 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/base.py
> b/meta/lib/oeqa/selftest/base.py
> index 80b9b4b..b2faa66 100644
> --- a/meta/lib/oeqa/selftest/base.py
> +++ b/meta/lib/oeqa/selftest/base.py
> @@ -27,6 +27,8 @@ class oeSelfTest(unittest.TestCase):
>          self.builddir = os.environ.get("BUILDDIR")
>          self.localconf_path = os.path.join(self.builddir,
> "conf/local.conf")
>          self.testinc_path = os.path.join(self.builddir,
> "conf/selftest.inc")
> +        self.local_bblayers_path = os.path.join(self.builddir,
> "conf/bblayers.conf")
> +        self.testinc_bblayers_path = os.path.join(self.builddir,
> "conf/bblayers.inc")
>          self.testlayer_path = oeSelfTest.testlayer_path
>          self._extra_tear_down_commands = []
>          self._track_for_cleanup = []
> @@ -45,6 +47,11 @@ class oeSelfTest(unittest.TestCase):
>              for f in files:
>                  if f == 'test_recipe.inc':
>                      os.remove(os.path.join(root, f))
> +        try:
> +            os.remove(self.testinc_bblayers_path)
> +        except OSError as e:
> +            if e.errno != errno.ENOENT:
> +                raise
>          # tests might need their own setup
>          # but if they overwrite this one they have to call
>          # super each time, so let's give them an alternative
> @@ -129,3 +136,18 @@ class oeSelfTest(unittest.TestCase):
>          except OSError as e:
>              if e.errno != errno.ENOENT:
>                  raise
> +
> +    # write to <builddir>/conf/bblayers.inc
> +    def write_bblayers_config(self, data):
> +        self.log.debug("Writing to: %s\n%s\n" %
> (self.testinc_bblayers_path, data))
> +        ftools.write_file(self.testinc_bblayers_path, data)
> +
> +    # append to <builddir>/conf/bblayers.inc
> +    def append_bblayers_config(self, data):
> +        self.log.debug("Appending to: %s\n%s\n" %
> (self.testinc_bblayers_path, data))
> +        ftools.append_file(self.testinc_bblayers_path, data)
> +
> +    # remove data from <builddir>/conf/bblayers.inc
> +    def remove_bblayers_config(self, data):
> +        self.log.debug("Removing from: %s\n\%s\n" %
> (self.testinc_bblayers_path, data))
> +        ftools.remove_from_file(self.testinc_bblayers_path, data)
> diff --git a/scripts/oe-selftest b/scripts/oe-selftest
> index a04e9fc..049a94e 100755
> --- a/scripts/oe-selftest
> +++ b/scripts/oe-selftest
> @@ -100,6 +100,11 @@ def add_include():
>              ftools.append_file(os.path.join(builddir, "conf/local.conf"),
> \
>                      "\n#include added by oe-selftest.py\ninclude
> selftest.inc")
>
> +    if "#include added by oe-selftest.py" \
> +        not in ftools.read_file(os.path.join(builddir,
> "conf/bblayers.conf")):
> +            log.info("Adding: \"include bblayers.inc\" in bblayers.conf")
> +            ftools.append_file(os.path.join(builddir,
> "conf/bblayers.conf"), \
> +                    "\n#include added by oe-selftest.py\ninclude
> bblayers.inc")
>
>  def remove_include():
>      builddir = os.environ.get("BUILDDIR")
> @@ -111,6 +116,11 @@ def remove_include():
>              ftools.remove_from_file(os.path.join(builddir,
> "conf/local.conf"), \
>                      "#include added by oe-selftest.py\ninclude
> selftest.inc")
>
> +    if "#include added by oe-selftest.py" \
> +        in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf")):
> +            log.info("Removing the include from bblayers.conf")
> +            ftools.remove_from_file(os.path.join(builddir,
> "conf/bblayers.conf"), \
> +                    "#include added by oe-selftest.py\ninclude
> bblayers.inc")
>
>  def remove_inc_files():
>      try:
> @@ -122,6 +132,11 @@ def remove_inc_files():
>      except (AttributeError, OSError,) as e:    # AttributeError may
> happen if BUILDDIR is not set
>          pass
>
> +    try:
> +        os.remove(os.path.join(os.environ.get("BUILDDIR"),
> "conf/bblayers.inc"))
> +    except:
> +        pass
> +
>  def get_tests(exclusive_modules=[], include_hidden=False):
>      testslist = []
>      for x in exclusive_modules:
> @@ -167,7 +182,6 @@ def main():
>                      print e
>                      pass
>
> -
>      if args.run_tests or args.run_all_tests:
>          if not preflight_check():
>              return 1
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c135f67e9edd05196ded33
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Daniel,<div><br></div><div>Unfortunately this series do=
esn&#39;t apply to the current master, can you rebase and resubmit?</div><d=
iv><br></div><div>Also, patches 2 and 3 have bad commit messages still.=C2=
=A0 Please keep the first line as a *short* summary (say, 70 characters), s=
tart it with the recipe/class/subsystem that is modified, and end with a si=
gned-off-by line.=C2=A0 Something like this:</div><div><br></div>&quot;&quo=
t;&quot;<div>oe-selftest: add methods to manipulate bblayer.conf</div><div>=
<br></div><div>Add methods to manipulate bblayer.conf in the same manner as=
 local.conf:</div><div>- write_bblayers_config</div><div>- append_bblayers_=
config</div><div>- remove_bblayers_config</div><br>Signed-off-by: Daniel Is=
trate &lt;<a href=3D"mailto:daniel.alexandrux.istrate@intel.com">daniel.ale=
xandrux.istrate@intel.com</a>&gt;<div>&quot;&quot;&quot;</div><div><br></di=
v><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On 26 June 2015 at 16:07, Daniel Istrate <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:daniel.alexandrux.istrate@intel.com" target=3D"_blank">daniel.a=
lexandrux.istrate@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">---<br>
=C2=A0meta/lib/oeqa/selftest/base.py | 22 ++++++++++++++++++++++<br>
=C2=A0scripts/oe-selftest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 +++=
++++++++++++-<br>
=C2=A02 files changed, 37 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.p=
y<br>
index 80b9b4b..b2faa66 100644<br>
--- a/meta/lib/oeqa/selftest/base.py<br>
+++ b/meta/lib/oeqa/selftest/base.py<br>
@@ -27,6 +27,8 @@ class oeSelfTest(unittest.TestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.builddir =3D os.environ.get(&quot;BU=
ILDDIR&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.localconf_path =3D os.path.join(self=
.builddir, &quot;conf/local.conf&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.testinc_path =3D os.path.join(self.b=
uilddir, &quot;conf/selftest.inc&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.local_bblayers_path =3D os.path.join(self=
.builddir, &quot;conf/bblayers.conf&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.testinc_bblayers_path =3D os.path.join(se=
lf.builddir, &quot;conf/bblayers.inc&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.testlayer_path =3D oeSelfTest.testla=
yer_path<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._extra_tear_down_commands =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._track_for_cleanup =3D []<br>
@@ -45,6 +47,11 @@ class oeSelfTest(unittest.TestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for f in files:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if f =3D=3D &=
#39;test_recipe.inc&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0os.remove(os.path.join(root, f))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(self.testinc_bblayers_=
path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if e.errno !=3D errno.ENOENT:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# tests might need their own setup<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# but if they overwrite this one they hav=
e to call<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# super each time, so let&#39;s give them=
 an alternative<br>
@@ -129,3 +136,18 @@ class oeSelfTest(unittest.TestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except OSError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if e.errno !=3D errno.ENOEN=
T:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise<br>
+<br>
+=C2=A0 =C2=A0 # write to &lt;builddir&gt;/conf/bblayers.inc<br>
+=C2=A0 =C2=A0 def write_bblayers_config(self, data):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.log.debug(&quot;Writing to: %s\n%s\n&quot=
; % (self.testinc_bblayers_path, data))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ftools.write_file(self.testinc_bblayers_path, =
data)<br>
+<br>
+=C2=A0 =C2=A0 # append to &lt;builddir&gt;/conf/bblayers.inc<br>
+=C2=A0 =C2=A0 def append_bblayers_config(self, data):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.log.debug(&quot;Appending to: %s\n%s\n&qu=
ot; % (self.testinc_bblayers_path, data))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ftools.append_file(self.testinc_bblayers_path,=
 data)<br>
+<br>
+=C2=A0 =C2=A0 # remove data from &lt;builddir&gt;/conf/bblayers.inc<br>
+=C2=A0 =C2=A0 def remove_bblayers_config(self, data):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.log.debug(&quot;Removing from: %s\n\%s\n&=
quot; % (self.testinc_bblayers_path, data))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ftools.remove_from_file(self.testinc_bblayers_=
path, data)<br>
diff --git a/scripts/oe-selftest b/scripts/oe-selftest<br>
index a04e9fc..049a94e 100755<br>
--- a/scripts/oe-selftest<br>
+++ b/scripts/oe-selftest<br>
@@ -100,6 +100,11 @@ def add_include():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ftools.append_file(os.path.=
join(builddir, &quot;conf/local.conf&quot;), \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;\n#include added by oe-selftest.py\ninclude selftest.inc&quot;)<br=
>
<br>
+=C2=A0 =C2=A0 if &quot;#include added by oe-selftest.py&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 not in ftools.read_file(os.path.join(builddir,=
 &quot;conf/bblayers.conf&quot;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://log.info" rel=
=3D"noreferrer" target=3D"_blank">log.info</a>(&quot;Adding: \&quot;include=
 bblayers.inc\&quot; in bblayers.conf&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ftools.append_file(os.path.join(=
builddir, &quot;conf/bblayers.conf&quot;), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;\n#include added by oe-selftest.py\ninclude bblayers.inc&quot;)<br>
<br>
=C2=A0def remove_include():<br>
=C2=A0 =C2=A0 =C2=A0builddir =3D os.environ.get(&quot;BUILDDIR&quot;)<br>
@@ -111,6 +116,11 @@ def remove_include():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ftools.remove_from_file(os.=
path.join(builddir, &quot;conf/local.conf&quot;), \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;#include added by oe-selftest.py\ninclude selftest.inc&quot;)<br>
<br>
+=C2=A0 =C2=A0 if &quot;#include added by oe-selftest.py&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 in ftools.read_file(os.path.join(builddir, &qu=
ot;conf/bblayers.conf&quot;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://log.info" rel=
=3D"noreferrer" target=3D"_blank">log.info</a>(&quot;Removing the include f=
rom bblayers.conf&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ftools.remove_from_file(os.path.=
join(builddir, &quot;conf/bblayers.conf&quot;), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;#include added by oe-selftest.py\ninclude bblayers.inc&quot;)<br>
<br>
=C2=A0def remove_inc_files():<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
@@ -122,6 +132,11 @@ def remove_inc_files():<br>
=C2=A0 =C2=A0 =C2=A0except (AttributeError, OSError,) as e:=C2=A0 =C2=A0 # =
AttributeError may happen if BUILDDIR is not set<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(os.path.join(os.environ.get(&quot;BU=
ILDDIR&quot;), &quot;conf/bblayers.inc&quot;))<br>
+=C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br>
=C2=A0def get_tests(exclusive_modules=3D[], include_hidden=3DFalse):<br>
=C2=A0 =C2=A0 =C2=A0testslist =3D []<br>
=C2=A0 =C2=A0 =C2=A0for x in exclusive_modules:<br>
@@ -167,7 +182,6 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0print e<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pass<br>
<br>
-<br>
=C2=A0 =C2=A0 =C2=A0if args.run_tests or args.run_all_tests:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not preflight_check():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11c135f67e9edd05196ded33--
