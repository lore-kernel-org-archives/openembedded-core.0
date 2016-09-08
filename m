Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3578A77146
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 06:33:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u886XVPr024141
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Sep 2016 23:33:31 -0700 (PDT)
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 7 Sep 2016 23:33:30 -0700
To: Pau Espin Pedrol <pespin.shar@gmail.com>
References: <cover.1473240119.git.Qi.Chen@windriver.com>
	<72f9c03cf7bb25482acc9c40b775a4f294e772b6.1473240119.git.Qi.Chen@windriver.com>
	<CAEGpDuYdSBJd3TyysNe4aCniRV3izLrs68jW4-D58sQJ+84+AA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <57D10664.3050007@windriver.com>
Date: Thu, 8 Sep 2016 14:34:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAEGpDuYdSBJd3TyysNe4aCniRV3izLrs68jW4-D58sQJ+84+AA@mail.gmail.com>
X-Originating-IP: [128.224.162.229]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] pulseaudio: fix to manage user services corretly
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
X-List-Received-Date: Thu, 08 Sep 2016 06:33:32 -0000
Content-Type: multipart/alternative;
	boundary="------------050606000108010605060503"

--------------050606000108010605060503
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2016 06:29 PM, Pau Espin Pedrol wrote:
>
>
> Pau Espin Pedrol
>
> 2016-09-07 11:22 GMT+02:00 Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>>:
>
>     Make use of the new SYSTEMD_USER_SERVICE variable added in
>     systemd.bbclass
>     to manage user services in pulseaudio-server package.
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>     b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>     index 6ed79ef..f3754d7 100644
>     --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>     +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>     @@ -124,8 +124,8 @@ FILES_${PN}-conf = "${sysconfdir}"
>      FILES_${PN}-bin +=
>     "${sysconfdir}/default/volatiles/volatiles.04_pulse"
>      FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-*
>     ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules
>     */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
>
>     -#SYSTEMD_PACKAGES = "${PN}-server"
>     -SYSTEMD_SERVICE_${PN}-server = "pulseaudio.service"
>     +SYSTEMD_PACKAGES = "${PN}-server"
>     +SYSTEMD_USER_SERVICE_${PN}-server = "pulseaudio.service
>     pulseaudio.socket"
>
> I think specifying "pulseaudio.socket" for 
> SYSTEMD_USER_SERVICE_${PN}-server should be enough, systemd.bbclass is 
> going to add the .service file afair.

Add both:
chenqi@pek-hostel-deb01:~/poky/build-systemd [1] $ ls 
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/systemd/user
default.target.wants  sockets.target.wants

Add pulseaudio.socket:
chenqi@pek-hostel-deb01:~/poky/build-systemd [1] $ ls 
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/systemd/user
sockets.target.wants

They have different results.
I don't know a lot about pulseaudio. Can you confirm that 
pulseaudio.socket is enough?

Regards,
Chen Qi

>      FILES_${PN}-misc = "${bindir}/* ${libdir}/pulseaudio/libpulsedsp.so"
>
>     --
>     1.9.1
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


--------------050606000108010605060503
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/07/2016 06:29 PM, Pau Espin
      Pedrol wrote:<br>
    </div>
    <blockquote
cite="mid:CAEGpDuYdSBJd3TyysNe4aCniRV3izLrs68jW4-D58sQJ+84+AA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br clear="all">
          <div>
            <div class="gmail_signature">
              <div dir="ltr">
                <div>Pau Espin Pedrol<br>
                </div>
              </div>
            </div>
          </div>
          <br>
          <div class="gmail_quote">2016-09-07 11:22 GMT+02:00 Chen Qi <span
              dir="ltr">&lt;<a moz-do-not-send="true" target="_blank"
                href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;</span>:<br>
            <blockquote style="margin:0px 0px 0px 0.8ex;border-left:1px
              solid rgb(204,204,204);padding-left:1ex"
              class="gmail_quote">Make use of the new
              SYSTEMD_USER_SERVICE variable added in systemd.bbclass<br>
              to manage user services in pulseaudio-server package.<br>
              <br>
              Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
              ---<br>
               meta/recipes-multimedia/<wbr>pulseaudio/pulseaudio.inc |
              4 ++--<br>
               1 file changed, 2 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/meta/recipes-multimedia/<wbr>pulseaudio/pulseaudio.inc
              b/meta/recipes-multimedia/<wbr>pulseaudio/pulseaudio.inc<br>
              index 6ed79ef..f3754d7 100644<br>
              --- a/meta/recipes-multimedia/<wbr>pulseaudio/pulseaudio.inc<br>
              +++ b/meta/recipes-multimedia/<wbr>pulseaudio/pulseaudio.inc<br>
              @@ -124,8 +124,8 @@ FILES_${PN}-conf = "${sysconfdir}"<br>
               FILES_${PN}-bin += "${sysconfdir}/default/<wbr>volatiles/volatiles.04_pulse"<br>
               FILES_${PN}-server = "${bindir}/pulseaudio
              ${bindir}/start-* ${sysconfdir} ${bindir}/pactl
              */udev/rules.d/*.rules */*/udev/rules.d/*.rules
              ${systemd_user_unitdir}/*"<br>
              <br>
              -#SYSTEMD_PACKAGES = "${PN}-server"<br>
              -SYSTEMD_SERVICE_${PN}-server = "pulseaudio.service"<br>
              +SYSTEMD_PACKAGES = "${PN}-server"<br>
              +SYSTEMD_USER_SERVICE_${PN}-<wbr>server =
              "pulseaudio.service pulseaudio.socket"<br>
              <br>
            </blockquote>
            <div>I think specifying "pulseaudio.socket" for
              SYSTEMD_USER_SERVICE_${PN}-<wbr>server should be enough,
              systemd.bbclass is going to add the .service file afair.<br>
            </div>
            <div> </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Add both:<br>
    chenqi@pek-hostel-deb01:~/poky/build-systemd [1] $ ls
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/systemd/user<br>
    default.target.wants  sockets.target.wants<br>
    <br>
    Add pulseaudio.socket:<br>
    chenqi@pek-hostel-deb01:~/poky/build-systemd [1] $ ls
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/systemd/user<br>
    sockets.target.wants<br>
    <br>
    They have different results.<br>
    I don't know a lot about pulseaudio. Can you confirm that
    pulseaudio.socket is enough?<br>
    <br>
    Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAEGpDuYdSBJd3TyysNe4aCniRV3izLrs68jW4-D58sQJ+84+AA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote style="margin:0px 0px 0px 0.8ex;border-left:1px
              solid rgb(204,204,204);padding-left:1ex"
              class="gmail_quote">
               FILES_${PN}-misc = "${bindir}/* ${libdir}/pulseaudio/<wbr>libpulsedsp.so"<br>
              <span class="gmail-HOEnZb"><font color="#888888"><br>
                  --<br>
                  1.9.1<br>
                  <br>
                  --<br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                  <a moz-do-not-send="true" target="_blank"
                    rel="noreferrer"
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </font></span></blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------050606000108010605060503--
