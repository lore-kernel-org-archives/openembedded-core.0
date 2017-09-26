Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8795F6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 08:32:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8Q8WO5U026356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 26 Sep 2017 01:32:24 -0700
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 26 Sep 2017 01:32:23 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1504598502.git.Qi.Chen@windriver.com>
	<68a878cd6e53211af0f2a5a248328d05597e63af.1504598502.git.Qi.Chen@windriver.com>
	<CA+chaQfUX5_GS+jJ-Av9-k=pB9RA+JG1=v8MhJhOzUR5jMJBjw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <2a385f68-0e26-5013-6381-1582aedd8688@windriver.com>
Date: Tue, 26 Sep 2017 16:38:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfUX5_GS+jJ-Av9-k=pB9RA+JG1=v8MhJhOzUR5jMJBjw@mail.gmail.com>
X-Originating-IP: [128.224.162.167]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemd: change some RRECOMMENDS to RDEPENDS
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
X-List-Received-Date: Tue, 26 Sep 2017 08:32:28 -0000
Content-Type: multipart/alternative;
	boundary="------------FC44B5B7D922BDC337ED45CF"

--------------FC44B5B7D922BDC337ED45CF
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/22/2017 05:34 PM, Martin Jansa wrote:
> This doesn't seem to work correctly for MACHINEs with 
> empty SERIAL_CONSOLE, because with empty SERIAL_CONSOLE there is no 
> systemd-serialgetty package (because it's also empty) and the build 
> fails with:
>
> Collected errors:
>  * calculate_dependencies_for: Cannot satisfy the following 
> dependencies for packagegroup-core-boot:
>  *      systemd-serialgetty *
>  * opkg_solver_install: Cannot install package packagegroup-core-boot.
>
> If you're setting NO_RECOMMENDATIONS to "1", then you should expect 
> that some recommended functionality will be missing, no?
>

Hi Martin,

Thanks a lot for pointing out this situation.
I've sent out a follow-up fix which sets ALLOW_EMPTY_${PN} = "1" in 
systemd-serialtty.bb.
I hope this would be sufficient.

I agree with you that if NO_RECOMMENDATIONS is set to "1", the lack of 
some functionality is allowed.
But if the user doesn't set anything related to serial console, and he's 
building our reference image (e.g. core-image-minimal) on our supported 
BSP (e.g. qemux86-64), the user should not be astonished by being unable 
to get to login.

Anyway, I hope my follow-up fix would fix things up.

Best Regards,
Chen Qi

> On Tue, Sep 5, 2017 at 10:07 AM, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Set NO_RECOMMENDATIONS to "1", build and start a systemd image, and we
>     could not get serial getty spawned, thus causing the user not able to
>     login via serial port.
>
>     E.g.
>     MACHINE=qemux86-64 bitbake core-image-minimal
>     runqemu qemux86-64 nographic
>
>     And we cannot login onto the system.
>
>     Move util-linux-agetty and systemd-serialgetty (determined by
>     PACKAGECONFIG)
>     from RRECOMMENDS to RDEPENDS to fix the above problem.
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb>
>     | 8 ++++----
>      1 file changed, 4 insertions(+), 4 deletions(-)
>
>     diff --git a/meta/recipes-core/systemd/systemd_234.bb
>     <http://systemd_234.bb> b/meta/recipes-core/systemd/systemd_234.bb
>     <http://systemd_234.bb>
>     index 2736f38..2695e15 100644
>     --- a/meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb>
>     +++ b/meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb>
>     @@ -492,13 +492,13 @@ FILES_${PN} = " ${base_bindir}/* \
>
>      FILES_${PN}-dev += "${base_libdir}/security/*.la
>     ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>
>     -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
>     +RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (=
>     ${EXTENDPKGV}) util-linux-agetty"
>     +RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
>     'serial-getty-generator', '', 'systemd-serialgetty', d)}"
>      RDEPENDS_${PN} += "volatile-binds update-rc.d"
>
>     -RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
>     'serial-getty-generator', '', 'systemd-serialgetty', d)} \
>     -                      systemd-extra-utils \
>     +RRECOMMENDS_${PN} += "systemd-extra-utils \
>                            systemd-compat-units udev-hwdb \
>     -                      util-linux-agetty  util-linux-fsck
>     e2fsprogs-e2fsck \
>     +                      util-linux-fsck e2fsprogs-e2fsck \
>                            kernel-module-autofs4 kernel-module-unix
>     kernel-module-ipv6 \
>                            os-release \
>      "
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


