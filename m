Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A71E478278
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 06:32:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBK6X0RW007939
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Dec 2017 22:33:00 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 19 Dec 2017 22:32:59 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1513300719-10186-1-git-send-email-yi.zhao@windriver.com>
	<1513300719-10186-2-git-send-email-yi.zhao@windriver.com>
	<CAJTo0Lb-=cwFZpFmnmxVnT+4nqM0U5L5zaLtFjum2u7fbBkAJQ@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <7dcacc40-a871-1c66-60f9-500040e0358d@windriver.com>
Date: Wed, 20 Dec 2017 14:31:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb-=cwFZpFmnmxVnT+4nqM0U5L5zaLtFjum2u7fbBkAJQ@mail.gmail.com>
X-Originating-IP: [128.224.162.134]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] hdparm: replace stat with coreutils as runtime dependency
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
X-List-Received-Date: Wed, 20 Dec 2017 06:32:59 -0000
Content-Type: multipart/alternative;
	boundary="------------F4C43051BDEBC80143A9678A"
Content-Language: en-US

--------------F4C43051BDEBC80143A9678A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ross,


在 2017年12月18日 21:02, Burton, Ross 写道:
> Does it really need coreutils stat, or is busybox's stat sufficient?

It uses "--format" option with stat, but busybox.stat doesn't support 
this option that would cause an error:
# stat --format="%04D" /
stat: unrecognized option '--format=%04D'

So we still need coreutils stat.


