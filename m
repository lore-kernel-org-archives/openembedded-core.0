Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 10C6D60290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 22:20:18 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id z135so3515135iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 14:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=FinQFodYNKehYj5YWnwQTM/sjLECfNP60hdvgKzMkcA=;
	b=HbpiA6FPTZuGFP+6mwjdAX5+zxVa+uLeTODnZ3CfTgaUnzTJjUF/UG5k30n+wouSGm
	UublnnSKvwOM0ei81J9CDaxNLn0r0lhtCRLhnI0dkp0fdPcYmtc4+VpKmLsNwErHHNJL
	lVBz5U6p/QkJd7nBWec+L6YlgYFt9EhITO4kOtQbhBlHXJBI/4bLIlGdec/snsDE2eU/
	9q4AdTwbljE17N1cuDjmgpFlBEtZkPd88ByXgU6R1eehK2mpP5sC9PAkidJJamO9adSa
	xY/+JCSeWb9p3bKSa9bvQ0DPGi7N29lDKpHAw0lljpck1tE48mxtJwSJf0CGaihBFGcJ
	3Mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=FinQFodYNKehYj5YWnwQTM/sjLECfNP60hdvgKzMkcA=;
	b=YvYXVEmor3I6O12M6X6AMCKiU1o3SM68g8+SXbBaL3FAYcDXSPoeqM1ceh2GXn4jv9
	diW/qdU6fQBPbcwwbKh3qnYf0/7YZs4W6PEDkbS0qan8T+JweJlSjEQ2ohKIUO9/+RVR
	dpQLCbsW/tpFPHpm6siXu3F6FPrLT9tE3Nw5gOCpSdO2MTU1bbbzgXFS6vsXZYHgyCT2
	m92rTUbPVrLNl2x1yiH0gndCyeRp5OnV1OGjjhJjT88oh/eLBRYLKDq6g0wGh8fM/ZFH
	gmPW5xYJyn4CbC8NHudAgguDc/MfZZLE5AksP7JxfCsd8y2oHKRu1kd8lURDMgm54Nhl
	QeuA==
X-Gm-Message-State: AG10YOQZDpMCef/iMe71jGRm7Jgkv0CVkFH/5KuhQYCfuKgdASWYCTOaGEvmoStZtBTXFfhVfV+r+njILKAxkA==
X-Received: by 10.107.34.139 with SMTP id i133mr2403346ioi.108.1455661219381; 
	Tue, 16 Feb 2016 14:20:19 -0800 (PST)
MIME-Version: 1.0
References: <1455653130-4388-1-git-send-email-humberto.ibarra.lopez@intel.com>
	<1455653130-4388-3-git-send-email-humberto.ibarra.lopez@intel.com>
In-Reply-To: <1455653130-4388-3-git-send-email-humberto.ibarra.lopez@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 16 Feb 2016 22:20:09 +0000
Message-ID: <CABcZANmj-yJyFzSXnLGwO7-oErmT7YKvVbjDpGAOVu7RCfo9gA@mail.gmail.com>
To: humberto.ibarra.lopez@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] scripts/oe-selftest: Use site.USER_SITE to run coverage configuration code for sub-process
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
X-List-Received-Date: Tue, 16 Feb 2016 22:20:19 -0000
Content-Type: multipart/alternative; boundary=001a11402b24e507eb052bea896c

--001a11402b24e507eb052bea896c
Content-Type: text/plain; charset=UTF-8

Shouldn't this use a try/finally to ensure the user's site area is properly
cleaned up if coverage_report() raises an exception? I doubt you want to
risk leaving that around.

On Tue, Feb 16, 2016 at 1:10 PM <humberto.ibarra.lopez@intel.com> wrote:

