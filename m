Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 534187E950
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 14:25:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7JEPqWO017742
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Aug 2019 07:25:52 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 19 Aug 2019 07:25:51 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <1566221602-123706-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj9y6uP-=iSDLj=wQ-LTuAgBTsHL7F84eiCSs8=aycjZMg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <0ff6e267-1659-ea55-cfc9-ce07da934511@windriver.com>
Date: Mon, 19 Aug 2019 22:25:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9y6uP-=iSDLj=wQ-LTuAgBTsHL7F84eiCSs8=aycjZMg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: decreasing default RLIMIT_NOFILE on qemu bsp
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
X-List-Received-Date: Mon, 19 Aug 2019 14:25:54 -0000
Content-Type: multipart/alternative;
	boundary="------------1D8445887095AC733C98F803"
Content-Language: en-US

--------------1D8445887095AC733C98F803
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 8/19/19 10:01 PM, Alexander Kanavin wrote:
> Should the limit be simply raised? The 256M setup is crumbling on 
> several fronts (runtime tests, modernisation of X, various non-x86 
> qemu targets). Adding per-image/target exceptions, custom 
> non-upstreamable patches, or sticking to deprecated configurations 
> isn't the right thing to do, I think.
>
The modification of set default RLIMIT_NOFILE(4k) just keeps sync with 
the one in sysvinit,

if the fronts you mentioned are working fine on sysvinit, I think it 
should be OK on systemd

but whether it has side effect or not still depends on the result of 
image test


The fix is trying to fix the blocking issue while switching init manager 
from sysvinit to systemd for poky


Hi RP,

Should we make HIGH_RLIMIT_NOFILE configurable from local.conf?

Then we could modify it according to the requirement, such as set it to 
4k at image test

//Hongxu

