Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 38E4760197
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 06:51:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6H6ptXO025382
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2019 23:51:55 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 16 Jul 2019 23:51:54 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190715102016.114264-1-kai.kang@windriver.com>
	<CAMKF1sq8rpdxdH2Yr8bHze06-R3hsmLTDdSLkX-TEj4utY2VYQ@mail.gmail.com>
	<0f664af2-cea3-aaa2-2a7c-74c43d58ced4@windriver.com>
	<CAMKF1spSOgaLYgy6U3r=wXNPcMA+qyy1Oigpob42xFAOFugbvA@mail.gmail.com>
	<8164ebb7-8a4f-a7ce-74de-e4adb60a6022@windriver.com>
	<CAMKF1sp=r+x8+DyGPAmJUfAMn6qtSzjquP+iaEwjtz1SkYXf7A@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <4d14f4a4-c3a2-ed2d-e8dc-fd6de1963124@windriver.com>
Date: Wed, 17 Jul 2019 14:51:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp=r+x8+DyGPAmJUfAMn6qtSzjquP+iaEwjtz1SkYXf7A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: set incomptible with tune mips
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
X-List-Received-Date: Wed, 17 Jul 2019 06:51:56 -0000
Content-Type: multipart/alternative;
	boundary="------------8C62849134C616616B5426E2"
Content-Language: en-US

--------------8C62849134C616616B5426E2
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2019/7/17 下午2:20, Khem Raj wrote:
> Right so we should only disable the tunes which don’t have clz and not 
> all mips as this patch is doing

The patch only set COMPATILE_HOST to null  only when default tune is 
'mips' which causes webkitgtk fails.
And for other conditions, it doesn't block to build that the 
COMPATILE_HOST is 'mips.*-linux'. 
<mailto:$%7B@bb.utils.contains('DEFAULTTUNE','mips','null','mips.*-linux',d)%7D>Such 
as the
default bsps qemumips(default tune mips32r2) and qemumips64(mips64r2), 
it doesn't affect them.

Kai


>
> On Tue, Jul 16, 2019 at 10:42 PM Kang Kai <Kai.Kang@windriver.com 
> <mailto:Kai.Kang@windriver.com>> wrote:
>
>     On 2019/7/16 下午11:33, Khem Raj wrote:
>>
>>
>>     On Tue, Jul 16, 2019 at 2:33 AM Kang Kai <Kai.Kang@windriver.com
>>     <mailto:Kai.Kang@windriver.com>> wrote:
>>
>>         On 2019/7/16 下午3:19, Khem Raj wrote:
>>         > On Mon, Jul 15, 2019 at 3:21 AM <kai.kang@windriver.com
>>         <mailto:kai.kang@windriver.com>> wrote:
>>         >> From: Kai Kang <kai.kang@windriver.com
>>         <mailto:kai.kang@windriver.com>>
>>         >>
>>         >> It fails to compile webkit when default tune is 'mips':
>>         >>
>>         >> |
>>         .../tmp-glibc/work/mips-wrs-linux/webkitgtk/2.24.2-r0/webkitgtk-2.24.2
>>         >> |
>>         /Source/JavaScriptCore/assembler/MacroAssemblerMIPS.h:418:23:
>>         >> | error: static assertion failed: CLZ opcode is not
>>         available for this ISA
>>         >>
>>         >> So don't build webkit when default tune is mips.
>>         >>
>>         >> Signed-off-by: Kai Kang <kai.kang@windriver.com
>>         <mailto:kai.kang@windriver.com>>
>>         >> ---
>>         >>   meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>>         <http://webkitgtk_2.24.2.bb> | 2 ++
>>         >>   1 file changed, 2 insertions(+)
>>         >>
>>         >> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>>         <http://webkitgtk_2.24.2.bb>
>>         b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>>         <http://webkitgtk_2.24.2.bb>
>>         >> index 056334fff5..891266b220 100644
>>         >> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>>         <http://webkitgtk_2.24.2.bb>
>>         >> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>>         <http://webkitgtk_2.24.2.bb>
>>         >> @@ -43,6 +43,8 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2
>>         cairo libxslt libxt libidn libgcrypt \
>>         >>             gettext-native glib-2.0 glib-2.0-native libtasn1 \
>>         >>             "
>>         >>
>>         >> +COMPATIBLE_HOST_mipsarch =
>>         "${@bb.utils.contains('DEFAULTTUNE', 'mips', 'null',
>>         'mips.*-linux', d)}"
>>         <mailto:$%7B@bb.utils.contains('DEFAULTTUNE','mips','null','mips.*-linux',d)%7D>
>>         >> +
>>         > this disables is for all kind of mips. I think thats a
>>         broad set, it
>>         > would be best to narrow it to what you saw it failing for
>>         > e.g. it should work for mips32 and mips64 so maybe mips1 is
>>         what you
>>         > want to disable for
>>
>>         I tested with qemumips and qemumips64. When set
>>
>>         DEFAULTTUNE= "mips"
>>
>>
>>     How about using mips32 and mips64 for default tune and retest
>
>
>     It build webkitgtk successfully on qemumips and qemumips64 with
>     default tune mips32 and mips64.
>
>
>>
>>
>>         It fails with the error.
>>
>>         Regards,
>>         Kai
>>
>>         >
>>         >
>>         >>   PACKAGECONFIG ??=
>>         "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',
>>         'wayland' ,d)} \
>>         >> ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl
>>         opengl', '' ,d)} \
>>         >>                      enchant \
>>         >> --
>>         >> 2.20.0
>>         >>
>>         >> --
>>         >> _______________________________________________
>>         >> Openembedded-core mailing list
>>         >> Openembedded-core@lists.openembedded.org
>>         <mailto:Openembedded-core@lists.openembedded.org>
>>         >>
>>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>         -- 
>>         Kai Kang
>>
>
>     -- 
>     Kai Kang
>

