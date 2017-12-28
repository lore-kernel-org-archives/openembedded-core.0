Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 07E4971AC1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Dec 2017 08:22:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBS8M4Bm001914
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Dec 2017 00:22:04 -0800 (PST)
Received: from [128.224.162.209] (128.224.162.209) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 28 Dec 2017 00:22:04 -0800
To: Martin Jansa <martin.jansa@gmail.com>, Jibin Xu <jibin.xu@windriver.com>
References: <20171228022126.219745-1-jibin.xu@windriver.com>
	<CA+chaQeUVEHAjLEGAVTxyr0JbBX5VTeaOeZsEL1ohhe7ijP7wg@mail.gmail.com>
	<65fe0d11-ecff-c982-a5b4-9c2559653012@windriver.com>
	<CA+chaQdBwU7HjBwtwMoyWjZYgQTmyM3n6q_2KpLWLNMsieYYhg@mail.gmail.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <96f54286-f06f-b412-f1ca-d561fba2f9f9@windriver.com>
Date: Thu, 28 Dec 2017 16:22:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdBwU7HjBwtwMoyWjZYgQTmyM3n6q_2KpLWLNMsieYYhg@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Dec 2017 08:22:05 -0000
Content-Type: multipart/alternative;
	boundary="------------5E1F49244161E3141F5E2421"
Content-Language: en-US

--------------5E1F49244161E3141F5E2421
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2017年12月28日 15:50, Martin Jansa wrote:
> > No,some MACHINEs not support qemu usermode
>
> That's not what I was asking.
>
> You're disabling whole build-time postinst when qemu-usermode is in 
> MACHINE_FEATURES with:
> ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 
> 'true','false', d)}
Hi,
It seems that the built-time postinst will be disable when qemu-usermode 
is *not* in MACHINE_FEATURES.
If anywhere wrong, please correct me.

