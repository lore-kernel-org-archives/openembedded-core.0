Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE80D7DEBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 03:41:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4E3fLFg017854
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 May 2019 20:41:21 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 13 May 2019 20:41:20 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190513095255.157287-1-kai.kang@windriver.com>
	<20190513095255.157287-2-kai.kang@windriver.com>
	<CAMKF1spxtnvC4VvwbecRijr=_H7pKDzFzQ3vj7PnBytUAByGRA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <0dad34dc-9c84-0320-e03c-db58a4943482@windriver.com>
Date: Tue, 14 May 2019 11:41:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spxtnvC4VvwbecRijr=_H7pKDzFzQ3vj7PnBytUAByGRA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] webkitgtk: fix compile error for arm64
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
X-List-Received-Date: Tue, 14 May 2019 03:41:24 -0000
Content-Type: multipart/alternative;
	boundary="------------C09284007C35A989BB3F7BDB"
Content-Language: en-US

--------------C09284007C35A989BB3F7BDB
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2019/5/13 下午11:43, Khem Raj wrote:
> Can you test this on say rpi3 in 64bit mode and see all is ok ?

It is ok to build 64-bit rpi3 from layer 
git://git.yoctoproject.org/meta-raspberrypi
with configurations:

MACHINE = "raspberrypi3-64"
LICENSE_FLAGS_WHITELIST_append = " commercial"

Regards,
Kai


>
> On Mon, May 13, 2019 at 2:53 AM <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     It removes function JSC::AssemblerBuffer::data() for ARM64 in commit
>     https://trac.webkit.org/changeset/236589/webkit. But the function is
>     still required by Cortex A53 and fails to compile for arm64:
>
>     |
>     .../tmp/work/aarch64-poky-linux/webkitgtk/2.24.1-r0/webkitgtk-2.24.1/Source/JavaScriptCore/assembler/ARM64Assembler.h:3769:100:
>     error: 'class JSC::AssemblerBuffer' has no member named 'data'
>     |     if
>     (UNLIKELY((*reinterpret_cast_ptr<int32_t*>(reinterpret_cast_ptr<char*>(m_buffer.data())
>     + m_buffer.codeSize() - sizeof(int32_t)) & 0x0a000000) == 0x08000000))
>
>     Not set WTF_CPU_ARM64_CORTEXA53 for arm64 to fix the failure.
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>      meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
>     <http://webkitgtk_2.24.1.bb> | 2 --
>      1 file changed, 2 deletions(-)
>
>     diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
>     <http://webkitgtk_2.24.1.bb>
>     b/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
>     <http://webkitgtk_2.24.1.bb>
>     index 771a893a6b..a57a3c058c 100644
>     --- a/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
>     <http://webkitgtk_2.24.1.bb>
>     +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
>     <http://webkitgtk_2.24.1.bb>
>     @@ -98,8 +98,6 @@ EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
>      EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
>      EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
>
>     -EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
>     -
>      # JIT not supported on MIPS either
>      EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "
>
>     -- 
>     2.20.0
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

-- 
Kai Kang


--------------C09284007C35A989BB3F7BDB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2019/5/13 下午11:43, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1spxtnvC4VvwbecRijr=_H7pKDzFzQ3vj7PnBytUAByGRA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div>
        <div dir="auto">Can you test this on say rpi3 in 64bit mode and
          see all is ok ?</div>
      </div>
    </blockquote>
    <p>It is ok to build 64-bit rpi3 from layer
      git://git.yoctoproject.org/meta-raspberrypi<br>
      with configurations:</p>
    <p>MACHINE =
"raspberrypi3-64"                                                                                                                      
      <br>
      LICENSE_FLAGS_WHITELIST_append = " commercial"</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAMKF1spxtnvC4VvwbecRijr=_H7pKDzFzQ3vj7PnBytUAByGRA@mail.gmail.com">
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, May 13, 2019 at 2:53
            AM &lt;<a href="mailto:kai.kang@windriver.com"
              moz-do-not-send="true">kai.kang@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Kai
            Kang &lt;<a href="mailto:kai.kang@windriver.com"
              target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
            <br>
            It removes function JSC::AssemblerBuffer::data() for ARM64
            in commit<br>
            <a href="https://trac.webkit.org/changeset/236589/webkit"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://trac.webkit.org/changeset/236589/webkit</a>.
            But the function is<br>
            still required by Cortex A53 and fails to compile for arm64:<br>
            <br>
            |
.../tmp/work/aarch64-poky-linux/webkitgtk/2.24.1-r0/webkitgtk-2.24.1/Source/JavaScriptCore/assembler/ARM64Assembler.h:3769:100:
            error: 'class JSC::AssemblerBuffer' has no member named
            'data'<br>
            |     if
(UNLIKELY((*reinterpret_cast_ptr&lt;int32_t*&gt;(reinterpret_cast_ptr&lt;char*&gt;(m_buffer.data())
            + m_buffer.codeSize() - sizeof(int32_t)) &amp; 0x0a000000)
            == 0x08000000))<br>
            <br>
            Not set WTF_CPU_ARM64_CORTEXA53 for arm64 to fix the
            failure.<br>
            <br>
            Signed-off-by: Kai Kang &lt;<a
              href="mailto:kai.kang@windriver.com" target="_blank"
              moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
            ---<br>
             meta/recipes-sato/webkit/<a
              href="http://webkitgtk_2.24.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">webkitgtk_2.24.1.bb</a>
            | 2 --<br>
             1 file changed, 2 deletions(-)<br>
            <br>
            diff --git a/meta/recipes-sato/webkit/<a
              href="http://webkitgtk_2.24.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">webkitgtk_2.24.1.bb</a>
            b/meta/recipes-sato/webkit/<a
              href="http://webkitgtk_2.24.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">webkitgtk_2.24.1.bb</a><br>
            index 771a893a6b..a57a3c058c 100644<br>
            --- a/meta/recipes-sato/webkit/<a
              href="http://webkitgtk_2.24.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">webkitgtk_2.24.1.bb</a><br>
            +++ b/meta/recipes-sato/webkit/<a
              href="http://webkitgtk_2.24.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">webkitgtk_2.24.1.bb</a><br>
            @@ -98,8 +98,6 @@ EXTRA_OECMAKE_append_aarch64 = "
            -DUSE_LD_GOLD=OFF "<br>
             EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "<br>
             EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "<br>
            <br>
            -EXTRA_OECMAKE_append_aarch64 = "
            -DWTF_CPU_ARM64_CORTEXA53=ON"<br>
            -<br>
             # JIT not supported on MIPS either<br>
             EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "<br>
            <br>
            -- <br>
            2.20.0<br>
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
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang</pre>
  </body>
</html>

--------------C09284007C35A989BB3F7BDB--
