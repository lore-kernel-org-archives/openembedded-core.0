Return-Path: <Jibin.Xu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 433696FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Dec 2017 07:39:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBS7dcXV023335
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 27 Dec 2017 23:39:38 -0800
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 27 Dec 2017 23:39:37 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <20171228022126.219745-1-jibin.xu@windriver.com>
	<CA+chaQeUVEHAjLEGAVTxyr0JbBX5VTeaOeZsEL1ohhe7ijP7wg@mail.gmail.com>
From: Jibin Xu <jibin.xu@windriver.com>
Message-ID: <65fe0d11-ecff-c982-a5b4-9c2559653012@windriver.com>
Date: Thu, 28 Dec 2017 15:42:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeUVEHAjLEGAVTxyr0JbBX5VTeaOeZsEL1ohhe7ijP7wg@mail.gmail.com>
X-Originating-IP: [128.224.162.161]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fontcache : fix build warning when using quemu usermode
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
X-List-Received-Date: Thu, 28 Dec 2017 07:39:39 -0000
Content-Type: multipart/alternative;
	boundary="------------91944A25801CA2D61CB0C9EE"
Content-Language: en-US

--------------91944A25801CA2D61CB0C9EE
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

I will send a right one for the typos.

"Does this mean that MACHINEs which use qemu usermode won't be able to 
use read-only images where this postinst cannot be executed on read-only 
rootfs?"

No,some MACHINEs not support qemu usermode, when used, it will lead to a 
qemu core dump: "qemu: uncaught target signal 11 (Segmentation fault) - 
core dumped".

so when use qemu usermode,check whether the machine supports it first.

Thanks,

Jibin

On 2017年12月28日 15:11, Martin Jansa wrote:
> There are 2 typos in "qemu".
>
> Does this mean that MACHINEs which use qemu usermode won't be able to 
> use read-only images where this postinst cannot be executed on 
> read-only rootfs?
>
> On Thu, Dec 28, 2017 at 3:21 AM, Jibin Xu <jibin.xu@windriver.com 
> <mailto:jibin.xu@windriver.com>> wrote:
>
>     fontcache uses quemu usermode by default, but some architecture
>     such as Intel skylake does not support qemu usermode, this can
>     lead to a build warning as below:
>     "WARNING: The postinstall intercept hook 'update_font_cache' failed".
>
>     Add a judgement of qemu usermode to fix the build warning.
>
>     Signed-off-by: Jibin Xu <jibin.xu@windriver.com
>     <mailto:jibin.xu@windriver.com>>
>     ---
>      meta/classes/fontcache.bbclass | 18 +++++++++++-------
>      1 file changed, 11 insertions(+), 7 deletions(-)
>
>     diff --git a/meta/classes/fontcache.bbclass
>     b/meta/classes/fontcache.bbclass
>     index e76331131e..3eb868fa08 100644
>     --- a/meta/classes/fontcache.bbclass
>     +++ b/meta/classes/fontcache.bbclass
>     @@ -17,13 +17,17 @@ FONTCONFIG_CACHE_PARAMS ?= "-v"
>      FONTCONFIG_CACHE_ENV ?= "FC_DEBUG=1"
>      fontcache_common() {
>      if [ -n "$D" ] ; then
>     -       $INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG}
>     mlprefix=${MLPREFIX} \
>     -               'bindir="${bindir}"' \
>     -               'libdir="${libdir}"' \
>     -               'base_libdir="${base_libdir}"' \
>     -               'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
>     -               'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"' \
>     -               'fontconfigcacheenv="${FONTCONFIG_CACHE_ENV}"'
>     +       if ${@bb.utils.contains('MACHINE_FEATURES',
>     'qemu-usermode', 'true','false', d)}; then
>     +               $INTERCEPT_DIR/postinst_intercept
>     update_font_cache ${PKG} mlprefix=${MLPREFIX} \
>     +                       'bindir="${bindir}"' \
>     +                       'libdir="${libdir}"' \
>     +                       'base_libdir="${base_libdir}"' \
>     +                     
>      'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
>     +                     
>      'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"' \
>     +                       'fontconfigcacheenv="${FONTCONFIG_CACHE_ENV}"'
>     +       else
>     +               exit 1
>     +       fi
>      else
>             ${FONTCONFIG_CACHE_ENV} fc-cache ${FONTCONFIG_CACHE_PARAMS}
>      fi
>     --
>     2.13.0
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