Regards,
Yi
>
> Ross
>
> On 15 December 2017 at 01:18, Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>> wrote:
>
>     Currently only hdparm specifies stat as runtime dependency in oe-core.
>     But the stat hasn't any update since 2002. Replace it with
>     coreutils as
>     runtime dependency since coreutils also provides stat program. Then we
>     can drop the stat recipe totally.
>
>     Also add a patch to fix stat path in wiper.sh.
>
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com
>     <mailto:yi.zhao@windriver.com>>
>     ---
>      .../hdparm/hdparm/wiper.sh-fix-stat-path.patch     | 38
>     ++++++++++++++++++++++
>      meta/recipes-extended/hdparm/hdparm_9.52.bb
>     <http://hdparm_9.52.bb>       |  6 ++--
>      2 files changed, 42 insertions(+), 2 deletions(-)
>      create mode 100644
>     meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch
>
>     diff --git
>     a/meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch
>     b/meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch
>     new file mode 100644
>     index 0000000..4af1b61
>     --- /dev/null
>     +++ b/meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch
>     @@ -0,0 +1,38 @@
>     +From e233006ee212109d2a1401dac37a9a851cc493d8 Mon Sep 17 00:00:00
>     2001
>     +From: Yi Zhao <yi.zhao@windriver.com <mailto:yi.zhao@windriver.com>>
>     +Date: Thu, 14 Dec 2017 15:23:47 +0800
>     +Subject: [PATCH] wiper.sh: fix stat path
>     +
>     +Fix the stat path for OE.
>     +
>     +Upstream-Status: Inappropriate [OE specific]
>     +
>     +Signed-off-by: Yi Zhao <yi.zhao@windriver.com
>     <mailto:yi.zhao@windriver.com>>
>     +---
>     + wiper/wiper.sh | 3 +--
>     + 1 file changed, 1 insertion(+), 2 deletions(-)
>     +
>     +diff --git a/wiper/wiper.sh b/wiper/wiper.sh
>     +index 79eddc8..9ef2840 100755
>     +--- a/wiper/wiper.sh
>     ++++ b/wiper/wiper.sh
>     +@@ -97,7 +97,6 @@ function find_prog(){
>     + hash -r  ## Refresh bash's cached PATH entries
>     + HDPARM=`find_prog /sbin/hdparm`       || exit 1
>     + FIND=`find_prog /usr/bin/find`        || exit 1
>     +-STAT=`find_prog /usr/bin/stat`        || exit 1
>     + GAWK=`find_prog /usr/bin/gawk`        || exit 1
>     + BLKID=`find_prog /sbin/blkid` || exit 1
>     + GREP=`find_prog /bin/grep`    || exit 1
>     +@@ -105,7 +104,7 @@ ID=`find_prog /usr/bin/id` || exit 1
>     + LS=`find_prog /bin/ls`                || exit 1
>     + DF=`find_prog /bin/df`                || exit 1
>     + RM=`find_prog /bin/rm`                || exit 1
>     +-STAT=`find_prog /usr/bin/stat`        || exit 1
>     ++STAT=`find_prog /bin/stat`    || exit 1
>     +
>     + [ $verbose -gt 1 ] && HDPARM="$HDPARM --verbose"
>     +
>     +--
>     +2.7.4
>     +
>     diff --git a/meta/recipes-extended/hdparm/hdparm_9.52.bb
>     <http://hdparm_9.52.bb>
>     b/meta/recipes-extended/hdparm/hdparm_9.52.bb <http://hdparm_9.52.bb>
>     index 49fdc94..13cfb3f 100644
>     --- a/meta/recipes-extended/hdparm/hdparm_9.52.bb
>     <http://hdparm_9.52.bb>
>     +++ b/meta/recipes-extended/hdparm/hdparm_9.52.bb
>     <http://hdparm_9.52.bb>
>     @@ -19,9 +19,11 @@ PACKAGES =+ "wiper"
>
>      FILES_wiper = "${bindir}/wiper.sh"
>
>     -RDEPENDS_wiper = "bash gawk stat"
>     +RDEPENDS_wiper = "bash gawk coreutils"
>
>     -SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz"
>     +SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
>     +           file://wiper.sh-fix-stat-path.patch \
>     +          "
>
>      SRC_URI[md5sum] = "410539d0bf3cc247181594581edbfb53"
>      SRC_URI[sha256sum] =
>     "c3429cd423e271fa565bf584598fd751dd2e773bb7199a592b06b5a61cec4fb6"
>     --
>     2.7.4
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


--------------F4C43051BDEBC80143A9678A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Ross,<br>
    </p>
    <br>
    <div class="moz-cite-prefix">在 2017年12月18日 21:02, Burton, Ross 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0Lb-=cwFZpFmnmxVnT+4nqM0U5L5zaLtFjum2u7fbBkAJQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Does it really need coreutils stat, or is busybox's
        stat sufficient?</div>
    </blockquote>
    <br>
    It uses "--format" option with stat, but busybox.stat doesn't
    support this option that would cause an error:<br>
    # stat --format="%04D" /<br>
    stat: unrecognized option '--format=%04D'<br>
    <br>
    So we still need coreutils stat.<br>
    <br>
    <br>
    Regards,<br>
    Yi<br>
    <blockquote type="cite"
cite="mid:CAJTo0Lb-=cwFZpFmnmxVnT+4nqM0U5L5zaLtFjum2u7fbBkAJQ@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 15 December 2017 at 01:18, Yi Zhao <span
            dir="ltr">&lt;<a href="mailto:yi.zhao@windriver.com"
              target="_blank" moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Currently
            only hdparm specifies stat as runtime dependency in oe-core.<br>
            But the stat hasn't any update since 2002. Replace it with
            coreutils as<br>
            runtime dependency since coreutils also provides stat
            program. Then we<br>
            can drop the stat recipe totally.<br>
            <br>
            Also add a patch to fix stat path in wiper.sh.<br>
            <br>
            Signed-off-by: Yi Zhao &lt;<a
              href="mailto:yi.zhao@windriver.com" moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;<br>
            ---<br>
             .../hdparm/hdparm/wiper.sh-<wbr>fix-stat-path.patch     |
            38 ++++++++++++++++++++++<br>
             meta/recipes-extended/hdparm/<a
              href="http://hdparm_9.52.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">h<wbr>dparm_9.52.bb</a> 
                  |  6 ++--<br>
             2 files changed, 42 insertions(+), 2 deletions(-)<br>
             create mode 100644 meta/recipes-extended/hdparm/<wbr>hdparm/wiper.sh-fix-stat-path.<wbr>patch<br>
            <br>
            diff --git a/meta/recipes-extended/<wbr>hdparm/hdparm/wiper.sh-fix-<wbr>stat-path.patch
            b/meta/recipes-extended/<wbr>hdparm/hdparm/wiper.sh-fix-<wbr>stat-path.patch<br>
            new file mode 100644<br>
            index 0000000..4af1b61<br>
            --- /dev/null<br>
            +++ b/meta/recipes-extended/<wbr>hdparm/hdparm/wiper.sh-fix-<wbr>stat-path.patch<br>
            @@ -0,0 +1,38 @@<br>
            +From e233006ee212109d2a1401dac37a9a<wbr>851cc493d8 Mon Sep
            17 00:00:00 2001<br>
            +From: Yi Zhao &lt;<a href="mailto:yi.zhao@windriver.com"
              moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;<br>
            +Date: Thu, 14 Dec 2017 15:23:47 +0800<br>
            +Subject: [PATCH] wiper.sh: fix stat path<br>
            +<br>
            +Fix the stat path for OE.<br>
            +<br>
            +Upstream-Status: Inappropriate [OE specific]<br>
            +<br>
            +Signed-off-by: Yi Zhao &lt;<a
              href="mailto:yi.zhao@windriver.com" moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;<br>
            +---<br>
            + wiper/wiper.sh | 3 +--<br>
            + 1 file changed, 1 insertion(+), 2 deletions(-)<br>
            +<br>
            +diff --git a/wiper/wiper.sh b/wiper/wiper.sh<br>
            +index 79eddc8..9ef2840 100755<br>
            +--- a/wiper/wiper.sh<br>
            ++++ b/wiper/wiper.sh<br>
            +@@ -97,7 +97,6 @@ function find_prog(){<br>
            + hash -r  ## Refresh bash's cached PATH entries<br>
            + HDPARM=`find_prog /sbin/hdparm`       || exit 1<br>
            + FIND=`find_prog /usr/bin/find`        || exit 1<br>
            +-STAT=`find_prog /usr/bin/stat`        || exit 1<br>
            + GAWK=`find_prog /usr/bin/gawk`        || exit 1<br>
            + BLKID=`find_prog /sbin/blkid` || exit 1<br>
            + GREP=`find_prog /bin/grep`    || exit 1<br>
            +@@ -105,7 +104,7 @@ ID=`find_prog /usr/bin/id` || exit 1<br>
            + LS=`find_prog /bin/ls`                || exit 1<br>
            + DF=`find_prog /bin/df`                || exit 1<br>
            + RM=`find_prog /bin/rm`                || exit 1<br>
            +-STAT=`find_prog /usr/bin/stat`        || exit 1<br>
            ++STAT=`find_prog /bin/stat`    || exit 1<br>
            +<br>
            + [ $verbose -gt 1 ] &amp;&amp; HDPARM="$HDPARM --verbose"<br>
            +<br>
            +--<br>
            +2.7.4<br>
            +<br>
            diff --git a/meta/recipes-extended/<wbr>hdparm/<a
              href="http://hdparm_9.52.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">hdparm_9.52.bb</a>
            b/meta/recipes-extended/<wbr>hdparm/<a
              href="http://hdparm_9.52.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">hdparm_9.52.bb</a><br>
            index 49fdc94..13cfb3f 100644<br>
            --- a/meta/recipes-extended/<wbr>hdparm/<a
              href="http://hdparm_9.52.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">hdparm_9.52.bb</a><br>
            +++ b/meta/recipes-extended/<wbr>hdparm/<a
              href="http://hdparm_9.52.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">hdparm_9.52.bb</a><br>
            @@ -19,9 +19,11 @@ PACKAGES =+ "wiper"<br>
            <br>
             FILES_wiper = "${bindir}/wiper.sh"<br>
            <br>
            -RDEPENDS_wiper = "bash gawk stat"<br>
            +RDEPENDS_wiper = "bash gawk coreutils"<br>
            <br>
            -SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/<wbr>${BP}.tar.gz"<br>
            +SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/<wbr>${BP}.tar.gz \<br>
            +           <a class="moz-txt-link-freetext" href="file://wiper.sh-fix-stat-path">file://wiper.sh-fix-stat-path</a>.<wbr>patch \<br>
            +          "<br>
            <br>
             SRC_URI[md5sum] = "<wbr>410539d0bf3cc247181594581edbfb<wbr>53"<br>
             SRC_URI[sha256sum] = "<wbr>c3429cd423e271fa565bf584598fd7<wbr>51dd2e773bb7199a592b06b5a61cec<wbr>4fb6"<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.7.4<br>
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

--------------F4C43051BDEBC80143A9678A--
