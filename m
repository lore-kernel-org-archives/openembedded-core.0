Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBAD60557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 04:52:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1N4q1Ep016685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 22 Feb 2018 20:52:01 -0800
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 22 Feb 2018 20:51:39 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180222141537.229103-1-hongzhi.song@windriver.com>
	<CAJTo0LaJ6EzLdBSs1K6n2u0O0DEtX8QJEEpdiQcv=vFh50_oyg@mail.gmail.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <f4c13206-896f-58ac-2a94-1de897ee6e9c@windriver.com>
Date: Fri, 23 Feb 2018 12:52:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaJ6EzLdBSs1K6n2u0O0DEtX8QJEEpdiQcv=vFh50_oyg@mail.gmail.com>
X-Originating-IP: [128.224.162.148]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Fri, 23 Feb 2018 04:52:01 -0000
Content-Type: multipart/alternative;
	boundary="------------1B78438EA4F99E6864F749EE"
Content-Language: en-US

--------------1B78438EA4F99E6864F749EE
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

What do you mean "it only happens with libseccomp"? I have tried to 
enable or disable

seccomp via CONFIG_SECCOMP, buf the results were same unless I set 
MountFlags=shared.

Without propagation patch, all block device, such as '/dev/sda*', 
mounted by systemd-udev,

are unaccessible to outside namespace, which means root user cann't use 
'/dev/sda*'. Do you

have any suggestions for me?

Thanks.



On 2018年02月22日 22:25, Burton, Ross wrote:
> We used to have this but it was removed in the 232 upgrade:
>
>     * Drop mount propagation patch, it only happens with libseccomp, 
> OE doesnt
>       enable it
>
> Is this not the case?  Or are you enabling seccomp?  Maybe this should 
> be a bbappend in meta-security?
>
> Ross
>
> On 22 February 2018 at 14:15, Hongzhi.Song <hongzhi.song@windriver.com 
> <mailto:hongzhi.song@windriver.com>> wrote:
>
>     MountFlags's default value is shared in systemd-udevd.service. But
>     upstream
>     sets MountFlags with slave just for keeping mounts done by udev
>     private to
>     udevd, which causes block device mounted by udev unvisable but
>     being busy for
>     host. So we revert it to shared to be propagated to host.
>
>     Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com
>     <mailto:hongzhi.song@windriver.com>>
>     ---
>      ...evd-re-enable-mount-propagation-for-udevd.patch | 33
>     ++++++++++++++++++++++
>      meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb>
>              |  1 +
>      2 files changed, 34 insertions(+)
>      create mode 100644
>     meta/recipes-core/systemd/systemd/systemd-udevd-re-enable-mount-propagation-for-udevd.patch
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/systemd-udevd-re-enable-mount-propagation-for-udevd.patch
>     b/meta/recipes-core/systemd/systemd/systemd-udevd-re-enable-mount-propagation-for-udevd.patch
>     new file mode 100644
>     index 0000000000..fce7bdd796
>     --- /dev/null
>     +++
>     b/meta/recipes-core/systemd/systemd/systemd-udevd-re-enable-mount-propagation-for-udevd.patch
>     @@ -0,0 +1,33 @@
>     +From 11a3312d36109f5e5a7697ddb05c533c51e2cd75 Mon Sep 17 00:00:00
>     2001
>     +From: "Hongzhi.Song" <hongzhi.song@windriver.com
>     <mailto:hongzhi.song@windriver.com>>
>     +Date: Mon, 19 Feb 2018 20:43:02 -0500
>     +Subject: [PATCH] systemd-udevd: re-enable mount propagation for udevd
>     +
>     +Upstream-Status: Inappropriate [embedded specific]
>     +
>     +Change the mount propagation flag from MountFlags=slave to
>     MountFlags=shared
>     +(default). Use shared to ensure that mounts and unmounts are
>     propagated from
>     +systemd's namespace to the service's namespace and vice versa,
>     while use slave
>     +to run processes so that none of their mounts and unmounts will
>     propagate to
>     +the host.
>     +
>     +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com
>     <mailto:hongzhi.song@windriver.com>>
>     +---
>     + units/systemd-udevd.service.in <http://systemd-udevd.service.in>
>     | 1 -
>     + 1 file changed, 1 deletion(-)
>     +
>     +diff --git a/units/systemd-udevd.service.in
>     <http://systemd-udevd.service.in> b/units/systemd-udevd.service.in
>     <http://systemd-udevd.service.in>
>     +index fc037b5..841d7a8 100644
>     +--- a/units/systemd-udevd.service.in
>     <http://systemd-udevd.service.in>
>     ++++ b/units/systemd-udevd.service.in
>     <http://systemd-udevd.service.in>
>     +@@ -24,7 +24,6 @@ ExecStart=@rootlibexecdir@/systemd-udevd
>     + KillMode=mixed
>     + WatchdogSec=3min
>     + TasksMax=infinity
>     +-MountFlags=slave
>     + MemoryDenyWriteExecute=yes
>     + RestrictRealtime=yes
>     + RestrictAddressFamilies=AF_UNIX AF_NETLINK AF_INET AF_INET6
>     +--
>     +2.8.1
>     +
>     diff --git a/meta/recipes-core/systemd/systemd_234.bb
>     <http://systemd_234.bb> b/meta/recipes-core/systemd/systemd_234.bb
>     <http://systemd_234.bb>
>     index babc351cc8..42f4f1ec76 100644
>     --- a/meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb>
>     +++ b/meta/recipes-core/systemd/systemd_234.bb <http://systemd_234.bb>
>     @@ -32,6 +32,7 @@ SRC_URI += " \
>                
>     file://0001-main-skip-many-initialization-steps-when-running-in-.patch
>     \
>                 file://CVE-2017-18078.patch \
>                
>     file://0001-resolved-fix-loop-on-packets-with-pseudo-dns-types.patch \
>     +         
>     file://systemd-udevd-re-enable-mount-propagation-for-udevd.patch \
>                 "
>      SRC_URI_append_qemuall = "
>     file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>
>     --
>     2.13.3
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