-- 
Kai Kang


--------------8C62849134C616616B5426E2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2019/7/17 下午2:20, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1sp=r+x8+DyGPAmJUfAMn6qtSzjquP+iaEwjtz1SkYXf7A@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div>
        <div dir="auto">Right so we should only disable the tunes which
          don’t have clz and not all mips as this patch is doing <br>
        </div>
      </div>
    </blockquote>
    <p>The patch only set COMPATILE_HOST to null  only when default tune
      is 'mips' which causes webkitgtk fails. <br>
      And for other conditions, it doesn't block to build that the
      COMPATILE_HOST is <a
        class="m_-5888914540470042948moz-txt-link-rfc2396E"
href="mailto:$%7B@bb.utils.contains('DEFAULTTUNE','mips','null','mips.*-linux',d)%7D"
        target="_blank"> 'mips.*-linux'.  </a>Such as the<br>
      default bsps qemumips(default tune mips32r2) and
      qemumips64(mips64r2), it doesn't affect them.<br>
    </p>
    <p>Kai<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAMKF1sp=r+x8+DyGPAmJUfAMn6qtSzjquP+iaEwjtz1SkYXf7A@mail.gmail.com">
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Jul 16, 2019 at
            10:42 PM Kang Kai &lt;<a
              href="mailto:Kai.Kang@windriver.com"
              moz-do-not-send="true">Kai.Kang@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div bgcolor="#FFFFFF" text="#000000">
              <div class="m_-5888914540470042948moz-cite-prefix">On
                2019/7/16 下午11:33, Khem Raj wrote:<br>
              </div>
              <blockquote type="cite">
                <div><br>
                </div>
                <div><br>
                  <div class="gmail_quote">
                    <div dir="ltr" class="gmail_attr">On Tue, Jul 16,
                      2019 at 2:33 AM Kang Kai &lt;<a
                        href="mailto:Kai.Kang@windriver.com"
                        target="_blank" moz-do-not-send="true">Kai.Kang@windriver.com</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">On
                      2019/7/16 下午3:19, Khem Raj wrote:<br>
                      &gt; On Mon, Jul 15, 2019 at 3:21 AM &lt;<a
                        href="mailto:kai.kang@windriver.com"
                        target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;
                      wrote:<br>
                      &gt;&gt; From: Kai Kang &lt;<a
                        href="mailto:kai.kang@windriver.com"
                        target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
                      &gt;&gt;<br>
                      &gt;&gt; It fails to compile webkit when default
                      tune is 'mips':<br>
                      &gt;&gt;<br>
                      &gt;&gt; |
                      .../tmp-glibc/work/mips-wrs-linux/webkitgtk/2.24.2-r0/webkitgtk-2.24.2<br>
                      &gt;&gt; |
                      /Source/JavaScriptCore/assembler/MacroAssemblerMIPS.h:418:23:<br>
                      &gt;&gt; | error: static assertion failed: CLZ
                      opcode is not available for this ISA<br>
                      &gt;&gt;<br>
                      &gt;&gt; So don't build webkit when default tune
                      is mips.<br>
                      &gt;&gt;<br>
                      &gt;&gt; Signed-off-by: Kai Kang &lt;<a
                        href="mailto:kai.kang@windriver.com"
                        target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
                      &gt;&gt; ---<br>
                      &gt;&gt;   meta/recipes-sato/webkit/<a
                        href="http://webkitgtk_2.24.2.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">webkitgtk_2.24.2.bb</a> |
                      2 ++<br>
                      &gt;&gt;   1 file changed, 2 insertions(+)<br>
                      &gt;&gt;<br>
                      &gt;&gt; diff --git a/meta/recipes-sato/webkit/<a
                        href="http://webkitgtk_2.24.2.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">webkitgtk_2.24.2.bb</a>
                      b/meta/recipes-sato/webkit/<a
                        href="http://webkitgtk_2.24.2.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">webkitgtk_2.24.2.bb</a><br>
                      &gt;&gt; index 056334fff5..891266b220 100644<br>
                      &gt;&gt; --- a/meta/recipes-sato/webkit/<a
                        href="http://webkitgtk_2.24.2.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">webkitgtk_2.24.2.bb</a><br>
                      &gt;&gt; +++ b/meta/recipes-sato/webkit/<a
                        href="http://webkitgtk_2.24.2.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">webkitgtk_2.24.2.bb</a><br>
                      &gt;&gt; @@ -43,6 +43,8 @@ DEPENDS = "zlib
                      libsoup-2.4 curl libxml2 cairo libxslt libxt
                      libidn libgcrypt \<br>
                      &gt;&gt;             gettext-native glib-2.0
                      glib-2.0-native libtasn1 \<br>
                      &gt;&gt;             "<br>
                      &gt;&gt;<br>
                      &gt;&gt; +COMPATIBLE_HOST_mipsarch = <a
                        class="m_-5888914540470042948moz-txt-link-rfc2396E"
