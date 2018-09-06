Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB9C796CE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 15:28:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w86FSe8Y009799
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 08:28:40 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 6 Sep 2018 08:28:39 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1535216766.git.kai.kang@windriver.com>
	<55b7afd2fc5b383ab482f4b004e38cb0797ca29c.1535216766.git.kai.kang@windriver.com>
	<CA+chaQfurea5vwojwt6fgzNvhUfRDF9HmPf_YFBhgEGhQPO2dA@mail.gmail.com>
	<4800fed2-8a51-7bb0-b6c6-fa1402289831@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <ab609cc5-dd34-bbc1-294f-be6985a30a2a@windriver.com>
Date: Thu, 6 Sep 2018 23:27:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4800fed2-8a51-7bb0-b6c6-fa1402289831@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] update_font_cache: update script for multilib
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
X-List-Received-Date: Thu, 06 Sep 2018 15:28:42 -0000
Content-Type: multipart/alternative;
	boundary="------------863B21D3015977FF02831CA9"
Content-Language: en-US

--------------863B21D3015977FF02831CA9
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年09月04日 18:02, Kang Kai wrote:
> On 2018年09月04日 17:44, Martin Jansa wrote:
>> Hi Kai,
>>
>> do you have similar fix for update_gio_module_cache intercept? It 
>> seems to fail similarly with multilib enabled.
>
> The fix is from script update_gio_module_cache, so I thought it works 
> and didn't meet the failure. I'll check it.
Hi Martin,

It has been done by 
http://git.openembedded.org/openembedded-core/commit/?id=1f53140528d79c38d4f3a82cd0a03bd0ddc87275
Add lib23-gconf to image which inherits gio-module-cache, then build 
image successfully.

Regards,
Kai


>
> Thanks,
> Kai
>
>>
>> Regards,
>>
>> On Sat, Aug 25, 2018 at 7:14 PM Kai Kang <kai.kang@windriver.com 
>> <mailto:kai.kang@windriver.com>> wrote:
>>
>>     Packages which inherit fontcache.bbclass call postinstall script
>>     update_font_cache. And in update_font_cache, it calls
>>     ${bindir}/fc-cache
>>     by qemuwrapper. When multilib is enabled, both packages foo and
>>     lib32-foo
>>     will call ${bindir}/fc-cache and one of them will fail to run
>>     obviously.
>>
>>     Duplicate install file fc-cache to ${libexecdir} with ${MLPREFIX} and
>>     call proper fc-cache in update_font_cache.
>>
>>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>>     <mailto:kai.kang@windriver.com>>
>>     ---
>>      meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>     <http://fontconfig_2.12.6.bb> | 8 +++++++-
>>      scripts/postinst-intercepts/update_font_cache         | 2 +-
>>      2 files changed, 8 insertions(+), 2 deletions(-)
>>
>>     diff --git
>>     a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>     <http://fontconfig_2.12.6.bb>
>>     b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>     <http://fontconfig_2.12.6.bb>
>>     index d4cbce80b45..db36c867741 100644
>>     --- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>     <http://fontconfig_2.12.6.bb>
>>     +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>     <http://fontconfig_2.12.6.bb>
>>     @@ -35,9 +35,15 @@ do_configure_prepend() {
>>          rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf
>>      }
>>
>>     +do_install_append_class-target() {
>>     +    # duplicate fc-cache for postinstall script
>>     +    mkdir -p ${D}${libexecdir}
>>     +    cp ${D}${bindir}/fc-cache ${D}${libexecdir}/${MLPREFIX}fc-cache
>>     +}
>>     +
>>      PACKAGES =+ "fontconfig-utils"
>>      FILES_${PN} =+ "${datadir}/xml/*"
>>     -FILES_fontconfig-utils = "${bindir}/*"
>>     +FILES_fontconfig-utils = "${bindir}/* ${libexecdir}/*"
>>
>>      # Work around past breakage in debian.bbclass
>>      RPROVIDES_fontconfig-utils = "libfontconfig-utils"
>>     diff --git a/scripts/postinst-intercepts/update_font_cache
>>     b/scripts/postinst-intercepts/update_font_cache
>>     index 20e9048adfc..e0ec471964c 100644
>>     --- a/scripts/postinst-intercepts/update_font_cache
>>     +++ b/scripts/postinst-intercepts/update_font_cache
>>     @@ -2,5 +2,5 @@
>>
>>      set -e
>>
>>     -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E
>>     ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D
>>     --system-only ${fontconfigcacheparams}
>>     +PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E
>>     ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache
>>     --sysroot=$D --system-only ${fontconfigcacheparams}
>>      chown -R root:root $D${fontconfigcachedir}
>>     -- 
>>     2.11.0
>>
>>     -- 
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> -- 
> Regards,
> Neil | Kai Kang


-- 
Regards,
Neil | Kai Kang