Thanks.
>
> and in that case read-only images will fail to build and even if you 
> remove that error (failed postinst scripts are causing errors when the 
> image is configured to be read-only), then the image is still bad for 
> runtime, because with read-only rootfs you cannot generate fontcache 
> even on the device.
>
>
> On Thu, Dec 28, 2017 at 8:42 AM, Jibin Xu <jibin.xu@windriver.com 
> <mailto:jibin.xu@windriver.com>> wrote:
>
>     I will send a right one for the typos.
>
>     "Does this mean that MACHINEs which use qemu usermode won't be
>     able to use read-only images where this postinst cannot be
>     executed on read-only rootfs?"
>
>     No,some MACHINEs not support qemu usermode, when used, it will
>     lead to a qemu core dump: "qemu: uncaught target signal 11
>     (Segmentation fault) - core dumped".
>
>     so when use qemu usermode,check whether the machine supports it
>     first.
>
>     Thanks,
>
>     Jibin
>
>     On 2017年12月28日 15:11, Martin Jansa wrote:
>>     There are 2 typos in "qemu".
>>
>>     Does this mean that MACHINEs which use qemu usermode won't be
>>     able to use read-only images where this postinst cannot be
>>     executed on read-only rootfs?
>>
>>     On Thu, Dec 28, 2017 at 3:21 AM, Jibin Xu <jibin.xu@windriver.com
>>     <mailto:jibin.xu@windriver.com>> wrote:
>>
>>         fontcache uses quemu usermode by default, but some architecture
>>         such as Intel skylake does not support qemu usermode, this can
>>         lead to a build warning as below:
>>         "WARNING: The postinstall intercept hook 'update_font_cache'
>>         failed".
>>
>>         Add a judgement of qemu usermode to fix the build warning.
>>
>>         Signed-off-by: Jibin Xu <jibin.xu@windriver.com
>>         <mailto:jibin.xu@windriver.com>>
>>         ---
>>          meta/classes/fontcache.bbclass | 18 +++++++++++-------
>>          1 file changed, 11 insertions(+), 7 deletions(-)
>>
>>         diff --git a/meta/classes/fontcache.bbclass
>>         b/meta/classes/fontcache.bbclass
>>         index e76331131e..3eb868fa08 100644
>>         --- a/meta/classes/fontcache.bbclass
>>         +++ b/meta/classes/fontcache.bbclass
>>         @@ -17,13 +17,17 @@ FONTCONFIG_CACHE_PARAMS ?= "-v"
>>          FONTCONFIG_CACHE_ENV ?= "FC_DEBUG=1"
>>          fontcache_common() {
>>          if [ -n "$D" ] ; then
>>         -       $INTERCEPT_DIR/postinst_intercept update_font_cache
>>         ${PKG} mlprefix=${MLPREFIX} \
>>         -               'bindir="${bindir}"' \
>>         -               'libdir="${libdir}"' \
>>         -               'base_libdir="${base_libdir}"' \
>>         -               'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
>>         -             
>>          'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"' \
>>         -               'fontconfigcacheenv="${FONTCONFIG_CACHE_ENV}"'
>>         +       if ${@bb.utils.contains('MACHINE_FEATURES',
>>         'qemu-usermode', 'true','false', d)}; then
>>         +               $INTERCEPT_DIR/postinst_intercept
>>         update_font_cache ${PKG} mlprefix=${MLPREFIX} \
>>         +                       'bindir="${bindir}"' \
>>         +                       'libdir="${libdir}"' \
>>         +  'base_libdir="${base_libdir}"' \
>>         +  'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
>>         +  'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"' \
>>         +  'fontconfigcacheenv="${FONTCONFIG_CACHE_ENV}"'
>>         +       else
>>         +               exit 1
>>         +       fi
>>          else
>>                 ${FONTCONFIG_CACHE_ENV} fc-cache
>>         ${FONTCONFIG_CACHE_PARAMS}
>>          fi
>>         --
>>         2.13.0
>>
>>         --
>>         _______________________________________________
>>         Openembedded-core mailing list
>>         Openembedded-core@lists.openembedded.org
>>         <mailto:Openembedded-core@lists.openembedded.org>
>>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>
>>
>
>
>
>

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


--------------5E1F49244161E3141F5E2421
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2017年12月28日 15:50, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQdBwU7HjBwtwMoyWjZYgQTmyM3n6q_2KpLWLNMsieYYhg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">&gt; <span style="font-size:12.8px">No,some
          MACHINEs not support qemu usermode</span>
        <div><span style="font-size:12.8px"><br>
          </span></div>
        <div><span style="font-size:12.8px">That's not what I was
            asking.</span></div>
        <div><span style="font-size:12.8px"><br>
          </span></div>
        <div><span style="font-size:12.8px">You're disabling whole
            build-time postinst when qemu-usermode is in
            MACHINE_FEATURES with:</span></div>
        <div><span style="font-size:12.8px">${@bb.utils.contains('MACHINE_</span><wbr
            style="font-size:12.8px"><span style="font-size:12.8px">FEATURES',
            'qemu-usermode', 'true','false', d)}</span><span
            style="font-size:12.8px"><br>
          </span></div>
      </div>
    </blockquote>
    Hi,<br>
    It seems that the built-time postinst will be disable when
    qemu-usermode is *not* in MACHINE_FEATURES.<br>
    If anywhere wrong, please correct me.<br>
    <br>
    Thanks.
    <blockquote type="cite"
cite="mid:CA+chaQdBwU7HjBwtwMoyWjZYgQTmyM3n6q_2KpLWLNMsieYYhg@mail.gmail.com">
      <div dir="ltr">
        <div><span style="font-size:12.8px"><br>
          </span></div>
        <div><span style="font-size:12.8px">and in that case read-only
            images will fail to build and even if you remove that error
            (failed postinst scripts are causing errors when the image
            is configured to be read-only), then the image is still bad
            for runtime, because with read-only rootfs you cannot
            generate fontcache even on the device.</span></div>
        <div><span style="font-size:12.8px"><br>
          </span></div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Thu, Dec 28, 2017 at 8:42 AM, Jibin
          Xu <span dir="ltr">&lt;<a
              href="mailto:jibin.xu@windriver.com" target="_blank"
              moz-do-not-send="true">jibin.xu@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div text="#000000" bgcolor="#FFFFFF">
              <p>I will send a right one for the typos.</p>
              <span class="">
                <p>"Does this mean that MACHINEs which use qemu usermode
                  won't be able to use read-only images where this
                  postinst cannot be executed on read-only rootfs?"</p>
              </span>
              <p>No,some MACHINEs not support qemu usermode, when used,
                it will lead to a qemu core dump: "qemu: uncaught target
                signal 11 (Segmentation fault) - core dumped".</p>
              <p>so when use qemu usermode,check whether the machine
                supports it first. <br>
              </p>
              <p>Thanks,</p>
              <p>Jibin<br>
              </p>
              <div>
                <div class="h5">
                  <div class="m_5674333459630589526moz-cite-prefix">On
                    2017年12月28日 15:11, Martin Jansa wrote:<br>
                  </div>
                  <blockquote type="cite">
                    <div dir="ltr">There are 2 typos in "qemu".
                      <div><br>
                      </div>
                      <div>Does this mean that MACHINEs which use qemu
                        usermode won't be able to use read-only images
                        where this postinst cannot be executed on
                        read-only rootfs?</div>
                    </div>
                    <div class="gmail_extra"><br>
                      <div class="gmail_quote">On Thu, Dec 28, 2017 at
                        3:21 AM, Jibin Xu <span dir="ltr">&lt;<a
                            href="mailto:jibin.xu@windriver.com"
                            target="_blank" moz-do-not-send="true">jibin.xu@windriver.com</a>&gt;</span>
                        wrote:<br>
                        <blockquote class="gmail_quote">fontcache uses
                          quemu usermode by default, but some
                          architecture<br>
                          such as Intel skylake does not support qemu
                          usermode, this can<br>
                          lead to a build warning as below:<br>
                          "WARNING: The postinstall intercept hook
                          'update_font_cache' failed".<br>
                          <br>
                          Add a judgement of qemu usermode to fix the
                          build warning.<br>
                          <br>
                          Signed-off-by: Jibin Xu &lt;<a
                            href="mailto:jibin.xu@windriver.com"
                            target="_blank" moz-do-not-send="true">jibin.xu@windriver.com</a>&gt;<br>
                          ---<br>
                           meta/classes/fontcache.<wbr>bbclass | 18
                          +++++++++++-------<br>
                           1 file changed, 11 insertions(+), 7
                          deletions(-)<br>
                          <br>
                          diff --git a/meta/classes/fontcache.bbcla<wbr>ss
                          b/meta/classes/fontcache.bbcla<wbr>ss<br>
                          index e76331131e..3eb868fa08 100644<br>
                          --- a/meta/classes/fontcache.bbcla<wbr>ss<br>
                          +++ b/meta/classes/fontcache.bbcla<wbr>ss<br>
                          @@ -17,13 +17,17 @@ FONTCONFIG_CACHE_PARAMS ?=
                          "-v"<br>
                           FONTCONFIG_CACHE_ENV ?= "FC_DEBUG=1"<br>
                           fontcache_common() {<br>
                           if [ -n "$D" ] ; then<br>
                          -       $INTERCEPT_DIR/postinst_inter<wbr>cept
                          update_font_cache ${PKG} mlprefix=${MLPREFIX}
                          \<br>
                          -               'bindir="${bindir}"' \<br>
                          -               'libdir="${libdir}"' \<br>
                          -               'base_libdir="${base_libdir}"<wbr>'
                          \<br>
                          -               'fontconfigcachedir="${FONTCO<wbr>NFIG_CACHE_DIR}"'
                          \<br>
                          -               'fontconfigcacheparams="${FON<wbr>TCONFIG_CACHE_PARAMS}"'
                          \<br>
                          -               'fontconfigcacheenv="${FONTCO<wbr>NFIG_CACHE_ENV}"'<br>
                          +       if ${@bb.utils.contains('MACHINE_<wbr>FEATURES',
                          'qemu-usermode', 'true','false', d)}; then<br>
                          +               $INTERCEPT_DIR/postinst_inter<wbr>cept
                          update_font_cache ${PKG} mlprefix=${MLPREFIX}
                          \<br>
                          +                       'bindir="${bindir}"' \<br>
                          +                       'libdir="${libdir}"' \<br>
                          +                     
                           'base_libdir="${base_libdir}"<wbr>' \<br>
                          +                     
                           'fontconfigcachedir="${FONTCO<wbr>NFIG_CACHE_DIR}"'
                          \<br>
                          +                     
                           'fontconfigcacheparams="${FON<wbr>TCONFIG_CACHE_PARAMS}"'
                          \<br>
                          +                     
                           'fontconfigcacheenv="${FONTCO<wbr>NFIG_CACHE_ENV}"'<br>
                          +       else<br>
                          +               exit 1<br>
                          +       fi<br>
                           else<br>
                                  ${FONTCONFIG_CACHE_ENV} fc-cache
                          ${FONTCONFIG_CACHE_PARAMS}<br>
                           fi<br>
                          <span class="m_5674333459630589526HOEnZb">--<br>
                            2.13.0<br>
                            <br>
                            --<br>
                            ______________________________<wbr>_________________<br>
                            Openembedded-core mailing list<br>
                            <a
                              href="mailto:Openembedded-core@lists.openembedded.org"
                              target="_blank" moz-do-not-send="true">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                            <a
                              href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                              rel="noreferrer" target="_blank"
                              moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                          </span></blockquote>
                      </div>
                      <br>
                    </div>
                  </blockquote>
                  <br>
                </div>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036
</pre>
  </body>
</html>

--------------5E1F49244161E3141F5E2421--