--------------91944A25801CA2D61CB0C9EE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>I will send a right one for the typos.</p>
    <p>"Does this mean that MACHINEs which use qemu usermode won't be
      able to use read-only images where this postinst cannot be
      executed on read-only rootfs?"</p>
    <p>No,some MACHINEs not support qemu usermode, when used, it will
      lead to a qemu core dump: "qemu: uncaught target signal 11
      (Segmentation fault) - core dumped".</p>
    <p>so when use qemu usermode,check whether the machine supports it
      first. <br>
    </p>
    <p>Thanks,</p>
    <p>Jibin<br>
    </p>
    <div class="moz-cite-prefix">On 2017年12月28日 15:11, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQeUVEHAjLEGAVTxyr0JbBX5VTeaOeZsEL1ohhe7ijP7wg@mail.gmail.com">
      <meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">There are 2 typos in "qemu".
        <div><br>
        </div>
        <div>Does this mean that MACHINEs which use qemu usermode won't
          be able to use read-only images where this postinst cannot be
          executed on read-only rootfs?</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Thu, Dec 28, 2017 at 3:21 AM, Jibin
          Xu <span dir="ltr">&lt;<a
              href="mailto:jibin.xu@windriver.com" target="_blank"
              moz-do-not-send="true">jibin.xu@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote">fontcache uses quemu usermode
            by default, but some architecture<br>
            such as Intel skylake does not support qemu usermode, this
            can<br>
            lead to a build warning as below:<br>
            "WARNING: The postinstall intercept hook 'update_font_cache'
            failed".<br>
            <br>
            Add a judgement of qemu usermode to fix the build warning.<br>
            <br>
            Signed-off-by: Jibin Xu &lt;<a
              href="mailto:jibin.xu@windriver.com"
              moz-do-not-send="true">jibin.xu@windriver.com</a>&gt;<br>
            ---<br>
             meta/classes/fontcache.bbclass | 18 +++++++++++-------<br>
             1 file changed, 11 insertions(+), 7 deletions(-)<br>
            <br>
            diff --git a/meta/classes/fontcache.<wbr>bbclass
            b/meta/classes/fontcache.<wbr>bbclass<br>
            index e76331131e..3eb868fa08 100644<br>
            --- a/meta/classes/fontcache.<wbr>bbclass<br>
            +++ b/meta/classes/fontcache.<wbr>bbclass<br>
            @@ -17,13 +17,17 @@ FONTCONFIG_CACHE_PARAMS ?= "-v"<br>
             FONTCONFIG_CACHE_ENV ?= "FC_DEBUG=1"<br>
             fontcache_common() {<br>
             if [ -n "$D" ] ; then<br>
            -       $INTERCEPT_DIR/postinst_<wbr>intercept
            update_font_cache ${PKG} mlprefix=${MLPREFIX} \<br>
            -               'bindir="${bindir}"' \<br>
            -               'libdir="${libdir}"' \<br>
            -               'base_libdir="${base_libdir}"' \<br>
            -               'fontconfigcachedir="${<wbr>FONTCONFIG_CACHE_DIR}"'
            \<br>
            -               'fontconfigcacheparams="${<wbr>FONTCONFIG_CACHE_PARAMS}"'
            \<br>
            -               'fontconfigcacheenv="${<wbr>FONTCONFIG_CACHE_ENV}"'<br>
            +       if ${@bb.utils.contains('MACHINE_<wbr>FEATURES',
            'qemu-usermode', 'true','false', d)}; then<br>
            +               $INTERCEPT_DIR/postinst_<wbr>intercept
            update_font_cache ${PKG} mlprefix=${MLPREFIX} \<br>
            +                       'bindir="${bindir}"' \<br>
            +                       'libdir="${libdir}"' \<br>
            +                       'base_libdir="${base_libdir}"' \<br>
            +                       'fontconfigcachedir="${<wbr>FONTCONFIG_CACHE_DIR}"'
            \<br>
            +                       'fontconfigcacheparams="${<wbr>FONTCONFIG_CACHE_PARAMS}"'
            \<br>
            +                       'fontconfigcacheenv="${<wbr>FONTCONFIG_CACHE_ENV}"'<br>
            +       else<br>
            +               exit 1<br>
            +       fi<br>
             else<br>
                    ${FONTCONFIG_CACHE_ENV} fc-cache
            ${FONTCONFIG_CACHE_PARAMS}<br>
             fi<br>
            <span class="HOEnZb">--<br>
              2.13.0<br>
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
    <br>
  </body>
</html>

--------------91944A25801CA2D61CB0C9EE--
