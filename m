Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9172C78668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 12:40:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8DCeWuF025314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Sep 2017 05:40:32 -0700 (PDT)
Received: from [172.25.59.215] (172.25.59.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Sep 2017 05:40:32 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170815185534.118522-1-jason.wessel@windriver.com>
	<CA+chaQcVcpkTVPCa7xdpMJZ+dWWdHCZrf66nPsyFOpj+iEos=A@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <89eb6c7d-f000-117a-7f3c-381499c8af88@windriver.com>
Date: Wed, 13 Sep 2017 07:40:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQcVcpkTVPCa7xdpMJZ+dWWdHCZrf66nPsyFOpj+iEos=A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Fix rootfs transaction error when PACKAGECONFIG has polkit
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
X-List-Received-Date: Wed, 13 Sep 2017 12:40:32 -0000
Content-Type: multipart/alternative;
	boundary="------------AD54615BA1532FE0F80C7673"
Content-Language: en-GB

--------------AD54615BA1532FE0F80C7673
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

It should work because it has nothing to do with that particular passwd file.   This is builds successfully on a ubuntu 16.04 host which has no polkitd user.

Also with the user add stanza in the patch it should be adding the user that is required when PACKAGECONFIG has the polkitd added to the psuedo passwd file.   We have quite a few configurations building properly.  Where I have seen transient failures before is when the -native sysroot does not get rebuilt but that is typically with other recipes.

Is this still a problem?


Jason.


On 09/06/2017 01:35 PM, Martin Jansa wrote:
> Does this work on hosts without polkitd user?
>
> Here it failed with:
>
> | chown: invalid user: ‘polkitd:root’
>
>
>
>
>
>
> On Tue, Aug 15, 2017 at 8:55 PM, Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>> wrote:
>
>     The systemd 234 added some files to the polkit directory and the
>     directory the files live in must be owned by the polkitd user, else
>     you will receive the following error when the rootfs is being
>     assembled:
>
>     Error: Transaction check error:
>       file /usr/share/polkit-1/rules.d conflicts between attempted installs of polkit-0.113-r0.15.core2_64 and systemd-1:234-r0.0.core2_64
>
>     The fix similar to other packages such as libvirt where the user must
>     exist and the directory must be created with the proper attributes.
>
>     Signed-off-by: Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>>
>     ---
>      meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb> | 9 +++++++++
>      1 file changed, 9 insertions(+)
>
>     diff --git a/meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb> b/meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb>
>     index ad7fc99b90..4560cf4175 100644
>     --- a/meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb>
>     +++ b/meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb>
>     @@ -245,6 +245,14 @@ do_install() {
>                     ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
>             fi
>             install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
>     +
>     +       # If polkit is setup fixup permissions and ownership
>     +       if [ "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'polkit', '', d)}" = "polkit" ] ; then
>     +           if [ -d ${D}${datadir}/polkit-1/rules.d ] ; then
>     +               chmod 700 ${D}${datadir}/polkit-1/rules.d
>     +               chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>     +           fi
>     +       fi
>      }
>
>      do_install_ptest () {
>     @@ -308,6 +316,7 @@ USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--sy
>      USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
>      USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
>      USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
>     +USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
>      GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
>      USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy;"
>
>     --
>     2.11.0
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------AD54615BA1532FE0F80C7673
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">It should work because it has nothing
      to do with that particular passwd file.   This is builds
      successfully on a ubuntu 16.04 host which has no polkitd user.<br>
      <br>
      Also with the user add stanza in the patch it should be adding the
      user that is required when PACKAGECONFIG has the polkitd added to
      the psuedo passwd file.   We have quite a few configurations
      building properly.  Where I have seen transient failures before is
      when the -native sysroot does not get rebuilt but that is
      typically with other recipes. <br>
      <br>
      Is this still a problem? <br>
      <br>
      <br>
      Jason. <br>
      <br>
      <br>
      On 09/06/2017 01:35 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQcVcpkTVPCa7xdpMJZ+dWWdHCZrf66nPsyFOpj+iEos=A@mail.gmail.com">
      <meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">Does this work on hosts without polkitd user?
        <div><br>
        </div>
        <div>Here it failed with:</div>
        <div><br>
        </div>
        <div>
          <div>| chown: invalid user: ‘polkitd:root’</div>
          <div><br>
          </div>
          <div><br>
          </div>
          <div><br>
          </div>
          <div><br>
          </div>
          <div><br>
          </div>
        </div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Tue, Aug 15, 2017 at 8:55 PM, Jason
          Wessel <span dir="ltr">&lt;<a
              href="mailto:jason.wessel@windriver.com" target="_blank"
              moz-do-not-send="true">jason.wessel@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote">The systemd 234 added some
            files to the polkit directory and the<br>
            directory the files live in must be owned by the polkitd
            user, else<br>
            you will receive the following error when the rootfs is
            being<br>
            assembled:<br>
            <br>
            Error: Transaction check error:<br>
              file /usr/share/polkit-1/rules.d conflicts between
            attempted installs of polkit-0.113-r0.15.core2_64 and
            systemd-1:234-r0.0.core2_64<br>
            <br>
            The fix similar to other packages such as libvirt where the
            user must<br>
            exist and the directory must be created with the proper
            attributes.<br>
            <br>
            Signed-off-by: Jason Wessel &lt;<a
              href="mailto:jason.wessel@windriver.com"
              moz-do-not-send="true">jason.wessel@windriver.com</a>&gt;<br>
            ---<br>
             meta/recipes-core/systemd/<a href="http://systemd_234.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">syst<wbr>emd_234.bb</a>
            | 9 +++++++++<br>
             1 file changed, 9 insertions(+)<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<a
              href="http://systemd_234.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">sy<wbr>stemd_234.bb</a>
            b/meta/recipes-core/systemd/<a href="http://systemd_234.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">sy<wbr>stemd_234.bb</a><br>
            index ad7fc99b90..4560cf4175 100644<br>
            --- a/meta/recipes-core/systemd/<a
              href="http://systemd_234.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">sy<wbr>stemd_234.bb</a><br>
            +++ b/meta/recipes-core/systemd/<a
              href="http://systemd_234.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">sy<wbr>stemd_234.bb</a><br>
            @@ -245,6 +245,14 @@ do_install() {<br>
                            ln -s ../run/systemd/resolve/resolv.<wbr>conf
            ${D}${sysconfdir}/resolv-conf.<wbr>systemd<br>
                    fi<br>
                    install -Dm 0755 ${S}/src/systemctl/systemd-<wbr>sysv-install.SKELETON
            ${D}${systemd_unitdir}/<wbr>systemd-sysv-install<br>
            +<br>
            +       # If polkit is setup fixup permissions and ownership<br>
            +       if [ "${@bb.utils.contains('<wbr>PACKAGECONFIG',
            'polkit', 'polkit', '', d)}" = "polkit" ] ; then<br>
            +           if [ -d ${D}${datadir}/polkit-1/rules.<wbr>d ] ;
            then<br>
            +               chmod 700 ${D}${datadir}/polkit-1/rules.<wbr>d<br>
            +               chown polkitd:root
            ${D}${datadir}/polkit-1/rules.<wbr>d<br>
            +           fi<br>
            +       fi<br>
             }<br>
            <br>
             do_install_ptest () {<br>
            @@ -308,6 +316,7 @@ USERADD_PARAM_${PN} +=
            "${@bb.utils.contains('<wbr>PACKAGECONFIG', 'timesyncd',
            '--sy<br>
             USERADD_PARAM_${PN} += "${@bb.utils.contains('<wbr>PACKAGECONFIG',
            'networkd', '--system -d / -M --shell /bin/nologin
            systemd-network;', '', d)}"<br>
             USERADD_PARAM_${PN} += "${@bb.utils.contains('<wbr>PACKAGECONFIG',
            'coredump', '--system -d / -M --shell /bin/nologin
            systemd-coredump;', '', d)}"<br>
             USERADD_PARAM_${PN} += "${@bb.utils.contains('<wbr>PACKAGECONFIG',
            'resolved', '--system -d / -M --shell /bin/nologin
            systemd-resolve;', '', d)}"<br>
            +USERADD_PARAM_${PN} += "${@bb.utils.contains('<wbr>PACKAGECONFIG',
            'polkit', '--system --no-create-home --user-group --home-dir
            ${sysconfdir}/polkit-1 polkitd;', '', d)}"<br>
             GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"<br>
             USERADD_PARAM_${PN}-extra-<wbr>utils += "--system -d / -M
            --shell /bin/nologin systemd-bus-proxy;"<br>
            <span class="HOEnZb"><br>
              --<br>
              2.11.0<br>
              <br>
              --<br>
              ______________________________<wbr>_________________<br>
              Openembedded-core mailing list<br>
              <a href="mailto:Openembedded-core@lists.openembedded.org"
                moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
              <a
                href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
            </span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------AD54615BA1532FE0F80C7673--