--------------863B21D3015977FF02831CA9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年09月04日 18:02, Kang Kai wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4800fed2-8a51-7bb0-b6c6-fa1402289831@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div class="moz-cite-prefix">On 2018年09月04日 17:44, Martin Jansa
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CA+chaQfurea5vwojwt6fgzNvhUfRDF9HmPf_YFBhgEGhQPO2dA@mail.gmail.com">
        <div dir="ltr">
          <div dir="ltr">Hi Kai,
            <div><br>
            </div>
            <div>do you have similar fix for update_gio_module_cache
              intercept? It seems to fail similarly with multilib
              enabled.</div>
          </div>
        </div>
      </blockquote>
      <br>
      The fix is from script update_gio_module_cache, so I thought it
      works and didn't meet the failure. I'll check it.<br>
    </blockquote>
    Hi Martin,<br>
    <br>
    It has been done by
<a class="moz-txt-link-freetext" href="http://git.openembedded.org/openembedded-core/commit/?id=1f53140528d79c38d4f3a82cd0a03bd0ddc87275">http://git.openembedded.org/openembedded-core/commit/?id=1f53140528d79c38d4f3a82cd0a03bd0ddc87275</a><br>
    Add lib23-gconf to image which inherits gio-module-cache, then build
    image successfully.<br>
    <br>
    Regards,<br>
    Kai<br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:4800fed2-8a51-7bb0-b6c6-fa1402289831@windriver.com"> <br>
      Thanks,<br>
      Kai<br>
      <br>
      <blockquote type="cite"
cite="mid:CA+chaQfurea5vwojwt6fgzNvhUfRDF9HmPf_YFBhgEGhQPO2dA@mail.gmail.com">
        <div dir="ltr">
          <div dir="ltr">
            <div><br>
            </div>
            <div>Regards,</div>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr">On Sat, Aug 25, 2018 at 7:14 PM Kai Kang &lt;<a
              href="mailto:kai.kang@windriver.com"
              moz-do-not-send="true">kai.kang@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Packages
            which inherit fontcache.bbclass call postinstall script<br>
            update_font_cache. And in update_font_cache, it calls
            ${bindir}/fc-cache<br>
            by qemuwrapper. When multilib is enabled, both packages foo
            and lib32-foo<br>
            will call ${bindir}/fc-cache and one of them will fail to
            run obviously.<br>
            <br>
            Duplicate install file fc-cache to ${libexecdir} with
            ${MLPREFIX} and<br>
            call proper fc-cache in update_font_cache.<br>
            <br>
            Signed-off-by: Kai Kang &lt;<a
              href="mailto:kai.kang@windriver.com" target="_blank"
              moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
            ---<br>
             meta/recipes-graphics/fontconfig/<a
              href="http://fontconfig_2.12.6.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">fontconfig_2.12.6.bb</a>
            | 8 +++++++-<br>
             scripts/postinst-intercepts/update_font_cache         | 2
            +-<br>
             2 files changed, 8 insertions(+), 2 deletions(-)<br>
            <br>
            diff --git a/meta/recipes-graphics/fontconfig/<a
              href="http://fontconfig_2.12.6.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">fontconfig_2.12.6.bb</a>
            b/meta/recipes-graphics/fontconfig/<a
              href="http://fontconfig_2.12.6.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">fontconfig_2.12.6.bb</a><br>
            index d4cbce80b45..db36c867741 100644<br>
            --- a/meta/recipes-graphics/fontconfig/<a
              href="http://fontconfig_2.12.6.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">fontconfig_2.12.6.bb</a><br>
            +++ b/meta/recipes-graphics/fontconfig/<a
              href="http://fontconfig_2.12.6.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">fontconfig_2.12.6.bb</a><br>
            @@ -35,9 +35,15 @@ do_configure_prepend() {<br>
                 rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf<br>
             }<br>
            <br>
            +do_install_append_class-target() {<br>
            +    # duplicate fc-cache for postinstall script<br>
            +    mkdir -p ${D}${libexecdir}<br>
            +    cp ${D}${bindir}/fc-cache
            ${D}${libexecdir}/${MLPREFIX}fc-cache<br>
            +}<br>
            +<br>
             PACKAGES =+ "fontconfig-utils"<br>
             FILES_${PN} =+ "${datadir}/xml/*"<br>
            -FILES_fontconfig-utils = "${bindir}/*"<br>
            +FILES_fontconfig-utils = "${bindir}/* ${libexecdir}/*"<br>
            <br>
             # Work around past breakage in debian.bbclass<br>
             RPROVIDES_fontconfig-utils = "libfontconfig-utils"<br>
            diff --git a/scripts/postinst-intercepts/update_font_cache
            b/scripts/postinst-intercepts/update_font_cache<br>
            index 20e9048adfc..e0ec471964c 100644<br>
            --- a/scripts/postinst-intercepts/update_font_cache<br>
            +++ b/scripts/postinst-intercepts/update_font_cache<br>
            @@ -2,5 +2,5 @@<br>
            <br>
             set -e<br>
            <br>
            -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E
            ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D
            --system-only ${fontconfigcacheparams}<br>
            +PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E
            ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache
            --sysroot=$D --system-only ${fontconfigcacheparams}<br>
             chown -R root:root $D${fontconfigcachedir}<br>
            -- <br>
            2.11.0<br>
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
      <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------863B21D3015977FF02831CA9--