> From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
>
> Coverage in oe-selftest currently requires to create or modify
> a sitecustomize.py file according the coverage tool setup instructions
> (http://coverage.readthedocs.org/). This file has to be located in
> the system's python folder, which is not a good solution since this
> folder is not accesible to non-privileged users.
>
> The best solution so far is to create this file in the home directory.
> This is implemented by creating the temporal file in the user site
> default folder.
>
> [Yocto #8930]
>
> Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
> ---
>  scripts/oe-selftest | 41 +++++++++++++++++++++++++++++++----------
>  1 file changed, 31 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/oe-selftest b/scripts/oe-selftest
> index f3865e4..3159d22 100755
> --- a/scripts/oe-selftest
> +++ b/scripts/oe-selftest
> @@ -553,6 +553,7 @@ def main():
>
>  def buildResultClass(args):
>      """Build a Result Class to use in the testcase execution"""
> +    import site
>
>      class StampedResult(unittest.TextTestResult):
>          """
> @@ -568,26 +569,41 @@ def buildResultClass(args):
>
>          def startTestRun(self):
>              """ Setup coverage before running any testcase """
> +
> +            # variable holding the coverage configuration file allowing
> subprocess to be measured
> +            self.coveragepth = None
> +
> +            # indicates the system if coverage is currently installed
> +            self.coverage_installed = True
> +
>              if args.coverage or args.coverage_source or
> args.coverage_include or args.coverage_omit:
>                  try:
>                      # check if user can do coverage
>                      import coverage
> -                    log.info("Coverage is enabled")
> -
> -                    # In case the user has not set the variable
> COVERAGE_PROCESS_START,
> -                    # create a default one and export it. The
> COVERAGE_PROCESS_START
> -                    # value indicates where the coverage configuration
> file resides
> -                    # More info on https://pypi.python.org/pypi/coverage
> -                    if not os.environ.get('COVERAGE_PROCESS_START'):
> -                        os.environ['COVERAGE_PROCESS_START'] =
> coverage_setup(args.run_tests, args.run_all_tests, args.coverage_source,
> args.coverage_include, args.coverage_omit)
> -
> -                    self.coverage_installed = True
>                  except:
>                      log.warn('\n'.join(["python coverage is not
> installed",
>                          "Make sure your coverage takes into account
> sub-process",
>                          "More info on
> https://pypi.python.org/pypi/coverage"]))
>                      self.coverage_installed = False
>
> +                if self.coverage_installed:
> +                    log.info("Coverage is enabled")
> +
> +                # In case the user has not set the variable
> COVERAGE_PROCESS_START,
> +                # create a default one and export it. The
> COVERAGE_PROCESS_START
> +                # value indicates where the coverage configuration file
> resides
> +                # More info on https://pypi.python.org/pypi/coverage
> +                if not os.environ.get('COVERAGE_PROCESS_START'):
> +                    os.environ['COVERAGE_PROCESS_START'] =
> coverage_setup(args.run_tests, args.run_all_tests, args.coverage_source,
> args.coverage_include, args.coverage_omit)
> +
> +                # Use default site.USER_SITE and write corresponding
> config file
> +                site.ENABLE_USER_SITE = True
> +                if not os.path.exists(site.USER_SITE):
> +                    os.makedirs(site.USER_SITE)
> +                self.coveragepth = os.path.join(site.USER_SITE,
> "coverage.pth")
> +                with open(self.coveragepth, 'w') as cps:
> +                    cps.write('import sys,site;
> sys.path.extend(site.getsitepackages()); import coverage;
> coverage.process_startup();')
> +
>          def stopTestRun(self):
>              """ Report coverage data after the testcases are run """
>
> @@ -601,6 +617,11 @@ def buildResultClass(args):
>                  log.info("===============")
>
>                  coverage_report()
> +                # remove the pth file
> +                try:
> +                    os.remove(self.coveragepth)
> +                except OSError:
> +                    pass
>
>      return StampedResult
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11402b24e507eb052bea896c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Shouldn&#39;t this use a try/finally to ensure the user&#3=
9;s site area is properly cleaned up if coverage_report() raises an excepti=
on? I doubt you want to risk leaving that around.</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr">On Tue, Feb 16, 2016 at 1:10 PM &lt;<a href=3D"=
mailto:humberto.ibarra.lopez@intel.com">humberto.ibarra.lopez@intel.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Humberto Ibarra &=
lt;<a href=3D"mailto:humberto.ibarra.lopez@intel.com" target=3D"_blank">hum=
berto.ibarra.lopez@intel.com</a>&gt;<br>
<br>
Coverage in oe-selftest currently requires to create or modify<br>
a sitecustomize.py file according the coverage tool setup instructions<br>
(<a href=3D"http://coverage.readthedocs.org/" rel=3D"noreferrer" target=3D"=
_blank">http://coverage.readthedocs.org/</a>). This file has to be located =
in<br>
the system&#39;s python folder, which is not a good solution since this<br>
folder is not accesible to non-privileged users.<br>
<br>
The best solution so far is to create this file in the home directory.<br>
This is implemented by creating the temporal file in the user site<br>
default folder.<br>
<br>
[Yocto #8930]<br>
<br>
Signed-off-by: Humberto Ibarra &lt;<a href=3D"mailto:humberto.ibarra.lopez@=
intel.com" target=3D"_blank">humberto.ibarra.lopez@intel.com</a>&gt;<br>
---<br>
=C2=A0scripts/oe-selftest | 41 +++++++++++++++++++++++++++++++----------<br=
>
=C2=A01 file changed, 31 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/scripts/oe-selftest b/scripts/oe-selftest<br>
index f3865e4..3159d22 100755<br>
--- a/scripts/oe-selftest<br>
+++ b/scripts/oe-selftest<br>
@@ -553,6 +553,7 @@ def main():<br>
<br>
=C2=A0def buildResultClass(args):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Build a Result Class to use in the te=
stcase execution&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 import site<br>
<br>
=C2=A0 =C2=A0 =C2=A0class StampedResult(unittest.TextTestResult):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
@@ -568,26 +569,41 @@ def buildResultClass(args):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def startTestRun(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot; Setup co=
verage before running any testcase &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # variable holding the coverage =
configuration file allowing subprocess to be measured<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.coveragepth =3D None<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # indicates the system if covera=
ge is currently installed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.coverage_installed =3D True=
<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if args.coverage or args.co=
verage_source or args.coverage_include or args.coverage_omit:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# check if user can do coverage<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0import coverage<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://log.info" rel=3D"noreferrer" target=3D"_blank">log.info</a>(&=
quot;Coverage is enabled&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # In=
 case the user has not set the variable COVERAGE_PROCESS_START,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # cr=
eate a default one and export it. The COVERAGE_PROCESS_START<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # va=
lue indicates where the coverage configuration file resides<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Mo=
re info on <a href=3D"https://pypi.python.org/pypi/coverage" rel=3D"norefer=
rer" target=3D"_blank">https://pypi.python.org/pypi/coverage</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if n=
ot os.environ.get(&#39;COVERAGE_PROCESS_START&#39;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 os.environ[&#39;COVERAGE_PROCESS_START&#39;] =3D coverage_setup(=
args.run_tests, args.run_all_tests, args.coverage_source, args.coverage_inc=
lude, args.coverage_omit)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.coverage_installed =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0log.warn(&#39;\n&#39;.join([&quot;python coverage is not installed&quot;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Make sure your coverage takes into account sub-proce=
ss&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;More info on <a href=3D"https://pypi.python.org/pypi=
/coverage" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pyp=
i/coverage</a>&quot;]))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.coverage_installed =3D False<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.coverage_i=
nstalled:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://log.info" rel=3D"noreferrer" target=3D"_blank">log.info</a>(&=
quot;Coverage is enabled&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # In case the user=
 has not set the variable COVERAGE_PROCESS_START,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # create a default=
 one and export it. The COVERAGE_PROCESS_START<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # value indicates =
where the coverage configuration file resides<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # More info on <a =
href=3D"https://pypi.python.org/pypi/coverage" rel=3D"noreferrer" target=3D=
"_blank">https://pypi.python.org/pypi/coverage</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.environ.=
get(&#39;COVERAGE_PROCESS_START&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.e=
nviron[&#39;COVERAGE_PROCESS_START&#39;] =3D coverage_setup(args.run_tests,=
 args.run_all_tests, args.coverage_source, args.coverage_include, args.cove=
rage_omit)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use default site=
.USER_SITE and write corresponding config file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 site.ENABLE_USER_S=
ITE =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exi=
sts(site.USER_SITE):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.m=
akedirs(site.USER_SITE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.coveragepth =
=3D os.path.join(site.USER_SITE, &quot;coverage.pth&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(self.cov=
eragepth, &#39;w&#39;) as cps:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cps.=
write(&#39;import sys,site; sys.path.extend(site.getsitepackages()); import=
 coverage; coverage.process_startup();&#39;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def stopTestRun(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot; Report c=
overage data after the testcases are run &quot;&quot;&quot;<br>
<br>
@@ -601,6 +617,11 @@ def buildResultClass(args):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://log.info" rel=3D"noreferrer" target=3D"_blank">log.info</a>(&quot;=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0coverage_repo=
rt()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # remove the pth f=
ile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.r=
emove(self.coveragepth)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0return StampedResult<br>
<br>
--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a11402b24e507eb052bea896c--
