Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EAD0060745
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 22:34:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 12 Jan 2017 14:34:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,220,1477983600"; 
	d="scan'208,217";a="808217396"
Received: from aehernan-mobl1.zpn.intel.com (HELO [10.219.5.166])
	([10.219.5.166])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jan 2017 14:34:51 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: "Ylinen, Mikko" <mikko.ylinen@intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
	<aff775fa6d3760d628b28276840a306f906347a6.1484164023.git.alejandro.hernandez@linux.intel.com>
	<CAHZ0fbEWJcA_rhrgSiKOaU01cN6wVr=r5UsJq6oqpo6WARB_4A@mail.gmail.com>
Message-ID: <c551dfe0-251a-25e4-8284-42b0c25886e1@linux.intel.com>
Date: Thu, 12 Jan 2017 16:34:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAHZ0fbEWJcA_rhrgSiKOaU01cN6wVr=r5UsJq6oqpo6WARB_4A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/7] image-live-artifacts: Add support for creating image artifacts only
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
X-List-Received-Date: Thu, 12 Jan 2017 22:34:52 -0000
Content-Type: multipart/alternative;
	boundary="------------257AED137F87081D0499DDB6"

--------------257AED137F87081D0499DDB6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Mikko


On 01/12/2017 06:52 AM, Ylinen, Mikko wrote:
>
>
> On Wed, Jan 11, 2017 at 9:55 PM, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     From: Tom Zanussi <tom.zanussi@linux.intel.com
>     <mailto:tom.zanussi@linux.intel.com>>
>
>     Rather than create an actual image, just put the image artifacts in an
>     'artifacts' directory that can then be picked up by wic.
>
I thought about changing it to boot-artifacts-only, but once I did, 
since it is based on image-live the code looked more confusing in my 
opinion.
Also, we wanted what image-live does  in some parts, in this case 
do_bootimg, but we also avoid other things from image-live.
>
> This is a desired goal now that wic is more widely used. However, any 
> particular
> reason why the implementation talks about "live" and copies what the 
> live image
> do_bootimg gives?
>
>     Signed-off-by: Alejandro Hernandez
>     <alejandro.hernandez@linux.intel.com
>     <mailto:alejandro.hernandez@linux.intel.com>>
>     Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com
>     <mailto:tom.zanussi@linux.intel.com>>
>     ---
>      meta/classes/image-live-artifacts.bbclass | 40
>     +++++++++++++++++++++++++++++++
>      meta/classes/image.bbclass                |  3 +++
>      meta/classes/image_types.bbclass          |  2 ++
>      3 files changed, 45 insertions(+)
>      create mode 100644 meta/classes/image-live-artifacts.bbclass
>
>     diff --git a/meta/classes/image-live-artifacts.bbclass
>     b/meta/classes/image-live-artifacts.bbclass
>     new file mode 100644
>     index 0000000..1501a9b
>     --- /dev/null
>     +++ b/meta/classes/image-live-artifacts.bbclass
>     @@ -0,0 +1,40 @@
>     +# Create the artifacts only on an ARTIFACTS_DIR,
>     +# which can be later picked up by wic
>     +
>     +inherit live-vm-common
>     +
>     +do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
>
>
Again, this was thought based on what image-live does, I'm not saying I 
disagree with you regarding handling the dependencies, but in this case 
you're saying you have the same issue with image-live?

