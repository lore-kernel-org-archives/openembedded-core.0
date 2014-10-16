Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-08.prod.phx3.secureserver.net
	(p3plsmtpa09-08.prod.phx3.secureserver.net [173.201.193.237])
	by mail.openembedded.org (Postfix) with ESMTP id 2BACF7192A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 12:32:22 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-08.prod.phx3.secureserver.net with 
	id 3oYP1p0010BVjqb01oYPmM; Thu, 16 Oct 2014 05:32:23 -0700
Message-ID: <543FBAD6.1050300@pabigot.com>
Date: Thu, 16 Oct 2014 07:32:22 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1413451107.git.Qi.Chen@windriver.com>	<222ef849d28064ba0786fb5bf929554d6389c9cc.1413451107.git.Qi.Chen@windriver.com>	<543FA509.1040203@pabigot.com>
	<543FB0DF.4020209@windriver.com>
In-Reply-To: <543FB0DF.4020209@windriver.com>
Subject: Re: [PATCH 1/1] systemd: fix runtime dependency
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
X-List-Received-Date: Thu, 16 Oct 2014 12:32:27 -0000
Content-Type: multipart/alternative;
	boundary="------------030902010300080004030400"

--------------030902010300080004030400
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/2014 06:49 AM, ChenQi wrote:
> On 10/16/2014 06:59 PM, Peter A. Bigot wrote:
>> On 10/16/2014 04:19 AM, Chen Qi wrote:
>>> Previously, if we set 'NO_RECOMMENDATIONS' to "1", we cannot reach 
>>> login
>>> in systemd systems. The problem is that several runtime dependencies 
>>> are
>>> coded as 'recommended' in our project.
>>>
>>> This patch makes the following changes.
>>> 1. Add util-linux-agetty as a runtime dependency.
>>>     Otherwise, getty services in systemd cannot start correctly.
>>> 2. Add systemd-serialgetty as a runtime dependency.
>>>     Otherwise, serialgetty services cannot start correctly in 
>>> systemd and
>>>     we would have problem when using `runqemu qemux86 nographic'.
>>> 3. Remove 'systemd' from RDEPENDS of systemd-serialgetty.
>>>     systemd-serialgetty justs ships systemd unit files, even if the 
>>> init
>>>     manager is 'sysvinit', these files do no harm.
>>
>> This looks really weird.  It doesn't make any sense that systemd 
>> should depend on systemd-serialgetty; the original dependency was right.
>>
>
> If systemd-serialgetty should rdepends on systemd, then in the same 
> logic, we should also change sysvinit-inittab to rdepend on sysvinit. 
> I don't think this is right.

OK, that makes sense: systemd-serialgetty doesn't depend on systemd, 
it's just not particularly useful without it.  Without digging into 
details, I could see a case for removing the RDEPENDS on systemd from 
systemd-serialgetty.  Maybe RRECOMMENDS is better.

However, so much more so does systemd not depend on systemd-serialgetty, 
so adding the dependency in the reverse direction is simply wrong.  A 
system without a serial console is unusual but not invalid.

>
>> serialgetty works fine under systemd with all my configurations as-is.
>>
>
> Yes. But it needs to be first installed to work correctly.

Agreed.

>> I think you need to look more closely at your project-specific 
>> configuration to understand why things aren't getting set up 
>> correctly for you.
>>
>
> You can hand-edit local.conf with IMAGE_INSTALL_remove/_append to 
> workaround a lot of runtime dependency issue. The problem is that 
> setting 'NO_RECOMMENDATIONS' to "1" is valid, however, such valid 
> configuration would raise a non-workable minimal image.

The documentation for NO_RECOMMENDATIONS has: 
http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-NO_RECOMMENDATIONS

Note: Some recommended packages might be required for certain system 
functionality, such as kernel modules. It is up to you to add packages 
with the |IMAGE_INSTALL| 
<http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-IMAGE_INSTALL> 
variable.

AFAICT, if this doesn't work for you because you use NO_RECOMMENDATIONS, 
it's a problem with your configuration, not with OE.

Peter

>
> Try the following steps with the current project.
> 1. set NO_RECOMMENDATIONS to "1" in local.conf
> 2. Change in local.conf to use systemd as the init manager
> 3. bitbake core-image-minimal
> 4. runqemu qemux86 nographic
>
> My point is that a system should let users login in on serial console. 
> Our sysvinit based system does this, and our systemd based system 
> should also do this.
>
>> Peter
>>
>>
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   meta/recipes-core/systemd/systemd-serialgetty.bb | 2 --
>>>   meta/recipes-core/systemd/systemd_216.bb         | 5 ++---
>>>   2 files changed, 2 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb 
>>> b/meta/recipes-core/systemd/systemd-serialgetty.bb
>>> index 1c34d5c..f3acaad 100644
>>> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
>>> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
>>> @@ -36,8 +36,6 @@ do_install() {
>>>       fi
>>>   }
>>>   -RDEPENDS_${PN} = "systemd"
>>> -
>>>   # This is a machine specific file
>>>   FILES_${PN} = "${systemd_unitdir}/system/*.service ${sysconfdir}"
>>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>> diff --git a/meta/recipes-core/systemd/systemd_216.bb 
>>> b/meta/recipes-core/systemd/systemd_216.bb
>>> index ebf9395..62fe5c7 100644
>>> --- a/meta/recipes-core/systemd/systemd_216.bb
>>> +++ b/meta/recipes-core/systemd/systemd_216.bb
>>> @@ -267,11 +267,10 @@ FILES_${PN} = " ${base_bindir}/* \
>>>   FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug 
>>> ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
>>>   FILES_${PN}-dev += "${base_libdir}/security/*.la 
>>> ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>>>   -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= 
>>> ${EXTENDPKGV})"
>>> +RDEPENDS_${PN} += "kmod dbus systemd-serialgetty util-linux-mount 
>>> util-linux-agetty udev (= ${EXTENDPKGV})"
>>>   RDEPENDS_${PN} += "volatile-binds"
>>>   -RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units 
>>> udev-hwdb\
>>> -                      util-linux-agetty \
>>> +RRECOMMENDS_${PN} += "systemd-compat-units udev-hwdb\
>>>                         util-linux-fsck e2fsprogs-e2fsck \
>>>                         kernel-module-autofs4 kernel-module-unix 
>>> kernel-module-ipv6 os-release \
>>>   "
>>
>


--------------030902010300080004030400
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 10/16/2014 06:49 AM, ChenQi wrote:<br>
    </div>
    <blockquote cite="mid:543FB0DF.4020209@windriver.com" type="cite">On
      10/16/2014 06:59 PM, Peter A. Bigot wrote:
      <br>
      <blockquote type="cite">On 10/16/2014 04:19 AM, Chen Qi wrote:
        <br>
        <blockquote type="cite">Previously, if we set
          'NO_RECOMMENDATIONS' to "1", we cannot reach login
          <br>
          in systemd systems. The problem is that several runtime
          dependencies are
          <br>
          coded as 'recommended' in our project.
          <br>
          <br>
          This patch makes the following changes.
          <br>
          1. Add util-linux-agetty as a runtime dependency.
          <br>
              Otherwise, getty services in systemd cannot start
          correctly.
          <br>
          2. Add systemd-serialgetty as a runtime dependency.
          <br>
              Otherwise, serialgetty services cannot start correctly in
          systemd and
          <br>
              we would have problem when using `runqemu qemux86
          nographic'.
          <br>
          3. Remove 'systemd' from RDEPENDS of systemd-serialgetty.
          <br>
              systemd-serialgetty justs ships systemd unit files, even
          if the init
          <br>
              manager is 'sysvinit', these files do no harm.
          <br>
        </blockquote>
        <br>
        This looks really weird.  It doesn't make any sense that systemd
        should depend on systemd-serialgetty; the original dependency
        was right.
        <br>
        <br>
      </blockquote>
      <br>
      If systemd-serialgetty should rdepends on systemd, then in the
      same logic, we should also change sysvinit-inittab to rdepend on
      sysvinit. I don't think this is right.<br>
    </blockquote>
    <br>
    OK, that makes sense: systemd-serialgetty doesn't depend on systemd,
    it's just not particularly useful without it.  Without digging into
    details, I could see a case for removing the RDEPENDS on systemd
    from systemd-serialgetty.  Maybe RRECOMMENDS is better.<br>
    <br>
    However, so much more so does systemd not depend on
    systemd-serialgetty, so adding the dependency in the reverse
    direction is simply wrong.  A system without a serial console is
    unusual but not invalid.<br>
    <br>
    <blockquote cite="mid:543FB0DF.4020209@windriver.com" type="cite">
      <br>
      <blockquote type="cite">serialgetty works fine under systemd with
        all my configurations as-is.
        <br>
        <br>
      </blockquote>
      <br>
      Yes. But it needs to be first installed to work correctly.
      <br>
    </blockquote>
    <br>
    Agreed.<br>
    <br>
    <blockquote cite="mid:543FB0DF.4020209@windriver.com" type="cite">
      <blockquote type="cite">I think you need to look more closely at
        your project-specific configuration to understand why things
        aren't getting set up correctly for you.
        <br>
        <br>
      </blockquote>
      <br>
      You can hand-edit local.conf with IMAGE_INSTALL_remove/_append to
      workaround a lot of runtime dependency issue. The problem is that
      setting 'NO_RECOMMENDATIONS' to "1" is valid, however, such valid
      configuration would raise a non-workable minimal image.
      <br>
    </blockquote>
    <br>
    The documentation for NO_RECOMMENDATIONS has:
