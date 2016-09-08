Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F281760620
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 02:32:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u882Wq13006302
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Sep 2016 19:32:53 -0700 (PDT)
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 7 Sep 2016 19:32:51 -0700
To: Pau Espin Pedrol <pespin.shar@gmail.com>
References: <cover.1473240119.git.Qi.Chen@windriver.com>
	<4e703d64c6d15986135603c94ad9730b7f6d66c7.1473240119.git.Qi.Chen@windriver.com>
	<CAEGpDuav43RX6WbQS5OVtDO6oRry-ybyMNt5iG8t1qMDriQ2gA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <57D0CDFE.7090101@windriver.com>
Date: Thu, 8 Sep 2016 10:33:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAEGpDuav43RX6WbQS5OVtDO6oRry-ybyMNt5iG8t1qMDriQ2gA@mail.gmail.com>
X-Originating-IP: [128.224.162.229]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] systemd.bbclass: add support to manage user services
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
X-List-Received-Date: Thu, 08 Sep 2016 02:32:55 -0000
Content-Type: multipart/alternative;
	boundary="------------070809050002000002080700"

--------------070809050002000002080700
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2016 08:14 PM, Pau Espin Pedrol wrote:
>
> 2016-09-07 11:22 GMT+02:00 Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>>:
>
>     Add new variable SYSTEMD_USER_SERVICE and SYSTEM_USER_AUTO_ENABLE
>     to manage user services. Their usage is like SYSTEMD_SERVICE and
>     SYSTEMD_AUTO_ENABLE.
>
>     [YOCTO #7800]
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      meta/classes/systemd.bbclass | 17 +++++++++++++----
>      1 file changed, 13 insertions(+), 4 deletions(-)
>
>     diff --git a/meta/classes/systemd.bbclass
>     b/meta/classes/systemd.bbclass
>     index db7873f..78cec97 100644
>     --- a/meta/classes/systemd.bbclass
>     +++ b/meta/classes/systemd.bbclass
>     @@ -7,6 +7,7 @@ SYSTEMD_PACKAGES_class-nativesdk ?= ""
>
>      # Whether to enable or disable the services on installation.
>      SYSTEMD_AUTO_ENABLE ??= "enable"
>     +SYSTEMD_USER_AUTO_ENABLE ??= "enable"
>
>      # This class will be included in any recipe that supports systemd
>     init scripts,
>      # even if systemd is not in DISTRO_FEATURES.  As such don't make
>     any changes
>     @@ -30,10 +31,14 @@ fi
>
>      if type systemctl >/dev/null 2>/dev/null; then
>             systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>     +       systemctl $OPTS --global ${SYSTEMD_USER_AUTO_ENABLE}
>     ${SYSTEMD_USER_SERVICE}
>
>
> I'm not sure having these 2 systemctl being executed together 
> everytime is a good idea. What if a recipe has a user service and no 
> system service?

Hi Pau Espin Pedrol,

Thanks for your review.

The postinstall script runs successfully with expected result at rootfs 
time. But your question reminds me of the situation of the on-target 
install/remove situation. I think I'll need to make a new patch to make 
sure things work in both situations.

The key point here is that 'systemctl' at rootfs time is a shell script 
written by ourselves and 'systemctl' on target is that provided by systemd.

> We are calling the first one with an empty system service? Or we are 
> may be enabling a systemd system service which should not be enabled 
> according to the recipe? I have the feeling this kind of cases are not 
> being catch in here and other pkg scripts in this commit.
>
> It is far from perfect, but in case you didn't, you may want to have a 
> look at my initial/previous commit to try to fix the issue: 
> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg42187.html
>
>
>             if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
>                     systemctl restart ${SYSTEMD_SERVICE}
>             fi
>     +       if [ -z "$D" -a "${SYSTEMD_USER_AUTO_ENABLE}" = "enable"
>     ]; then
>     +               systemctl --global restart ${SYSTEMD_USER_SERVICE}
>     +       fi
>      fi
>      }
>
>     @@ -47,9 +52,11 @@ fi
>      if type systemctl >/dev/null 2>/dev/null; then
>             if [ -z "$D" ]; then
>                     systemctl stop ${SYSTEMD_SERVICE}
>     +               systemctl --global stop ${SYSTEMD_USER_SERVICE}
>
>
> I think this is not gonna work, you cannot call --global with stop 
> afair. I'm not sure which is the good solution for this though, but 
> you should ideally go through all systemd user sessions and call 
> "systemctl --user stop". No idea if that's actually easily feasible.