--------------FC44B5B7D922BDC337ED45CF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/22/2017 05:34 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote
cite="mid:CA+chaQfUX5_GS+jJ-Av9-k=pB9RA+JG1=v8MhJhOzUR5jMJBjw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">This doesn't seem to work correctly for MACHINEs
        with empty SERIAL_CONSOLE, because with empty SERIAL_CONSOLE
        there is no systemd-serialgetty package (because it's also
        empty) and the build fails with:
        <div><br>
        </div>
        <div>Collected errors:<br>
        </div>
        <div>
          <div> * calculate_dependencies_for: Cannot satisfy the
            following dependencies for packagegroup-core-boot:</div>
          <div> *      systemd-serialgetty *</div>
          <div> * opkg_solver_install: Cannot install package
            packagegroup-core-boot.</div>
        </div>
        <div><br>
        </div>
        <div>If you're setting <span style="font-size:12.8px">NO_RECOMMENDATIONS
            to "1", then you should expect that some recommended
            functionality will be missing, no?</span></div>
      </div>
      <div class="gmail_extra"><br>
      </div>
    </blockquote>
    <br>
    Hi Martin,<br>
    <br>
    Thanks a lot for pointing out this situation.<br>
    I've sent out a follow-up fix which sets ALLOW_EMPTY_${PN} = "1" in
    systemd-serialtty.bb.<br>
    I hope this would be sufficient.<br>
    <br>
    I agree with you that if NO_RECOMMENDATIONS is set to "1", the lack
    of some functionality is allowed.<br>
    But if the user doesn't set anything related to serial console, and
    he's building our reference image (e.g. core-image-minimal) on our
    supported BSP (e.g. qemux86-64), the user should not be astonished
    by being unable to get to login.<br>
    <br>
    Anyway, I hope my follow-up fix would fix things up.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CA+chaQfUX5_GS+jJ-Av9-k=pB9RA+JG1=v8MhJhOzUR5jMJBjw@mail.gmail.com"
      type="cite">
      <div class="gmail_extra">
        <div class="gmail_quote">On Tue, Sep 5, 2017 at 10:07 AM, Chen
          Qi <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Set
            NO_RECOMMENDATIONS to "1", build and start a systemd image,
            and we<br>
            could not get serial getty spawned, thus causing the user
            not able to<br>
            login via serial port.<br>
            <br>
            E.g.<br>
            MACHINE=qemux86-64 bitbake core-image-minimal<br>
            runqemu qemux86-64 nographic<br>
            <br>
            And we cannot login onto the system.<br>
            <br>
            Move util-linux-agetty and systemd-serialgetty (determined
            by PACKAGECONFIG)<br>
            from RRECOMMENDS to RDEPENDS to fix the above problem.<br>
            <br>
            Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            ---<br>
             meta/recipes-core/systemd/<a moz-do-not-send="true"
              href="http://systemd_234.bb" rel="noreferrer"
              target="_blank">syst<wbr>emd_234.bb</a> | 8 ++++----<br>
             1 file changed, 4 insertions(+), 4 deletions(-)<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<a
              moz-do-not-send="true" href="http://systemd_234.bb"
              rel="noreferrer" target="_blank">sy<wbr>stemd_234.bb</a>
            b/meta/recipes-core/systemd/<a moz-do-not-send="true"
              href="http://systemd_234.bb" rel="noreferrer"
              target="_blank">sy<wbr>stemd_234.bb</a><br>
            index 2736f38..2695e15 100644<br>
            --- a/meta/recipes-core/systemd/<a moz-do-not-send="true"
              href="http://systemd_234.bb" rel="noreferrer"
              target="_blank">sy<wbr>stemd_234.bb</a><br>
            +++ b/meta/recipes-core/systemd/<a moz-do-not-send="true"
              href="http://systemd_234.bb" rel="noreferrer"
              target="_blank">sy<wbr>stemd_234.bb</a><br>
            @@ -492,13 +492,13 @@ FILES_${PN} = " ${base_bindir}/* \<br>
            <br>
             FILES_${PN}-dev += "${base_libdir}/security/*.la
            ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.<wbr>systemd"<br>
            <br>
            -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (=
            ${EXTENDPKGV})"<br>
            +RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (=
            ${EXTENDPKGV}) util-linux-agetty"<br>
            +RDEPENDS_${PN} += "${@bb.utils.contains('<wbr>PACKAGECONFIG',
            'serial-getty-generator', '', 'systemd-serialgetty', d)}"<br>
             RDEPENDS_${PN} += "volatile-binds update-rc.d"<br>
            <br>
            -RRECOMMENDS_${PN} += "${@bb.utils.contains('<wbr>PACKAGECONFIG',
            'serial-getty-generator', '', 'systemd-serialgetty', d)} \<br>
            -                      systemd-extra-utils \<br>
            +RRECOMMENDS_${PN} += "systemd-extra-utils \<br>
                                   systemd-compat-units udev-hwdb \<br>
            -                      util-linux-agetty  util-linux-fsck
            e2fsprogs-e2fsck \<br>
            +                      util-linux-fsck e2fsprogs-e2fsck \<br>
                                   kernel-module-autofs4
            kernel-module-unix kernel-module-ipv6 \<br>
                                   os-release \<br>
             "<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                1.9.1<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a moz-do-not-send="true"
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------FC44B5B7D922BDC337ED45CF--