--------------1B78438EA4F99E6864F749EE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>What do you mean "it only happens with libseccomp"? I have tried
      to enable or disable <br>
    </p>
    <p>seccomp via CONFIG_SECCOMP, buf the results were same unless I
      set MountFlags=shared.</p>
    <p>Without propagation patch, all block device, such as '/dev/sda*',
      mounted by systemd-udev, <br>
    </p>
    <p>are unaccessible to outside namespace, which means root user
      cann't use '/dev/sda*'. Do you <br>
    </p>
    <p>have any suggestions for me?</p>
    <p>Thanks.<br>
    </p>
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2018年02月22日 22:25, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LaJ6EzLdBSs1K6n2u0O0DEtX8QJEEpdiQcv=vFh50_oyg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">We used to have this but it was removed in the 232
        upgrade:
        <div><br>
        </div>
        <div>
          <div>    * Drop mount propagation patch, it only happens with
            libseccomp, OE doesnt</div>
          <div>      enable it</div>
        </div>
        <div><br>
        </div>
        <div>Is this not the case?  Or are you enabling seccomp?  Maybe
          this should be a bbappend in meta-security?</div>
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 22 February 2018 at 14:15,
          Hongzhi.Song <span dir="ltr">&lt;<a
              href="mailto:hongzhi.song@windriver.com" target="_blank"
              moz-do-not-send="true">hongzhi.song@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">MountFlags's
            default value is shared in systemd-udevd.service. But
            upstream<br>
            sets MountFlags with slave just for keeping mounts done by
            udev private to<br>
            udevd, which causes block device mounted by udev unvisable
            but being busy for<br>
            host. So we revert it to shared to be propagated to host.<br>
            <br>
            Signed-off-by: Hongzhi.Song &lt;<a
              href="mailto:hongzhi.song@windriver.com"
              moz-do-not-send="true">hongzhi.song@windriver.com</a>&gt;<br>
            ---<br>
             ...evd-re-enable-mount-<wbr>propagation-for-udevd.patch |
            33 ++++++++++++++++++++++<br>
             meta/recipes-core/systemd/<a href="http://systemd_234.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">syst<wbr>emd_234.bb</a> 
                     |  1 +<br>
             2 files changed, 34 insertions(+)<br>
             create mode 100644 meta/recipes-core/systemd/<wbr>systemd/systemd-udevd-re-<wbr>enable-mount-propagation-for-<wbr>udevd.patch<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<wbr>systemd/systemd-udevd-re-<wbr>enable-mount-propagation-for-<wbr>udevd.patch
            b/meta/recipes-core/systemd/<wbr>systemd/systemd-udevd-re-<wbr>enable-mount-propagation-for-<wbr>udevd.patch<br>
            new file mode 100644<br>
            index 0000000000..fce7bdd796<br>
            --- /dev/null<br>
            +++ b/meta/recipes-core/systemd/<wbr>systemd/systemd-udevd-re-<wbr>enable-mount-propagation-for-<wbr>udevd.patch<br>
            @@ -0,0 +1,33 @@<br>
            +From 11a3312d36109f5e5a7697ddb05c53<wbr>3c51e2cd75 Mon Sep
            17 00:00:00 2001<br>
            +From: "Hongzhi.Song" &lt;<a
              href="mailto:hongzhi.song@windriver.com"
              moz-do-not-send="true">hongzhi.song@windriver.com</a>&gt;<br>
            +Date: Mon, 19 Feb 2018 20:43:02 -0500<br>
            +Subject: [PATCH] systemd-udevd: re-enable mount propagation
            for udevd<br>
            +<br>
            +Upstream-Status: Inappropriate [embedded specific]<br>
            +<br>
            +Change the mount propagation flag from MountFlags=slave to
            MountFlags=shared<br>
            +(default). Use shared to ensure that mounts and unmounts
            are propagated from<br>
            +systemd's namespace to the service's namespace and vice
            versa, while use slave<br>
            +to run processes so that none of their mounts and unmounts
            will propagate to<br>
            +the host.<br>
            +<br>
            +Signed-off-by: Hongzhi.Song &lt;<a
              href="mailto:hongzhi.song@windriver.com"
              moz-do-not-send="true">hongzhi.song@windriver.com</a>&gt;<br>
            +---<br>
            + units/<a href="http://systemd-udevd.service.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">systemd-udevd.service.in</a>
            | 1 -<br>
            + 1 file changed, 1 deletion(-)<br>
            +<br>
            +diff --git a/units/<a
              href="http://systemd-udevd.service.in" rel="noreferrer"
              target="_blank" moz-do-not-send="true">systemd-udevd.service.<wbr>in</a>
            b/units/<a href="http://systemd-udevd.service.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">systemd-udevd.service.<wbr>in</a><br>
            +index fc037b5..841d7a8 100644<br>
            +--- a/units/<a href="http://systemd-udevd.service.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">systemd-udevd.service.<wbr>in</a><br>
            ++++ b/units/<a href="http://systemd-udevd.service.in"
              rel="noreferrer" target="_blank" moz-do-not-send="true">systemd-udevd.service.<wbr>in</a><br>
            +@@ -24,7 +24,6 @@ ExecStart=@rootlibexecdir@/<wbr>systemd-udevd<br>
            + KillMode=mixed<br>
            + WatchdogSec=3min<br>
            + TasksMax=infinity<br>
            +-MountFlags=slave<br>
            + MemoryDenyWriteExecute=yes<br>
            + RestrictRealtime=yes<br>
            + RestrictAddressFamilies=AF_<wbr>UNIX AF_NETLINK AF_INET
            AF_INET6<br>
            +--<br>
            +2.8.1<br>
            +<br>
            diff --git a/meta/recipes-core/systemd/<a
              href="http://systemd_234.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">sy<wbr>stemd_234.bb</a>
            b/meta/recipes-core/systemd/<a href="http://systemd_234.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">sy<wbr>stemd_234.bb</a><br>
            index babc351cc8..42f4f1ec76 100644<br>
            --- a/meta/recipes-core/systemd/<a
              href="http://systemd_234.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">sy<wbr>stemd_234.bb</a><br>
            +++ b/meta/recipes-core/systemd/<a
              href="http://systemd_234.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">sy<wbr>stemd_234.bb</a><br>
            @@ -32,6 +32,7 @@ SRC_URI += " \<br>
                        <a class="moz-txt-link-freetext" href="file://0001-main-skip-many">file://0001-main-skip-many</a>-<wbr>initialization-steps-when-<wbr>running-in-.patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://CVE-2017-18078.patch">file://CVE-2017-18078.patch</a> \<br>
                        <a class="moz-txt-link-freetext" href="file://0001-resolved-fix-loop">file://0001-resolved-fix-loop</a>-<wbr>on-packets-with-pseudo-dns-<wbr>types.patch
            \<br>
            +          <a class="moz-txt-link-freetext" href="file://systemd-udevd-re">file://systemd-udevd-re</a>-<wbr>enable-mount-propagation-for-<wbr>udevd.patch
            \<br>
                        "<br>
             SRC_URI_append_qemuall = " <a class="moz-txt-link-freetext" href="file://0001-core-device.c">file://0001-core-device.c</a>-<wbr>Change-the-default-device-<wbr>timeout-to-2.patch"<br>
            <span class="HOEnZb"><font color="#888888"><br>
                --<br>
                2.13.3<br>
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
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------1B78438EA4F99E6864F749EE--