href="mailto:$%7B@bb.utils.contains('DEFAULTTUNE','mips','null','mips.*-linux',d)%7D"
                        target="_blank" moz-do-not-send="true">"${@bb.utils.contains('DEFAULTTUNE',
                        'mips', 'null', 'mips.*-linux', d)}"</a><br>
                      &gt;&gt; +<br>
                      &gt; this disables is for all kind of mips. I
                      think thats a broad set, it<br>
                      &gt; would be best to narrow it to what you saw it
                      failing for<br>
                      &gt; e.g. it should work for mips32 and mips64 so
                      maybe mips1 is what you<br>
                      &gt; want to disable for<br>
                      <br>
                      I tested with qemumips and qemumips64. When set<br>
                      <br>
                      DEFAULTTUNE= "mips"</blockquote>
                    <div dir="auto"><br>
                    </div>
                    <div dir="auto">How about using mips32 and mips64
                      for default tune and retest <br>
                    </div>
                  </div>
                </div>
              </blockquote>
              <p><br>
              </p>
            </div>
            <div bgcolor="#FFFFFF" text="#000000">
              <p>It build webkitgtk successfully on qemumips and
                qemumips64 with default tune mips32 and mips64.</p>
            </div>
            <div bgcolor="#FFFFFF" text="#000000">
              <p><br>
              </p>
              <blockquote type="cite">
                <div>
                  <div class="gmail_quote">
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
                      <br>
                      It fails with the error.<br>
                      <br>
                      Regards,<br>
                      Kai<br>
                      <br>
                      &gt;<br>
                      &gt;<br>
                      &gt;&gt;   PACKAGECONFIG ??=
                      "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
                      'x11', 'wayland' ,d)} \<br>
                      &gt;&gt;                     
                      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
                      'webgl opengl', '' ,d)} \<br>
                      &gt;&gt;                      enchant \<br>
                      &gt;&gt; --<br>
                      &gt;&gt; 2.20.0<br>
                      &gt;&gt;<br>
                      &gt;&gt; --<br>
                      &gt;&gt;
                      _______________________________________________<br>
                      &gt;&gt; Openembedded-core mailing list<br>
                      &gt;&gt; <a
                        href="mailto:Openembedded-core@lists.openembedded.org"
                        target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
                      &gt;&gt; <a
                        href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
                      <br>
                      <br>
                      -- <br>
                      Kai Kang<br>
                      <br>
                    </blockquote>
                  </div>
                </div>
              </blockquote>
              <p><br>
              </p>
              <pre class="m_-5888914540470042948moz-signature" cols="72">-- 
Kai Kang</pre>
            </div>
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

--------------8C62849134C616616B5426E2--