<a class="moz-txt-link-freetext" href="http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-NO_RECOMMENDATIONS">http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-NO_RECOMMENDATIONS</a><br>
    <br>
    Note: Some recommended packages might be required for certain system
    functionality, such as kernel modules. It is up to you to add
    packages with the <a class="link"
href="http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-IMAGE_INSTALL"
      title="IMAGE_INSTALL"><code class="filename">IMAGE_INSTALL</code></a>
    variable. <br>
    <br>
    AFAICT, if this doesn't work for you because you use
    NO_RECOMMENDATIONS, it's a problem with your configuration, not with
    OE.<br>
    <br>
    Peter<br>
    <br>
    <blockquote cite="mid:543FB0DF.4020209@windriver.com" type="cite">
      <br>
      Try the following steps with the current project.
      <br>
      1. set NO_RECOMMENDATIONS to "1" in local.conf
      <br>
      2. Change in local.conf to use systemd as the init manager
      <br>
      3. bitbake core-image-minimal
      <br>
      4. runqemu qemux86 nographic
      <br>
      <br>
      My point is that a system should let users login in on serial
      console. Our sysvinit based system does this, and our systemd
      based system should also do this.
      <br>
      <br>
      <blockquote type="cite">Peter
        <br>
        <br>
        <br>
        <blockquote type="cite">
          <br>
          Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
          <br>
          ---
          <br>
            meta/recipes-core/systemd/systemd-serialgetty.bb | 2 --
          <br>
            meta/recipes-core/systemd/systemd_216.bb         | 5 ++---
          <br>
            2 files changed, 2 insertions(+), 5 deletions(-)
          <br>
          <br>
          diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb
          b/meta/recipes-core/systemd/systemd-serialgetty.bb
          <br>
          index 1c34d5c..f3acaad 100644
          <br>
          --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
          <br>
          +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
          <br>
          @@ -36,8 +36,6 @@ do_install() {
          <br>
                fi
          <br>
            }
          <br>
            -RDEPENDS_${PN} = "systemd"
          <br>
          -
          <br>
            # This is a machine specific file
          <br>
            FILES_${PN} = "${systemd_unitdir}/system/*.service
          ${sysconfdir}"
          <br>
            PACKAGE_ARCH = "${MACHINE_ARCH}"
          <br>
          diff --git a/meta/recipes-core/systemd/systemd_216.bb
          b/meta/recipes-core/systemd/systemd_216.bb
          <br>
          index ebf9395..62fe5c7 100644
          <br>
          --- a/meta/recipes-core/systemd/systemd_216.bb
          <br>
          +++ b/meta/recipes-core/systemd/systemd_216.bb
          <br>
          @@ -267,11 +267,10 @@ FILES_${PN} = " ${base_bindir}/* \
          <br>
            FILES_${PN}-dbg += "${rootlibdir}/.debug
          ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug
          ${base_libdir}/security/.debug/"
          <br>
            FILES_${PN}-dev += "${base_libdir}/security/*.la
          ${datadir}/dbus-1/interfaces/
          ${sysconfdir}/rpm/macros.systemd"
          <br>
            -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (=
          ${EXTENDPKGV})"
          <br>
          +RDEPENDS_${PN} += "kmod dbus systemd-serialgetty
          util-linux-mount util-linux-agetty udev (= ${EXTENDPKGV})"
          <br>
            RDEPENDS_${PN} += "volatile-binds"
          <br>
            -RRECOMMENDS_${PN} += "systemd-serialgetty
          systemd-compat-units udev-hwdb\
          <br>
          -                      util-linux-agetty \
          <br>
          +RRECOMMENDS_${PN} += "systemd-compat-units udev-hwdb\
          <br>
                                  util-linux-fsck e2fsprogs-e2fsck \
          <br>
                                  kernel-module-autofs4
          kernel-module-unix kernel-module-ipv6 os-release \
          <br>
            "
          <br>
        </blockquote>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------030902010300080004030400--