> perhaps have 'do_image_artifacts' and let users/other classes set 
> additional dependencies.
>
>     +                   mtools-native:do_populate_sysroot \
>     +                        cdrtools-native:do_populate_sysroot \
>     +                        virtual/kernel:do_deploy \
>     +                        ${MLPREFIX}syslinux:do_populate_sysroot \
>     +                        syslinux-native:do_populate_sysroot \
>
>
> For example, if I use systemd-boot I don't need syslinux built at all. 
> The EFI_CLASS/PCBIOS_CLASS
> could define the additional depends here (like they are currently 
> doing for bootimg/bootdirectdisk).
>
> The defaults should be just kernel and initrd(s) (if defined).
>
>     +                   ${@oe.utils.ifelse(d.getVar('COMPRESSISO',
>     False),'zisofs-tools-native:do_populate_sysroot','')} \
>     +                        "
>     +
>     +
>     +LABELS_LIVE ?= "boot install"
>     +
>     +ARTIFACTS_DIR = "${DEPLOY_DIR_IMAGE}/artifacts"
>     +
>     +populate_bootloader() {
>     +       populate_kernel ${ARTIFACTS_DIR}
>     +
>     +       if [ "${PCBIOS}" = "1" ]; then
>     +               syslinux_hddimg_populate ${ARTIFACTS_DIR}
>     +       fi
>     +       if [ "${EFI}" = "1" ]; then
>     +               efi_hddimg_populate ${ARTIFACTS_DIR}
>     +       fi
>     +}
>     +
>     +python do_bootimg() {
>     +    set_live_vm_vars(d, 'LIVE')
>     +    if d.getVar("PCBIOS", True) == "1":
>     +        bb.build.exec_func('build_syslinux_cfg', d)
>     +    if d.getVar("EFI", True) == "1":
>     +        bb.build.exec_func('build_efi_cfg', d)
>     +    bb.build.exec_func('populate_bootloader', d)
>     +}
>     +
>     +addtask bootimg before do_image_complete
>     diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>     index 04fd5f9..fd249c8 100644
>     --- a/meta/classes/image.bbclass
>     +++ b/meta/classes/image.bbclass
>     @@ -130,6 +130,9 @@ do_rootfs[vardeps] += "${@rootfs_variables(d)}"
>      do_build[depends] += "virtual/kernel:do_deploy"
>
>      def build_live(d):
>     +    if bb.utils.contains("IMAGE_FSTYPES", "live-artifacts-only",
>     "live-artifacts-only", "0", d) == "live-artifacts-only":
>     +         return "image-live-artifacts"
>
>
Not as far as I know, but so that would work when building something AND 
the artifacts, but what if you want to build the artifacts only?, you 
would have to build everything else as well wouldn't you?

I'm trying to think if this change is not more related to actually 
changing image-live, but I could be misunderstanding things
> Is there a need for the image artifacts for other than wic? It could 
> be made so that if wic is in IMAGE_FSTYPES,
> image-artifacts are built by default. This means the logic of 
> inheriting image-artifacts has a better place, e.g.,
> in it's own build_wic() check.
>
> -- Mikko


--------------257AED137F87081D0499DDB6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Hey Mikko<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/12/2017 06:52 AM, Ylinen, Mikko
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHZ0fbEWJcA_rhrgSiKOaU01cN6wVr=r5UsJq6oqpo6WARB_4A@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Wed, Jan 11, 2017 at 9:55 PM,
            Alejandro Hernandez <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:alejandro.hernandez@linux.intel.com"
                target="_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
              Tom Zanussi &lt;<a moz-do-not-send="true"
                href="mailto:tom.zanussi@linux.intel.com">tom.zanussi@linux.intel.com</a>&gt;<br>
              <br>
              Rather than create an actual image, just put the image
              artifacts in an<br>
              'artifacts' directory that can then be picked up by wic.<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    I thought about changing it to boot-artifacts-only, but once I did,
    since it is based on image-live the code looked more confusing in my
    opinion.<br>
    Also, we wanted what image-live does  in some parts, in this case
    do_bootimg, but we also avoid other things from image-live.<br>
    <blockquote
cite="mid:CAHZ0fbEWJcA_rhrgSiKOaU01cN6wVr=r5UsJq6oqpo6WARB_4A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>This is a desired goal now that wic is more widely
              used. However, any particular</div>
            <div>reason why the implementation talks about "live" and
              copies what the live image</div>
            <div>do_bootimg gives? </div>
            <div> <br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              Signed-off-by: Alejandro Hernandez &lt;<a
                moz-do-not-send="true"
                href="mailto:alejandro.hernandez@linux.intel.com">alejandro.hernandez@linux.<wbr>intel.com</a>&gt;<br>
              Signed-off-by: Tom Zanussi &lt;<a moz-do-not-send="true"
                href="mailto:tom.zanussi@linux.intel.com">tom.zanussi@linux.intel.com</a>&gt;<br>
              ---<br>
               meta/classes/image-live-<wbr>artifacts.bbclass | 40
              ++++++++++++++++++++++++++++++<wbr>+<br>
               meta/classes/image.bbclass                |  3 +++<br>
               meta/classes/image_types.<wbr>bbclass          |  2 ++<br>
               3 files changed, 45 insertions(+)<br>
               create mode 100644 meta/classes/image-live-<wbr>artifacts.bbclass<br>
              <br>
              diff --git a/meta/classes/image-live-<wbr>artifacts.bbclass
              b/meta/classes/image-live-<wbr>artifacts.bbclass<br>
              new file mode 100644<br>
              index 0000000..1501a9b<br>
              --- /dev/null<br>
              +++ b/meta/classes/image-live-<wbr>artifacts.bbclass<br>
              @@ -0,0 +1,40 @@<br>
              +# Create the artifacts only on an ARTIFACTS_DIR,<br>
              +# which can be later picked up by wic<br>
              +<br>
              +inherit live-vm-common<br>
              +<br>
              +do_bootimg[depends] += "dosfstools-native:do_<wbr>populate_sysroot
              \<br>
            </blockquote>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Again, this was thought based on what image-live does, I'm not
    saying I disagree with you regarding handling the dependencies, but
    in this case you're saying you have the same issue with image-live?<br>
    <br>
    <blockquote
