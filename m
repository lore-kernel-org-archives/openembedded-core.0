Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-09.prod.phx3.secureserver.net
	(p3plsmtpa07-09.prod.phx3.secureserver.net [173.201.192.238])
	by mail.openembedded.org (Postfix) with ESMTP id 3723965D3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 12:16:48 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-09.prod.phx3.secureserver.net with 
	id DoGm1p00G0BVjqb01oGnCi; Mon, 10 Nov 2014 05:16:48 -0700
Message-ID: <5460ACAE.2080103@pabigot.com>
Date: Mon, 10 Nov 2014 06:16:46 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1415077496-11116-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<CAJTo0LZ2FL--UchK7pVPUJFtsQJtH35_a0aJwYUSnWh34nCf-A@mail.gmail.com>
In-Reply-To: <CAJTo0LZ2FL--UchK7pVPUJFtsQJtH35_a0aJwYUSnWh34nCf-A@mail.gmail.com>
Subject: Re: [PATCH] Bluez5: Add gatttool to new package bluez5-tools
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
X-List-Received-Date: Mon, 10 Nov 2014 12:16:56 -0000
Content-Type: multipart/alternative;
	boundary="------------010008090507070604090805"

--------------010008090507070604090805
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2014 06:42 AM, Burton, Ross wrote:
>
> On 4 November 2014 05:04, Qian Lei <qianl.fnst@cn.fujitsu.com 
> <mailto:qianl.fnst@cn.fujitsu.com>> wrote:
>
>     # at_console doesn't really work with the current state of OE, so
>     punch some more holes so people can actually use BT
>     +        install -m 0755 ${S}/attrib/gatttool ${D}/${bindir}/
>             install -m 0644 ${WORKDIR}/bluetooth.conf
>     ${D}/${sysconfdir}/dbus-1/system.d/
>      }
>
>
> Because of where you put the install, it looks like installing 
> gatttool is related to the DBus configuration.
>
>      ALLOW_EMPTY_libasound-module-bluez = "1"
>     -PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex"
>     +PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex
>     ${PN}-tools"
>
>
> Two questions:
> 1) If we're installing gatttool, why not the other tools that are 
> noinst (obex-client-tool, obexctl, etc). Patching the makefile would 
> install all the tools that upstream build.
> 2) Do these deserve a separate package, or as they're for testing 
> should they go into PN-testtools?
>

I do think the extra tools deserve an extra package, because they may or 
may not be for testing, and in any case don't get installed in a 
distinct test area as the current contents of ${PN}-testtools do.

In fact, they don't get installed at all.  If EXPERIMENTAL is enabled 
via PACKAGECONFIG (as it is in one of my WIP virtual/bluez patches) 
there are a lot of those tools, some of which have opaque names that 
don't appear related to bluetooth.  However, as I use bluez5 more of 
them are things I want available on the target.

At this time I'm inclined to add a ${PN}-noinst-tools package for them.  
I'm debating whether it's better to manually install them from the build 
area, to highlight that upstream doesn't install them, or to modify the 
Makefile to remove "noinst_" and then explicitly list each one in a 
separate FILES_${PN}-noinst-tools variable.  The latter seems a higher 
risk for unwittingly adding non-standard executables to ${PN}.

Is there any precedent for a package to have its own subdirectory off 
${bindir}?  It'd be easy enough to patch the Makefile to put them all in 
${bindir}/bluez5.

I'm sympathetic with Qian Lei and also assumed that gattool, which used 
to be installed in bluez4, might be an exception and just belongs as an 
OE addition to bluez5 rather than being put in ${PN}-noinst-tools.  But 
that's a slippery slope and new things like btgatt-client might be just 
as important to the folks who want to use GATT with bluez5.  Now I'm 
inclined to keep it separate too.

Peter

--------------010008090507070604090805
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/07/2014 06:42 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZ2FL--UchK7pVPUJFtsQJtH35_a0aJwYUSnWh34nCf-A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 4 November 2014 05:04, Qian Lei <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:qianl.fnst@cn.fujitsu.com" target="_blank">qianl.fnst@cn.fujitsu.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":zy" class="a3s" style="overflow:hidden">       
                # at_console doesn't really work with the current state
                of OE, so punch some more holes so people can actually
                use BT<br>
                +        install -m 0755 ${S}/attrib/gatttool
                ${D}/${bindir}/<br>
                        install -m 0644 ${WORKDIR}/bluetooth.conf
                ${D}/${sysconfdir}/dbus-1/system.d/<br>
                 }<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Because of where you put the install, it looks like
              installing gatttool is related to the DBus configuration.</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":zy" class="a3s" style="overflow:hidden">
                 ALLOW_EMPTY_libasound-module-bluez = "1"<br>
                -PACKAGES =+ "libasound-module-bluez ${PN}-testtools
                ${PN}-obex"<br>
                +PACKAGES =+ "libasound-module-bluez ${PN}-testtools
                ${PN}-obex ${PN}-tools"<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Two questions:</div>
            <div>1) If we're installing gatttool, why not the other
              tools that are noinst (obex-client-tool, obexctl, etc). 
              Patching the makefile would install all the tools that
              upstream build.</div>
            <div>2) Do these deserve a separate package, or as they're
              for testing should they go into PN-testtools? <br>
            </div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I do think the extra tools deserve an extra package, because they
    may or may not be for testing, and in any case don't get installed
    in a distinct test area as the current contents of ${PN}-testtools
    do.<br>
    <br>
    In fact, they don't get installed at all.  If EXPERIMENTAL is
    enabled via PACKAGECONFIG (as it is in one of my WIP virtual/bluez
    patches) there are a lot of those tools, some of which have opaque
    names that don't appear related to bluetooth.  However, as I use
    bluez5 more of them are things I want available on the target.<br>
    <br>
    At this time I'm inclined to add a ${PN}-noinst-tools package for
    them.  I'm debating whether it's better to manually install them
    from the build area, to highlight that upstream doesn't install
    them, or to modify the Makefile to remove "noinst_" and then
    explicitly list each one in a separate FILES_${PN}-noinst-tools
    variable.  The latter seems a higher risk for unwittingly adding
    non-standard executables to ${PN}.<br>
    <br>
    Is there any precedent for a package to have its own subdirectory
    off ${bindir}?  It'd be easy enough to patch the Makefile to put
    them all in ${bindir}/bluez5.<br>
    <br>
    I'm sympathetic with Qian Lei and also assumed that gattool, which
    used to be installed in bluez4, might be an exception and just
    belongs as an OE addition to bluez5 rather than being put in
    ${PN}-noinst-tools.  But that's a slippery slope and new things like
    btgatt-client might be just as important to the folks who want to
    use GATT with bluez5.  Now I'm inclined to keep it separate too.<br>
    <br>
    Peter<br>
  </body>
</html>

--------------010008090507070604090805--