>
> Alex
>
> On Mon, 19 Aug 2019 at 15:34, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     Since do_testimage for core-image-sato-sdk has memory limitation
>     (256Mib)
>     which caused rpc.statd failed with out of memory.
>     [  531.306146] Out of memory: Kill process 193 (rpc.statd) score
>     200 or sacrifice child
>
>     The rpc.statd allocates memory according to RLIMIT_NOFILE,
>     so decrease it to 4k to keep sync with sysvinit
>
>     After applying the patch, the memory cost is the same with sysvinit
>     rpcuser    340  0.0  1.0   3212  2588 ?        Ss   13:20  0:00
>     /usr/sbin/rpc.statd -F
>     root       473  0.0  0.2   3464   496 ?        Ss   13:23  0:00
>     /usr/sbin/rpc.mountd
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      ...0001-decreasing-the-default-RLIMIT_NOFILE.patch | 35
>     ++++++++++++++++++++++
>      meta/recipes-core/systemd/systemd_242.bb <http://systemd_242.bb>
>              |  4 +++
>      2 files changed, 39 insertions(+)
>      create mode 100644
>     meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
>     b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
>     new file mode 100644
>     index 0000000..fb8e2c9
>     --- /dev/null
>     +++
>     b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
>     @@ -0,0 +1,35 @@
>     +From 55c7196163e481c508fa708b9b8f5e7bf2d2f007 Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Date: Mon, 19 Aug 2019 07:16:47 -0400
>     +Subject: [PATCH] decreasing the default RLIMIT_NOFILE
>     +
>     +Since do_testimage for core-image-sato-sdk has memory limits (256Mib)
>     +which caused rpc.statd failed with out of memory.
>     +[  531.306146] Out of memory: Kill process 193 (rpc.statd) score
>     200 or sacrifice child
>     +
>     +The rpc.statd allocates memory according to RLIMIT_NOFILE,
>     +so decrease it to 4k which keep sync with sysvinit
>     +
>     +Upstream-Status: Inappropriate [oe specific]
>     +
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + meson.build | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/meson.build b/meson.build
>     +index 18a7cc5..e30894b 100644
>     +--- a/meson.build
>     ++++ b/meson.build
>     +@@ -79,7 +79,7 @@ conf.set10('HAVE_SYSV_COMPAT', sysvinit_path !=
>     '' and sysvrcnd_path != '',
>     +
>     + conf.set10('BUMP_PROC_SYS_FS_FILE_MAX',
>     get_option('bump-proc-sys-fs-file-max'))
>     + conf.set10('BUMP_PROC_SYS_FS_NR_OPEN',
>     get_option('bump-proc-sys-fs-nr-open'))
>     +-conf.set('HIGH_RLIMIT_NOFILE',          512*1024)
>     ++conf.set('HIGH_RLIMIT_NOFILE',          4*1024)
>     +
>     + # join_paths ignores the preceding arguments if an absolute
>     component is
>     + # encountered, so this should canonicalize various paths when
>     they are
>     +--
>     +2.8.1
>     +
>     diff --git a/meta/recipes-core/systemd/systemd_242.bb
>     <http://systemd_242.bb> b/meta/recipes-core/systemd/systemd_242.bb
>     <http://systemd_242.bb>
>     index 1953fef..ab15ad2 100644
>     --- a/meta/recipes-core/systemd/systemd_242.bb <http://systemd_242.bb>
>     +++ b/meta/recipes-core/systemd/systemd_242.bb <http://systemd_242.bb>
>     @@ -58,6 +58,10 @@ SRC_URI_MUSL =
>     "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
>     <http://available.pa>
>     file://0001-do-not-disable-buffer-in-writing-files.patch \
>                     "
>
>     +SRC_URI_append_qemuall = " \
>     +  file://0001-decreasing-the-default-RLIMIT_NOFILE.patch \
>     +"
>     +
>      PAM_PLUGINS = " \
>          pam-plugin-unix \
>          pam-plugin-loginuid \
>     -- 
>     2.8.1
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------1D8445887095AC733C98F803
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 8/19/19 10:01 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj9y6uP-=iSDLj=wQ-LTuAgBTsHL7F84eiCSs8=aycjZMg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Should the limit be simply raised? The 256M setup is
          crumbling on several fronts (runtime tests, modernisation of
          X, various non-x86 qemu targets). Adding per-image/target
          exceptions, custom non-upstreamable patches, or sticking to
          deprecated configurations isn't the right thing to do, I
          think.<br>
        </div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <p>The modification of set default RLIMIT_NOFILE(4k) just keeps sync
      with the one in sysvinit,</p>
    <p>if the fronts you mentioned are working fine on sysvinit, I think
      it should be OK on systemd<br>
    </p>
    <p>but whether it has side effect or not still depends on the result
      of image test</p>
    <p><br>
    </p>
    <p>The fix is trying to fix the blocking issue while switching init
      manager from sysvinit to systemd for poky</p>
    <p><br>
    </p>
    <p>Hi RP,</p>
    <p>Should we make HIGH_RLIMIT_NOFILE configurable from local.conf?</p>
    <p>Then we could modify it according to the requirement, such as set
      it to 4k at image test <br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj9y6uP-=iSDLj=wQ-LTuAgBTsHL7F84eiCSs8=aycjZMg@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, 19 Aug 2019 at 15:34,
          Hongxu Jia &lt;<a href="mailto:hongxu.jia@windriver.com"
            target="_blank" moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since
          do_testimage for core-image-sato-sdk has memory limitation
          (256Mib)<br>
          which caused rpc.statd failed with out of memory.<br>
          [  531.306146] Out of memory: Kill process 193 (rpc.statd)
          score 200 or sacrifice child<br>
          <br>
          The rpc.statd allocates memory according to RLIMIT_NOFILE,<br>
          so decrease it to 4k to keep sync with sysvinit<br>
          <br>
          After applying the patch, the memory cost is the same with
          sysvinit<br>
          rpcuser    340  0.0  1.0   3212  2588 ?        Ss   13:20 
           0:00 /usr/sbin/rpc.statd -F<br>
          root       473  0.0  0.2   3464   496 ?        Ss   13:23 
           0:00 /usr/sbin/rpc.mountd<br>
          <br>
          Signed-off-by: Hongxu Jia &lt;<a
            href="mailto:hongxu.jia@windriver.com" target="_blank"
            moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
          ---<br>
           ...0001-decreasing-the-default-RLIMIT_NOFILE.patch | 35
          ++++++++++++++++++++++<br>
           meta/recipes-core/systemd/<a href="http://systemd_242.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">systemd_242.bb</a> 
                   |  4 +++<br>
           2 files changed, 39 insertions(+)<br>
           create mode 100644
meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch<br>
          <br>
          diff --git
a/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch<br>
          new file mode 100644<br>
          index 0000000..fb8e2c9<br>
          --- /dev/null<br>
          +++
b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch<br>
          @@ -0,0 +1,35 @@<br>
          +From 55c7196163e481c508fa708b9b8f5e7bf2d2f007 Mon Sep 17
          00:00:00 2001<br>
          +From: Hongxu Jia &lt;<a
            href="mailto:hongxu.jia@windriver.com" target="_blank"
            moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
          +Date: Mon, 19 Aug 2019 07:16:47 -0400<br>
          +Subject: [PATCH] decreasing the default RLIMIT_NOFILE<br>
          +<br>
          +Since do_testimage for core-image-sato-sdk has memory limits
          (256Mib)<br>
          +which caused rpc.statd failed with out of memory.<br>
          +[  531.306146] Out of memory: Kill process 193 (rpc.statd)
          score 200 or sacrifice child<br>
          +<br>
          +The rpc.statd allocates memory according to RLIMIT_NOFILE,<br>
          +so decrease it to 4k which keep sync with sysvinit<br>
          +<br>
          +Upstream-Status: Inappropriate [oe specific]<br>
          +<br>
          +Signed-off-by: Hongxu Jia &lt;<a
            href="mailto:hongxu.jia@windriver.com" target="_blank"
            moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
          +---<br>
          + meson.build | 2 +-<br>
          + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
          +<br>
          +diff --git a/meson.build b/meson.build<br>
          +index 18a7cc5..e30894b 100644<br>
          +--- a/meson.build<br>
          ++++ b/meson.build<br>
          +@@ -79,7 +79,7 @@ conf.set10('HAVE_SYSV_COMPAT',
          sysvinit_path != '' and sysvrcnd_path != '',<br>
          + <br>
          + conf.set10('BUMP_PROC_SYS_FS_FILE_MAX',
          get_option('bump-proc-sys-fs-file-max'))<br>
          + conf.set10('BUMP_PROC_SYS_FS_NR_OPEN', 
          get_option('bump-proc-sys-fs-nr-open'))<br>
          +-conf.set('HIGH_RLIMIT_NOFILE',          512*1024)<br>
          ++conf.set('HIGH_RLIMIT_NOFILE',          4*1024)<br>
          + <br>
          + # join_paths ignores the preceding arguments if an absolute
          component is<br>
          + # encountered, so this should canonicalize various paths
          when they are<br>
          +-- <br>
          +2.8.1<br>
          +<br>
          diff --git a/meta/recipes-core/systemd/<a
            href="http://systemd_242.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">systemd_242.bb</a>
          b/meta/recipes-core/systemd/<a href="http://systemd_242.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">systemd_242.bb</a><br>
          index 1953fef..ab15ad2 100644<br>
          --- a/meta/recipes-core/systemd/<a
            href="http://systemd_242.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">systemd_242.bb</a><br>
          +++ b/meta/recipes-core/systemd/<a
            href="http://systemd_242.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">systemd_242.bb</a><br>
          @@ -58,6 +58,10 @@ SRC_URI_MUSL =
          "<a class="moz-txt-link-freetext" href="file://0001-Use-getenv-when-secure-versions-are-not">file://0001-Use-getenv-when-secure-versions-are-not</a>-<a
            href="http://available.pa" target="_blank"
            moz-do-not-send="true">available.pa</a><br>
                         
          <a class="moz-txt-link-freetext" href="file://0001-do-not-disable-buffer-in-writing-files.patch">file://0001-do-not-disable-buffer-in-writing-files.patch</a> \<br>
                          "<br>
          <br>
          +SRC_URI_append_qemuall = " \<br>
          +             
           <a class="moz-txt-link-freetext" href="file://0001-decreasing-the-default-RLIMIT_NOFILE.patch">file://0001-decreasing-the-default-RLIMIT_NOFILE.patch</a> \<br>
          +"<br>
          +<br>
           PAM_PLUGINS = " \<br>
               pam-plugin-unix \<br>
               pam-plugin-loginuid \<br>
          -- <br>
          2.8.1<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
          <a
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------1D8445887095AC733C98F803--
