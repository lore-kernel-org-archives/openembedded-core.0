Return-Path: <california.l.sullivan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 69C3878709
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 22:05:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Dec 2017 14:05:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,347,1508828400"; d="scan'208,217";a="8566548"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 01 Dec 2017 14:05:10 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <20171114212050.15881-1-california.l.sullivan@intel.com>
	<20171114220340.28764-1-california.l.sullivan@intel.com>
	<CA+chaQe+qJCwz3dyYh51Pr8Gum5L0wt3VDqrTxs+a36cbOyzYQ@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <3adad65e-6eca-190f-5a71-7cd509bbd3f9@intel.com>
Date: Fri, 1 Dec 2017 14:05:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQe+qJCwz3dyYh51Pr8Gum5L0wt3VDqrTxs+a36cbOyzYQ@mail.gmail.com>
Cc: "Wold, Saul" <saul.wold@intel.com>, henry.bruce@intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3 V2] initramfs-framework: add install module
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
X-List-Received-Date: Fri, 01 Dec 2017 22:05:09 -0000
Content-Type: multipart/alternative;
	boundary="------------384A23853D935CF644BE61D7"
Content-Language: en-US

--------------384A23853D935CF644BE61D7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

My bad. I was using initramfs-module-install-efi as a template when I 
shouldn't have.

I see you already sent a patch addressing the issue. Looks good, and 
thanks for that.

---
Cal

On 12/01/2017 01:01 PM, Martin Jansa wrote:
> Why does it inherit allarch when it depends on TUNE_PKGARCH grub and 
> other packages?
>
> Also it should repect the restrictions which are in grub recipe:
>
> COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
> COMPATIBLE_HOST_armv7a = 'null'
> COMPATIBLE_HOST_armv7ve = 'null'
>
> because without it it adds new ERROR to "bitbake world":
> ERROR: Nothing RPROVIDES 'grub' (but 
> oe-core/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb 
> <http://initramfs-module-install_1.0.bb> RDEPENDS on or otherwise 
> requires it)
> grub was skipped: incompatible with host arm-oe-linux-gnueabi (not in 
> COMPATIBLE_HOST)
> grub was skipped: incompatible with host arm-oe-linux-gnueabi (not in 
> COMPATIBLE_HOST)
> NOTE: Runtime target 'grub' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['grub']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable 
> providers.
>
> On Tue, Nov 14, 2017 at 11:03 PM, California Sullivan 
> <california.l.sullivan@intel.com 
> <mailto:california.l.sullivan@intel.com>> wrote:
>
>     The non-EFI counterpart for installation was previously missing for
>     initramfs-framework. This simply puts the normal install script in the
>     correct location for initramfs-framework to make use of it.
>
>     Signed-off-by: California Sullivan
>     <california.l.sullivan@intel.com
>     <mailto:california.l.sullivan@intel.com>>
>     ---
>     V2 changes:
>     * Add the module's dependencies to
>     SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS, since
>       its dependencies changing don't matter in regards building the
>     package.
>     * PR = "r1" since its a new recipe.
>
>      meta/conf/layer.conf                                 |  4 ++++
>      .../initrdscripts/initramfs-module-install_1.0.bb
>     <http://initramfs-module-install_1.0.bb>   | 20 ++++++++++++++++++++
>      2 files changed, 24 insertions(+)
>      create mode 100644
>     meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
>     <http://initramfs-module-install_1.0.bb>
>
>     diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>     index 0342324..6782058 100644
>     --- a/meta/conf/layer.conf
>     +++ b/meta/conf/layer.conf
>     @@ -57,6 +57,10 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>        initramfs-module-install-efi->e2fsprogs \
>        initramfs-module-install-efi->parted \
>        initramfs-module-install-efi->util-linux \
>     +  initramfs-module-install->e2fsprogs \
>     +  initramfs-module-install->grub \
>     +  initramfs-module-install->parted \
>     +  initramfs-module-install->util-linux \
>        liberation-fonts->fontconfig \
>        cantarell-fonts->fontconfig \
>        gnome-icon-theme->librsvg \
>     diff --git
>     a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
>     <http://initramfs-module-install_1.0.bb>
>     b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
>     <http://initramfs-module-install_1.0.bb>
>     new file mode 100644
>     index 0000000..ce7f165
>     --- /dev/null
>     +++
>     b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
>     <http://initramfs-module-install_1.0.bb>
>     @@ -0,0 +1,20 @@
>     +SUMMARY = "initramfs-framework module for installation option"
>     +LICENSE = "MIT"
>     +LIC_FILES_CHKSUM =
>     "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>     +RDEPENDS_${PN} = "initramfs-framework-base grub parted
>     e2fsprogs-mke2fs util-linux-blkid"
>     +
>     +PR = "r1"
>     +
>     +inherit allarch
>     +
>     +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>     +SRC_URI = "file://init-install.sh"
>     +
>     +S = "${WORKDIR}"
>     +
>     +do_install() {
>     +    install -d ${D}/init.d
>     +    install -m 0755 ${WORKDIR}/init-install.sh ${D}/init.d/install.sh
>     +}
>     +
>     +FILES_${PN} = "/init.d/install.sh"
>     --
>     2.9.5
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


