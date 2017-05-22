Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6287377E26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 23:08:46 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 22 May 2017 16:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,379,1491289200"; 
	d="scan'208,217";a="104137685"
Received: from olopezca-mobl2.amr.corp.intel.com (HELO [10.252.250.88])
	([10.252.250.88])
	by orsmga005.jf.intel.com with ESMTP; 22 May 2017 16:08:46 -0700
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20170522222523.15978-1-alejandro.hernandez@linux.intel.com>
	<CAMKF1soNk9DWEuiYSy_zQ=MrUSK186FAGQJOSDOu=_nfHGByqw@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <10077e31-2f0d-2915-fa2c-38c5eadc8b87@linux.intel.com>
Date: Mon, 22 May 2017 18:08:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soNk9DWEuiYSy_zQ=MrUSK186FAGQJOSDOu=_nfHGByqw@mail.gmail.com>
Subject: Re: [PATCH] intltool: Adds gettext as a DEPENDS
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
X-List-Received-Date: Mon, 22 May 2017 23:08:48 -0000
Content-Type: multipart/alternative;
	boundary="------------AA8BC8FE1DF3D58CA163C897"
Content-Language: en-US

--------------AA8BC8FE1DF3D58CA163C897
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Khem,


On 05/22/2017 05:41 PM, Khem Raj wrote:
>
> On Mon, May 22, 2017 at 3:25 PM Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     When setting USE_NLS="no" and building systemd-boot
>     (which DEPENDS on intltool), configure fails,
>     complaining about missing gettext:
>
>     configure: error: GNU gettext tools not found; required for intltool
>
>     This is caused because USE_NLS="no" makes the gettext class
>     add gettext-minimal-native to BASEDEPENDS instead of adding
>     gettext-native.
>
>     Since we still would like to set USE_NLS="no" and build systemd-boot,
>     we add gettext-native as a dependency to intltool-native, which
>     makes it
>     available for the configure script of systemd-boot fixing the problem.
>
>     [YOCTO #11562]
>
>     Signed-off-by: Alejandro Hernandez
>     <alejandro.hernandez@linux.intel.com
>     <mailto:alejandro.hernandez@linux.intel.com>>
>     ---
>      meta/recipes-devtools/intltool/intltool_0.51.0.bb
>     <http://intltool_0.51.0.bb> | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
>     <http://intltool_0.51.0.bb>
>     b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
>     <http://intltool_0.51.0.bb>
>     index 551bdf0619a..ecff2faf253 100644
>     --- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
>     <http://intltool_0.51.0.bb>
>     +++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
>     <http://intltool_0.51.0.bb>
>     @@ -16,7 +16,7 @@ UPSTREAM_CHECK_URI =
>     "https://launchpad.net/intltool/trunk/"
>
>      DEPENDS = "libxml-parser-perl-native"
>      RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
>     -DEPENDS_class-native = "libxml-parser-perl-native"
>     +DEPENDS_class-native = "libxml-parser-perl-native gettext-native"
>
>
> This will serialise the build I think it better to add the dep only 
> when NLS is down disabled
I thought about doing so but I couldn't think of a clean way of doing it.

I can't get rid of it on the gettext.bbclass since it would mess up the 
work on b090fde5c184


What I can do, is set gettext-native as a DEPENDS to systemd-boot which 
is the one that is actually
complaining, this way we would keep returning gettext-minimal-native 
when USE_NLS="no", but we would
also fix the issue, what do you think?


>
>
>      inherit autotools pkgconfig perlnative
>
>     --
>     2.12.0
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------AA8BC8FE1DF3D58CA163C897
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hey Khem,<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 05/22/2017 05:41 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1soNk9DWEuiYSy_zQ=MrUSK186FAGQJOSDOu=_nfHGByqw@mail.gmail.com">
      <div><br>
        <div class="gmail_quote">
          <div>On Mon, May 22, 2017 at 3:25 PM Alejandro Hernandez &lt;<a
              href="mailto:alejandro.hernandez@linux.intel.com"
              moz-do-not-send="true">alejandro.hernandez@linux.intel.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">When
            setting USE_NLS="no" and building systemd-boot<br>
            (which DEPENDS on intltool), configure fails,<br>
            complaining about missing gettext:<br>
            <br>
            configure: error: GNU gettext tools not found; required for
            intltool<br>
            <br>
            This is caused because USE_NLS="no" makes the gettext class<br>
            add gettext-minimal-native to BASEDEPENDS instead of adding<br>
            gettext-native.<br>
            <br>
            Since we still would like to set USE_NLS="no" and build
            systemd-boot,<br>
            we add gettext-native as a dependency to intltool-native,
            which makes it<br>
            available for the configure script of systemd-boot fixing
            the problem.<br>
            <br>
            [YOCTO #11562]<br>
            <br>
            Signed-off-by: Alejandro Hernandez &lt;<a
              href="mailto:alejandro.hernandez@linux.intel.com"
              target="_blank" moz-do-not-send="true">alejandro.hernandez@linux.intel.com</a>&gt;<br>
            ---<br>
             meta/recipes-devtools/intltool/<a
              href="http://intltool_0.51.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">intltool_0.51.0.bb</a>
            | 2 +-<br>
             1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
            diff --git a/meta/recipes-devtools/intltool/<a
              href="http://intltool_0.51.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">intltool_0.51.0.bb</a>
            b/meta/recipes-devtools/intltool/<a
              href="http://intltool_0.51.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">intltool_0.51.0.bb</a><br>
            index 551bdf0619a..ecff2faf253 100644<br>
            --- a/meta/recipes-devtools/intltool/<a
              href="http://intltool_0.51.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">intltool_0.51.0.bb</a><br>
            +++ b/meta/recipes-devtools/intltool/<a
              href="http://intltool_0.51.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">intltool_0.51.0.bb</a><br>
            @@ -16,7 +16,7 @@ UPSTREAM_CHECK_URI = "<a
              href="https://launchpad.net/intltool/trunk/"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://launchpad.net/intltool/trunk/</a>"<br>
            <br>
             DEPENDS = "libxml-parser-perl-native"<br>
             RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"<br>
            -DEPENDS_class-native = "libxml-parser-perl-native"<br>
            +DEPENDS_class-native = "libxml-parser-perl-native
            gettext-native"</blockquote>
          <div><br>
          </div>
          <div>This will serialise the build I think it better to add
            the dep only when NLS is down disabled <br>
          </div>
        </div>
      </div>
    </blockquote>
    I thought about doing so but I couldn't think of a clean way of
    doing it.<br>
    <br>
    I can't get rid of it on the gettext.bbclass since it would mess up
    the work on b090fde5c184<br>
    <br>
    <br>
    What I can do, is set gettext-native as a DEPENDS to systemd-boot
    which is the one that is actually<br>
    complaining, this way we would keep returning gettext-minimal-native
    when USE_NLS="no", but we would <br>
    also fix the issue, what do you think?<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CAMKF1soNk9DWEuiYSy_zQ=MrUSK186FAGQJOSDOu=_nfHGByqw@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            <br>
             inherit autotools pkgconfig perlnative<br>
            <br>
            --<br>
            2.12.0<br>
            <br>
            --<br>
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
    <br>
  </body>
</html>

--------------AA8BC8FE1DF3D58CA163C897--