cite="mid:CAHZ0fbEWJcA_rhrgSiKOaU01cN6wVr=r5UsJq6oqpo6WARB_4A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>perhaps have 'do_image_artifacts' and let users/other
              classes set additional dependencies.</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"> +     
                                mtools-native:do_populate_<wbr>sysroot \<br>
              +                        cdrtools-native:do_populate_<wbr>sysroot
              \<br>
              +                        virtual/kernel:do_deploy \<br>
              +                        ${MLPREFIX}syslinux:do_<wbr>populate_sysroot
              \<br>
              +                        syslinux-native:do_populate_<wbr>sysroot
              \<br>
            </blockquote>
            <div><br>
            </div>
            <div>For example, if I use systemd-boot I don't need
              syslinux built at all. The EFI_CLASS/PCBIOS_CLASS</div>
            <div>could define the additional depends here (like they are
              currently doing for bootimg/bootdirectdisk).</div>
            <div><br>
            </div>
            <div>The defaults should be just kernel and initrd(s) (if
              defined).</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"> +     
                                ${@oe.utils.ifelse(d.getVar('<wbr>COMPRESSISO',
              False),'zisofs-tools-native:<wbr>do_populate_sysroot','')}
              \<br>
              +                        "<br>
              +<br>
              +<br>
              +LABELS_LIVE ?= "boot install"<br>
              +<br>
              +ARTIFACTS_DIR = "${DEPLOY_DIR_IMAGE}/<wbr>artifacts"<br>
              +<br>
              +populate_bootloader() {<br>
              +       populate_kernel ${ARTIFACTS_DIR}<br>
              +<br>
              +       if [ "${PCBIOS}" = "1" ]; then<br>
              +               syslinux_hddimg_populate ${ARTIFACTS_DIR}<br>
              +       fi<br>
              +       if [ "${EFI}" = "1" ]; then<br>
              +               efi_hddimg_populate ${ARTIFACTS_DIR}<br>
              +       fi<br>
              +}<br>
              +<br>
              +python do_bootimg() {<br>
              +    set_live_vm_vars(d, 'LIVE')<br>
              +    if d.getVar("PCBIOS", True) == "1":<br>
              +        bb.build.exec_func('build_<wbr>syslinux_cfg', d)<br>
              +    if d.getVar("EFI", True) == "1":<br>
              +        bb.build.exec_func('build_efi_<wbr>cfg', d)<br>
              +    bb.build.exec_func('populate_<wbr>bootloader', d)<br>
              +}<br>
              +<br>
              +addtask bootimg before do_image_complete<br>
              diff --git a/meta/classes/image.bbclass
              b/meta/classes/image.bbclass<br>
              index 04fd5f9..fd249c8 100644<br>
              --- a/meta/classes/image.bbclass<br>
              +++ b/meta/classes/image.bbclass<br>
              @@ -130,6 +130,9 @@ do_rootfs[vardeps] +=
              "${@rootfs_variables(d)}"<br>
               do_build[depends] += "virtual/kernel:do_deploy"<br>
              <br>
               def build_live(d):<br>
              +    if bb.utils.contains("IMAGE_<wbr>FSTYPES",
              "live-artifacts-only", "live-artifacts-only", "0", d) ==
              "live-artifacts-only":<br>
              +         return "image-live-artifacts"<br>
            </blockquote>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Not as far as I know, but so that would work when building something
    AND the artifacts, but what if you want to build the artifacts
    only?, you would have to build everything else as well wouldn't you?<br>
    <br>
    I'm trying to think if this change is not more related to actually
    changing image-live, but I could be misunderstanding things<br>
    <blockquote
cite="mid:CAHZ0fbEWJcA_rhrgSiKOaU01cN6wVr=r5UsJq6oqpo6WARB_4A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>Is there a need for the image artifacts for other than
              wic? It could be made so that if wic is in IMAGE_FSTYPES,</div>
            <div>image-artifacts are built by default. This means the
              logic of inheriting image-artifacts has a better place,
              e.g.,</div>
            <div>in it's own build_wic() check.</div>
            <div><br>
            </div>
            <div>-- Mikko</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------257AED137F87081D0499DDB6--
