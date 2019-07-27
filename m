Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 92E5D6BE2A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 01:24:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6R1OIPj027718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jul 2019 18:24:28 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 26 Jul 2019 18:24:07 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190726093443.40634-1-kai.kang@windriver.com>
	<20190726093443.40634-2-kai.kang@windriver.com>
	<CANNYZj--B16+q6PHBk7W9ESpGFs1gjGJwNYUGR-rc0yznYMJyw@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <d28df357-6fa3-2b25-1d94-2430276bf266@windriver.com>
Date: Sat, 27 Jul 2019 09:23:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj--B16+q6PHBk7W9ESpGFs1gjGJwNYUGR-rc0yznYMJyw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] epiphany: set imcompatible with tune mips
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
X-List-Received-Date: Sat, 27 Jul 2019 01:24:54 -0000
Content-Type: multipart/alternative;
	boundary="------------9A444312D68F8318AD50040D"
Content-Language: en-US

--------------9A444312D68F8318AD50040D
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2019/7/26 下午6:09, Alexander Kanavin wrote:
> Wait, does this mean that the line must be inserted into all of the 
> recipes that depend on webkitgtk (wihch is very awkward)? Shouldn't 
> just the webkitgtk recipe fix be enough?

Unfortunately, yes. But there is only one recipe epiphany in oe-core. I 
think it doesn't need to pay too much attention for mips arch too.

Kai

>
> Alex
>
> On Fri, 26 Jul 2019 at 12:35, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     webkitgtk doesn't work with tune mips and set imcompatible with it.
>     epiphany depends on webkitgtk and mask it too.
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>      meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
>     <http://epiphany_3.32.3.bb> | 3 +++
>      1 file changed, 3 insertions(+)
>
>     diff --git a/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
>     <http://epiphany_3.32.3.bb>
>     b/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
>     <http://epiphany_3.32.3.bb>
>     index de1b6e2f84..d1c6af52ed 100644
>     --- a/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
>     <http://epiphany_3.32.3.bb>
>     +++ b/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
>     <http://epiphany_3.32.3.bb>
>     @@ -16,5 +16,8 @@ SRC_URI =
>     "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
>      SRC_URI[archive.md5sum] = "c4976507bf3de69f27a050ad09531f5a"
>      SRC_URI[archive.sha256sum] =
>     "3ccb6859a43b839b714aa425cb185056f1e8604adbaab6a1bc179d1ba641a33f"
>
>     +# webkitgtk doesn't work with tune 'mips'
>     +COMPATIBLE_HOST_mipsarch = "${@bb.utils.contains('DEFAULTTUNE',
>     'mips', 'null', 'mips.*-linux', d)}"
>     +
>      FILES_${PN} += "${datadir}/dbus-1
>     ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
>      RDEPENDS_${PN} = "iso-codes adwaita-icon-theme
>     gsettings-desktop-schemas"
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


--------------9A444312D68F8318AD50040D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2019/7/26 下午6:09, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj--B16+q6PHBk7W9ESpGFs1gjGJwNYUGR-rc0yznYMJyw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">Wait, does this mean that the line must be inserted
        into all of the recipes that depend on webkitgtk (wihch is very
        awkward)? Shouldn't just the webkitgtk recipe fix be enough?</div>
    </blockquote>
    <p>Unfortunately, yes. But there is only one recipe epiphany in
      oe-core. I think it doesn't need to pay too much attention for
      mips arch too.</p>
    <p>Kai<br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj--B16+q6PHBk7W9ESpGFs1gjGJwNYUGR-rc0yznYMJyw@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Alex</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, 26 Jul 2019 at 12:35,
          &lt;<a href="mailto:kai.kang@windriver.com"
            moz-do-not-send="true">kai.kang@windriver.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">From:
          Kai Kang &lt;<a href="mailto:kai.kang@windriver.com"
            target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
          <br>
          webkitgtk doesn't work with tune mips and set imcompatible
          with it.<br>
          epiphany depends on webkitgtk and mask it too.<br>
          <br>
          Signed-off-by: Kai Kang &lt;<a
            href="mailto:kai.kang@windriver.com" target="_blank"
            moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
          ---<br>
           meta/recipes-gnome/epiphany/<a
            href="http://epiphany_3.32.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">epiphany_3.32.3.bb</a>
          | 3 +++<br>
           1 file changed, 3 insertions(+)<br>
          <br>
          diff --git a/meta/recipes-gnome/epiphany/<a
            href="http://epiphany_3.32.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">epiphany_3.32.3.bb</a>
          b/meta/recipes-gnome/epiphany/<a
            href="http://epiphany_3.32.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">epiphany_3.32.3.bb</a><br>
          index de1b6e2f84..d1c6af52ed 100644<br>
          --- a/meta/recipes-gnome/epiphany/<a
            href="http://epiphany_3.32.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">epiphany_3.32.3.bb</a><br>
          +++ b/meta/recipes-gnome/epiphany/<a
            href="http://epiphany_3.32.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">epiphany_3.32.3.bb</a><br>
          @@ -16,5 +16,8 @@ SRC_URI =
          "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}<br>
           SRC_URI[archive.md5sum] = "c4976507bf3de69f27a050ad09531f5a"<br>
           SRC_URI[archive.sha256sum] =
          "3ccb6859a43b839b714aa425cb185056f1e8604adbaab6a1bc179d1ba641a33f"<br>
          <br>
          +# webkitgtk doesn't work with tune 'mips'<br>
          +COMPATIBLE_HOST_mipsarch =
          <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DEFAULTTUNE','mips','null','mips.*-linux',d)}">"${@bb.utils.contains('DEFAULTTUNE', 'mips', 'null',
          'mips.*-linux', d)}"</a><br>
          +<br>
           FILES_${PN} += "${datadir}/dbus-1
          ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"<br>
           RDEPENDS_${PN} = "iso-codes adwaita-icon-theme
          gsettings-desktop-schemas"<br>
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
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang</pre>
  </body>
</html>

--------------9A444312D68F8318AD50040D--