The service is enabled and started with '--global' option, and stopping 
it with '--global' option seems reasonable to me. If there's some 
special case, let's look into it then.

Best Regards,
Chen Qi

>             fi
>
>             systemctl $OPTS disable ${SYSTEMD_SERVICE}
>     +       systemctl $OPTS --global disable ${SYSTEMD_USER_SERVICE}
>      fi
>      }
>
>     @@ -139,12 +146,14 @@ python systemd_populate_packages() {
>          def systemd_check_services():
>              searchpaths = [oe.path.join(d.getVar("sysconfdir", True),
>     "systemd", "system"),]
>              searchpaths.append(d.getVar("systemd_system_unitdir", True))
>     +        searchpaths.append(oe.path.join(d.getVar("sysconfdir",
>     True), "systemd", "user"))
>     +        searchpaths.append(d.getVar("systemd_user_unitdir", True))
>              systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
>
>              keys = 'Also'
>              # scan for all in SYSTEMD_SERVICE[]
>              for pkg_systemd in systemd_packages.split():
>     -            for service in get_package_var(d, 'SYSTEMD_SERVICE',
>     pkg_systemd).split():
>     +            for service in (get_package_var(d, 'SYSTEMD_SERVICE',
>     pkg_systemd) + get_package_var(d, 'SYSTEMD_USER_SERVICE',
>     pkg_systemd)).split():
>                      path_found = ''
>
>                      # Deal with adding, for example,
>     'ifplugd@eth0.service' from
>     @@ -165,14 +174,14 @@ python systemd_populate_packages() {
>                      if path_found != '':
>                          systemd_add_files_and_parse(pkg_systemd,
>     path_found, service, keys)
>                      else:
>     -                    raise bb.build.FuncFailed("SYSTEMD_SERVICE_%s
>     value %s does not exist" % \
>     -                        (pkg_systemd, service))
>     +                    raise bb.build.FuncFailed("SYSTEMD_SERVICE_%s
>     or SYSTEMD_USER_SERVICE_%s value %s does not exist" % \
>     +                        (pkg_systemd, pkg_systemd, service))
>
>          # Run all modifications once when creating package
>          if os.path.exists(d.getVar("D", True)):
>              for pkg in d.getVar('SYSTEMD_PACKAGES', True).split():
>                  systemd_check_package(pkg)
>     -            if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
>     +            if d.getVar('SYSTEMD_SERVICE_' + pkg, True) or
>     d.getVar('SYSTEMD_USER_SERVICE_' + pkg, True):
>                      systemd_generate_package_scripts(pkg)
>              systemd_check_services()
>      }
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------070809050002000002080700
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/07/2016 08:14 PM, Pau Espin
      Pedrol wrote:<br>
    </div>
    <blockquote
cite="mid:CAEGpDuav43RX6WbQS5OVtDO6oRry-ybyMNt5iG8t1qMDriQ2gA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra">
          <div class="gmail_quote">2016-09-07 11:22 GMT+02:00 Chen Qi <span
              dir="ltr">&lt;<a moz-do-not-send="true" target="_blank"
                href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;</span>:<br>
            <blockquote style="margin:0px 0px 0px 0.8ex;border-left:1px
              solid rgb(204,204,204);padding-left:1ex"
              class="gmail_quote">Add new variable SYSTEMD_USER_SERVICE
              and SYSTEM_USER_AUTO_ENABLE<br>
              to manage user services. Their usage is like
              SYSTEMD_SERVICE and<br>
              SYSTEMD_AUTO_ENABLE.<br>
              <br>
              [YOCTO #7800]<br>
              <br>
              Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
              ---<br>
               meta/classes/systemd.bbclass | 17 +++++++++++++----<br>
               1 file changed, 13 insertions(+), 4 deletions(-)<br>
              <br>
              diff --git a/meta/classes/systemd.bbclass
              b/meta/classes/systemd.bbclass<br>
              index db7873f..78cec97 100644<br>
              --- a/meta/classes/systemd.bbclass<br>
              +++ b/meta/classes/systemd.bbclass<br>
              @@ -7,6 +7,7 @@ SYSTEMD_PACKAGES_class-<wbr>nativesdk ?=
              ""<br>
              <br>
               # Whether to enable or disable the services on
              installation.<br>
               SYSTEMD_AUTO_ENABLE ??= "enable"<br>
              +SYSTEMD_USER_AUTO_ENABLE ??= "enable"<br>
              <br>
               # This class will be included in any recipe that supports
              systemd init scripts,<br>
               # even if systemd is not in DISTRO_FEATURES.  As such
              don't make any changes<br>
              @@ -30,10 +31,14 @@ fi<br>
              <br>
               if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
                      systemctl $OPTS ${SYSTEMD_AUTO_ENABLE}
              ${SYSTEMD_SERVICE}<br>
              +       systemctl $OPTS --global
              ${SYSTEMD_USER_AUTO_ENABLE} ${SYSTEMD_USER_SERVICE} <br>
            </blockquote>
            <div><br>
            </div>
            <div>I'm not sure having these 2 systemctl being executed
              together everytime is a good idea. What if a recipe has a
              user service and no system service?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Hi Pau Espin Pedrol,<br>
    <br>
    Thanks for your review.<br>
    <br>
    The postinstall script runs successfully with expected result at
    rootfs time. But your question reminds me of the situation of the
    on-target install/remove situation. I think I'll need to make a new
    patch to make sure things work in both situations.<br>
    <br>
    The key point here is that 'systemctl' at rootfs time is a shell
    script written by ourselves and 'systemctl' on target is that
    provided by systemd.<br>
    <br>
    <blockquote
cite="mid:CAEGpDuav43RX6WbQS5OVtDO6oRry-ybyMNt5iG8t1qMDriQ2gA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> We are calling the first one with an empty system
              service? Or we are may be enabling a systemd system
              service which should not be enabled according to the
              recipe? I have the feeling this kind of cases are not
              being catch in here and other pkg scripts in this commit.<br>
              <br>
            </div>
            <div>It is far from perfect, but in case you didn't, you may
              want to have a look at my initial/previous commit to try
              to fix the issue: <a moz-do-not-send="true"
href="https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg42187.html">https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg42187.html</a><br>
            </div>
            <div> </div>
            <blockquote style="margin:0px 0px 0px 0.8ex;border-left:1px
              solid rgb(204,204,204);padding-left:1ex"
              class="gmail_quote">
              <br>
                      if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" =
              "enable" ]; then<br>
                              systemctl restart ${SYSTEMD_SERVICE}<br>
                      fi<br>
              +       if [ -z "$D" -a "${SYSTEMD_USER_AUTO_ENABLE}" =
              "enable" ]; then<br>
              +               systemctl --global restart
              ${SYSTEMD_USER_SERVICE}<br>
              +       fi<br>
               fi<br>
               }<br>
              <br>
              @@ -47,9 +52,11 @@ fi<br>
               if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
                      if [ -z "$D" ]; then<br>
                              systemctl stop ${SYSTEMD_SERVICE}<br>
              +               systemctl --global stop
              ${SYSTEMD_USER_SERVICE}<br>
            </blockquote>
            <div><br>
            </div>
            <div>I think this is not gonna work, you cannot call
              --global with stop afair. I'm not sure which is the good
              solution for this though, but you should ideally go
              through all systemd user sessions and call "systemctl
              --user stop". No idea if that's actually easily feasible.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    The service is enabled and started with '--global' option, and
    stopping it with '--global' option seems reasonable to me. If
    there's some special case, let's look into it then.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAEGpDuav43RX6WbQS5OVtDO6oRry-ybyMNt5iG8t1qMDriQ2gA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote style="margin:0px 0px 0px 0.8ex;border-left:1px
              solid rgb(204,204,204);padding-left:1ex"
              class="gmail_quote">
                      fi<br>
              <br>
                      systemctl $OPTS disable ${SYSTEMD_SERVICE}<br>
              +       systemctl $OPTS --global disable
              ${SYSTEMD_USER_SERVICE}<br>
               fi<br>
               }<br>
              <br>
              @@ -139,12 +146,14 @@ python systemd_populate_packages() {<br>
                   def systemd_check_services():<br>
                       searchpaths = [oe.path.join(d.getVar("<wbr>sysconfdir",
              True), "systemd", "system"),]<br>
                       searchpaths.append(d.getVar("<wbr>systemd_system_unitdir",
              True))<br>
              +        searchpaths.append(oe.path.<wbr>join(d.getVar("sysconfdir",
              True), "systemd", "user"))<br>
              +        searchpaths.append(d.getVar("<wbr>systemd_user_unitdir",
              True))<br>
                       systemd_packages = d.getVar('SYSTEMD_PACKAGES',
              True)<br>
              <br>
                       keys = 'Also'<br>
                       # scan for all in SYSTEMD_SERVICE[]<br>
                       for pkg_systemd in systemd_packages.split():<br>
              -            for service in get_package_var(d,
              'SYSTEMD_SERVICE', pkg_systemd).split():<br>
              +            for service in (get_package_var(d,
              'SYSTEMD_SERVICE', pkg_systemd) + get_package_var(d,
              'SYSTEMD_USER_SERVICE', pkg_systemd)).split():<br>
                               path_found = ''<br>
              <br>
                               # Deal with adding, for example,
              '<a class="moz-txt-link-abbreviated" href="mailto:ifplugd@eth0.service">ifplugd@eth0.service</a>' from<br>
              @@ -165,14 +174,14 @@ python systemd_populate_packages() {<br>
                               if path_found != '':<br>
                                   systemd_add_files_and_parse(<wbr>pkg_systemd,
              path_found, service, keys)<br>
                               else:<br>
              -                    raise bb.build.FuncFailed("SYSTEMD_<wbr>SERVICE_%s
              value %s does not exist" % \<br>
              -                        (pkg_systemd, service))<br>
              +                    raise bb.build.FuncFailed("SYSTEMD_<wbr>SERVICE_%s
              or SYSTEMD_USER_SERVICE_%s value %s does not exist" % \<br>
              +                        (pkg_systemd, pkg_systemd,
              service))<br>
              <br>
                   # Run all modifications once when creating package<br>
                   if os.path.exists(d.getVar("D", True)):<br>
                       for pkg in d.getVar('SYSTEMD_PACKAGES',
              True).split():<br>
                           systemd_check_package(pkg)<br>
              -            if d.getVar('SYSTEMD_SERVICE_' + pkg, True):<br>
              +            if d.getVar('SYSTEMD_SERVICE_' + pkg, True)
              or d.getVar('SYSTEMD_USER_<wbr>SERVICE_' + pkg, True):<br>
                               systemd_generate_package_<wbr>scripts(pkg)<br>
                       systemd_check_services()<br>
               }<br>
              <span class="gmail-HOEnZb"><font color="#888888">--<br>
                  1.9.1<br>
                  <br>
                  --<br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                  <a moz-do-not-send="true" target="_blank"
                    rel="noreferrer"
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </font></span></blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------070809050002000002080700--
