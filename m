Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RaQ3x-0005fY-IJ
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 11:58:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBDApPax009197
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 02:51:25 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 13 Dec 2011 02:51:24 -0800
Message-ID: <4EE72E39.9000103@windriver.com>
Date: Tue, 13 Dec 2011 18:51:37 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1323688579.git.xiaofeng.yan@windriver.com>	<fbfec531140ee0c6848402faf94ba93b903d02ef.1323688580.git.xiaofeng.yan@windriver.com>
	<CAP9ODKrGOc27fxR74Ops4YjF+vLAwU5kZRZFW4XZjiFBaS=hig@mail.gmail.com>
In-Reply-To: <CAP9ODKrGOc27fxR74Ops4YjF+vLAwU5kZRZFW4XZjiFBaS=hig@mail.gmail.com>
X-Originating-IP: [128.224.162.146]
Subject: Re: [PATCH 7/7] core-image-gtk-directfb.bb: add an image for gtk over directfb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 10:58:22 -0000
Content-Type: multipart/alternative;
	boundary="------------050506000006010709080003"

--------------050506000006010709080003
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2011?12?12? 19:40, Otavio Salvador wrote:
> On Mon, Dec 12, 2011 at 09:28, Xiaofeng Yan 
> <xiaofeng.yan@windriver.com <mailto:xiaofeng.yan@windriver.com>> wrote:
>
>     From: Xiaofeng Yan <xiaofeng.yan@windriver.com
>     <mailto:xiaofeng.yan@windriver.com>>
>
>     This file can make an image to run gtk over directfb.
>
>
> I think this ought to be done on core-image-gtk not a specific one for 
> directfb as it depends on a distro feature and you can't just generate 
> an image with this, if the distro has no directfb feature enabled.
> -- 
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br <mailto:otavio@ossystems.com.br> 
> http://www.ossystems.com.br
> Mobile: +55 53 9981-7854 http://projetos.ossystems.com.br
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
I can add a mechanism to inform user to add "gtk-directfb" to 
DISTRO_FEATURES by adding like the following steps
$touch meta/class/gtk-directfb.bbclass
$cat  meta/class/gtk-directfb.bbclass
python () {
     import os
     import signal
     packages = d.getVar('DISTRO_FEATURES', 1).split()
     for pkg in packages:
         if pkg == "x11":
             print("Please remove x11 from DISTRO_FEATURES, use 
\"gtk-directfb\" instead of it\n")
             pid = os.getpid()
             os.kill(pid,signal.SIGCLD) # it could have some issues
}

$cat core-image-gtk-directfb.bb
LICENSE = "MIT"
PR="r0"

inherit gtk-directfb

LIC_FILES_CHKSUM = 
"file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     
file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"


DEPENDS += "task-core-gtk-directfb"

RDEPENDS_${PN} += " \
     task-core-gtk-directfb-base \
     "

inherit core-image

IMAGE_INSTALL += "\
     ${POKY_BASE_INSTALL} \
     task-core-basic \
     module-init-tools \
     task-core-gtk-directfb-base \
"
Do you have any comment about above method ?

Thanks
Yan

--------------050506000006010709080003
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    On 2011&#24180;12&#26376;12&#26085; 19:40, Otavio Salvador wrote:
    <blockquote
cite="mid:CAP9ODKrGOc27fxR74Ops4YjF+vLAwU5kZRZFW4XZjiFBaS=hig@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div class="gmail_quote">On Mon, Dec 12, 2011 at 09:28, Xiaofeng
        Yan <span dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:xiaofeng.yan@windriver.com">xiaofeng.yan@windriver.com</a>&gt;</span>
        wrote:<br>
        <blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt
          0.8ex; border-left: 1px solid rgb(204, 204, 204);
          padding-left: 1ex;">
          From: Xiaofeng Yan &lt;<a moz-do-not-send="true"
            href="mailto:xiaofeng.yan@windriver.com">xiaofeng.yan@windriver.com</a>&gt;<br>
          <br>
          This file can make an image to run gtk over directfb.<br>
        </blockquote>
        <div><br>
        </div>
        <div>I think this ought to be done on core-image-gtk not a
          specific one for directfb as it depends on a distro feature
          and you can't just generate an image with this, if the distro
          has no directfb feature enabled.</div>
        <div>&nbsp;</div>
      </div>
      -- <br>
      Otavio Salvador&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;O.S. Systems<br>
      E-mail: <a moz-do-not-send="true"
        href="mailto:otavio@ossystems.com.br" target="_blank">otavio@ossystems.com.br</a>&nbsp;
      <a moz-do-not-send="true" href="http://www.ossystems.com.br"
        target="_blank">http://www.ossystems.com.br</a><br>
      Mobile: +55 53 9981-7854&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<a moz-do-not-send="true"
        href="http://projetos.ossystems.com.br" target="_blank">http://projetos.ossystems.com.br</a><br>
      <br>
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    I can add a mechanism to inform user to add "gtk-directfb" to
    DISTRO_FEATURES by adding like the following steps<br>
    $touch meta/class/gtk-directfb.bbclass<br>
    $cat&nbsp; meta/class/gtk-directfb.bbclass<br>
    python () {<br>
    &nbsp;&nbsp;&nbsp; import os<br>
    &nbsp;&nbsp;&nbsp; import signal<br>
    &nbsp;&nbsp;&nbsp; packages = d.getVar('DISTRO_FEATURES', 1).split()<br>
    &nbsp;&nbsp;&nbsp; for pkg in packages:<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if pkg == "x11":<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; print("Please remove x11 from DISTRO_FEATURES, use
    \"gtk-directfb\" instead of it\n")<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; pid = os.getpid() <br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; os.kill(pid,signal.SIGCLD) # it could have some issues <br>
    }<br>
    <br>
    $cat core-image-gtk-directfb.bb<br>
    LICENSE = "MIT"<br>
    PR="r0"<br>
    <br>
    <font color="#cc0000">inherit gtk-directfb</font><br>
    <br>
    LIC_FILES_CHKSUM =
    "<a class="moz-txt-link-freetext" href="file://$">file://$</a>{COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="file://$">file://$</a>{COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"<br>
    <br>
    <br>
    DEPENDS += "task-core-gtk-directfb"<br>
    <br>
    RDEPENDS_${PN} += " \<br>
    &nbsp;&nbsp;&nbsp; task-core-gtk-directfb-base \<br>
    &nbsp;&nbsp;&nbsp; "<br>
    <br>
    inherit core-image<br>
    <br>
    IMAGE_INSTALL += "\<br>
    &nbsp;&nbsp;&nbsp; ${POKY_BASE_INSTALL} \<br>
    &nbsp;&nbsp;&nbsp; task-core-basic \<br>
    &nbsp;&nbsp;&nbsp; module-init-tools \<br>
    &nbsp;&nbsp;&nbsp; task-core-gtk-directfb-base \<br>
    "<br>
    Do you have any comment about above method ?<br>
    <br>
    Thanks<br>
    Yan<br>
  </body>
</html>

--------------050506000006010709080003--
