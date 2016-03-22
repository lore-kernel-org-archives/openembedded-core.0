Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41A6D6067D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 01:16:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2M1GGj1014218
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 21 Mar 2016 18:16:16 -0700
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 21 Mar 2016 18:16:15 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1458397812.git.hongxu.jia@windriver.com>
	<ee2f2af704cb828dd936d435cb98c88de74db825.1458397812.git.hongxu.jia@windriver.com>
	<CAJTo0LbbXz4PkHzW97csmTBjnffFJwJnR6JauecLrXc-nH3_BQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56F09CD9.7020802@windriver.com>
Date: Tue, 22 Mar 2016 09:16:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbbXz4PkHzW97csmTBjnffFJwJnR6JauecLrXc-nH3_BQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/18] gconf: fix buildpaths QA issue
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
X-List-Received-Date: Tue, 22 Mar 2016 01:16:17 -0000
Content-Type: multipart/alternative;
	boundary="------------060702030804040506060204"

--------------060702030804040506060204
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/21/2016 10:47 PM, Burton, Ross wrote:
>
> On 19 March 2016 at 14:56, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     +PACKAGECONFIG[debug] = "--enable-debug=yes, --enable-debug=no"
>
>
> There's an explicit --enable-debug in EXTRA_OECONF,

Yes, we should remove the duplicated --enable-debug in EXTRA_OECONF

> and reading the configure --help shows that the "off" mode should be 
> --enable-debug=minimum as "no" removes the GLib checks which can 
> result in crashes if bad data is passed to the API.

./configure --help
...
   --enable-debug          Compile with debug checks. [no/yes/minimum,
                           default=minimum]
...

vim ./configure.ac
...
121 dnl Default to debug spew in unstable branch
122 AC_ARG_ENABLE(debug,
123   AS_HELP_STRING([--enable-debug],
124     [Compile with debug checks. @<:@no/yes/minimum, 
default=minimum@:>@]),
125   , enable_debug=minimum)
126
127 if test "x$enable_debug" = "xyes"; then
128   CFLAGS="$CFLAGS -DGCONF_ENABLE_DEBUG=1"
129   AC_MSG_NOTICE([Will build with debugging spew and checks])
130 else
131   if test "x$enable_debug" = "xno"; then
132     CFLAGS="$CFLAGS -DG_DISABLE_CHECKS=1 -DG_DISABLE_ASSERT=1"
133     AC_MSG_NOTICE([Will build without *any* debugging code])
134   else
135     AC_MSG_NOTICE([Will build with debug checks but no debug spew])
136   fi
137 fi
...

vim gconf/gconfd.c
...
  384 #ifdef GCONF_ENABLE_DEBUG
  385   /* -- Debug only */
  386
  387   if (addresses == NULL)
  388     {
  389       gconf_log(GCL_DEBUG, _("gconfd compiled with debugging; 
trying to load gconf.path from the source directory"));
  390       conffile = g_strconcat(GCONF_SRCDIR, "/gconf/gconf.path", NULL);
  391       addresses = gconf_load_source_path(conffile, NULL);
  392       g_free(conffile);
  393     }
  394
  395   /* -- End of Debug Only */
  396 #endif
...

If we could not use '--enable-debug=yes' to fix build paths issue,
and as your suggested it should not remove check and assert,
so minimum is the best choice.

//Hongxu

>
> Ross


--------------060702030804040506060204
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/21/2016 10:47 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbbXz4PkHzW97csmTBjnffFJwJnR6JauecLrXc-nH3_BQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 19 March 2016 at 14:56, Hongxu Jia
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":9qh" class="a3s" style="overflow:hidden">+PACKAGECONFIG[debug]
                = "--enable-debug=yes, --enable-debug=no"<br>
              </div>
            </blockquote>
          </div>
          <br>
          There's an explicit --enable-debug in EXTRA_OECONF, </div>
      </div>
    </blockquote>
    <br>
    Yes, we should remove the duplicated --enable-debug in EXTRA_OECONF<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbbXz4PkHzW97csmTBjnffFJwJnR6JauecLrXc-nH3_BQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">and reading the configure --help shows
          that the "off" mode should be --enable-debug=minimum as "no"
          removes the GLib checks which can result in crashes if bad
          data is passed to the API.</div>
      </div>
    </blockquote>
    <br>
    ./configure --help<br>
    ...<br>
      --enable-debug          Compile with debug checks.
    [no/yes/minimum,<br>
                              default=minimum]<br>
    ...<br>
    <br>
    vim ./configure.ac<br>
    ...<br>
    121 dnl Default to debug spew in unstable branch<br>
    122 AC_ARG_ENABLE(debug,<br>
    123   AS_HELP_STRING([--enable-debug],<br>
    124     [Compile with debug checks. @&lt;:@no/yes/minimum,
    default=minimum@:&gt;@]),<br>
    125   , enable_debug=minimum)<br>
    126 <br>
    127 if test "x$enable_debug" = "xyes"; then<br>
    128   CFLAGS="$CFLAGS -DGCONF_ENABLE_DEBUG=1"<br>
    129   AC_MSG_NOTICE([Will build with debugging spew and checks])<br>
    130 else<br>
    131   if test "x$enable_debug" = "xno"; then<br>
    132     CFLAGS="$CFLAGS -DG_DISABLE_CHECKS=1 -DG_DISABLE_ASSERT=1"<br>
    133     AC_MSG_NOTICE([Will build without *any* debugging code])<br>
    134   else<br>
    135     AC_MSG_NOTICE([Will build with debug checks but no debug
    spew])<br>
    136   fi<br>
    137 fi<br>
    ...<br>
    <br>
    vim gconf/gconfd.c<br>
    ...<br>
     384 #ifdef GCONF_ENABLE_DEBUG<br>
     385   /* -- Debug only */<br>
     386 <br>
     387   if (addresses == NULL)<br>
     388     {<br>
     389       gconf_log(GCL_DEBUG, _("gconfd compiled with debugging;
    trying to load gconf.path from the source directory"));<br>
     390       conffile = g_strconcat(GCONF_SRCDIR, "/gconf/gconf.path",
    NULL);<br>
     391       addresses = gconf_load_source_path(conffile, NULL);<br>
     392       g_free(conffile);<br>
     393     }<br>
     394 <br>
     395   /* -- End of Debug Only */<br>
     396 #endif<br>
    ...<br>
    <br>
    If we could not use '--enable-debug=yes' to fix build paths issue,<br>
    and as your suggested it should not remove check and assert,<br>
    so minimum is the best choice.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbbXz4PkHzW97csmTBjnffFJwJnR6JauecLrXc-nH3_BQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------060702030804040506060204--
