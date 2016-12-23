Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB067763A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 02:01:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBN2163Z015274
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Dec 2016 18:01:06 -0800 (PST)
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 22 Dec 2016 18:01:05 -0800
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1482294710.git.Qi.Chen@windriver.com>
	<4e33a8311af3ea53162e3c9a8ed0848b4a8250cc.1482294710.git.Qi.Chen@windriver.com>
	<CAHiDW_HLYXEMEsF1ukFgOSZ+NFXJ2j09Pmo9Ty+7mW9pJrZVTA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <da623bba-0dc8-a038-8727-4fe585a2fdd1@windriver.com>
Date: Fri, 23 Dec 2016 10:02:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_HLYXEMEsF1ukFgOSZ+NFXJ2j09Pmo9Ty+7mW9pJrZVTA@mail.gmail.com>
X-Originating-IP: [128.224.162.184]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] package_manager: default to have scriptlet output captured in log
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
X-List-Received-Date: Fri, 23 Dec 2016 02:01:07 -0000
Content-Type: multipart/alternative;
	boundary="------------F157A96F656443010C242B34"

--------------F157A96F656443010C242B34
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2016 05:36 PM, Jussi Kukkonen wrote:
> On 21 December 2016 at 06:32, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
> >
> > We need to have scriptlet output captured in log. If we don't do so,
> > some useful information from scriptlets (especially postinstall script)
> > would be missing. In case a script has a warning message but it does not
> > necessarily have to fail, the message should be captured.
> >
> > Opkg has already done that. Change for rpm and dpkg so that scriptlet
> > output is captured and no warning message is missing.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>>
> > ---
> >  meta/lib/oe/package_manager.py | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/lib/oe/package_manager.py 
> b/meta/lib/oe/package_manager.py
> > index e557473..6892106 100644
> > --- a/meta/lib/oe/package_manager.py
> > +++ b/meta/lib/oe/package_manager.py
> > @@ -669,11 +669,11 @@ class RpmPM(PackageManager):
> >          self.install_dir_path = os.path.join(self.target_rootfs, 
> self.install_dir_name)
> >          self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
> >          self.smart_cmd = bb.utils.which(os.getenv('PATH'), "smart")
> > -        # 0 = default, only warnings
> > -        # 1 = --log-level=info (includes information about 
> executing scriptlets and their output)
> > +        # 0 = --log-level=warning, only warnings
> > +        # 1 = --log-level=info (includes information about 
> executing scriptlets and their output), default
> >          # 2 = --log-level=debug
> >          # 3 = --log-level=debug plus dumps of scriplet content and 
> command invocation
> > -        self.debug_level = int(d.getVar('ROOTFS_RPM_DEBUG') or "0")
> > +        self.debug_level = int(d.getVar('ROOTFS_RPM_DEBUG') or "1")
> >          self.smart_opt = ["--log-level=%s" %
> >                           ("warning" if self.debug_level == 0 else
> >                            "info" if self.debug_level == 1 else
> > @@ -2025,7 +2025,8 @@ class DpkgPM(OpkgDpkgPM):
> >                          bb.note("Executing %s for package: %s ..." %
> > (control_script.name.lower(), pkg_name))
> >                          subprocess.check_output([p_full, 
> control_script.argument],
> > -                                stderr=subprocess.STDOUT)
> > +  stderr=subprocess.STDOUT).decode("utf-8")
> > +                        bb.note(output)
>
>
> This patch seems likely to be the reason for this autobuilder failure:
> https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/builds/669/steps/BuildImages/logs/stdio
>

Sorry, I'll fix it immediately and send out V2.

Best Regards,
Chen Qi

> ---
> ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Error executing a python 
> function in exec_python_func() autogenerated:
>
> The stack trace of python calls that resulted in this 
> exception/failure was:
> File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:do_rootfs(d)
>      0003:
> File: 
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/classes/image.bbclass', 
> lineno: 266, function: do_rootfs
>      0262:
>      0263:    progress_reporter.next_stage()
>      0264:
>      0265:    # generate rootfs
>  *** 0266:    create_rootfs(d, progress_reporter=progress_reporter, 
> logcatcher=logcatcher)
>      0267:
>      0268:    progress_reporter.finish()
>      0269:}
>      0270:do_rootfs[dirs] = "${TOPDIR}"
> File: 
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/rootfs.py', 
> lineno: 1009, function: create_rootfs
>      1005:        RpmRootfs(d, manifest_dir, progress_reporter, 
> logcatcher).create()
>      1006:    elif img_type == "ipk":
>      1007:        OpkgRootfs(d, manifest_dir, progress_reporter, 
> logcatcher).create()
>      1008:    elif img_type == "deb":
>  *** 1009:        DpkgRootfs(d, manifest_dir, progress_reporter, 
> logcatcher).create()
>      1010:
>      1011:    os.environ.clear()
>      1012:    os.environ.update(env_bkp)
>      1013:
> File: 
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/rootfs.py', 
> lineno: 202, function: create
>      0198:        if self.progress_reporter:
>      0199:            self.progress_reporter.next_stage()
>      0200:
>      0201:        # call the package manager dependent create method
>  *** 0202:        self._create()
>      0203:
>      0204:        sysconfdir = self.image_rootfs + 
> self.d.getVar('sysconfdir')
>      0205:        bb.utils.mkdirhier(sysconfdir)
>      0206:        with open(sysconfdir + "/version", "w+") as ver:
> File: 
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/rootfs.py', 
> lineno: 691, function: _create
>      0687:        self.pm.fix_broken_dependencies()
>      0688:
>      0689:        self.pm.mark_packages("installed")
>      0690:
>  *** 0691:        self.pm.run_pre_post_installs()
>      0692:
>      0693:        execute_pre_post_process(self.d, deb_post_process_cmds)
>      0694:
>      0695:        if self.progress_reporter:
> File: 
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/package_manager.py', 
> lineno: 2029, function: run_pre_post_installs
>      2025:                        bb.note("Executing %s for package: 
> %s ..." %
>      2026: (control_script.name.lower(), pkg_name))
>      2027:  subprocess.check_output([p_full, control_script.argument],
>      2028:  stderr=subprocess.STDOUT).decode("utf-8")
>  *** 2029:                        bb.note(output)
>      2030:                    except subprocess.CalledProcessError as e:
>      2031:                        bb.note("%s for package %s failed 
> with %d:\n%s" %
>      2032:                                (control_script.name 
> <http://control_script.name>, pkg_name, e.returncode,
>      2033:  e.output.decode("utf-8")))
> Exception: NameError: name 'output' is not defined
> ---
>
>
> Thanks,
>   Jussi
>
>
> >
> >                      except subprocess.CalledProcessError as e:
> >                          bb.note("%s for package %s failed with 
> %d:\n%s" %
> >                                  (control_script.name 
> <http://control_script.name>, pkg_name, e.returncode,
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org 
> <mailto:Openembedded-core@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



--------------F157A96F656443010C242B34
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12/22/2016 05:36 PM, Jussi Kukkonen
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHiDW_HLYXEMEsF1ukFgOSZ+NFXJ2j09Pmo9Ty+7mW9pJrZVTA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 21 December 2016 at 06:32, Chen Qi &lt;<a
          moz-do-not-send="true" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;
        wrote:<br>
        &gt;<br>
        &gt; We need to have scriptlet output captured in log. If we
        don't do so,<br>
        &gt; some useful information from scriptlets (especially
        postinstall script)<br>
        &gt; would be missing. In case a script has a warning message
        but it does not<br>
        &gt; necessarily have to fail, the message should be captured.<br>
        &gt;<br>
        &gt; Opkg has already done that. Change for rpm and dpkg so that
        scriptlet<br>
        &gt; output is captured and no warning message is missing.<br>
        &gt;<br>
        &gt; Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
          href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
        &gt; ---<br>
        &gt;  meta/lib/oe/package_manager.py | 9 +++++----<br>
        &gt;  1 file changed, 5 insertions(+), 4 deletions(-)<br>
        &gt;<br>
        &gt; diff --git a/meta/lib/oe/package_manager.py
        b/meta/lib/oe/package_manager.py<br>
        &gt; index e557473..6892106 100644<br>
        &gt; --- a/meta/lib/oe/package_manager.py<br>
        &gt; +++ b/meta/lib/oe/package_manager.py<br>
        &gt; @@ -669,11 +669,11 @@ class RpmPM(PackageManager):<br>
        &gt;          self.install_dir_path =
        os.path.join(self.target_rootfs, self.install_dir_name)<br>
        &gt;          self.rpm_cmd = bb.utils.which(os.getenv('PATH'),
        "rpm")<br>
        &gt;          self.smart_cmd = bb.utils.which(os.getenv('PATH'),
        "smart")<br>
        &gt; -        # 0 = default, only warnings<br>
        &gt; -        # 1 = --log-level=info (includes information about
        executing scriptlets and their output)<br>
        &gt; +        # 0 = --log-level=warning, only warnings<br>
        &gt; +        # 1 = --log-level=info (includes information about
        executing scriptlets and their output), default<br>
        &gt;          # 2 = --log-level=debug<br>
        &gt;          # 3 = --log-level=debug plus dumps of scriplet
        content and command invocation<br>
        &gt; -        self.debug_level =
        int(d.getVar('ROOTFS_RPM_DEBUG') or "0")<br>
        &gt; +        self.debug_level =
        int(d.getVar('ROOTFS_RPM_DEBUG') or "1")<br>
        &gt;          self.smart_opt = ["--log-level=%s" %<br>
        &gt;                           ("warning" if self.debug_level ==
        0 else<br>
        &gt;                            "info" if self.debug_level == 1
        else<br>
        &gt; @@ -2025,7 +2025,8 @@ class DpkgPM(OpkgDpkgPM):<br>
        &gt;                          bb.note("Executing %s for package:
        %s ..." %<br>
        &gt;                                  
        (control_script.name.lower(), pkg_name))<br>
        &gt;                          subprocess.check_output([p_full,
        control_script.argument],<br>
        &gt; -                                stderr=subprocess.STDOUT)<br>
        &gt; +                              
         stderr=subprocess.STDOUT).decode("utf-8")<br>
        &gt; +                        bb.note(output)<br>
        <br>
        <br>
        This patch seems likely to be the reason for this autobuilder
        failure:<br>
        <a moz-do-not-send="true"
href="https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/builds/669/steps/BuildImages/logs/stdio">https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/builds/669/steps/BuildImages/logs/stdio</a><br>
        <br>
      </div>
    </blockquote>
    <br>
    Sorry, I'll fix it immediately and send out V2.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAHiDW_HLYXEMEsF1ukFgOSZ+NFXJ2j09Pmo9Ty+7mW9pJrZVTA@mail.gmail.com"
      type="cite">
      <div dir="ltr">---<br>
        ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Error executing a
        python function in exec_python_func() autogenerated:<br>
        <br>
        The stack trace of python calls that resulted in this
        exception/failure was:<br>
        File: 'exec_python_func() autogenerated', lineno: 2, function:
        &lt;module&gt;<br>
             0001:<br>
         *** 0002:do_rootfs(d)<br>
             0003:<br>
        File:
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/classes/image.bbclass',
        lineno: 266, function: do_rootfs<br>
             0262:<br>
             0263:    progress_reporter.next_stage()<br>
             0264:<br>
             0265:    # generate rootfs<br>
         *** 0266:    create_rootfs(d,
        progress_reporter=progress_reporter, logcatcher=logcatcher)<br>
             0267:<br>
             0268:    progress_reporter.finish()<br>
             0269:}<br>
             0270:do_rootfs[dirs] = "${TOPDIR}"<br>
        File:
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/rootfs.py',
        lineno: 1009, function: create_rootfs<br>
             1005:        RpmRootfs(d, manifest_dir, progress_reporter,
        logcatcher).create()<br>
             1006:    elif img_type == "ipk":<br>
             1007:        OpkgRootfs(d, manifest_dir, progress_reporter,
        logcatcher).create()<br>
             1008:    elif img_type == "deb":<br>
         *** 1009:        DpkgRootfs(d, manifest_dir, progress_reporter,
        logcatcher).create()<br>
             1010:<br>
             1011:    os.environ.clear()<br>
             1012:    os.environ.update(env_bkp)<br>
             1013:<br>
        File:
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/rootfs.py',
        lineno: 202, function: create<br>
             0198:        if self.progress_reporter:<br>
             0199:            self.progress_reporter.next_stage()<br>
             0200:<br>
             0201:        # call the package manager dependent create
        method<br>
         *** 0202:        self._create()<br>
             0203:<br>
             0204:        sysconfdir = self.image_rootfs +
        self.d.getVar('sysconfdir')<br>
             0205:        bb.utils.mkdirhier(sysconfdir)<br>
             0206:        with open(sysconfdir + "/version", "w+") as
        ver:<br>
        File:
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/rootfs.py',
        lineno: 691, function: _create<br>
             0687:        self.pm.fix_broken_dependencies()<br>
             0688:<br>
             0689:        self.pm.mark_packages("installed")<br>
             0690:<br>
         *** 0691:        self.pm.run_pre_post_installs()<br>
             0692:<br>
             0693:        execute_pre_post_process(self.d,
        deb_post_process_cmds)<br>
             0694:<br>
             0695:        if self.progress_reporter:<br>
        File:
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/package_manager.py',
        lineno: 2029, function: run_pre_post_installs<br>
             2025:                        bb.note("Executing %s for
        package: %s ..." %<br>
             2026:                                
        (control_script.name.lower(), pkg_name))<br>
             2027:                      
         subprocess.check_output([p_full, control_script.argument],<br>
             2028:                              
         stderr=subprocess.STDOUT).decode("utf-8")<br>
         *** 2029:                        bb.note(output)<br>
             2030:                    except
        subprocess.CalledProcessError as e:<br>
             2031:                        bb.note("%s for package %s
        failed with %d:\n%s" %<br>
             2032:                                (<a
          moz-do-not-send="true" href="http://control_script.name">control_script.name</a>,
        pkg_name, e.returncode,<br>
             2033:                                  
         e.output.decode("utf-8")))<br>
        Exception: NameError: name 'output' is not defined<br>
        ---<br>
        <br>
        <div><br>
        </div>
        <div>Thanks,</div>
        <div>  Jussi<br>
          <br>
           <br>
          &gt;<br>
          &gt;                      except subprocess.CalledProcessError
          as e:<br>
          &gt;                          bb.note("%s for package %s
          failed with %d:\n%s" %<br>
          &gt;                                  (<a
            moz-do-not-send="true" href="http://control_script.name">control_script.name</a>,
          pkg_name, e.returncode,<br>
          &gt; --<br>
          &gt; 1.9.1<br>
          &gt;<br>
          &gt; --<br>
          &gt; _______________________________________________<br>
          &gt; Openembedded-core mailing list<br>
          &gt; <a moz-do-not-send="true"
            href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
          &gt; <a moz-do-not-send="true"
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a></div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------F157A96F656443010C242B34--