--------------384A23853D935CF644BE61D7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <tt>My bad. I was using initramfs-module-install-efi as a template
      when I shouldn't have.<br>
      <br>
      I see you already sent a patch addressing the issue. Looks good,
      and thanks for that.<br>
      <br>
      ---<br>
      Cal<br>
    </tt><br>
    <div class="moz-cite-prefix">On 12/01/2017 01:01 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQe+qJCwz3dyYh51Pr8Gum5L0wt3VDqrTxs+a36cbOyzYQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Why does it inherit allarch when it depends on
        TUNE_PKGARCH grub and other packages?
        <div><br>
        </div>
        <div>Also it should repect the restrictions which are in grub
          recipe:</div>
        <div>
          <div><br>
          </div>
          <div>COMPATIBLE_HOST =
            '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'</div>
          <div>COMPATIBLE_HOST_armv7a = 'null'</div>
          <div>COMPATIBLE_HOST_armv7ve = 'null'</div>
        </div>
        <div><br>
        </div>
        <div>because without it it adds new ERROR to "bitbake world":</div>
        <div>
          <div>ERROR: Nothing RPROVIDES 'grub' (but
            oe-core/meta/recipes-core/initrdscripts/<a
              href="http://initramfs-module-install_1.0.bb"
              moz-do-not-send="true">initramfs-module-install_1.0.bb</a>
            RDEPENDS on or otherwise requires it)</div>
          <div>grub was skipped: incompatible with host
            arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)</div>
          <div>grub was skipped: incompatible with host
            arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)</div>
          <div>NOTE: Runtime target 'grub' is unbuildable, removing...</div>
          <div>Missing or unbuildable dependency chain was: ['grub']</div>
          <div>ERROR: Required build target 'meta-world-pkgdata' has no
            buildable providers.</div>
        </div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Tue, Nov 14, 2017 at 11:03 PM,
          California Sullivan <span dir="ltr">&lt;<a
              href="mailto:california.l.sullivan@intel.com"
              target="_blank" moz-do-not-send="true">california.l.sullivan@intel.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
              class="">The non-EFI counterpart for installation was
              previously missing for<br>
              initramfs-framework. This simply puts the normal install
              script in the<br>
              correct location for initramfs-framework to make use of
              it.<br>
              <br>
            </span><span class="">Signed-off-by: California Sullivan
              &lt;<a href="mailto:california.l.sullivan@intel.com"
                moz-do-not-send="true">california.l.sullivan@intel.<wbr>com</a>&gt;<br>
              ---<br>
            </span>V2 changes:<br>
            * Add the module's dependencies to
            SIGGEN_EXCLUDE_SAFE_RECIPE_<wbr>DEPS, since<br>
              its dependencies changing don't matter in regards building
            the package.<br>
            * PR = "r1" since its a new recipe.<br>
            <br>
             meta/conf/layer.conf                                 |  4
            ++++<br>
             .../initrdscripts/<a
              href="http://initramfs-module-install_1.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">initramfs-<wbr>module-install_1.0.bb</a> 
              | 20 ++++++++++++++++++++<br>
             2 files changed, 24 insertions(+)<br>
             create mode 100644 meta/recipes-core/<wbr>initrdscripts/<a
              href="http://initramfs-module-install_1.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">initramfs-<wbr>module-install_1.0.bb</a><br>
            <br>
            diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf<br>
            index 0342324..6782058 100644<br>
            --- a/meta/conf/layer.conf<br>
            +++ b/meta/conf/layer.conf<br>
            @@ -57,6 +57,10 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_<wbr>DEPS += "
            \<br>
               initramfs-module-install-efi-&gt;<wbr>e2fsprogs \<br>
               initramfs-module-install-efi-&gt;<wbr>parted \<br>
               initramfs-module-install-efi-&gt;<wbr>util-linux \<br>
            +  initramfs-module-install-&gt;<wbr>e2fsprogs \<br>
            +  initramfs-module-install-&gt;grub \<br>
            +  initramfs-module-install-&gt;<wbr>parted \<br>
            +  initramfs-module-install-&gt;<wbr>util-linux \<br>
               liberation-fonts-&gt;fontconfig \<br>
               cantarell-fonts-&gt;fontconfig \<br>
               gnome-icon-theme-&gt;librsvg \<br>
            <span class="">diff --git a/meta/recipes-core/<wbr>initrdscripts/<a
                href="http://initramfs-module-install_1.0.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">initramfs-<wbr>module-install_1.0.bb</a>
              b/meta/recipes-core/<wbr>initrdscripts/<a
                href="http://initramfs-module-install_1.0.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">initramfs-<wbr>module-install_1.0.bb</a><br>
              new file mode 100644<br>
            </span>index 0000000..ce7f165<br>
            <span class="">--- /dev/null<br>
              +++ b/meta/recipes-core/<wbr>initrdscripts/<a
                href="http://initramfs-module-install_1.0.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">initramfs-<wbr>module-install_1.0.bb</a><br>
              @@ -0,0 +1,20 @@<br>
              +SUMMARY = "initramfs-framework module for installation
              option"<br>
              +LICENSE = "MIT"<br>
              +LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://$">file://$</a>{COREBASE}/meta/<wbr>COPYING.MIT;md5=<wbr>3da9cfbcb788c80a0384361b4de204<wbr>20"<br>
              +RDEPENDS_${PN} = "initramfs-framework-base grub parted
              e2fsprogs-mke2fs util-linux-blkid"<br>
              +<br>
            </span>+PR = "r1"<br>
            <div class="HOEnZb">
              <div class="h5">+<br>
                +inherit allarch<br>
                +<br>
                +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"<br>
                +SRC_URI = <a class="moz-txt-link-rfc2396E" href="file://init-install.sh">"file://init-install.sh"</a><br>
                +<br>
                +S = "${WORKDIR}"<br>
                +<br>
                +do_install() {<br>
                +    install -d ${D}/init.d<br>
                +    install -m 0755 ${WORKDIR}/init-install.sh
                ${D}/init.d/install.sh<br>
                +}<br>
                +<br>
                +FILES_${PN} = "/init.d/install.sh"<br>
                --<br>
                2.9.5<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------384A23853D935CF644BE61D7--
